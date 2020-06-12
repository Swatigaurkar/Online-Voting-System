using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Online_Voting_System.Design.User
{
    public partial class Election : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["VoterId"] as string;
            Label2.Text = username;
            Label4.Text = "<b><font color=Brown>" + "WELLCOME USER:: " + "</font>";

            if (Session["VoterId"] == null)
            {
                Session.Abandon();
                Response.Redirect("~/Design/User/Login.aspx");
            }
           
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbvoting"].ConnectionString);

                con.Open();

                SqlDataSource sds1 = new SqlDataSource();
                sds1.ConnectionString = ConfigurationManager.ConnectionStrings["dbvoting"].ToString();
                sds1.SelectParameters.Add("VoterId", TypeCode.String, this.Label2.Text);
                sds1.SelectCommand = "SELECT * FROM [UserVoted] WHERE [VoterId]=@VoterId";

                DataView dv1 = (DataView)sds1.Select(DataSourceSelectArguments.Empty);
                if (dv1.Count == 0)
                {

                    string insert = "insert into UserVoted values('" + this.Label2.Text + "')";
                    SqlCommand cmd = new SqlCommand(insert,con);
                    cmd.ExecuteNonQuery();


                    SqlDataSource sds = new SqlDataSource();
                    sds.ConnectionString = ConfigurationManager.ConnectionStrings["dbvoting"].ToString();
                    sds.SelectParameters.Add("Name", TypeCode.String, this.RadioButtonList1.SelectedValue);
                    sds.SelectCommand = "SELECT * FROM [vote] WHERE [Name]=@Name";

                    DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
                    if (dv.Count == 0)
                    {
                        int vote = 0;
                        string command = "insert into vote values(@Name,'" + vote + "')";
                        SqlCommand cmd1 = new SqlCommand(command, con);
                        cmd1.Parameters.AddWithValue("@Name", RadioButtonList1.SelectedValue);

                        cmd1.ExecuteNonQuery();
                        string command3 = "update vote set vote=vote+1 where Name=@Name";
                        SqlCommand cmd3 = new SqlCommand(command3, con);
                        cmd3.Parameters.AddWithValue("@Name", RadioButtonList1.SelectedValue);
                        cmd3.ExecuteNonQuery();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('vote successfully');window.location='Election.aspx';", true);
                        return;
                    }
                    else
                    {
                        string command1 = "update Vote set vote=vote+1 where Name=@Name";
                        SqlCommand cmd1 = new SqlCommand(command1, con);
                        cmd1.Parameters.AddWithValue("@Name", RadioButtonList1.SelectedValue);
                        cmd1.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('vote successfully');window.location='Election.aspx';", true);


                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Already voted!');window.location='Election.aspx';", true);

                }


            }




            catch (Exception ex)
            {

                Label3.Text = ex.Message;
                //"Please enter you Voter ID or select candidates !";
            }


        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["VoterID"] = null;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Logout Successfully');window.location='Election.aspx';", true);
            Session.Abandon();
            Response.Redirect("~/Design/Home.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

           
        }
    }
}