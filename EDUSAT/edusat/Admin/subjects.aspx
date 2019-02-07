<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="subjects.aspx.cs" Inherits="Admin_subjects" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="blog-head">
        <h2>Upload Subjects</h2>
    </div>
    <div class="col-md-8 blog-left">
        <table class="table-condensed">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Select Course"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpcourse" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpcourse_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Subject Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtsubject" runat="server" CssClass="form-control" placeholder="Enter Subject Name"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Semester"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpsemcount" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                        <asp:ListItem>0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="[If the course is yearly based then select semester as 0]"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnsave_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>

        </table>
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="no" HeaderText="No." />
                <asp:BoundField DataField="subname" HeaderText="Subject Name" />
                <asp:BoundField DataField="sem" HeaderText="Semester" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="glyphicon glyphicon-remove" OnClientClick="return confirm('Do you want to delete this data?')" CommandArgument='<%# Eval("subid") %>'>Remove</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />

    </div>
</asp:Content>

