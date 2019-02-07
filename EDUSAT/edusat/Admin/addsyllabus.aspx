<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="addsyllabus.aspx.cs" Inherits="Admin_addsyllabus" %>

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
        <h2>Upload Syllabus</h2>
    </div>
    <div class="col-md-8 blog-left">
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
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Semester number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Syllabus"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                    <asp:Label ID="Label3" runat="server" Text="(*.pdf)"></asp:Label>
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="SL.No" HeaderText="SL.No" />
                <asp:BoundField DataField="cname" HeaderText="Course" />
                  <asp:BoundField DataField="semester" HeaderText="Semester No." />
                <asp:BoundField DataField="upload_date" HeaderText="Updated On" />

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="glyphicon glyphicon-open-file" CommandArgument='<%# Eval("spath") %>' CommandName="vw">View</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="glyphicon glyphicon-remove" CommandArgument='<%# Eval("sid") %>' CommandName="dl" OnClientClick="return confirm('Do you want to delete this data?')">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <h4>
            <asp:Label ID="lblemptymsg" Text="" runat="server" ForeColor="#006699"></asp:Label></h4>

        <br />
        
    </div>
    <div class="col-md-4 single-page-right">

        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>

</asp:Content>

