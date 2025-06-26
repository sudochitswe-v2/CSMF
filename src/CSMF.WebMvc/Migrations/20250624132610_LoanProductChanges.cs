using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class LoanProductChanges : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "duration_months",
                table: "loan_products",
                newName: "min_duration_months");

            migrationBuilder.AlterColumn<string>(
                name: "recurring_penalty_type",
                table: "loan_products",
                type: "longtext",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "longtext")
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AlterColumn<string>(
                name: "penalty_type",
                table: "loan_products",
                type: "longtext",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "longtext")
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AlterColumn<int>(
                name: "grace_period_days",
                table: "loan_products",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "max_duration_months",
                table: "loan_products",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "max_duration_months",
                table: "loan_products");

            migrationBuilder.RenameColumn(
                name: "min_duration_months",
                table: "loan_products",
                newName: "duration_months");

            migrationBuilder.UpdateData(
                table: "loan_products",
                keyColumn: "recurring_penalty_type",
                keyValue: null,
                column: "recurring_penalty_type",
                value: "");

            migrationBuilder.AlterColumn<string>(
                name: "recurring_penalty_type",
                table: "loan_products",
                type: "longtext",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "longtext",
                oldNullable: true)
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.UpdateData(
                table: "loan_products",
                keyColumn: "penalty_type",
                keyValue: null,
                column: "penalty_type",
                value: "");

            migrationBuilder.AlterColumn<string>(
                name: "penalty_type",
                table: "loan_products",
                type: "longtext",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "longtext",
                oldNullable: true)
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AlterColumn<int>(
                name: "grace_period_days",
                table: "loan_products",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);
        }
    }
}
