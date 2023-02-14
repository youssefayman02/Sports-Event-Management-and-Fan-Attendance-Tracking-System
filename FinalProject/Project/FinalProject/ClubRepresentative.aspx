<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentative.aspx.cs" Inherits="FinalProject.ClubRepresentative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:auto; margin-right:auto;text-align:center">
            <asp:Label ID="Label1" runat="server" Text="Welcome"  Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </div>
        <ul>
            <li>
                <div>

                    <asp:Label ID="Label2" runat="server" Text="Information about the club you are representating"></asp:Label>

                    &nbsp;<asp:Button ID="Button4" runat="server" Text="View" class="btn btn-primary" OnClick="Button4_Click" />

                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="53px" Width="359px">
                    </asp:GridView>

                    <hr />

                    <br />

                </div>
            </li>

            <li>
                <div>


                    <asp:Label ID="Label3" runat="server" Text="View All Upcoming Matches "></asp:Label>


                &nbsp;<asp:Button ID="Button1" runat="server"  class="btn btn-primary" Text="View" OnClick="Button1_Click" />


                    <br />
                    <hr />


                    <br />


                </div>
            </li>

            <li>
                <div>

                    <asp:Label ID="Label4" runat="server" Text="View All Available Stadiums"></asp:Label>

                &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="View" OnClick="Button2_Click" />

                    <br />
                    <hr />

                </div>
            </li>

            <li>
                <div>

                    <asp:Label ID="Label5" runat="server" Text="Send host request"></asp:Label>

                    <br />

                    <br />
                    <asp:Label ID="Label7" runat="server" Text="Enter stadium name"></asp:Label>

                   &nbsp;<asp:TextBox ID="stadiumID" runat="server"></asp:TextBox>

                    <br />
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="Enter start time"></asp:Label>

                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:TextBox ID="startID" runat="server" type="datetime-local"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" Text="Enter end time"></asp:Label>

                   &nbsp;<asp:TextBox ID="endID" runat="server" type="datetime-local"></asp:TextBox>

                   &nbsp;
                    <asp:Button ID="Button3" runat="server" class="btn btn-primary" Text="Send Request" OnClick="Button3_Click" />

                    <br />
                    <hr />

                   </div>
            </li>
        </ul>
    </form>
</body>
</html>
