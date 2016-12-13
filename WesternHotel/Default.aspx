<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WesternHotel._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LoginView ViewStateMode="Disabled" runat="server">
        <AnonymousTemplate>
            <div class="jumbotron default" id="templateType">
                <h1>WELCOME TO<br />WESTERN SYDNEY HOTEL</h1>
                <%--<p class="lead"></p>--%>
               <%-- <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
                    
            </div>
        </AnonymousTemplate>

        <RoleGroups>
            <asp:RoleGroup Roles="user">
                <ContentTemplate>
                <div class="jumbotron" id="templateType">
                    <h1>WELCOME TO<br />
                        WESTERN SYDNEY HOTEL</h1>
                    <%--<p class="lead"></p>--%>
                    <%-- <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
                </div>

                <div class="row user-stuff">
                        <div class="col-md-4">
                            <h2>Search Rooms</h2>
                            <p>
                                This page enable a logged-in user to update his/her details in the database. 
                            </p>
                        </div>

                        <div class="col-md-4">
                            <h2>Book Rooms</h2>
                            <p>
                                This page should allow a logged-in user to display details of all his/her permit purchases to date. 
                            </p>
                        </div>

                        <div class="col-md-4">
                            <h2>My Bookings</h2>
                            <p>
                                This page enables a logged-in user to make a new purchase
                            </p>

                        </div>
                    </div>
                </ContentTemplate>
            </asp:RoleGroup>

            <asp:RoleGroup Roles="admin">
                <ContentTemplate>
                <div class="jumbotron" id="templateType">
                    <h1>WELCOME TO<br />
                        WESTERN SYDNEY HOTEL</h1>
                    <%--<p class="lead"></p>--%>
                    <%-- <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
                </div>

                <div class="row admin-stuff">
                        <div class="col-md-6">
                            <h2>Manage Rooms</h2>
                            <p>
                                This page enables a logged-in admin to update room details in the database. 
                            </p>
                        </div>

                        <div class="col-md-6">
                            <h2>Statistics</h2>
                            <p>
                                This page allows a logged-in admin to display statistics of bookings. 
                            </p>
                        </div>
                    </div>
                </ContentTemplate>

            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>

</asp:Content>
