using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class Modified_Branch_Entity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "address",
                table: "branches",
                type: "longtext",
                nullable: false)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "email",
                table: "branches",
                type: "longtext",
                nullable: false)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "phones",
                table: "branches",
                type: "longtext",
                nullable: false)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "system_user_id",
                table: "branches",
                type: "varchar(255)",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "ix_branches_system_user_id",
                table: "branches",
                column: "system_user_id");

            migrationBuilder.AddForeignKey(
                name: "fk_branches_users_system_user_id",
                table: "branches",
                column: "system_user_id",
                principalTable: "AspNetUsers",
                principalColumn: "id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_branches_users_system_user_id",
                table: "branches");

            migrationBuilder.DropIndex(
                name: "ix_branches_system_user_id",
                table: "branches");

            migrationBuilder.DropColumn(
                name: "address",
                table: "branches");

            migrationBuilder.DropColumn(
                name: "email",
                table: "branches");

            migrationBuilder.DropColumn(
                name: "phones",
                table: "branches");

            migrationBuilder.DropColumn(
                name: "system_user_id",
                table: "branches");
        }
    }
}
