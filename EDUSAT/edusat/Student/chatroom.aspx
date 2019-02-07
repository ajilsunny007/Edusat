<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chatroom.aspx.cs" Inherits="Student_chatroom" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chat With Friends</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .b1 {
            margin-top: 50px;
        }

        input {
            padding: 0px;
            margin: 0px;
        }
        body {
            margin: 0px;
            background-color:#98d4ff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="background-color: #4bdd91; height: 100%;">
              
                <div style="width: 450px; height: 100%; border: 2px solid #0094ff; border-radius: 5px; float: left">
                         <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="500px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:Timer ID="Timer1" runat="server" Interval="500" OnTick="Timer1_Tick">
                            </asp:Timer>
                        </ContentTemplate>
                    </asp:UpdatePanel> </asp:Panel>
                    <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="307px"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" CssClass="b1" Height="32px" Width="37px" OnClick="ImageButton2_Click" ImageUrl="~/Design/images/back.jpg" />
                    <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
