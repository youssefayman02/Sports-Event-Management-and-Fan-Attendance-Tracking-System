<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StadiumManager.aspx.cs" Inherits="FinalProject.StadiumManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
         <div style="margin-left:auto; margin-right:auto;text-align:center">
            <asp:Label ID="Label13" runat="server" Text=""  Font-Bold="true" Font-Size="X-Large"></asp:Label>
             <br />
             <br />
            </div>
        <div style="margin-left:auto; margin-right:auto;text-align:center">
        <asp:Button ID="Button1" runat="server" Text="View Stadium Info" OnClick="Button1_Click" class="btn btn-primary" />
        <p>
            <asp:Button ID="Button2" runat="server" Text="View Requests" OnClick="Button2_Click" class="btn btn-primary"/>
        </p>
                        </div>
    </form>
</body>
</html>
