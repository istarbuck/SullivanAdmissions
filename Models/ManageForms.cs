using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Admissions.Models
{
    public class ManageForms
    {
        public string CompleteForm(string userID, string formID)
        {
            PersonalInfoDataContext personalInfo = new PersonalInfoDataContext();

            FormAssignment currentForm = personalInfo.FormAssignments.FirstOrDefault(f => f.FormID == formID & f.UserID == userID);

            currentForm.Status = "Complete";

            personalInfo.SubmitChanges();

            return GetNextForm(userID);
        }

        public string GetNextForm(string userID)
        {
            string returnURL;

            PersonalInfoDataContext personalInfo = new PersonalInfoDataContext();

            var formList = personalInfo.FormAssignments.Where(f => f.UserID == userID & f.Status == "Assigned").OrderBy(f => f.Order).ToList();

            FormAssignment nextForm = formList.FirstOrDefault();

            Form form = personalInfo.Forms.FirstOrDefault(f => f.FormID == nextForm.FormID);

            if (form != null)
                returnURL = form.URL;
            else
                returnURL = "Confirm.aspx";

            return returnURL;
        }

    }
}