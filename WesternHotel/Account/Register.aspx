<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WesternHotel.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2 class="titleH2"><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" MaxLength="30" placeholder="example@email.com" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
                <asp:RegularExpressionValidator ID="emailPatternValidator" Display="Dynamic" ControlToValidate="Email" 
                    ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" runat="server" CssClass="text-danger" 
                    ErrorMessage="Invalid Email Format! (eg:example@email.com)"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="gname" CssClass="col-md-2 control-label">Given Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="gname" MaxLength="20" CssClass="form-control" placeholder="John" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="gname" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Given Name field is required." />
                <asp:RegularExpressionValidator ID="givenNamePatternValidator" Display="Dynamic" ControlToValidate="gname" 
                    ValidationExpression="[a-zA-z\'\-]+" runat="server" CssClass="text-danger" 
                    ErrorMessage="Invalid Name Format (allowed charcters a-z ' - ONLY)"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="sname" CssClass="col-md-2 control-label">Surname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="sname" MaxLength="20" CssClass="form-control" placeholder="Citizen" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="sname" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Surname field is required." />
                <asp:RegularExpressionValidator ID="lastNamePatternValidator" Display="Dynamic" ControlToValidate="sname" 
                    ValidationExpression="[a-zA-z\'\-]+" runat="server" CssClass="text-danger" 
                    ErrorMessage="Invalid Name Format (allowed charcters a-z ' - ONLY)"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="address" MaxLength="40" CssClass="form-control" placeholder="20 address road" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="address" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Address field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="state" CssClass="col-md-2 control-label">State</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="state" CssClass="form-control" runat="server">
                    <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                    <asp:ListItem Value="NSW">NSW</asp:ListItem>
                    <asp:ListItem Value="ACT">ACT</asp:ListItem>
                    <asp:ListItem Value="VIC">VIC</asp:ListItem>
                    <asp:ListItem Value="WA">WA</asp:ListItem>
                    <asp:ListItem Value="QLD">QLD</asp:ListItem>
                    <asp:ListItem Value="SA">SA</asp:ListItem>
                    <asp:ListItem Value="NT">NT</asp:ListItem>
                    <asp:ListItem Value="TAS">TAS</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="state" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The State field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="postcode" CssClass="col-md-2 control-label">Postcode</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="postcode" MaxLength="4" CssClass="form-control" placeholder="2770" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="postcode" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Postcode field is required." />
                <asp:RegularExpressionValidator ID="postcodePatternValidate" Display="Dynamic" ControlToValidate="postcode" 
                    CssClass="text-danger" runat="server" ValidationExpression="[0-9]{4}" ErrorMessage="Postcode can MUST contain 4 Numeric characters">
                </asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="mobile" CssClass="col-md-2 control-label">Mobile</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mobile" MaxLength="10" CssClass="form-control" placeholder="04dddddddd" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="mobile" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Mobile field is required." />
                <asp:RegularExpressionValidator ID="mobilePatternValidator" CssClass="text-danger" Display="Dynamic" 
                    ControlToValidate="mobile" ValidationExpression="04[0-9]{8}" runat="server" 
                    ErrorMessage="Invalid Mobile Number, Please follow this format 04dddddddd (where d is a digit)">
                </asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default btn-new-submit" />
            </div>
        </div>
    </div>
</asp:Content>
