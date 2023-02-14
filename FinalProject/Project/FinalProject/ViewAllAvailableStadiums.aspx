<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAllAvailableStadiums.aspx.cs" Inherits="FinalProject.ViewAllAvailableStadiums" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:auto; margin-right:auto;text-align:center">
            <asp:Label ID="Label1" runat="server" Text="View All Available Stadiums"  Font-Bold="true" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            <br />
            </div>
        <ul>
            <li>
                <div>

                    <asp:Label ID="Label2" runat="server" Text="Enter Date"></asp:Label>

                &nbsp;
                    <asp:TextBox ID="dateID" runat="server" Type="datetime-local"></asp:TextBox>

                &nbsp;
                    <asp:Button ID="Button1" runat="server" Text="View" class="btn btn-primary" OnClick="Button1_Click" />

                    <br />
                    <hr />

                </div>
            </li>
        </ul>
        <div>

            <asp:GridView ID="GridView1" runat="server" align="Center" RowStyle-Wrap="false" CssClass="table table-responsive table-striped">
            </asp:GridView>

        </div>
    </form>
</body>
</html>
