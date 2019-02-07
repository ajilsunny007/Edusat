<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="seminars.aspx.cs" Inherits="Student_seminars" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Latest Seminar Topics</h2>
    </div>
    <div class="col-md-8 blog-left">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="table-condensed">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcategory" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="drpcategory_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("type") %>' CssClass="label label-info"></asp:Label>
                        <h3>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("topic") %>' CommandArgument='<%# Eval("seminarid") %>'></asp:LinkButton></h3>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                        <hr />
                    </ItemTemplate>
                </asp:ListView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

