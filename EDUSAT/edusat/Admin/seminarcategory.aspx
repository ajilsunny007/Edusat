<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="seminarcategory.aspx.cs" Inherits="seminarcategory" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="blog-head">
        <h2>Upload Seminar Category</h2>
    </div>
    <div class="col-md-8 blog-left">
        <table class=" table-condensed">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style1">
                    <asp:Button ID="btn_save" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btn_save_Click" />
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="no" HeaderText="No." />
                <asp:BoundField DataField="category" HeaderText="Category" />
            </Columns>
        </asp:GridView>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />

    </div>
</asp:Content>

