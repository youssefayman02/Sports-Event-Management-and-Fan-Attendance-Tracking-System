<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FinalProject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <h1 align="Center"> Welcome to Registration Page</h1>
    <form id="form1" runat="server">
        <div>
            <br />
            <h2>Register As:</h2>
            <br />
            <asp:Button ID="SAID" class="btn btn-primary" runat="server" Text="SportsAssociationManager" OnClick="SportsAssociationManager" />
            &nbsp;<asp:Button ID="CRID" class="btn btn-primary" runat="server" Text="Club_Representative" OnClick="Club_Representative" />
            &nbsp;<asp:Button ID="SMID" class="btn btn-primary" runat="server" Text="Stadium_Manager" OnClick="Stadium_Manager" />
            &nbsp;<asp:Button ID="FanID" class="btn btn-primary" runat="server" Text="Fan" OnClick="Fan" />
            <br />

        </div>
    </form>
</body>
</html>
