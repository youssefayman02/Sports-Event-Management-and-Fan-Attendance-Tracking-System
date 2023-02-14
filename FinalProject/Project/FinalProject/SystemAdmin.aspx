<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="FinalProject.SystemAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:auto; margin-right:auto;text-align:center">
            <asp:Label ID="Label9" runat="server" Text="Welcome"  Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </div>
        <ul>
            <li>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Add a club "></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Enter name"></asp:Label>
        &nbsp;<asp:TextBox ID="clubnameID" runat="server"></asp:TextBox>
        &nbsp;<asp:Label ID="Label3" runat="server" Text="Enter location"></asp:Label>
        &nbsp;<asp:TextBox ID="clublocationId" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Add new Club" OnClick="Button1_Click" />
            <br />
            <hr />
        </div>
                </li>

            <li>

        <div>

            <asp:Label ID="Label4" runat="server" Text="Delete club"></asp:Label>

            <br />
            <asp:Label ID="Label5" runat="server" Text="Enter name"></asp:Label>
&nbsp;<asp:TextBox ID="clubnameID2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="Delete club" OnClick="Button2_Click" />

            <br />
            <hr />

            </div>

                </li>

            <li>
            
        <div>

            <asp:Label ID="Label6" runat="server" Text="Add stadium"></asp:Label>

            <br />
            Enter name
            <asp:TextBox ID="snameID" runat="server"></asp:TextBox>
&nbsp;Enter location
            <asp:TextBox ID="slocationID" runat="server"></asp:TextBox>
&nbsp;Enter capacity
            <asp:TextBox ID="scapacityID" runat="server" type="Number" min="0"></asp:TextBox>
&nbsp;<asp:Button ID="Button3" runat="server" class="btn btn-primary" Text="Add new stadium" OnClick="Button3_Click" />

            <br />
            <hr />

        </div>
                </li>

            <li>

        <div>

            Delete stadium<br />
            Enter name
            <asp:TextBox ID="snameID2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button4" runat="server" class="btn btn-primary" Text="Delete Stadium" OnClick="Button4_Click" />

            <br />
            <hr />

        </div>
                </li>

            <li>

        <div>

            <asp:Label ID="Label7" runat="server" Text="Block a Fan"></asp:Label>

            <br />
            <asp:Label ID="Label8" runat="server" Text="Enter a national id number"></asp:Label>

        &nbsp;<asp:TextBox ID="fID" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button5" runat="server" class="btn btn-primary" Text="Block" OnClick="Button5_Click" />

        &nbsp;
            <asp:Button ID="Button6" runat="server" class="btn btn-primary" Text="Unblock" OnClick="Button6_Click" />
            <br />
            <hr />

        </div>
                </li>
        </ul>
    </form>
</body>
</html>
