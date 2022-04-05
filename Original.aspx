<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Original.aspx.cs" Inherits="Original" %>

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
<body style="align:left">
    <div style="width:600px; height: 110px;"></div>
    <div style="background-color:rgba(255, 255, 255, .4);width:600px; height: 120px; border-radius: 25px">
    <form id="form1" runat="server" style="font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">
        <p style="font-size:40px; color:red">&nbsp;Your Response is done</p>
        &nbsp;<asp:GridView ID="Event" runat="server" AutoGenerateColumns="False" align="center" Width="1016px" GridLines="Horizontal"  CssClass="cs" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
                <Columns>
                    <asp:BoundField DataField="original_content_id" HeaderText="ID" />
                    <asp:BoundField DataField="original_content_content_manager_id" HeaderText="Content Manager ID" />
                    <asp:BoundField DataField="original_content_reviewer_id" HeaderText="Reviewer ID" />
                    <asp:BoundField DataField="review_status" HeaderText="Review Status" />
                    <asp:BoundField DataField="filter_status" HeaderText="Filter Status" />
                    <asp:BoundField DataField="rating" HeaderText="Rating" />
                </Columns>
            </asp:GridView>
    </form></div>
</body>
</html>