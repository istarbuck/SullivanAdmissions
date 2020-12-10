namespace Admissions.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class EnrollmentType : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "COPStudent", c => c.String());
            AddColumn("dbo.AspNetUsers", "InternationalStudent", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "InternationalStudent");
            DropColumn("dbo.AspNetUsers", "COPStudent");
        }
    }
}
