<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Teacher_profile" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Profile</h2>
    </div>
    <div class="col-md-8 blog-left">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class=" table table-striped">
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="First Name" placeholder="Enter First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblfname" runat="server" placeholder="Enter First Name" Text="First Name"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" CssClass="control-label" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbllname" runat="server" CssClass="control-label" Text="Last Name"></asp:Label>
                        </tdtxtlname1
                    </tr>
                    <td>&nbsp;<tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" CssClass="control-label" Text="E-Mail Id"></asp:Label>

                        </td>
                        <td>
                            <asp:Label ID="lblemail" runat="server" CssClass="control-label" Text="E-Mail Id"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label19" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblmob" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                                &nbsp;<asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:LinkButton ID="lknChange" runat="server" OnClick="lknChange_Click">Change</asp:LinkButton>
                                <asp:LinkButton ID="lknupdate" runat="server" OnClick="LinkButton2_Click">Update</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label11" runat="server" CssClass="control-label" Text="Course you taken"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblcourse" runat="server" CssClass="control-label" Text="Course you taken"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label14" runat="server" CssClass="control-label" Text="Qualification"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblqualification" runat="server" CssClass="control-label" Text="Qualification"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label15" runat="server" CssClass="control-label" Text="Experiance"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblexperiance" runat="server" CssClass="control-label" Text="Experiance"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </td>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />

    </div>

</asp:Content>

