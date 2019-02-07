<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="addqstn.aspx.cs" Inherits="addqstn" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="blog-head">
        <h2>Upload Question Papers</h2>
    </div>
    <div class="col-md-8 blog-left">
         <br />

                <table class="table table-responsive">

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
                            <asp:DropDownList ID="drpSubject" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="drpSubject_SelectedIndexChanged">
                                <asp:ListItem>--SELECT--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Question Paper Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txttopic" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Year"></asp:Label>
                        </td>
                        <td>

                            <asp:DropDownList ID="drpyear" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Semester"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpSem" runat="server" CssClass="form-control">
                                <asp:ListItem>--SELECT--</asp:ListItem>
                                <asp:ListItem>first</asp:ListItem>
                                <asp:ListItem>second</asp:ListItem>
                                <asp:ListItem>third</asp:ListItem>
                                <asp:ListItem>fourth</asp:ListItem>
                                <asp:ListItem>fifth</asp:ListItem>
                                <asp:ListItem>Sixth</asp:ListItem>
                                <asp:ListItem>seventh</asp:ListItem>
                                <asp:ListItem>eighth</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Set Number"></asp:Label>
                        </td>
                        <td>

                            <asp:TextBox ID="txtsetnum" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Upload Question Paper"></asp:Label>
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
                <asp:Label ID="Label10" runat="server"></asp:Label>
    </div>
     <div class="col-md-4 single-page-right">
     
         <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

