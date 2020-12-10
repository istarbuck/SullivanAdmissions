namespace Admissions.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PersonalInfo : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "LastName", c => c.String());
            AddColumn("dbo.AspNetUsers", "ZipCode", c => c.String());
            AddColumn("dbo.AspNetUsers", "Campus", c => c.String());
            AddColumn("dbo.AspNetUsers", "ReEntry", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "ReEntry");
            DropColumn("dbo.AspNetUsers", "Campus");
            DropColumn("dbo.AspNetUsers", "ZipCode");
            DropColumn("dbo.AspNetUsers", "LastName");
        }
    }
}
