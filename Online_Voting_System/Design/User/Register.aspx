<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_Voting_System.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
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
    </style>
    <h2>Register...</h2>
     <hr />
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
     <div class="form-horizontal">
        <h4>Create a new account</h4>
       
         <asp:Label ID="Label2" runat="server"></asp:Label>
        <div class="form-group">
           
             <div class="col-md-10">   
             </div>
        </div>

      
        <div class="form-group">
           
            <strong>
           
            <asp:Label ID="LabelFname" runat="server" CssClass="col-md-2 control-label" Text="First Name"></asp:Label>
            
             </strong>
            
             <div class="col-md-10">   
                 <asp:TextBox ID="Fname" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="Fname" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        
        <div class="form-group">           
            <strong>
            <asp:Label ID="LabelLname" runat="server" CssClass="col-md-2 control-label" Text="Last Name"></asp:Label>         
             </strong>       
             <div class="col-md-10">
                    <asp:TextBox ID="Lname" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="Lname"></asp:RequiredFieldValidator>
             </div>
        </div>
        <div class="form-group">
            
            <strong>
            
            <asp:Label ID="Labeldob" runat="server" CssClass="col-md-2 control-label" Text="DOB"></asp:Label>
            
             </strong>
            
             <div class="col-md-10">
                 <div class="text-left">
                     <asp:DropDownList ID="txtdob" runat="server" CssClass="form-control control-label" Width="287px">
                     </asp:DropDownList>
                     <asp:Label ID="Label1" runat="server"></asp:Label>
                 </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtdob" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <strong>
                <asp:Button runat="server" OnClick="CreateUser_Click" OnClientClick="return confirm('Are you sure you want to register?');" Text="Register" CssClass="btn btn-default" BackColor="#FF3300" BorderColor="Black" ForeColor="White" style="font-weight: bold; font-size: medium" />
                </strong>
                <asp:HiddenField ID="Id_hfd" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
