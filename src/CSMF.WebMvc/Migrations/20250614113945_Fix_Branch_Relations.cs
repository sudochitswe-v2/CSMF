using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class Fix_Branch_Relations : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_asp_net_users_branch_users_branch_user_id",
                table: "AspNetUsers");

            migrationBuilder.DropForeignKey(
                name: "fk_branches_branch_users_branch_user_id",
                table: "branches");

            migrationBuilder.DropForeignKey(
                name: "fk_branches_users_system_user_id",
                table: "branches");

            migrationBuilder.DropIndex(
                name: "ix_branches_branch_user_id",
                table: "branches");

            migrationBuilder.DropIndex(
                name: "ix_branches_system_user_id",
                table: "branches");

            migrationBuilder.DropIndex(
                name: "ix_asp_net_users_branch_user_id",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "branch_user_id",
                table: "branches");

            migrationBuilder.DropColumn(
                name: "system_user_id",
                table: "branches");

            migrationBuilder.DropColumn(
                name: "branch_user_id",
                table: "AspNetUsers");

            migrationBuilder.AddColumn<string>(
                name: "system_user_id",
                table: "branch_users",
                type: "varchar(255)",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "ix_branch_users_branch_id",
                table: "branch_users",
                column: "branch_id");

            migrationBuilder.CreateIndex(
                name: "ix_branch_users_system_user_id",
                table: "branch_users",
                column: "system_user_id");

            migrationBuilder.AddForeignKey(
                name: "fk_branch_users_branches_branch_id",
                table: "branch_users",
                column: "branch_id",
                principalTable: "branches",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "fk_branch_users_users_system_user_id",
                table: "branch_users",
                column: "system_user_id",
                principalTable: "AspNetUsers",
                principalColumn: "id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_branch_users_branches_branch_id",
                table: "branch_users");

            migrationBuilder.DropForeignKey(
                name: "fk_branch_users_users_system_user_id",
                table: "branch_users");

            migrationBuilder.DropIndex(
                name: "ix_branch_users_branch_id",
                table: "branch_users");

            migrationBuilder.DropIndex(
                name: "ix_branch_users_system_user_id",
                table: "branch_users");

            migrationBuilder.DropColumn(
                name: "system_user_id",
                table: "branch_users");

            migrationBuilder.AddColumn<int>(
                name: "branch_user_id",
                table: "branches",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "system_user_id",
                table: "branches",
                type: "varchar(255)",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<int>(
                name: "branch_user_id",
                table: "AspNetUsers",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "ix_branches_branch_user_id",
                table: "branches",
                column: "branch_user_id");

            migrationBuilder.CreateIndex(
                name: "ix_branches_system_user_id",
                table: "branches",
                column: "system_user_id");

            migrationBuilder.CreateIndex(
                name: "ix_asp_net_users_branch_user_id",
                table: "AspNetUsers",
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
                name: "fk_branches_users_system_user_id",
                table: "branches",
                column: "system_user_id",
                principalTable: "AspNetUsers",
                principalColumn: "id");
        }
    }
}
