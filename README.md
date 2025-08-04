# 🏦 CSMF Loan Management System

> A web-based loan management system built with **.NET 8 MVC**, **Entity Framework Core**, and **MariaDB** to digitize customer onboarding, loan processing, repayment tracking, and reporting.

---

## ✅ Table of Contents
1. [Project Overview](#-project-overview)  
2. [Key Features](#-key-features)  
3. [Technology Stack](#-technology-stack)  
4. [System Requirements](#-system-requirements)  
5. [Setup & Installation](#-setup--installation)  
6. [Database Configuration](#-database-configuration)  
7. [Running the Application](#-running-the-application)  
8. [User Roles & Access](#-user-roles--access)  
9. [Core Modules & Workflows](#-core-modules--workflows)  
10. [Troubleshooting](#-troubleshooting)  
11. [Future Enhancements](#-future-enhancements)  
12. [License](#-license)

---

## ✅ Project Overview

The **CSMF Loan Management System** replaces manual, paper-based loan operations with a secure, centralized digital platform. It supports the full loan lifecycle—from customer registration to repayment and reporting—while improving accuracy, efficiency, and scalability across multiple branches.

This system was developed using **Agile DSDM methodology** and structured into **three time-boxed phases**:
- **Time Box 1**: Foundational Modules & Onboarding
- **Time Box 2**: Loan & Fee Management
- **Time Box 3**: Repayment, Penalty & Reporting

---

## ✅ Key Features

| Feature | Description |
|--------|-------------|
| **Customer Management** | Register, view, and manage customer details with NRC, contact info, and branch association. |
| **Loan Products** | Define loan types with rules for interest, duration, fees, and penalties. |
| **Loan Applications** | Apply for loans with auto-calculated repayment schedules based on product rules. |
| **Repayment Tracking** | Record payments, allocate to principal, interest, fees, and penalties. |
| **Repayment Schedules** | Auto-generated installments with status tracking (Paid, Overdue, Partially Paid). |
| **Penalty Transactions** | Track late payment penalties and update status automatically. |
| **Document Management** | Upload and store customer documents (e.g., ID, land deeds). |
| **Grantor Management** | Link guarantors to borrowers for risk assessment. |
| **Dashboard** | View key metrics (active loans, overdue repayments) with branch filtering. |
| **Role-Based Access** | Admin, Loan Officer, and Read-Only roles with secure authentication. |
| **Responsive UI** | Bootstrap 5 design works on desktop and mobile devices. |

---

## ✅ Technology Stack

| Layer | Technology |
|------|------------|
| **Frontend** | Razor Pages, Bootstrap 5, HTML5, CSS3, jQuery |
| **Backend** | ASP.NET Core MVC (C#), .NET 8 |
| **Data Access** | Entity Framework Core 8 |
| **Database** | MariaDB (MySQL-compatible) |
| **Authentication** | ASP.NET Core Identity (simplified) |
| **Hosting** | IIS / Kestrel (local or server) |
| **Development Tools** | Visual Studio 2022, Dbeaver, Git |
| **Reporting** | Built-in Razor views with future export support (PDF/Excel) |

---

## ✅ System Requirements

### 🔧 Development Environment
- **OS**: Windows 10 or later
- **IDE**: Visual Studio 2022 (Community or higher)
- **.NET SDK**: .NET 8.0
- **Database**: MariaDB 10.5+ or MySQL 8.0+
- **Browser**: Chrome, Edge, or Firefox (latest)

### 🖥️ Server Requirements
- **OS**: Windows Server 2016+ or Linux (via Docker)
- **Web Server**: IIS or Kestrel
- **RAM**: 4 GB minimum (8 GB recommended)
- **Storage**: 10 GB (grows with document uploads)

---

## ✅ Setup & Installation

### Step 1: Clone the Repository
```bash
git clone https://github.com/sudochitswe-v2/CSMF.git
cd CSMF
```

### Step 2: Restore NuGet Packages
Open the `.sln` file in **Visual Studio 2022**.  
Let it auto-restore packages, or run:
```bash
dotnet restore
```

### Step 3: Install MariaDB / MySQL
1. Download and install **MariaDB** from [mariadb.org](https://mariadb.org/download/)
2. Run the installer and set root password (e.g., `root`)
3. Use **MySQL Workbench/Dbeaver** or command line to manage databases.

---

## ✅ Database Configuration

### Step 1: Create Database
```sql
CREATE DATABASE csmf_dev_01;
CREATE DATABASE csmf_hangfire_dev_01;
```

### Step 2: Update Connection String
In `appsettings.json`, update:
```json
"ConnectionStrings": {
    "MySql": "server=localhost;port=3308;database=csmf_dev_01;user=root;password=P@ssw0rd",
    "MySqlHangfire": "server=localhost;port=3308;database=csmf_hangfire_dev_01;user=root;password=P@ssw0rd;Allow User Variables=true"
  }
```
Set Database backup dump path in `appsettings.json`
```
"DumpExe": "D:\\Path to\\mysqldump.exe",
```

> 🔐 **Security Tip**: Use environment variables in production.

### Step 3: Run EF Migrations
```bash
dotnet ef database update
```

This will create all tables: `Customers`, `LoanApplications`, `RepaymentSchedules`, etc.

---

## ✅ Running the Application

### Option 1: Using Visual Studio
1. Press **F5** or click **Run**
2. The app will launch at `https://localhost:7044` or `http://localhost:5092`

### Option 2: Using CLI
```bash
dotnet run
```

Navigate to: `https://localhost:7001`

---

## ✅ User Roles & Access

| Role | Permissions |
|------|-------------|
| **Admin** | Full access: manage users, loans, customers, and reports |
| **Loan Officer** | Create loans, record repayments, upload documents |
| **Read-Only** | View-only access for auditors or managers |

> 🔐 Default login:  
> - **Email**: `admin@csmf.org`  
> - **Password**: `P@ssw0rd!` *(Change after first login)*

---

## ✅ Core Modules & Workflows

### 1. **Customer Onboarding**
- Go to **Customers > Create**
- Fill in name, NRC, phone, address
- Save → Customer ID is generated

### 2. **Loan Product Setup**
- Go to **Loan Products > Create**
- Set principal range, duration, interest method, fees, and penalties
- Save for use in applications

### 3. **Apply for Loan**
- From **Loan Applications > Create**
- Select customer and loan product
- System auto-fills:
  - Repayment schedule
  - Interest calculation
  - Fee breakdown

### 4. **Record Repayment**
- Go to **Repayment > Create**
- Select loan and installment
- Enter amount paid and breakdown (principal, interest, fee, penalty)
- Status updates automatically

### 5. **View Dashboard**
- Shows:
  - Total loans
  - Active loans
  - Overdue installments
  - Upcoming repayments
- Filter by **branch** using dropdown

### 6. **Manage Documents & Grantors**
- In **Customer Details**, use accordion tabs:
  - **Documents**: Upload PDFs/images
  - **Grantors**: Add guarantors with NRC and contact info

---

## ✅ Troubleshooting

| Issue | Solution |
|------|----------|
| **EF Migration fails** | Ensure MariaDB is running and connection string is correct |
| **Page not found after login** | Clear browser cache or check route configuration |
| **Database bacckup fails** | Use `mysql.exe`, not `mysqldump.exe` for import |
| **JavaScript not working** | Ensure jQuery and Bootstrap JS are loaded in layout |

---

## ✅ Future Enhancements

| Feature | Description |
|--------|-------------|
| **Accounting Module** | Integrate general ledger, income tracking, and financial reports |
| **Automated Reminders** | SMS/email alerts for upcoming and overdue repayments |
| **Offline Mode** | Allow field officers to record data without internet |
| **Mobile App** | PWA or native app for remote access |
| **OCR Integration** | Extract data from uploaded documents (e.g., NRC scans) |
| **Advanced Reporting** | Export to PDF/Excel, charts for delinquency rates |
| **Audit Trail** | Log all user actions for compliance and security |

---

## ✅ License

This project is licensed under the Apache License, Version 2.0.
You may freely use, modify, and distribute the software in accordance with the terms of this license.

> © 2025 CSMF  
> Developed as part of a software engineering project.

---

## ✅ Support

For questions, feedback, or collaboration:
- **Email**: chitswe.dev@gmail.com
- **GitHub**: [https://github.com/sudochitswe-v2/CSMF](https://github.com/sudochitswe-v2/CSMF)

---

✅ **You're ready to go!**  
Launch the app, log in, and start managing loans digitally.

--- 
