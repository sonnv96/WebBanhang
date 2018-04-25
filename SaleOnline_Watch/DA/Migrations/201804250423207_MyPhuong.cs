namespace DA.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MyPhuong : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Accounts",
                c => new
                    {
                        UserName = c.String(nullable: false, maxLength: 30),
                        Password = c.String(maxLength: 50),
                        Role = c.String(),
                    })
                .PrimaryKey(t => t.UserName);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        CategoryID = c.Int(nullable: false, identity: true),
                        CategoryName = c.String(nullable: false, maxLength: 25),
                        Description = c.String(storeType: "ntext"),
                    })
                .PrimaryKey(t => t.CategoryID);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        ProductID = c.Int(nullable: false, identity: true),
                        ProductName = c.String(nullable: false, maxLength: 40),
                        SupplierID = c.Int(nullable: false),
                        CategoryID = c.Int(nullable: false),
                        Quantity = c.Int(nullable: false),
                        UnitPrice = c.Decimal(nullable: false, storeType: "money"),
                        ProductImage = c.String(maxLength: 100),
                        Description = c.String(),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Categories", t => t.CategoryID, cascadeDelete: true)
                .ForeignKey("dbo.Suppliers", t => t.SupplierID, cascadeDelete: true)
                .Index(t => t.SupplierID)
                .Index(t => t.CategoryID);
            
            CreateTable(
                "dbo.Order_Detail",
                c => new
                    {
                        OrderID = c.String(nullable: false, maxLength: 30),
                        ProductID = c.Int(nullable: false),
                        UnitPrice = c.Decimal(nullable: false, storeType: "money"),
                        Quantity = c.Short(nullable: false),
                    })
                .PrimaryKey(t => new { t.OrderID, t.ProductID })
                .ForeignKey("dbo.Orders", t => t.OrderID, cascadeDelete: true)
                .ForeignKey("dbo.Products", t => t.ProductID, cascadeDelete: true)
                .Index(t => t.OrderID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        OrderID = c.String(nullable: false, maxLength: 30),
                        CustomerID = c.String(maxLength: 30),
                        OrderDate = c.DateTime(nullable: false),
                        RequiredDate = c.DateTime(nullable: false),
                        ShippedDate = c.DateTime(nullable: false),
                        Freight = c.Decimal(nullable: false, storeType: "money"),
                        ShipAddress = c.String(maxLength: 60),
                    })
                .PrimaryKey(t => t.OrderID)
                .ForeignKey("dbo.Customers", t => t.CustomerID)
                .Index(t => t.CustomerID);
            
            CreateTable(
                "dbo.Customers",
                c => new
                    {
                        CustomerID = c.String(nullable: false, maxLength: 30),
                        Password = c.String(maxLength: 50),
                        ContactName = c.String(maxLength: 30),
                        Address = c.String(maxLength: 100),
                        Phone = c.String(maxLength: 24),
                    })
                .PrimaryKey(t => t.CustomerID);
            
            CreateTable(
                "dbo.Feedbacks",
                c => new
                    {
                        FeedId = c.Int(nullable: false, identity: true),
                        FeedTitle = c.String(maxLength: 100),
                        FeedContent = c.String(),
                        FeedDate = c.DateTime(nullable: false),
                        CustomerID = c.String(maxLength: 30),
                    })
                .PrimaryKey(t => t.FeedId)
                .ForeignKey("dbo.Customers", t => t.CustomerID)
                .Index(t => t.CustomerID);
            
            CreateTable(
                "dbo.Suppliers",
                c => new
                    {
                        SupplierID = c.Int(nullable: false, identity: true),
                        CompanyName = c.String(nullable: false, maxLength: 40),
                        Address = c.String(maxLength: 60),
                        Phone = c.String(maxLength: 24),
                    })
                .PrimaryKey(t => t.SupplierID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Products", "SupplierID", "dbo.Suppliers");
            DropForeignKey("dbo.Order_Detail", "ProductID", "dbo.Products");
            DropForeignKey("dbo.Order_Detail", "OrderID", "dbo.Orders");
            DropForeignKey("dbo.Orders", "CustomerID", "dbo.Customers");
            DropForeignKey("dbo.Feedbacks", "CustomerID", "dbo.Customers");
            DropForeignKey("dbo.Products", "CategoryID", "dbo.Categories");
            DropIndex("dbo.Feedbacks", new[] { "CustomerID" });
            DropIndex("dbo.Orders", new[] { "CustomerID" });
            DropIndex("dbo.Order_Detail", new[] { "ProductID" });
            DropIndex("dbo.Order_Detail", new[] { "OrderID" });
            DropIndex("dbo.Products", new[] { "CategoryID" });
            DropIndex("dbo.Products", new[] { "SupplierID" });
            DropTable("dbo.Suppliers");
            DropTable("dbo.Feedbacks");
            DropTable("dbo.Customers");
            DropTable("dbo.Orders");
            DropTable("dbo.Order_Detail");
            DropTable("dbo.Products");
            DropTable("dbo.Categories");
            DropTable("dbo.Accounts");
        }
    }
}
