using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class LoanProductChanges1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "min_duration_months",
                table: "loan_products",
                newName: "min_duration_value");

            migrationBuilder.RenameColumn(
                name: "max_duration_months",
                table: "loan_products",
                newName: "max_duration_value");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "min_duration_value",
                table: "loan_products",
                newName: "min_duration_months");

            migrationBuilder.RenameColumn(
                name: "max_duration_value",
                table: "loan_products",
                newName: "max_duration_months");
        }
    }
}
