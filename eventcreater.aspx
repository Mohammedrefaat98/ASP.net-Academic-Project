<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eventcreater.aspx.cs" Inherits="eventcreater" %>

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
    <div style="background-color:rgba(255, 255, 255, .4);width:450px; height: 780px; border-radius: 25px">
    <form id="form1" runat="server" style="font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">
        <br>
            <p>&nbsp;&nbsp;Viewer ID*</p>
        &nbsp;<asp:TextBox id="Viewer_id" runat="server"/>
            <br>
        <p>&nbsp;&nbsp;Description*</p>
        &nbsp;<asp:TextBox id="Description" runat="server"/>
            <br>
        <p>&nbsp;&nbsp;City*</p>
        &nbsp;<asp:TextBox id="City" runat="server"/>
            <br>
        <p>&nbsp;&nbsp;Time*</p>
        &nbsp;<asp:TextBox id="Time" runat="server"/>
        &nbsp;<asp:Label runat="server" Text="MM/DD/YYYY *" ForeColor="#ffff00" Font-Bold="true"/>
            <br> 
        <p>&nbsp;&nbsp;Entertainer*</p>
        &nbsp;<asp:TextBox id="Entertainer" runat="server"/>
            <br>
        <p>&nbsp;&nbsp;Photo link</p>
        &nbsp;<asp:TextBox id="Photolink" runat="server"/>
            <br>
        <p>&nbsp;&nbsp;Video link</p>
        &nbsp;<asp:TextBox id="Videolink" runat="server"/>
            <br>
            <br>
        &nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Text="I will need to advertise this event" OnCheckedChanged="CheckBox1_CheckedChanged" />
            <br>
        &nbsp;<asp:Button id="button2" runat="server" Text="Create" OnClick="Button2Clicked" Width="74px" />
            <br>
        &nbsp;<asp:Label id="Label1" runat="server"/>
        <br>
        <br>
        &nbsp;<asp:Label id="Label2" runat="server" Text="*: recommended" Font-Size="15px" Font-Bold="true" ForeColor="#993333"/>
	</form></div>
    <br>
    <br>
    <div style="height: 22px; text-align:center;color:white;font-size:15px; background-color:black; font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; border-radius: 15px" >© 2018 - IEgypt WebSite</div>
</body>
</html>
