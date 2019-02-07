<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.master" AutoEventWireup="true" CodeFile="paymentsuccess.aspx.cs" Inherits="Teacher_paymentsuccess" %>

<%@ Register Src="~/Student/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="blog-head">
        <h2>Blog</h2>
    </div>
    <div class="col-md-8 blog-left">
        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
            <ItemTemplate>
                <div>
                    <h3>
                        <asp:HyperLink ID="hpltopic" runat="server" Text='<%# Eval("topic") %>'>HyperLink</asp:HyperLink></h3>
                    <br />
                    <asp:Label ID="lbldescption" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                    <br />
                    <div style="text-align: center; margin: auto">
                        <br />
                        <asp:Image CssClass="img-thumbnail" ID="imgabstract" runat="server" Height="351px" Width="310px" ImageUrl='<%# Eval("img") %>' />
                        <br />
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("type") %>' />
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("rate") %>' />
                        <br />
                        <br />
                        <asp:Button ID="LinkButton1" runat="server" CssClass="btn btn-info" CommandArgument='<%# Eval("abstractfile") %>' CommandName="vw" Text="Download" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

