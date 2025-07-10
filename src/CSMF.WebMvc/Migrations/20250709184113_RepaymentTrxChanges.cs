using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class RepaymentTrxChanges : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "status",
                table: "repayment_transactions");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "status",
                table: "repayment_transactions",
                type: "longtext",
                nullable: false);
        }
    }
}
