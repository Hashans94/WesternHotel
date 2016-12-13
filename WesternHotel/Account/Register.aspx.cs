using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WesternHotel.Models;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WesternHotel.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);

            String connectionString = WebConfigurationManager.ConnectionStrings["WesternHotel"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);

            String sql = "INSERT INTO customers (username, gname, sname, address, state, postcode, mobile) VALUES (@username, @givenName, @surname, @address, @state, @postcode, @mobile)";

            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@username", Email.Text);
            cmd.Parameters.AddWithValue("@givenName", gname.Text );
            cmd.Parameters.AddWithValue("@surname", sname.Text );
            cmd.Parameters.AddWithValue("@address", address.Text );
            cmd.Parameters.AddWithValue("@state", state.SelectedValue);
            cmd.Parameters.AddWithValue("@postcode", postcode.Text );
            cmd.Parameters.AddWithValue("@mobile", mobile.Text );




            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                using (con)
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                var roleresult = manager.AddToRole(manager.FindByEmail(Email.Text).Id, "user");

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);

                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}