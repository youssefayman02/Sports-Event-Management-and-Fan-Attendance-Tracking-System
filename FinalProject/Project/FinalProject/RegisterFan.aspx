<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterFan.aspx.cs" Inherits="FinalProject.Fan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:auto; margin-right:auto;text-align:center">
            <asp:Label ID="Label8" runat="server" Text="Welcome New Fan"  Font-Bold="true" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="nameID" runat="server"></asp:TextBox>

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="usernameID" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password" ></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="passwordID" TextMode="Password" runat="server"></asp:TextBox>

        &nbsp;<br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="National Id Number"></asp:Label>

        &nbsp;
            <asp:TextBox ID="nationalID" runat="server"></asp:TextBox>

        &nbsp;
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Phone Number"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<asp:TextBox ID="phoneID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="addressID" runat="server"></asp:TextBox>
&nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="BirthDate"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="dateID" type="datetime-local" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            
            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Register" OnClick="Button1_Click1" />
            
        </div>
    </form>
</body>
</html>
