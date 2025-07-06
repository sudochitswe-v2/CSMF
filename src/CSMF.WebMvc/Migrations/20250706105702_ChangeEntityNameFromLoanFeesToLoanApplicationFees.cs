using System;
using Microsoft.EntityFrameworkCore.Migrations;
using MySql.EntityFrameworkCore.Metadata;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class ChangeEntityNameFromLoanFeesToLoanApplicationFees : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "loan_fees");

            migrationBuilder.DropColumn(
                name: "created_at",
                table: "repayment_transactions");

            migrationBuilder.DropColumn(
                name: "created_at",
                table: "penalty_transactions");

            migrationBuilder.DropColumn(
                name: "days_overdue",
                table: "penalty_transactions");

            migrationBuilder.CreateTable(
                name: "loan_application_fees",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    loan_application_id = table.Column<int>(type: "int", nullable: false),
                    fee_name = table.Column<string>(type: "longtext", nullable: false),
                    fee_type = table.Column<string>(type: "longtext", nullable: false),
                    fee_percentage = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    fee_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    calculated_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_loan_application_fees", x => x.id);
                    table.ForeignKey(
                        name: "fk_loan_application_fees_loan_applications_loan_application_id",
                        column: x => x.loan_application_id,
                        principalTable: "loan_applications",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "ix_loan_application_fees_loan_application_id",
                table: "loan_application_fees",
                column: "loan_application_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "loan_application_fees");

            migrationBuilder.AddColumn<DateTime>(
                name: "created_at",
                table: "repayment_transactions",
                type: "datetime(6)",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "created_at",
                table: "penalty_transactions",
                type: "datetime(6)",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<int>(
                name: "days_overdue",
                table: "penalty_transactions",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "loan_fees",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    loan_application_id = table.Column<int>(type: "int", nullable: false),
                    calculated_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    fee_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    fee_name = table.Column<string>(type: "longtext", nullable: false),
                    fee_percentage = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    fee_type = table.Column<string>(type: "longtext", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_loan_fees", x => x.id);
                    table.ForeignKey(
                        name: "fk_loan_fees_loan_applications_loan_application_id",
                        column: x => x.loan_application_id,
                        principalTable: "loan_applications",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "ix_loan_fees_loan_application_id",
                table: "loan_fees",
                column: "loan_application_id");
        }
    }
}
