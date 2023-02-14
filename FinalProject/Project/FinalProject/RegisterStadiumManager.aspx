<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterStadiumManager.aspx.cs" Inherits="FinalProject.RegisterStadiumManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:auto; margin-right:auto;text-align:center">
            <asp:Label ID="Label5" runat="server" Text="Welcome New Stadium Manager"  Font-Bold="true" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="nameID" runat="server"></asp:TextBox>

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
&nbsp;
            <asp:TextBox ID="usernameID" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password" ></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="passwordID" TextMode="Password" runat="server"></asp:TextBox>

        &nbsp;<br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Stadium"></asp:Label>

            &nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="stadiumID" runat="server"></asp:TextBox>

        &nbsp;
            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Register" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
