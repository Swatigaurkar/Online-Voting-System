<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="Online_Voting_System.Design.Admin.Result" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
             text-align: center;
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
         .auto-style5 {
             background-color: #FF3300;
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
                 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

             </div>
      
             <strong>
      
     <asp:Button ID="btnLogout" runat="server" OnClientClick="return confirm('Are you sure you want to Logout?');" OnClick="btnLogout_Click" Text="Logout" CssClass="auto-style6" />
             </strong>
            </div>
     <br />
          <h1>Voting Result</h1>
          <hr />
          <p>&nbsp;</p>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
        <Series>
            <asp:Series Name="Series1" XValueMember="Name" YValueMembers="Votes" YValuesPerPoint="4"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbvoting %>" SelectCommand="SELECT Candidates.*, vote.Vote AS Votes FROM Candidates INNER JOIN vote ON Candidates.Name = vote.Name"></asp:SqlDataSource>
     </div>


    <hr />
     <strong>
<asp:LinkButton runat="server" ID="LinkButton1" CommandName="Delete"

OnClientClick="return confirm('Are you sure you want to delete this Election?');" Text="Delete Election" OnClick="LinkButton1_Click" CssClass="auto-style5" ></asp:LinkButton>

     </strong>

</asp:Content>
