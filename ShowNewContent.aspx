<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowNewContent.aspx.cs" Inherits="ShowNewContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
html{
	background:url('image/2889095.jpg') no-repeat center center fixed;
	-webkit-background-size:cover;
	-moz-background-size:cover;
	-o-background-size:cover;
	background-size:cover;
}
ul{
    margin:0px;
    padding:0px;
    list-style:none
}
ul li{
    float: left;
    width:200px;
    height:40px;
    background-color: black;
    opacity:.8;
    line-height:40px;
    text-align:center;
    font-size:20px;
}
ul li a{
    text-decoration:none;
    color :white;
    display: block;
}
ul li a:hover{
    background-color: red;
}
ul li ul li{
    display: none;
}
ul li:hover ul li{
    display: block;
}
.cs{
    width: 80%;
    border: solid 2px black;
    min-width: 80%;

}
.header
{
    background-color: #646464;
    font-family: Arial;
    color: White;
    height: 25px;
    text-align: center;
    font-size: 16px;
}
.rows
{
    background-color: #fff;
    font-family: Arial;
    font-size: 14px;
    color: #000;
    min-height: 25px;
    text-align: left;
}

.rows:hover
{
    background-color: #ff8000;
    font-family: Arial;
    color: #fff;
    text-align: left;
}
</style>
</head>
    <ul>
        <li><a href="eventcreater.aspx">Create Event</a></li>
        <li><a href="existingrequest.aspx">Apply Existing Request</a></li>
        <li><a>New Request</a>
            <ul>
                <li><a href="Newrequest.aspx">Apply</a></li>
                <li><a href="DeleteNewRequest.aspx">Delete</a></li>
            </ul>
        </li>
        <li><a>Original Content</a>
            <ul>
            <li><a href="ratecontent.aspx">Review</a></li>
            <li><a href="WriteComment.aspx">Write Comment</a></li>
            <li><a href="EditComment.aspx">Edit Comment</a></li>
            <li><a href="DeleteComment.aspx">Delete Comment</a></li>
        </ul>
        </li>
        <li><a>Advertisment</a>
            <ul>
            <li><a href="CreateAd.aspx">Create</a></li>
            <li><a href="EditAd.aspx">Edit</a></li>
            <li><a href="DeleteAd.aspx">Delete</a></li>
        </ul>
        </li>
        <li><a href="ShowNewContent.aspx">Show New Content</a></li>
    </ul>
<body>
    <form id="form1" runat="server">
        <br>
        <br>
        <br>
        <br>
        <br>
            <table style="margin-top:10%; background-color:aqua" align="center">
                <tr>
                    <td>&nbsp;Viewer ID*</td>
                    <td>&nbsp;<asp:TextBox ID="Viewer_ID" runat="server"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;New Request ID</td>
                    <td>&nbsp;<asp:TextBox ID="request" runat="server"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;<asp:Button ID="Button1" runat="server" Text="Show" OnClick="Button1_Click" /></td>
                    <td>&nbsp;</td>
                </tr>
              </table>
            <div><td>&nbsp;<asp:Label id="Label1" runat="server" BackColor="White"/></td>

            </div>
            <div>
            <asp:GridView ID="NewContent" runat="server" AutoGenerateColumns="false" align="center" GridLines="Horizontal"  CssClass="cs" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
                <Columns>
                    <asp:BoundField DataField="new_content_id" HeaderText="Content ID" />
                    <asp:BoundField DataField="new_content_new_request_id" HeaderText="New Request ID" />
                    <asp:BoundField DataField="new_request_viewer_ID" HeaderText="Viewer ID" />
                    <asp:BoundField DataField="first_name" HeaderText="Contributer first name" />
                    <asp:BoundField DataField="middle_name" HeaderText="Contributer middle name" />
                    <asp:BoundField DataField="last_name" HeaderText="Contributer last name" />
                </Columns>
            </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
