<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="syllabus.aspx.cs" Inherits="Student_syllabus" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="blog-head">
        <h2>Syllabus</h2>
    </div>
    <br />
     <table class="table table-condensed">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Course"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpcourse" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="drpcourse_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
        <hr />
    <div class="col-md-8 blog-left">
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
        
        <br />
        <asp:Label ID="lblemptymsg" runat="server" Font-Italic="True" ForeColor="#999999"></asp:Label>
        
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

