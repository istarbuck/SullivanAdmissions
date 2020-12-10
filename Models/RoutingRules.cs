using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Admissions.Models;

namespace Admissions
{
    public class RoutingRules
    {
        public string ZipCodes(string zipCode)
        {
            string campusID = "70";

            ProgramDataContext programs = new ProgramDataContext();

            var lexingtonZipCodes = programs.ZipLists.Where(z => z.Location_Code == "21").Select(z => z.ZIP).ToList();

            var fortKnoxZipCodes = programs.ZipLists.Where(z => z.Location_Code == "11").Select(z => z.ZIP).ToList();

            var northernKentuckyZipCodes = programs.ZipLists.Where(z => z.Location_Code == "01").Select(z => z.ZIP).ToList();

            if (lexingtonZipCodes.Contains(zipCode.Trim()))
            {
                campusID = "71";
            }
            else if (fortKnoxZipCodes.Contains(zipCode.Trim()))
            {
                campusID = "72";
            }
            else if (fortKnoxZipCodes.Contains(zipCode.Trim()))
            {
                campusID = "73";
            }

            return campusID; 
            
        }

        public string DetermineCampus(string zipCode)
        {
            string campus = "Louisville";

            ProgramDataContext programs = new ProgramDataContext();

            var lexingtonZipCodes = programs.ZipLists.Where(z => z.Location_Code == "21").Select(z => z.ZIP).ToList();

            var fortKnoxZipCodes = programs.ZipLists.Where(z => z.Location_Code == "11").Select(z => z.ZIP).ToList();

            var northernKentuckyZipCodes = programs.ZipLists.Where(z => z.Location_Code == "01").Select(z => z.ZIP).ToList();

            if (lexingtonZipCodes.Contains(zipCode.Trim()))
            {
                campus = "Lexington";
            }
            else if (fortKnoxZipCodes.Contains(zipCode.Trim()))
            {
                campus = "Fort Knox";
            }
            else if (northernKentuckyZipCodes.Contains(zipCode.Trim()))
            {
                campus = "Northern Kentucky";
            }


            return campus;

        }

        public string CampusName(string campus, string zipCode, string attendingMethod)
        {
            if (attendingMethod != "online")
                return campus;
            else
                return DetermineCampus(zipCode);
        }

        public string PaymentAccount(string campusName, string zipCode)
        {
            string campus = "SullivanLouisville";

            if (campusName == "Louisville")
                campus = "SullivanLouisville";

            else if (campusName == "Lexington")
                campus = "SullivanLexington";

            else if (campusName == "Northern Kentucky")
                campus = "SullivanLouisville";

            else if (campusName == "Louisa")
                campus = "SullivanLexington";

            else if (campusName == "Online")
                campus = OnlineAccount(zipCode);

            return campus;
        }

        public string OnlineAccount(string zipCode)
        {
            string campus = "SullivanLouisville";

            ProgramDataContext programs = new ProgramDataContext();

            var lexingtonZipCodes = programs.ZipLists.Where(z => z.Location_Code == "21").Select(z => z.ZIP).ToList();

            if (lexingtonZipCodes.Contains(zipCode.Trim()))
            {
                campus = "SullivanLexington";
            }

            return campus;

        }

        public string CampusID(string campus, string zipCode)
        {
            string campusID = "01";

            if (campus == "Louisville")
                campusID = "01";
            else if (campus == "Lexington")
                campusID = "21";
            else if (campus == "Fort Knox")
                campusID = "11";
            else if (campus == "Online")
                campusID = "01";
            else if (campus == "Northern Kentucky")
                campusID = "70";
            else if (campus == "Louisa")
                campusID = "71";
            else if (campus == "Spencerian Louisville" || campus == "Dupont Circle")
                return "02";
            else if (campus == "Spencerian Lexington")
                return "43";
            else if (campus == "SCTD" || campus == "Atkinson Sq")
                return "03";
            return campusID;
        }

    }
}