using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Admissions.Models;
using System.Collections.Generic;

namespace Admissions.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser()
            {
                UserName = Email.Text,
                Email = Email.Text,
                FirstName = tBoxFirstName.Text,
                LastName = tBoxLastName.Text,
                ZipCode = tBoxZipCode.Text,
                PhoneNumber = tBoxHomePhoneNumber.Text,
                Campus = campus.SelectedItem.Text,
                ReEntry = Re_Entry.SelectedValue,
                AttendClasses = classPlan.SelectedValue
            };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                PersonalInfoDataContext personalInfo = new PersonalInfoDataContext();
                Email email = new Email();

                var forms = personalInfo.Forms.ToList();

                if (rblCOP.SelectedItem.Text == "Yes")
                {
                    forms = forms.Where(f => f.Category == "standard" || f.Category == "cop" && f.FormID != "Enrollment Agreement").ToList();
                }
                else if(rblInternational.SelectedItem.Text == "Yes")
                {
                    forms = forms.Where(f => f.Category == "standard" || f.Category == "international" && f.FormID != "Enrollment Agreement").ToList();
                }
                else
                {
                    forms.Where(f => f.Category == "standard").ToList();
                }

                foreach (var item in forms)
                {
                    FormAssignment assignment = new Models.FormAssignment();
                    assignment.UserID = user.Id;
                    assignment.FormID = item.FormID;
                    assignment.Status = "Assigned";
                    assignment.Order = item.Order;

                    personalInfo.FormAssignments.InsertOnSubmit(assignment);
                    personalInfo.SubmitChanges();
                }

                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                email.SendAccountEmails(user.Email, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl("https://secure.sullivan.edu/Admissions/Account/EmailConfirmation", Response);


            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        protected void classPlan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (classPlan.SelectedValue == "campus" || classPlan.SelectedValue == "combo")
            {
                campus.Items[1].Enabled = true;
                campus.Items[2].Enabled = true;
                campus.Items[3].Enabled = true;
                campus.Items[4].Enabled = false;
                campus.Items[5].Enabled = true;

                if (classPlan.SelectedValue == "campus")
                    campus.Items[6].Enabled = false;
                else
                    campus.Items[6].Enabled = true;


            }
            else if (classPlan.SelectedValue == "online")
            {
                campus.Items[1].Enabled = false;
                campus.Items[2].Enabled = false;
                campus.Items[3].Enabled = false;
                campus.Items[4].Enabled = true;
                campus.Items[5].Enabled = false;
                campus.Items[6].Enabled = false;
            }
        }
    }
}