<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.master" AutoEventWireup="true" CodeFile="questionpaper.aspx.cs" Inherits="Teacher_questionpaper" %>

<%@ Register Src="~/Student/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="blog-head">
        <h2>Welcome to Edusat.com</h2>
        <p> This Category Contains Previous year Question Pappers of Various Subjects.</p>
    </div>
    <div class="col-md-8 blog-left">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <table class="table-condensed">
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Select Course"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcourse" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpcourse_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
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
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Semester"></asp:Label>
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
                            </asp:DropDownList></td>
                        <td>
                            <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-primary" OnClick="btnView_Click" />
                        </td>
                    </tr>
                </table>
                <br />
           
                 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="qstnid" OnRowCommand="GridView1_RowCommand" OnDataBound="GridView1_DataBound">
                            <Columns>
                               <asp:BoundField DataField="year" HeaderText="Year" />
                                  <asp:BoundField DataField="setnum" HeaderText="Set Number" />
                                 <asp:TemplateField HeaderText="Question Paper">
                                    <ItemTemplate>

                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("filepath") %>' Text='<%# Eval("qstn_name") %>' CommandName="vw"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                  <asp:BoundField DataField="semester" HeaderText="Semester" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("filepath") %>' CssClass="glyphicon glyphicon-open-file" CommandName='<%# Eval("qstn_name") %>'>Download</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
               <%--  </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnView" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>  --%>
         
                <asp:Label ID="lblmsg" runat="server" Font-Italic="True"></asp:Label>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

