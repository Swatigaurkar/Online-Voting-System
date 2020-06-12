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
    public partial class AddCandidates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = "<b><font color=Brown>" + "WELLCOME:: " + "</font>" + "<b><font color=red>" + Session["Admin"] + "</font>";

            if (Session["Admin"] == null)
            {
                Session.Abandon();
                Response.Redirect("~/Design/Admin/AdminLogin.aspx");
            }
        }


        protected void btnAddCandidate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbvoting"].ConnectionString);
                con.Open();

                    string insert = "insert into Candidates values(@Name,@DOB,@Email,@Position)";
                    SqlCommand cmd = new SqlCommand(insert, con);

                    string message = "Voter Registered successfully.";
                    string script = "window.onload = function(){ alert('";

                    cmd.Parameters.AddWithValue("@Name", CFname.Text +" "+ CLname.Text);
                    cmd.Parameters.AddWithValue("@DOB ", Cdob.Text);
                    cmd.Parameters.AddWithValue("@Email ", Email.Text);
                    cmd.Parameters.AddWithValue("@Position", Cposition.Text);


                    cmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Candidate Registered successfully.');window.location='AddCandidates.aspx';", true);

                    script += message;
                    script += "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

               // }
                
               

                con.Close();
            }
            catch (Exception ex)
            {
               // ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Candidate not Registered.Try Again.');window.location='AddCandidates.aspx';", true);

                Response.Write(ex.Message);
            }


        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Admin"] = null;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Logout Successfully');window.location='AddCandidates.aspx';", true);
            Session.Abandon();
            Response.Redirect("~/Design/Admin/AdminLogin.aspx");
        }
    }
}