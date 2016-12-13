<%@ Page Language="C#" Title="Search Room" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchRoom.aspx.cs" Inherits="WesternHotel.user.SearchRoom" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanelSearchRooms" runat="server">
        <ContentTemplate>
            <section class="form-horizontal">
                <fieldset>
                    <legend><h2 class="titleH2">Search Rooms</h2></legend>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Text="Beds:"></asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList CssClass="form-control" ID="ListBeds" runat="server">
                                <asp:ListItem Selected="True" Value="" Text="-- Please Select --"></asp:ListItem>
                                <asp:ListItem Value="1" Text="1 Bed"></asp:ListItem>
                                <asp:ListItem Value="2" Text="2 Beds"></asp:ListItem>
                                <asp:ListItem Value="3" Text="3 Beds"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredBeds" runat="server" CssClass="text-danger" Display="Dynamic"
                                ErrorMessage="Beds Required" ControlToValidate="ListBeds"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Text="Orientation:"></asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList CssClass="form-control" ID="ListOrientation" runat="server">
                                <asp:ListItem Selected="True" Value="" Text="-- Please Select --"></asp:ListItem>
                                <asp:ListItem Value="N" Text="North"></asp:ListItem>
                                <asp:ListItem Value="S" Text="South"></asp:ListItem>
                                <asp:ListItem Value="E" Text="East"></asp:ListItem>
                                <asp:ListItem Value="W" Text="West"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Text="Check In Date:"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBoxCheckInDate" CssClass="form-control" TextMode="Date" placeholder="01/12/2016" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredCheckInDate" CssClass="text-danger" runat="server" Display="Dynamic"
                                ControlToValidate="TextBoxCheckInDate" ErrorMessage="Check In Date Required">
                            </asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="ValidateCheckInDate" runat="server" CssClass="text-danger" Display="Dynamic" ControlToValidate="TextBoxCheckInDate"
                                ErrorMessage="" OnServerValidate="ValidateDate_ServerValidate"></asp:CustomValidator>
                        </div>

                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Text="Check Out Date:"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBoxCheckOutDate" CssClass="form-control" TextMode="Date" placeholder="01/12/2016" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" Display="Dynamic"
                                ControlToValidate="TextBoxCheckOutDate" ErrorMessage="Check Out Date Required">
                            </asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="ValidateCheckOutDate" runat="server" CssClass="text-danger" Display="Dynamic" ControlToValidate="TextBoxCheckOutDate"
                                ErrorMessage="" OnServerValidate="ValidateCheckOutDate_ServerValidate"></asp:CustomValidator>
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" ID="submit" Text="Submit" CssClass="btn btn-default btn-new-submit" OnClick="submit_Click" />
                        </div>
                    </div>
                </fieldset>
            </section>

            
            <section>
               <asp:Label ID="DynamicTable" runat="server"></asp:Label>
                
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
