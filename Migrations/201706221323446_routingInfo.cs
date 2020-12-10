namespace Admissions.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class routingInfo : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "Program", c => c.String());
            AddColumn("dbo.AspNetUsers", "Housing", c => c.String());
            AddColumn("dbo.AspNetUsers", "Transcripts", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "Transcripts");
            DropColumn("dbo.AspNetUsers", "Housing");
            DropColumn("dbo.AspNetUsers", "Program");
        }
    }
}
