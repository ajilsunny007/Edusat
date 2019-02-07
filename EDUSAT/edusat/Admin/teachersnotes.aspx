<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="teachersnotes.aspx.cs" Inherits="Admin_teachersnotes" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="blog-head">
        <h2>View Teachers Note</h2>
    </div>
    <div class="col-md-8 blog-left">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="no" HeaderText="No." />
                        <asp:BoundField DataField="topic" HeaderText="Topic" />
                        <asp:BoundField DataField="uploadedon" HeaderText="Uploaded On" />
                        <asp:BoundField DataField="subject" HeaderText="Subject" />
                         <asp:BoundField DataField="preference" HeaderText="preference" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Experiance" HeaderText="Experiance" />
                        <asp:BoundField DataField="Takencourse" HeaderText="Taken Course" />
                        <asp:BoundField DataField="Qualif" HeaderText="Qualification" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="glyphicon glyphicon-open-file" CommandArgument='<%# Eval("note_id") %>' CommandName="vw">View</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                        <h2 class="center">  <asp:Label ID="lblmsg" runat="server" Font-Italic="True" ForeColor="#999999"></asp:Label></h2>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

