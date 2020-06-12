<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Online_Voting_System.Design.Admin.admin" %>
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

        .auto-style3 {
            color: #000066;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            text-align: center;
        }

    .auto-style4 {
        font-size: xx-large;
        color: #000066;
        font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
        }

    </style>
    <div class="text-center">
    <asp:Panel ID="Panel1" runat="server">
        &nbsp;
        <h1 class="auto-style4"><strong style="border-style: none; border-width: inherit; border-color: #FF0000;">Welcome to Admin
            </strong></h1>
        <asp:Image ID="Image2" runat="server" Height="236px" ImageUrl="~/Image/admin.png" Width="401px" />
    </asp:Panel>
</div>
</asp:Content>
