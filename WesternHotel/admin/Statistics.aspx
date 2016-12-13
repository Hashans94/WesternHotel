<%@ Page Language="C#" Title="Statistics" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="WesternHotel.admin.Statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanelStatistics" runat="server">
        <ContentTemplate>

            <asp:SqlDataSource ID="DataSourceStatistics" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>"
                SelectCommand="SELECT [bookings].[rid] AS RoomID, COUNT(*) FROM [bookings] INNER JOIN [rooms] ON [bookings].[rid] = [rooms].[rid]
        GROUP BY [bookings].[rid]"></asp:SqlDataSource>

            <asp:SqlDataSource ID="DataSourceRooms" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>"
                SelectCommand="SELECT MONTH(btime) AS TheMonth, COUNT(*) AS NumOfBookings FROM [bookings] GROUP BY MONTH(btime)"></asp:SqlDataSource>

            <asp:Label ID="LabelHeader" CssClass="adminHeader" runat="server"><h2>Statistics</h2></asp:Label>
            <section class="form-horizontal">
                <fieldset>
                    <legend>Chart Options</legend>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Text="Chart Type:"></asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList CssClass="form-control" ID="ListChartType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ListChartType_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="Column" Text="Column"></asp:ListItem>
                                <asp:ListItem Value="Pie" Text="Pie"></asp:ListItem>
                                <asp:ListItem Value="Line" Text="Line"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Text="Chart Dimention:"></asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList CssClass="form-control" ID="ListChartDimension" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ListChartDimension_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="2D" Text="2D"></asp:ListItem>
                                <asp:ListItem Value="3D" Text="3D"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </fieldset>
            </section>

            <asp:Chart ID="Chart1" runat="server" DataSourceID="DataSourceStatistics">
                <Titles>
                    <asp:Title Text="Room Bookings"></asp:Title>
                </Titles>
                <Series>
                    <asp:Series Name="Series1" XValueMember="RoomID" YValueMembers="Column1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Room ID"></AxisX>
                        <AxisY Title="Bookings"></AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:Chart ID="Chart2" runat="server" DataSourceID="DataSourceRooms" Palette="EarthTones">
                <Titles>
                    <asp:Title Text="Bookings According To Month"></asp:Title>
                </Titles>
                <Series>
                    <asp:Series Name="Series1" XValueMember="TheMonth" YValueMembers="NumOfBookings"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Month"></AxisX>
                        <AxisY Title="Bookings"></AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
