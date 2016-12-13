<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="WesternHotel.user.MyBookings" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="UpdatePanelMyBookings" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="DataSourceBookings" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>" 
                SelectCommand="SELECT customers.gname, customers.sname, bookings.rid, bookings.checkin, bookings.checkout, bookings.cost, bookings.btime FROM bookings INNER JOIN customers ON bookings.username = customers.username WHERE (bookings.username = @username)">
                <SelectParameters>
                    <asp:Parameter Name="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <fieldset>
                <legend class="titleH2 no-border"><h2>My Bookings</h2></legend>
            </fieldset>
            <asp:GridView ID="GridViewBookings" CssClass="table" BorderStyle="None" runat="server" DataSourceID="DataSourceBookings" AllowSorting="True" AutoGenerateColumns="False" BorderColor="White">
                <Columns>
                    <asp:BoundField DataField="gname" HeaderText="Given Name" SortExpression="gname" />
                    <asp:BoundField DataField="sname" HeaderText="Surname" SortExpression="sname" />
                    <asp:BoundField DataField="rid" HeaderText="Room ID" SortExpression="rid" />
                    <asp:BoundField DataField="checkin" HeaderText="Check In Date" SortExpression="checkin" />
                    <asp:BoundField DataField="checkout" HeaderText="Check Out Date" SortExpression="checkout" />
                    <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                    <asp:BoundField DataField="btime" HeaderText="Booking Time" SortExpression="btime" />
                </Columns>
                <EmptyDataTemplate>
                    <h3 class="text-danger">You currently don't have any bookings!</h3>
                </EmptyDataTemplate>
            </asp:GridView>   
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
