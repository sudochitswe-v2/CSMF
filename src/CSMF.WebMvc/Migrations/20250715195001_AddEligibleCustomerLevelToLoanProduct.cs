using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class AddEligibleCustomerLevelToLoanProduct : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "eligible_customer_levels",
                table: "loan_products",
                type: "longtext",
                nullable: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "eligible_customer_levels",
                table: "loan_products");
        }
    }
}
