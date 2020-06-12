using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Voting_System.Design.Admin
{
    public partial class AdminLogin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (Email.Text == "admin@gmail.com" && Password.Text == "admin")
            {
                Session["Admin"] = Email.Text;
                Session.Timeout = 10;
                Response.Redirect("admin.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Login Successfully');window.location='AdminLogin.aspx';", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('UserId or Password Does Not Match');window.location='AdminLogin.aspx';", true);

            }
        }
    }
}