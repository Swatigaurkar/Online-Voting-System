<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Election.aspx.cs" Inherits="Online_Voting_System.Design.User.Election" %>
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

    </style>
  <br />
     <div class="auto-style2">
         <div class="text-right">
             <div class="auto-style4">   
                 <asp:Label ID="Label4" runat="server" ></asp:Label>
                 <asp:Label ID="Label2" runat="server" ></asp:Label>

             </div>
      
        <asp:Button ID="btnLogout" runat="server" Text="logout" OnClientClick="return confirm('Are you sure you want to Logout?');" OnClick="btnLogout_Click" />
            </div>
         <br />
         <hr />
         <table class="nav-justified">
             <tr>
                 <td class="text-center" colspan="2">
                     &nbsp;</td>
             </tr>
             <tr>
                 <td class="text-right">
                 <strong>
                                <asp:Label ID="Label1" runat="server" Text="Select Candidate Position"></asp:Label>            
                             </strong>
            
                 </td>
                 <td>
                      <div class="col-md-10">  
                                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Position" DataValueField="Position" Height="29px" Width="256px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                         <asp:ListItem>Select Position</asp:ListItem>
                                     </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbvoting %>" SelectCommand="SELECT [Position] FROM [Candidates]"></asp:SqlDataSource>
                                </div> 
                 </td>
             </tr>
             <tr>
                 <td>
                 </td>
                 <td>
  
                         <div>  
                               <asp:RadioButtonList ID="RadioButtonList1" runat="server"   DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name"></asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbvoting %>" SelectCommand="SELECT [Name], [Position] FROM [Candidates]"></asp:SqlDataSource>
                    </div>
                 </td>
             </tr>
             <tr>
                 <td></td>
                 <td>
                  <div>
                             <asp:Button ID="btnsubmit" runat="server" Text="Vote" BackColor="Red" BorderColor="Black" ForeColor="White" OnClientClick="return confirm('Are you sure?');" OnClick="btnsubmit_Click" />

                             <br />
                             <asp:Label ID="Label3" runat="server"></asp:Label>

                         </div>

                 </td>
             </tr>
           
         </table>
           
         
       
        </div>
   
</asp:Content>
