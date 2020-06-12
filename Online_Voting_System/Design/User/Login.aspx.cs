using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using System.Web.UI.WebControls;

using Online_Voting_System.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Online_Voting_System.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

   

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbvoting"].ConnectionString);

                con.Open();
                string qry = "select * from registeruser where VoterId='" + VoterId.Text + "' and password='" + Password.Text + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                  Session["VoterId"] = VoterId.Text;
                if (VoterId.Text == dr.GetValue(0).ToString() && Password.Text == dr.GetValue(5).ToString())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Login Successfully');window.location='Login.aspx';", true);
                    Response.Redirect("~/Design/User/Election.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('UserId or Password Does Not Match');window.location='Login.aspx';", true);

                }

                con.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }

        }
    }
}