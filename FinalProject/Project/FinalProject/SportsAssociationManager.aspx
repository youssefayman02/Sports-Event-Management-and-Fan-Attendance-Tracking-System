<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportsAssociationManager.aspx.cs" Inherits="FinalProject.SportsAssociationManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    
    <form id="form1" runat="server">
        <div style="margin-left:auto; margin-right:auto;text-align:center">
            <asp:Label ID="Label13" runat="server" Text="Welcome"  Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </div>
        <ul>
            <li>
                <div>

                    <asp:Label ID="Label1" runat="server" Text="Add New Match"></asp:Label>

                    <br />

                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Enter host club name:"></asp:Label>

                &nbsp;<asp:TextBox ID="hostID" runat="server"></asp:TextBox>

                &nbsp;<asp:Label ID="Label3" runat="server" Text="Enter guest club name:"></asp:Label>

                &nbsp;<asp:TextBox ID="guestID" runat="server"></asp:TextBox>

                &nbsp;<br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Enter start time:" ></asp:Label>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                &nbsp;<asp:TextBox ID="startID" runat="server" type="datetime-local"></asp:TextBox>

                &nbsp;<asp:Label ID="Label5" runat="server" Text="Enter end time:"></asp:Label>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                &nbsp;<asp:TextBox ID="endID" runat="server" type="datetime-local"></asp:TextBox>

                &nbsp; <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Add New Match" OnClick="Button1_Click" />

                    &nbsp; <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="Delete Match" OnClick="Button2_Click" />

                    <br />

                    <hr />

                    <br />

                </div>
                </li>

            <li>
                <div>

                    <asp:Label ID="Label11" runat="server" Text="View All Upcoming Matches"></asp:Label>

                &nbsp;<asp:Button ID="Button3" runat="server" class="btn btn-primary" Text="View" OnClick="Button3_Click" />

                    <br />
                    <hr />
                    <br />

                </div>
            </li>

            <li>
                <div>

                    View Already Played Matches
                    <asp:Button ID="Button4" runat="server" class="btn btn-primary" Text="View" OnClick="Button4_Click" />

                    <br />

                    <hr />

                    <br />

                </div>
            </li>

            <li>
                <div>

                    <asp:Label ID="Label12" runat="server" Text=" View pair of club names who never scheduled to play with each other"></asp:Label>

                &nbsp;<asp:Button ID="Button5" runat="server" class="btn btn-primary" Text="View" OnClick="Button5_Click" />

                    <br />
                    <hr />

                </div>
            </li>
            </ul>
    </form>
</body>
</html>
