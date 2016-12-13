<%@ Page Language="C#" Title="Book Rooms" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookRoom.aspx.cs" Inherits="WesternHotel.user.BookRoom" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="DatasourceGetRooms" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>"
                SelectCommand="SELECT [rid] FROM [rooms]"></asp:SqlDataSource>
            <%--<asp:Label Text="Room ID" runat="server"></asp:Label><asp:TextBox ID="TextBoxRoomID" runat="server"></asp:TextBox>
            <asp:Label Text="Check In Date" runat="server"></asp:Label><asp:TextBox ID="TextBoxCheckInDate" runat="server"></asp:TextBox>
            <asp:Label Text="Check Out Date" runat="server"></asp:Label><asp:TextBox ID="TextBoxCheckOutDate" runat="server"></asp:TextBox>
            <asp:Label Text="Cost" runat="server"></asp:Label><asp:TextBox ID="TextBoxCost" runat="server"></asp:TextBox>

            <asp:Button ID="submitQuery" Text="Submit" runat="server" OnClick="submitQuery_Click" />

            <br /><asp:Label ID="Success" runat="server"></asp:Label>--%>

            <section class="form-horizontal">
                <fieldset>
                    <legend>
                        <h2 class="titleH2">Book Rooms</h2>
                    </legend>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Text="Room:"></asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList CssClass="form-control" ID="ListRoom" runat="server" DataSourceID="DatasourceGetRooms" DataTextField="rid" DataValueField="rid">
                                <asp:ListItem Selected="True" Value="" Text="-- Please Select --"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredBeds" runat="server" CssClass="text-danger" Display="Dynamic"
                                ErrorMessage="Beds Required" ControlToValidate="ListRoom"></asp:RequiredFieldValidator>
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
                <asp:Label ID="progressLabel" runat="server"></asp:Label>
            </section>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
