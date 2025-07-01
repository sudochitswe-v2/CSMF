using System;
using Microsoft.EntityFrameworkCore.Migrations;
using MySql.EntityFrameworkCore.Metadata;

#nullable disable

namespace CSMF.WebMvc.Migrations
{
    /// <inheritdoc />
    public partial class Init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    id = table.Column<string>(type: "varchar(255)", nullable: false),
                    first_name = table.Column<string>(type: "longtext", nullable: false),
                    last_name = table.Column<string>(type: "longtext", nullable: false),
                    user_name = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true),
                    normalized_user_name = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true),
                    email = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true),
                    normalized_email = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true),
                    email_confirmed = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    password_hash = table.Column<string>(type: "longtext", nullable: true),
                    security_stamp = table.Column<string>(type: "longtext", nullable: true),
                    concurrency_stamp = table.Column<string>(type: "longtext", nullable: true),
                    phone_number = table.Column<string>(type: "longtext", nullable: true),
                    phone_number_confirmed = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    two_factor_enabled = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    lockout_end = table.Column<DateTimeOffset>(type: "datetime", nullable: true),
                    lockout_enabled = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    access_failed_count = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_asp_net_users", x => x.id);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "branches",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    name = table.Column<string>(type: "longtext", nullable: false),
                    email = table.Column<string>(type: "longtext", nullable: false),
                    phones = table.Column<string>(type: "longtext", nullable: false),
                    address = table.Column<string>(type: "longtext", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_branches", x => x.id);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "loan_products",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    product_title = table.Column<string>(type: "longtext", nullable: false),
                    description = table.Column<string>(type: "longtext", nullable: false),
                    min_principal_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    max_principal_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    duration_period = table.Column<string>(type: "longtext", nullable: false),
                    duration_type = table.Column<string>(type: "longtext", nullable: false),
                    min_duration_value = table.Column<int>(type: "int", nullable: false),
                    max_duration_value = table.Column<int>(type: "int", nullable: true),
                    interest_method = table.Column<string>(type: "longtext", nullable: false),
                    interest_rate = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    interest_cycle = table.Column<string>(type: "longtext", nullable: false),
                    repayment_cycle = table.Column<string>(type: "longtext", nullable: false),
                    late_penalty_enabled = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    penalty_type = table.Column<string>(type: "longtext", nullable: true),
                    penalty_percentage = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    penalty_fixed_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    penalty_calculation_base = table.Column<string>(type: "longtext", nullable: true),
                    grace_period_days = table.Column<int>(type: "int", nullable: true),
                    recurring_penalty_type = table.Column<string>(type: "longtext", nullable: true),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_loan_products", x => x.id);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    id = table.Column<string>(type: "varchar(255)", nullable: false),
                    system_user_id = table.Column<string>(type: "varchar(255)", nullable: true),
                    name = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true),
                    normalized_name = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true),
                    concurrency_stamp = table.Column<string>(type: "longtext", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_asp_net_roles", x => x.id);
                    table.ForeignKey(
                        name: "fk_asp_net_roles_asp_net_users_system_user_id",
                        column: x => x.system_user_id,
                        principalTable: "AspNetUsers",
                        principalColumn: "id");
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    user_id = table.Column<string>(type: "varchar(255)", nullable: false),
                    claim_type = table.Column<string>(type: "longtext", nullable: true),
                    claim_value = table.Column<string>(type: "longtext", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_asp_net_user_claims", x => x.id);
                    table.ForeignKey(
                        name: "fk_asp_net_user_claims_asp_net_users_user_id",
                        column: x => x.user_id,
                        principalTable: "AspNetUsers",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    login_provider = table.Column<string>(type: "varchar(255)", nullable: false),
                    provider_key = table.Column<string>(type: "varchar(255)", nullable: false),
                    provider_display_name = table.Column<string>(type: "longtext", nullable: true),
                    user_id = table.Column<string>(type: "varchar(255)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_asp_net_user_logins", x => new { x.login_provider, x.provider_key });
                    table.ForeignKey(
                        name: "fk_asp_net_user_logins_asp_net_users_user_id",
                        column: x => x.user_id,
                        principalTable: "AspNetUsers",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    user_id = table.Column<string>(type: "varchar(255)", nullable: false),
                    login_provider = table.Column<string>(type: "varchar(255)", nullable: false),
                    name = table.Column<string>(type: "varchar(255)", nullable: false),
                    value = table.Column<string>(type: "longtext", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_asp_net_user_tokens", x => new { x.user_id, x.login_provider, x.name });
                    table.ForeignKey(
                        name: "fk_asp_net_user_tokens_asp_net_users_user_id",
                        column: x => x.user_id,
                        principalTable: "AspNetUsers",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "branch_users",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    branch_id = table.Column<int>(type: "int", nullable: false),
                    user_id = table.Column<string>(type: "longtext", nullable: false),
                    system_user_id = table.Column<string>(type: "varchar(255)", nullable: true),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_branch_users", x => x.id);
                    table.ForeignKey(
                        name: "fk_branch_users_branches_branch_id",
                        column: x => x.branch_id,
                        principalTable: "branches",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "fk_branch_users_users_system_user_id",
                        column: x => x.system_user_id,
                        principalTable: "AspNetUsers",
                        principalColumn: "id");
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "customers",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    first_name = table.Column<string>(type: "longtext", nullable: false),
                    last_name = table.Column<string>(type: "longtext", nullable: false),
                    email = table.Column<string>(type: "longtext", nullable: false),
                    phone = table.Column<string>(type: "longtext", nullable: false),
                    address = table.Column<string>(type: "longtext", nullable: false),
                    identification_number = table.Column<string>(type: "longtext", nullable: false),
                    branch_id = table.Column<int>(type: "int", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_customers", x => x.id);
                    table.ForeignKey(
                        name: "fk_customers_branches_branch_id",
                        column: x => x.branch_id,
                        principalTable: "branches",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    role_id = table.Column<string>(type: "varchar(255)", nullable: false),
                    claim_type = table.Column<string>(type: "longtext", nullable: true),
                    claim_value = table.Column<string>(type: "longtext", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_asp_net_role_claims", x => x.id);
                    table.ForeignKey(
                        name: "fk_asp_net_role_claims_asp_net_roles_role_id",
                        column: x => x.role_id,
                        principalTable: "AspNetRoles",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    user_id = table.Column<string>(type: "varchar(255)", nullable: false),
                    role_id = table.Column<string>(type: "varchar(255)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_asp_net_user_roles", x => new { x.user_id, x.role_id });
                    table.ForeignKey(
                        name: "fk_asp_net_user_roles_asp_net_roles_role_id",
                        column: x => x.role_id,
                        principalTable: "AspNetRoles",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "fk_asp_net_user_roles_asp_net_users_user_id",
                        column: x => x.user_id,
                        principalTable: "AspNetUsers",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "documents",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    customer_id = table.Column<int>(type: "int", nullable: false),
                    name = table.Column<string>(type: "longtext", nullable: false),
                    content_type = table.Column<string>(type: "longtext", nullable: false),
                    size = table.Column<long>(type: "bigint", nullable: false),
                    data = table.Column<byte[]>(type: "longblob", nullable: false),
                    extension = table.Column<string>(type: "longtext", nullable: false),
                    description = table.Column<string>(type: "longtext", nullable: true),
                    document_type = table.Column<string>(type: "longtext", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_documents", x => x.id);
                    table.ForeignKey(
                        name: "fk_documents_customers_customer_id",
                        column: x => x.customer_id,
                        principalTable: "customers",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "grantors",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    customer_id = table.Column<int>(type: "int", nullable: false),
                    first_name = table.Column<string>(type: "longtext", nullable: false),
                    last_name = table.Column<string>(type: "longtext", nullable: false),
                    email = table.Column<string>(type: "longtext", nullable: false),
                    phone = table.Column<string>(type: "longtext", nullable: false),
                    address = table.Column<string>(type: "longtext", nullable: false),
                    identification_number = table.Column<string>(type: "longtext", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_grantors", x => x.id);
                    table.ForeignKey(
                        name: "fk_grantors_customers_customer_id",
                        column: x => x.customer_id,
                        principalTable: "customers",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "loan_applications",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    loan_product_id = table.Column<int>(type: "int", nullable: false),
                    customer_id = table.Column<int>(type: "int", nullable: false),
                    status = table.Column<string>(type: "longtext", nullable: false),
                    principal_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    release_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    duration = table.Column<int>(type: "int", nullable: false),
                    duration_period = table.Column<string>(type: "longtext", nullable: false),
                    interest_method = table.Column<string>(type: "longtext", nullable: false),
                    interest_rate = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    interest_cycle = table.Column<string>(type: "longtext", nullable: false),
                    repayment_cycle = table.Column<string>(type: "longtext", nullable: false),
                    repayment_day = table.Column<int>(type: "int", nullable: false),
                    total_interest = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    total_fees = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    total_repayment = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_loan_applications", x => x.id);
                    table.ForeignKey(
                        name: "fk_loan_applications_customers_customer_id",
                        column: x => x.customer_id,
                        principalTable: "customers",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "fk_loan_applications_loan_products_loan_product_id",
                        column: x => x.loan_product_id,
                        principalTable: "loan_products",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "loan_fees",
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
                    table.PrimaryKey("pk_loan_fees", x => x.id);
                    table.ForeignKey(
                        name: "fk_loan_fees_loan_applications_loan_application_id",
                        column: x => x.loan_application_id,
                        principalTable: "loan_applications",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "repayment_schedules",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    loan_application_id = table.Column<int>(type: "int", nullable: false),
                    installment_number = table.Column<int>(type: "int", nullable: false),
                    due_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    description = table.Column<string>(type: "longtext", nullable: false),
                    principal_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    interest_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    fee_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    total_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    outstanding_principal = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    status = table.Column<string>(type: "longtext", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_repayment_schedules", x => x.id);
                    table.ForeignKey(
                        name: "fk_repayment_schedules_loan_applications_loan_application_id",
                        column: x => x.loan_application_id,
                        principalTable: "loan_applications",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "penalty_transactions",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    loan_application_id = table.Column<int>(type: "int", nullable: false),
                    repayment_schedule_id = table.Column<int>(type: "int", nullable: false),
                    penalty_amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    penalty_type = table.Column<string>(type: "longtext", nullable: false),
                    penalty_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    days_overdue = table.Column<int>(type: "int", nullable: false),
                    status = table.Column<string>(type: "longtext", nullable: false),
                    description = table.Column<string>(type: "longtext", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_penalty_transactions", x => x.id);
                    table.ForeignKey(
                        name: "fk_penalty_transactions_loan_applications_loan_application_id",
                        column: x => x.loan_application_id,
                        principalTable: "loan_applications",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "fk_penalty_transactions_repayment_schedules_repayment_schedule_",
                        column: x => x.repayment_schedule_id,
                        principalTable: "repayment_schedules",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "repayment_transactions",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    loan_application_id = table.Column<int>(type: "int", nullable: false),
                    repayment_schedule_id = table.Column<int>(type: "int", nullable: false),
                    amount_paid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    principal_paid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    interest_paid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    fee_paid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    penalty_paid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    payment_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    payment_method = table.Column<string>(type: "longtext", nullable: false),
                    status = table.Column<string>(type: "longtext", nullable: false),
                    notes = table.Column<string>(type: "longtext", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    created_by = table.Column<string>(type: "longtext", nullable: false),
                    created_on = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    modified_by = table.Column<string>(type: "longtext", nullable: true),
                    modified_on = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_repayment_transactions", x => x.id);
                    table.ForeignKey(
                        name: "fk_repayment_transactions_loan_applications_loan_application_id",
                        column: x => x.loan_application_id,
                        principalTable: "loan_applications",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "fk_repayment_transactions_repayment_schedules_repayment_schedul",
                        column: x => x.repayment_schedule_id,
                        principalTable: "repayment_schedules",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "ix_asp_net_role_claims_role_id",
                table: "AspNetRoleClaims",
                column: "role_id");

            migrationBuilder.CreateIndex(
                name: "ix_asp_net_roles_system_user_id",
                table: "AspNetRoles",
                column: "system_user_id");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "normalized_name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "ix_asp_net_user_claims_user_id",
                table: "AspNetUserClaims",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "ix_asp_net_user_logins_user_id",
                table: "AspNetUserLogins",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "ix_asp_net_user_roles_role_id",
                table: "AspNetUserRoles",
                column: "role_id");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "normalized_email");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "normalized_user_name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "ix_branch_users_branch_id",
                table: "branch_users",
                column: "branch_id");

            migrationBuilder.CreateIndex(
                name: "ix_branch_users_system_user_id",
                table: "branch_users",
                column: "system_user_id");

            migrationBuilder.CreateIndex(
                name: "ix_customers_branch_id",
                table: "customers",
                column: "branch_id");

            migrationBuilder.CreateIndex(
                name: "ix_documents_customer_id",
                table: "documents",
                column: "customer_id");

            migrationBuilder.CreateIndex(
                name: "ix_grantors_customer_id",
                table: "grantors",
                column: "customer_id");

            migrationBuilder.CreateIndex(
                name: "ix_loan_applications_customer_id",
                table: "loan_applications",
                column: "customer_id");

            migrationBuilder.CreateIndex(
                name: "ix_loan_applications_loan_product_id",
                table: "loan_applications",
                column: "loan_product_id");

            migrationBuilder.CreateIndex(
                name: "ix_loan_fees_loan_application_id",
                table: "loan_fees",
                column: "loan_application_id");

            migrationBuilder.CreateIndex(
                name: "ix_penalty_transactions_loan_application_id",
                table: "penalty_transactions",
                column: "loan_application_id");

            migrationBuilder.CreateIndex(
                name: "ix_penalty_transactions_repayment_schedule_id",
                table: "penalty_transactions",
                column: "repayment_schedule_id");

            migrationBuilder.CreateIndex(
                name: "ix_repayment_schedules_loan_application_id",
                table: "repayment_schedules",
                column: "loan_application_id");

            migrationBuilder.CreateIndex(
                name: "ix_repayment_transactions_loan_application_id",
                table: "repayment_transactions",
                column: "loan_application_id");

            migrationBuilder.CreateIndex(
                name: "ix_repayment_transactions_repayment_schedule_id",
                table: "repayment_transactions",
                column: "repayment_schedule_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "branch_users");

            migrationBuilder.DropTable(
                name: "documents");

            migrationBuilder.DropTable(
                name: "grantors");

            migrationBuilder.DropTable(
                name: "loan_fees");

            migrationBuilder.DropTable(
                name: "penalty_transactions");

            migrationBuilder.DropTable(
                name: "repayment_transactions");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "repayment_schedules");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "loan_applications");

            migrationBuilder.DropTable(
                name: "customers");

            migrationBuilder.DropTable(
                name: "loan_products");

            migrationBuilder.DropTable(
                name: "branches");
        }
    }
}
