namespace CSMF.WebMvc.Models;

// NavigationItem.cs
public class NavigationItem
{
    public string Title { get; set; }
    public string Icon { get; set; }
    public string Controller { get; set; }
    public string Action { get; set; }
    public List<NavigationItem> Children { get; set; } = new List<NavigationItem>();
    public bool IsAccordion { get; set; } = true;
    public bool IsVisible { get; set; } = true;
}
public class NavigationGroup
{
    public List<NavigationItem> Items { get; set; } = new List<NavigationItem>();

}

public class NavGroupExtentions
{
    private static NavigationItem DashBoard()
    {
        return new NavigationItem
        {
            Title = "Dashboard",
            Icon = "bi-speedometer2",
            Controller = "Home",
            Action = "Index",
            IsAccordion = false
        };
    }
    private static NavigationItem Branches()
    {
        return new NavigationItem
        {
            Title = "Branches",
            Icon = "bi-diagram-3",
            Controller = "Branches",
            Children = new List<NavigationItem>
                {
                    new NavigationItem {
                        Title = "View Branches",
                        Action = "Index",
                        Icon = "bi-buildings"
                    },
                    new NavigationItem {
                        Title = "Add Branch",
                        Action = "Create",
                        Icon = "bi-building-add"
                    },
                }
        };
    }
    private static NavigationItem Customers()
    {
        return new NavigationItem
        {
            Title = "Customers",
            Icon = "bi-person-lines-fill",
            Controller = "Customers",
            Children =
                [
                    new NavigationItem {
                        Title = "View Customers",
                        Action = "Index",
                        Icon = "bi-people"
                    },
                    new NavigationItem {
                        Title = "New Customer",
                        Action = "Create",
                        Icon = "bi-person-plus"
                    },
                    new NavigationItem {
                        Title = "Documents",
                        Action = "Documents",
                        Icon = "bi-file-earmark-text"
                    },
                    new NavigationItem {
                        Title = "Guarantors",
                        Action = "Guarantors",
                        Icon = "bi-person-bounding-box"
                    },
                ]
        };
    }

    private static NavigationItem Loans()
    {
        return new NavigationItem
        {
            Title = "Loans",
            Icon = "bi-briefcase",
            Controller = "Loans",
            Children = new List<NavigationItem>
                {
                    new NavigationItem {
                        Title = "Loan Products",
                        Action = "Index",
                        Icon = "bi-box-seam"
                    },
                    new NavigationItem {
                        Title = "Loan Applications",
                        Action = "Applications",
                        Icon = "bi-folder2-open"
                    },
                    new NavigationItem {
                        Title = "New Application",
                        Action = "CreateApplication",
                        Icon = "bi-journal-plus"
                    },
                    new NavigationItem {
                        Title = "Loan Fees",
                        Action = "Fees",
                        Icon = "bi-cash-stack"
                    },
                }
        };
    }
    private static NavigationItem Reports()
    {
        return new NavigationItem
        {
            Title = "Reports",
            Icon = "bi-graph-up",
            Controller = "Reports",
            Children = new List<NavigationItem>
                {
                    new NavigationItem {
                        Title = "Customer Reports",
                        Action = "Customers",
                        Icon = "bi-person-lines-fill"
                    },
                    new NavigationItem {
                        Title = "Loan Reports",
                        Action = "Loans",
                        Icon = "bi-clipboard-data"
                    },
                    new NavigationItem {
                        Title = "Repayment Reports",
                        Action = "Repayments",
                        Icon = "bi-journal-text"
                    },
                    new NavigationItem {
                        Title = "Delinquency Reports",
                        Action = "Delinquency",
                        Icon = "bi-exclamation-circle"
                    },
                    new NavigationItem {
                        Title = "Financial Statements",
                        Action = "Financials",
                        Icon = "bi-file-earmark-bar-graph"
                    },
                    new NavigationItem {
                        Title = "Custom Reports",
                        Action = "Custom",
                        Icon = "bi-file-earmark-spreadsheet"
                    }
                }
        };
    }
    private static NavigationItem UsersAndRoles()
    {
        return new NavigationItem
        {
            Title = "Users & Roles",
            Icon = "bi-person-gear",
            Controller = "Users",
            Children = new List<NavigationItem>
                {
                    new NavigationItem {
                        Title = "User Management",
                        Action = "Index",
                        Icon = "bi-person-check"
                    },
                    new NavigationItem {
                        Title = "Roles & Permissions",
                        Action = "Roles",
                        Icon = "bi-shield-lock"
                    },
                    new NavigationItem {
                        Title = "Audit Logs",
                        Action = "AuditLogs",
                        Icon = "bi-clipboard-check"
                    },
                    new NavigationItem {
                        Title = "Login History",
                        Action = "LoginHistory",
                        Icon = "bi-clock-history"
                    }
                }
        };
    }
    private static NavigationItem Repayments()
    {
        return new NavigationItem
        {
            Title = "Repayments",
            Icon = "bi-wallet2",
            Controller = "Repayments",
            Children = new List<NavigationItem>
                {
                    new NavigationItem {
                        Title = "Repayment Transactions",
                        Action = "Index",
                        Icon = "bi-receipt"
                    },
                    new NavigationItem {
                        Title = "Receive Payment",
                        Action = "Create",
                        Icon = "bi-cash-stack"
                    },
                    new NavigationItem {
                        Title = "Repayment Schedule",
                        Action = "Schedule",
                        Icon = "bi-calendar-range"
                    },
                    new NavigationItem {
                        Title = "Overdue Loans",
                        Action = "Overdue",
                        Icon = "bi-exclamation-octagon"
                    },
                    new NavigationItem {
                        Title = "Payment Reconciliation",
                        Action = "Reconciliation",
                        Icon = "bi-arrow-repeat"
                    }
                }
        };
    }
    private static NavigationItem Settings()
    {
        return new NavigationItem
        {
            Title = "Settings",
            Icon = "bi-gear",
            Controller = "Settings",
            Children = new List<NavigationItem>
                {
                    new NavigationItem {
                        Title = "System Configuration",
                        Action = "General",
                        Icon = "bi-sliders"
                    },
                    new NavigationItem {
                        Title = "Security Settings",
                        Action = "Security",
                        Icon = "bi-shield-check"
                    },
                    new NavigationItem {
                        Title = "Loan Products Setup",
                        Action = "LoanProducts",
                        Icon = "bi-box-seam"
                    },
                    new NavigationItem {
                        Title = "Fee Configuration",
                        Action = "Fees",
                        Icon = "bi-cash-stack"
                    },
                    new NavigationItem {
                        Title = "Backup & Restore",
                        Action = "Backup",
                        Icon = "bi-cloud-arrow-up"
                    },
                    new NavigationItem {
                        Title = "System Updates",
                        Action = "Updates",
                        Icon = "bi-download"
                    }
                }
        };
    }


    public static NavigationGroup GetDefaultNavData()
    {
        return new NavigationGroup
        {
            Items = new List<NavigationItem>
        {
            DashBoard(),
            Branches(),
            Customers(),
            Loans(),
            Repayments(),
            Reports(),
            UsersAndRoles(),
            Settings(),
        }
        };
    }
}


