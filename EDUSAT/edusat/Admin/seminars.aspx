<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="seminars.aspx.cs" Inherits="Admin_seminars" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Upload Seminars</h2>
    </div>
    <div class="col-md-8 blog-left">
        <table class="table-condensed">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpcategory" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Topic Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txttopic" runat="server" CssClass="form-control" placeholder="Enter topic name " Width="334px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Upload small description"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtdesc" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter a description about project" Height="185px" Width="338px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="File Type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpType" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="drpType_SelectedIndexChanged">
                        <asp:ListItem>--SELECT--</asp:ListItem>
                        <asp:ListItem>Premium</asp:ListItem>
                        <asp:ListItem>Free</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Rate"></asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="txtrate" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Upload Image of Abstact"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="flupimage" runat="server" CssClass="form-control" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Upload Complete Abstract"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="flupabstract" runat="server" CssClass="form-control" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>

        </table>
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <br />
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="no" HeaderText="No." />
                        <asp:BoundField DataField="topic" HeaderText="Topic" />
                        <asp:BoundField DataField="uploadedon" HeaderText="Uploaded On" />
                        <asp:BoundField DataField="uploadedby" HeaderText="Uploaded By" />
                        <asp:BoundField DataField="category" HeaderText="Category" />
                        <asp:BoundField DataField="DRate" HeaderText="Rate" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="glyphicon glyphicon-open-file" CommandArgument='<%# Eval("abstractfile") %>' CommandName="vw">View</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="glyphicon glyphicon-remove" CommandArgument='<%# Eval("seminarid") %>' CommandName="dl" OnClientClick="return confirm('Do you want to delete this data?')">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="20" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    <div class="col-md-4 single-page-right">

        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>

</asp:Content>

