<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="viewteacherstopics.aspx.cs" Inherits="viewteacherstopics" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Blog</h2>
    </div>
    <div class="col-md-8 blog-left">
        <div>
            <iframe id="iFrame1" scrolling="yes" style="width: 100%; height: 800px" runat="server" />
        </div>
        <div class="container">

            <asp:Button ID="btnapprove" runat="server" Text="Approve" CssClass="btn  btn-success" OnClick="btnapprove_Click" />

            <asp:Button ID="btnreject" runat="server" Text="Reject" CssClass="btn btn-danger" OnClick="btnreject_Click" />
        </div>
    </div>
    <div class="col-md-4 single-page-right">

        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

