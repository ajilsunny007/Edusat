<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.master" AutoEventWireup="true" CodeFile="downloadpaidnotes.aspx.cs" Inherits="Teacher_downloadpaidnotes" %>

<%@ Register Src="~/Student/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="blog-head">
        <h2></h2>
    </div>
    <div class="col-md-8 blog-left">
    
                <table style="width:100%">
                    <tr>
                        <td>

                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4">
                                <ItemTemplate>
                                    <div style="text-align: center; border: 1px #00a54f solid; margin: 8px; padding: 15px; border-radius: 8px">
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("download_type") %>' CssClass="label label-info"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="img-rounded" Height="173px" Width="153px" CommandArgument='<%# Eval("note_id") %>' ImageUrl='<%# Eval("image_file") %>' />
                                        <br />
                                        <b>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("topic") %>'></asp:Label></b>
                                        <br />

                                        <i>
                                            <asp:Label ID="Label3" runat="server" Text="Rating: "></asp:Label>
                                        
                                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("qual") %>'></asp:Label></i>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Download Now" CssClass="btn btn-success" Height="63px" Width="192px" OnClick="Button1_Click" />
                             <br />   <br />   <br />    <asp:Label ID="lblmsg" runat="server" Font-Italic="True"></asp:Label>
                        </td>
                    </tr>
                </table>

          
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

