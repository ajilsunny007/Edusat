<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="prevqstn.aspx.cs" Inherits="Admin_prevqstn" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="blog-head">
        <h2>View Question Papers</h2>
    </div>
  
          <div class="col-md-8 blog-left">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <table class="table-condensed">
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Select Course"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcourse1" runat="server" CssClass="form-control"  AutoPostBack="True" OnSelectedIndexChanged="drpcourse1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Subject"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpSubject1" runat="server" CssClass="form-control">
                                <asp:ListItem>--SELECT--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Semester"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpSem1" runat="server" CssClass="form-control">
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
                <asp:Label ID="lblmsg" runat="server" Font-Italic="True"></asp:Label>
           
               
          
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

