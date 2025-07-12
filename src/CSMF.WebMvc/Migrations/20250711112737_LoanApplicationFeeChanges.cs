using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class LoanApplicationFeeChanges : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "fee_amount",
                table: "loan_application_fees");

            migrationBuilder.DropColumn(
                name: "fee_percentage",
                table: "loan_application_fees");

            migrationBuilder.DropColumn(
                name: "fee_type",
                table: "loan_application_fees");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "fee_amount",
                table: "loan_application_fees",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "fee_percentage",
                table: "loan_application_fees",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "fee_type",
                table: "loan_application_fees",
                type: "longtext",
                nullable: false);
        }
    }
}
