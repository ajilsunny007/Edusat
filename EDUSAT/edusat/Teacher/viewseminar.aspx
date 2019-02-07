<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="viewseminar.aspx.cs" Inherits="Student_viewseminar" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="blog-head">
        <h2></h2>
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
                      <h4>  <asp:Label ID="Label2" runat="server" Text="You have to Pay Rs."></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("rate") %>'></asp:Label></h4>
                        <br />
                        <br />
                        <asp:Button ID="LinkButton1" runat="server" CssClass="btn btn-info" CommandArgument='<%# Eval("abstractfile") %>' CommandName="vw" Text="Download" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:HiddenField ID="hdfid" runat="server" />
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

