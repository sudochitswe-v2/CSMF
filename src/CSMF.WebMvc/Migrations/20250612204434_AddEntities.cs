using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class AddEntities : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_customers_branch_branch_id",
                table: "customers");

            migrationBuilder.DropPrimaryKey(
                name: "pk_branch",
                table: "branch");

            migrationBuilder.RenameTable(
                name: "branch",
                newName: "branches");

            migrationBuilder.AddColumn<int>(
                name: "branch_user_id",
                table: "AspNetUsers",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "branch_user_id",
                table: "branches",
                type: "int",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "pk_branches",
                table: "branches",
                column: "id");

            migrationBuilder.CreateTable(
                name: "branch_users",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    branch_id = table.Column<int>(type: "int", nullable: false),
                    user_id = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    created_by = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_branch_users", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "ix_asp_net_users_branch_user_id",
                table: "AspNetUsers",
                column: "branch_user_id");

            migrationBuilder.CreateIndex(
                name: "ix_branches_branch_user_id",
                table: "branches",
                column: "branch_user_id");

            migrationBuilder.AddForeignKey(
                name: "fk_asp_net_users_branch_users_branch_user_id",
                table: "AspNetUsers",
                column: "branch_user_id",
                principalTable: "branch_users",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "fk_branches_branch_users_branch_user_id",
                table: "branches",
                column: "branch_user_id",
                principalTable: "branch_users",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "fk_customers_branches_branch_id",
                table: "customers",
                column: "branch_id",
                principalTable: "branches",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_asp_net_users_branch_users_branch_user_id",
                table: "AspNetUsers");

            migrationBuilder.DropForeignKey(
                name: "fk_branches_branch_users_branch_user_id",
                table: "branches");

            migrationBuilder.DropForeignKey(
                name: "fk_customers_branches_branch_id",
                table: "customers");

            migrationBuilder.DropTable(
                name: "branch_users");

            migrationBuilder.DropIndex(
                name: "ix_asp_net_users_branch_user_id",
                table: "AspNetUsers");

            migrationBuilder.DropPrimaryKey(
                name: "pk_branches",
                table: "branches");

            migrationBuilder.DropIndex(
                name: "ix_branches_branch_user_id",
                table: "branches");

            migrationBuilder.DropColumn(
                name: "branch_user_id",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "branch_user_id",
                table: "branches");

            migrationBuilder.RenameTable(
                name: "branches",
                newName: "branch");

            migrationBuilder.AddPrimaryKey(
                name: "pk_branch",
                table: "branch",
                column: "id");

            migrationBuilder.AddForeignKey(
                name: "fk_customers_branch_branch_id",
                table: "customers",
                column: "branch_id",
                principalTable: "branch",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
