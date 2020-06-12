using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Online_Voting_System.Design.Admin
{
    public partial class Result : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbvoting"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "<b><font color=Brown>" + "WELLCOME:: " + "</font>" + "<b><font color=red>" + Session["Admin"] + "</font>";

            if (Session["Admin"] == null)
            {
                Session.Abandon();
                Response.Redirect("~/Design/Admin/AdminLogin.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Logout Successfully');window.location='Result.aspx';", true);
            Session.Abandon();
            Response.Redirect("~/Design/Admin/admin.aspx");
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            con.Open();

            string deleteQuery = "DELETE FROM Candidates; DELETE FROM UserVoted; DELETE FROM vote;";
            SqlCommand cmd = new SqlCommand(deleteQuery, con);
            {

                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Delete successfully');window.location='AddCandidates.aspx';", true);

            }
            con.Close();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            con.Open();

            string deleteQuery = "DELETE FROM vote; DELETE FROM UserVoted; DELETE FROM Candidates;";
            SqlCommand cmd = new SqlCommand(deleteQuery, con);
            {

                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Delete successfully');window.location='AddCandidates.aspx';", true);

            }
            con.Close();
        }
    }
}