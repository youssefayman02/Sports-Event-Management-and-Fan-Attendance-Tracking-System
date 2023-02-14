<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStadiumInfo.aspx.cs" Inherits="FinalProject.ViewStadiumInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div><asp:GridView ID="GridView1" runat="server" Height="53px" Width="359px">
                    </asp:GridView>
        </div>
        <asp:Button ID="Button1" runat="server" Text="View Requests" OnClick="Button1_Click" class="btn btn-primary" />
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
