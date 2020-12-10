namespace Admissions.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Alumni : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "AttendClasses", c => c.String());
            AddColumn("dbo.AspNetUsers", "Alumni", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "Alumni");
            DropColumn("dbo.AspNetUsers", "AttendClasses");
        }
    }
}
