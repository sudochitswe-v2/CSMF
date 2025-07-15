using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class DocsAddVerifiedStatus : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "is_verified",
                table: "documents",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "is_verified",
                table: "documents");
        }
    }
}
