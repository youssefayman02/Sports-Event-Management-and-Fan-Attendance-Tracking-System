<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fan.aspx.cs" Inherits="FinalProject.Fan1" %>

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
            <br />
            <br />
        </div>
        <ul>
            <li>
                <div>
                <asp:Label ID="Label2" runat="server" Text="All Available Tickets"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Enter a datetime"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="dateID" runat="server" type="datetime-local"></asp:TextBox>
                    &nbsp;
                    <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="View" OnClick="Button1_Click" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" align="Center" RowStyle-Wrap="false" CssClass="table table-responsive table-striped">
                    </asp:GridView>
                    <hr />
                    <br />
                    </div>
            </li>
            <li>
                <div>
                <asp:Label ID="Label4" runat="server" Text="Purchase A Ticket"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Enter host club"></asp:Label>
                &nbsp;
                    <asp:TextBox ID="hostID" runat="server"></asp:TextBox>
&nbsp;
                    <asp:Label ID="Label6" runat="server" Text="Enter guest club"></asp:Label>
                &nbsp;
                    <asp:TextBox ID="guestID" runat="server"></asp:TextBox>
&nbsp;
                    <asp:Label ID="Label7" runat="server" Text="Enter a datetime"></asp:Label>
                &nbsp;
                    <asp:TextBox ID="dateID1" runat="server" type="datetime-local"></asp:TextBox>
&nbsp;
                    <asp:Button ID="Button2" runat="server" class="btn btn-primary" OnClick="Button2_Click" Text="Purchase" />
                    <br />
                    <hr />
                </div>
            </li>
        </ul>
        
    </form>
</body>
</html>
