<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddCandidates.aspx.cs" Inherits="Online_Voting_System.Design.Admin.AddCandidates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style type="text/css">
        
	    body{
            background: url('/Image/website_background_1.jpg');
			
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			min-height: 100vh;
			width: auto;

			display: flex;
			flex-direction: column;

		}

         .auto-style2 {
             font-weight: bold;
         }

    .auto-style3 {
        text-align: justify;
    }
    .auto-style4 {
        text-align: justify;
        width: 336px;
    }
    .auto-style5 {
        display: block;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.428571429;
        color: #555555;
        vertical-align: middle;
        background-color: #ffffff;
        border: 1px solid #cccccc;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    }
    
         .auto-style2 {
             margin-bottom: 15px;
             text-align: left;
         }

         .auto-style3 {
            color: #000066;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            text-align: center;
         }

    .auto-style4 {
        margin-bottom: 15px;
        text-align: left;
        width: 288px;
    }
         .auto-style6 {
             font-weight: bold;
         }
    </style>
    <br />
    <br />
        <div class="auto-style2">
         <div class="text-right">
             <div class="auto-style4">   
                 <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
             </div>
      
             <strong>
      
             <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClientClick="return confirm('Are you sure you want to Logout?');" CssClass="auto-style6" OnClick="btnLogout_Click" />         

             </strong>         

         </div>
    <h1>Candidate Registration</h1>
          <div class="form-group">
           
              <table class="nav-justified">
                  <tr>
                      <td class="auto-style4">
                          <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name</span>

                      </td>
                      <td>
                           <div class="col-md-10"> 
                  <asp:TextBox ID="CFname" runat="server" CssClass="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="CFname" ForeColor="Red"></asp:RequiredFieldValidator>
             </div>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style4">
                          <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Last Name</span>
                      </td>
                      <td>
                           <div class="col-md-10">   
                   <asp:TextBox ID="CLname" runat="server" CssClass="form-control"></asp:TextBox>  
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="CLname" ForeColor="Red"></asp:RequiredFieldValidator>           

               </div>  
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style4">
                                           <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DOB</span>

                      </td>
                      <td>
                          <div class="col-md-10">   
                     <asp:TextBox ID="Cdob" runat="server" CssClass="auto-style5" TextMode="Date" Height="32px" Width="277px"></asp:TextBox> 
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="Cdob" ForeColor="Red"></asp:RequiredFieldValidator>            

                 </div>
                      </td>
                  </tr>
                   <tr>
                      <td class="auto-style4">
                           <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email</span>

                      </td>
                      <td>
                          <div class="col-md-10"> 
                          <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </div>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style4">
                           <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Position</span>

                      </td>
                      <td>
                           <div class="col-md-10">   
                <asp:TextBox ID="Cposition" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="Cposition" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style4">

                      </td>
                      <td>
                           <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <strong>
                    <asp:Button ID="btnAddCandidate" runat="server" Text="Add"  CssClass="btn btn-default" BackColor="#FF3300" BorderColor="Black" ForeColor="White" style="font-weight: bold; font-size: medium" OnClientClick="return confirm('Are you sure you want to Add this Candidate?');" OnClick="btnAddCandidate_Click"/>
                <br />
                </strong>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
                      </td>
                  </tr>
                 
              </table>
           
              
                 
         </div>
    

     </div>
</asp:Content>
