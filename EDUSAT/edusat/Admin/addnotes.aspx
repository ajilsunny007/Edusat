<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="addnotes.aspx.cs" Inherits="Admin_addnotes" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Upload Notes</h2>
    </div>
    <div class="col-md-8 blog-left">
        <table class="table table-responsive">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Topic Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txttopic" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Select Course"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpcourse" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpcourse_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
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
                <td>&nbsp;</td>
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
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Preference"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpPrefrence" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Payment Type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpPayType" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="drpType_SelectedIndexChanged">
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
                    <asp:Label ID="Label4" runat="server" Text="Upload Image of note"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="flupimage" runat="server" CssClass="form-control" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Upload Complete Note"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="flupabstract" runat="server" CssClass="form-control" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btn_save" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click" />
                    <br />
                    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />

    </div>
</asp:Content>

