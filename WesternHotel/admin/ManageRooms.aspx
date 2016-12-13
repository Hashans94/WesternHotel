<%@ Page Language="C#" Title="Manage Rooms" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="WesternHotel.admin.ManageRooms" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="manageRoomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>" DeleteCommand="DELETE FROM [rooms] WHERE [rid] = @rid" InsertCommand="INSERT INTO [rooms] ([rid], [level], [beds], [orientation], [price]) VALUES (@rid, @level, @beds, @orientation, @price)" SelectCommand="SELECT * FROM [rooms]" UpdateCommand="UPDATE [rooms] SET [level] = @level, [beds] = @beds, [orientation] = @orientation, [price] = @price WHERE [rid] = @rid">
        <DeleteParameters>
            <asp:Parameter Name="rid" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="rid" Type="String" />
            <asp:Parameter Name="level" Type="String" />
            <asp:Parameter Name="beds" Type="Byte" />
            <asp:Parameter Name="orientation" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="level" Type="String" />
            <asp:Parameter Name="beds" Type="Byte" />
            <asp:Parameter Name="orientation" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="rid" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:Label ID="LabelHeader" CssClass="adminHeader" runat="server"><h2>Manage Rooms</h2></asp:Label>
    <asp:UpdatePanel ID="updateManageRooms" runat="server">
        <ContentTemplate>
            <asp:ListView ID="ListViewManageRooms" runat="server" DataKeyNames="rid" DataSourceID="manageRoomsDataSource" InsertItemPosition="LastItem">
                <LayoutTemplate>
                    <table class="table" runat="server" id="LayoutTemplateTable">
                        <thead>
                            <tr runat="server">
                                <th>Action</th>
                                <th>Room ID</th>
                                <th>Level</th>
                                <th>Beds</th>
                                <th>Orientation</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>

                <EmptyDataTemplate>
                    <table runat="server" class="table">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr runat="server">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-sm btn-default" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass=" btn btn-sm btn-default" />
                        </td>
                        <td>
                            <asp:Label ID="LabelRoomId" runat="server" Text='<%# Eval("rid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LabelLevel" runat="server" Text='<%# Eval("level") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LabelBeds" runat="server" Text='<%# Eval("beds") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LabelOrientation" runat="server" Text='<%# Eval("orientation") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LabelPrice" runat="server" Text='<%# Eval("price") %>' />
                        </td>
                    </tr>
                </ItemTemplate>

                <EditItemTemplate>
                    <tr runat="server">
                        <td>
                            <asp:Button CssClass="btn btn-sm btn-success" ID="UpdateButton" runat="server" ValidationGroup="validateUpdate" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-sm btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="LabelEditRoomId" runat="server" Text='<%# Eval("rid") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" placeholder="Level" ID="TextBoxLevel" runat="server" Text='<%# Bind("level") %>' />
                            
                            <asp:RequiredFieldValidator ID="RequireLevel" ControlToValidate="TextBoxLevel" Display="Dynamic"
                                ValidationGroup="validateUpdate" ErrorMessage="Level Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchLevel" ControlToValidate="TextBoxLevel" Display="Dynamic" 
                                ValidationGroup="validateUpdate" ErrorMessage="Invalid Level" ValidationExpression="[G123]{1}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>

                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" placeholder="Beds" ID="TextBoxBeds" runat="server" Text='<%# Bind("beds") %>' />

                             <asp:RequiredFieldValidator ID="RequireBeds" ControlToValidate="TextBoxBeds" Display="Dynamic"
                                ValidationGroup="validateUpdate" ErrorMessage="Beds Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchBeds" ControlToValidate="TextBoxBeds" Display="Dynamic" 
                                ValidationGroup="validateUpdate" ErrorMessage="Invalid Beds" ValidationExpression="[123]{1}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>

                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" placeholder="Orientation" ID="TextBoxOrientation" runat="server" Text='<%# Bind("orientation") %>' />
                            
                            <asp:RequiredFieldValidator ID="RequireOrientation" ControlToValidate="TextBoxOrientation" Display="Dynamic"
                                ValidationGroup="validateUpdate" ErrorMessage="Orientation Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchOrientation" ControlToValidate="TextBoxOrientation" Display="Dynamic" 
                                ValidationGroup="validateUpdate" ErrorMessage="Invalid Orientation" ValidationExpression="[NSWE]{1}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>

                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" placeholder="Price" ID="TextBoxPrice" runat="server" Text='<%# Bind("price") %>' />

                            <asp:RequiredFieldValidator ID="RequirePrice" ControlToValidate="TextBoxPrice" Display="Dynamic"
                                ValidationGroup="validateUpdate" ErrorMessage="Price Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchPrice" ControlToValidate="TextBoxPrice" Display="Dynamic" 
                                ValidationGroup="validateUpdate" ErrorMessage="Invalid Price" ValidationExpression="[0-9]*\.{0,1}[0-9]{0,2}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>

                        </td>
                    </tr>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <tr runat="server">
                        <td>
                            <asp:Button CssClass="btn btn-sm btn-primary" ValidationGroup="validateInsert" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass=" btn btn-sm btn-danger" ID="CancelButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" placeholder="Room ID" ID="TextBoxRoomID" runat="server" Text='<%# Bind("rid") %>' />
                            
                            <asp:RequiredFieldValidator ID="RequireRoomID" ControlToValidate="TextBoxRoomID" Display="Dynamic"
                                ValidationGroup="validateInsert" ErrorMessage="Room ID Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchRoomID" ControlToValidate="TextBoxRoomID" Display="Dynamic" 
                                ValidationGroup="validateInsert" ErrorMessage="Invalid Room ID" ValidationExpression="[G123]{1}[0-9]{2}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" placeholder="Level" ID="TextBoxLevel" runat="server" Text='<%# Bind("level") %>' />

                            <asp:RequiredFieldValidator ID="RequireLevel" ControlToValidate="TextBoxLevel" Display="Dynamic"
                                ValidationGroup="validateInsert" ErrorMessage="Level Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchLevel" ControlToValidate="TextBoxLevel" Display="Dynamic" 
                                ValidationGroup="validateInsert" ErrorMessage="Invalid level" ValidationExpression="[G123]{1}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>

                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" placeholder="Beds" ID="TextBoxBeds" runat="server" Text='<%# Bind("beds") %>' />

                            <asp:RequiredFieldValidator ID="RequireBed" ControlToValidate="TextBoxBeds" Display="Dynamic"
                                ValidationGroup="validateInsert" ErrorMessage="Beds Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchBed" ControlToValidate="TextBoxBeds" Display="Dynamic" 
                                ValidationGroup="validateInsert" ErrorMessage="Invalid Bed" ValidationExpression="[123]{1}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>

                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" placeholder="Orientation" ID="TextBoxOrientation" runat="server" Text='<%# Bind("orientation") %>' />

                            <asp:RequiredFieldValidator ID="RequireOrientations" ControlToValidate="TextBoxOrientation" Display="Dynamic"
                                ValidationGroup="validateInsert" ErrorMessage="Orientation Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchOrientations" ControlToValidate="TextBoxOrientation" Display="Dynamic" 
                                ValidationGroup="validateInsert" ErrorMessage="Invalid Orientation" ValidationExpression="[NSWE]{1}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control newTextBox" ID="TextBoxPrice" placeholder="Price" runat="server" Text='<%# Bind("price") %>' />

                            <asp:RequiredFieldValidator ID="RequirePrice" ControlToValidate="TextBoxPrice" Display="Dynamic"
                                ValidationGroup="validateInsert" ErrorMessage="Price Required" CssClass="text-danger" runat="server">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchPrice" ControlToValidate="TextBoxPrice" Display="Dynamic" 
                                ValidationGroup="validateInsert" ErrorMessage="Invalid Price" ValidationExpression="[0-9]*\.{0,1}[0-9]{0,2}" CssClass="text-danger" runat="server">
                            </asp:RegularExpressionValidator>

                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
