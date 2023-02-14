<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRequests.aspx.cs" Inherits="FinalProject.ViewRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" >
            <Columns>
                <asp:ButtonField ButtonType="Button" Text="Accept" CommandName="Accept" runat="server" />
                <asp:ButtonField ButtonType="Button" Text="Reject" CommandName="Reject" runat="server" />
            </Columns>
        </asp:GridView>


        <br />


        <asp:Button runat="server" Text="View Stadium Info" OnClick="Unnamed1_Click" />

    </form>
</body>
</html>
