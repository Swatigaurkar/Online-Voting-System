using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Online_Voting_System.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace Online_Voting_System.Account
{
    public partial class Register : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbvoting"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Random r = new Random();
            int i = r.Next(12345, 98765);
            Id_hfd.Value = i.ToString();

            if (!IsPostBack)
            {
                for (int n = 1947; n <= 2020; n++)
                {
                    txtdob.Items.Add(n.ToString());
                }
            }

        }
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("select year(getdate())", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int i = Convert.ToInt32(dt.Rows[0][0].ToString());
            int j = Convert.ToInt32(txtdob.SelectedValue);
            int k = i - j;
            if (k >= 18)
            {
                Label1.Text = k.ToString();


                try
                {
                   SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbvoting"].ConnectionString);
                   con.Open();
                    string insert = "insert into registeruser values(@VoterId,@Name,@DOB,@Age,@Email,@password)";
                    SqlCommand cmd = new SqlCommand(insert, con);
                  
                    string message = "Voter Registered successfully.";
                    string script = "window.onload = function(){ alert('";
                    Label2.Text = Id_hfd.Value;


                    cmd.Parameters.AddWithValue("VoterId", Label2.Text);
                    cmd.Parameters.AddWithValue("Name ", Fname.Text+" "+ Lname.Text);
                    cmd.Parameters.AddWithValue("DOB", txtdob.Text);
                    cmd.Parameters.AddWithValue("Age", Label1.Text);

                    cmd.Parameters.AddWithValue("Email", Email.Text);
                    cmd.Parameters.AddWithValue("password", Password.Text);
                 
                    script += "VoterId = " + Label2.Text + " ";
                    script += "Password = " + Password.Text + " ";
                    cmd.ExecuteNonQuery();

                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter Registered successfully.');window.location='VoterRegister.aspx';", true);

                    script += message;
                    script += "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);



                     con.Close();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter not Registered.Try Again.');window.location='VoterRegister.aspx';", true);

                    Response.Write(ex.Message);
                }
            }
            else
            {
                ErrorMessage.Text = "You are not Eligible for applying voter id";
            }

         


            
            
        }

    
    }
}