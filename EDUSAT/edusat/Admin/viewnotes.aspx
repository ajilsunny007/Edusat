<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="viewnotes.aspx.cs" Inherits="Admin_viewnotes" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="blog-head">
        <h2>View Notes</h2>
    </div>
    <div class="col-md-8 blog-left">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <table class="table-condensed">
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Select Course"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcourse" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpcourse_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Subject"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpSubject" runat="server" CssClass="form-control">
                                <asp:ListItem>--SELECT--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                         </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Note Type"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpNotetype" runat="server" CssClass="form-control">
                                <asp:ListItem>--SELECT--</asp:ListItem>
                                <asp:ListItem>PDF</asp:ListItem>
                                <asp:ListItem>VIDEO</asp:ListItem>
                                <asp:ListItem>PPT</asp:ListItem>
                                   <asp:ListItem>TextBook</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-primary" OnClick="btnView_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" >
            <Columns>
                <asp:BoundField DataField="no" HeaderText="No." />
                <asp:BoundField DataField="download_type" HeaderText="Type" />
                <asp:BoundField DataField="topic" HeaderText="Topic" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="glyphicon glyphicon-open-file"  CommandArgument='<%# Eval("note_path") %>'>Download</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                <asp:Label ID="lblmsg" runat="server" Font-Italic="True"></asp:Label>
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

