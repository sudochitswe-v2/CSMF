// Interfaces/IDatabaseBackupService.cs (same as before)
using MySql.Data.MySqlClient;
using System.Diagnostics;
using Dapper;

public interface IDatabaseBackupService
{
    Task<string> CreateBackupAsync();
    Task<List<string>> GetBackupsAsync();
    Task<bool> RestoreBackupAsync(string backupFileName);
}

// Services/DatabaseBackupService.cs
public class DatabaseBackupService : IDatabaseBackupService
{
    private readonly IConfiguration _config;
    private readonly IWebHostEnvironment _env;
    private readonly ILogger<DatabaseBackupService> _logger;
    private readonly string _backupDir;

    public DatabaseBackupService(
        IConfiguration config,
        IWebHostEnvironment env,
        ILogger<DatabaseBackupService> logger)
    {
        _config = config;
        _env = env;
        _logger = logger;
        _backupDir = Path.Combine(_env.ContentRootPath, "DatabaseBackups");

        // Ensure backup directory exists
        if (!Directory.Exists(_backupDir))
        {
            Directory.CreateDirectory(_backupDir);
        }
    }

    public async Task<string> CreateBackupAsync()
    {
        var connectionString = _config.GetConnectionString("MySql");
        var dbName = GetDatabaseName(connectionString);
        var timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
        var backupFileName = $"{dbName}_Backup_{timestamp}.sql";
        var backupPath = Path.Combine(_backupDir, backupFileName);

        try
        {
            // Using mysqldump command line tool
            var builder = new MySqlConnectionStringBuilder(connectionString);
            var server = builder.Server;
            var userId = builder.UserID;
            var password = builder.Password;

            var name = _config.GetValue<string>("DumpExe");
            var processInfo = new ProcessStartInfo
            {
                FileName = name,
                Arguments = $"--host={server} --user={userId} --password={password} {dbName} --result-file={backupPath}",
                UseShellExecute = false,
                CreateNoWindow = true,
                RedirectStandardError = true
            };

            using (var process = Process.Start(processInfo))
            {
                if (process == null)
                {
                    throw new InvalidOperationException("Failed to start mysqldump process");
                }

                var error = await process.StandardError.ReadToEndAsync();
                await process.WaitForExitAsync();

                if (process.ExitCode != 0)
                {
                    throw new Exception($"mysqldump failed: {error}");
                }
            }

            _logger.LogInformation($"Database backup created: {backupPath}");
            return backupFileName;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating database backup");
            throw;
        }
    }

    public Task<List<string>> GetBackupsAsync()
    {
        var backups = Directory.GetFiles(_backupDir, "*.sql")
            .Select(Path.GetFileName)
            .OrderDescending()
            .ToList();

        return Task.FromResult(backups);
    }

    public async Task<bool> RestoreBackupAsync(string backupFileName)
    {
        var connectionString = _config.GetConnectionString("DefaultConnection");
        var dbName = GetDatabaseName(connectionString);
        var backupPath = Path.Combine(_backupDir, backupFileName);

        if (!File.Exists(backupPath))
        {
            _logger.LogError($"Backup file not found: {backupPath}");
            return false;
        }

        try
        {
            var builder = new MySqlConnectionStringBuilder(connectionString);
            var server = builder.Server;
            var userId = builder.UserID;
            var password = builder.Password;

            // First drop all tables (clean restore)
            await DropAllTables(connectionString);

            // Restore using mysql command line
            var processInfo = new ProcessStartInfo
            {
                FileName = "mysql",
                Arguments = $"--host={server} --user={userId} --password={password} {dbName} < \"{backupPath}\"",
                UseShellExecute = false,
                CreateNoWindow = true,
                RedirectStandardError = true
            };

            using (var process = Process.Start(processInfo))
            {
                if (process == null)
                {
                    throw new InvalidOperationException("Failed to start mysql process");
                }

                var error = await process.StandardError.ReadToEndAsync();
                await process.WaitForExitAsync();

                if (process.ExitCode != 0)
                {
                    throw new Exception($"mysql restore failed: {error}");
                }
            }

            _logger.LogInformation($"Database restored from: {backupPath}");
            return true;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error restoring database backup");
            throw;
        }
    }

    private async Task DropAllTables(string connectionString)
    {
        using var connection = new MySqlConnection(connectionString);
        await connection.OpenAsync();

        // Get all tables
        var tables = await connection.QueryAsync<string>(
            "SELECT table_name FROM information_schema.tables WHERE table_schema = DATABASE()");

        if (!tables.Any()) return;

        // Disable foreign key checks temporarily
        await connection.ExecuteAsync("SET FOREIGN_KEY_CHECKS = 0;");

        // Drop all tables
        foreach (var table in tables)
        {
            await connection.ExecuteAsync($"DROP TABLE IF EXISTS `{table}`;");
        }

        // Re-enable foreign key checks
        await connection.ExecuteAsync("SET FOREIGN_KEY_CHECKS = 1;");
    }

    private static string GetDatabaseName(string connectionString)
    {
        var builder = new MySqlConnectionStringBuilder(connectionString);
        return builder.Database;
    }
}