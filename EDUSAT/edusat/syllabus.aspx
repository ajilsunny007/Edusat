<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="syllabus.aspx.cs" Inherits="Student_syllabus" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Latest Syllabus</h2>
    </div>
   
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="SL.No" HeaderText="SL.No" />
                <asp:BoundField DataField="cname" HeaderText="Course" />
                                  <asp:BoundField DataField="semester" HeaderText="Semester No." />
                <asp:BoundField DataField="upload_date" HeaderText="Updated On" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="glyphicon glyphicon-download-alt" CommandArgument='<%# Eval("spath") %>' CommandName="vw">Download</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
   
    

</asp:Content>

