<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAllUpcomingMatchesClub.aspx.cs" Inherits="FinalProject.ViewAllUpcomingMatchesClub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:auto; margin-right:auto;text-align:center">
            <asp:Label ID="Label1" runat="server" Text="View All Upcoming Club Matches"  Font-Bold="true" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" align="Center" RowStyle-Wrap="false" CssClass="table table-responsive table-striped">
            </asp:GridView>

        </div>
    </form>
</body>
</html>
