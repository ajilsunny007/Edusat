<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="forgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btn_login" runat="server" Text="OK" CssClass="btn btn-primary" OnClick="btn_login_Click"  />
            &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >Create a New Account</asp:LinkButton>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
</asp:Content>

