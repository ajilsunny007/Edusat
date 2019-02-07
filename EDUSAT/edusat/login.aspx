<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        table {
            margin: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-group" >
 <h4 style="color:#4cc47d"> <span>Please Log in to EDUSAT for flexible communication</span></h4>
        <br />
    <table class="table-condensed"  >
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Username(E-Mail Id)" CssClass="control-label" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtuname" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Password" CssClass="control-label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btn_login" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="btn_login_Click"  />
            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Small" ForeColor="#FF6600" OnClick="LinkButton2_Click">Fogot Your Password</asp:LinkButton>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >Not a Member||Sign Up</asp:LinkButton>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
                        <asp:Label ID="lblmsg" runat="server" CssClass="control-label"></asp:Label>
        <br />
       </div>
</asp:Content>

