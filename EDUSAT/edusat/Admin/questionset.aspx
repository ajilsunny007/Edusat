<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="questionset.aspx.cs" Inherits="Admin_questionset" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="blog-head">
        <h2>Add Questions</h2>
    </div>
    <div class="col-md-8 blog-left">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="form-group">
            <table class="table-condensed">
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Select Course"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpCourse" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="drpCourse_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Select Subject"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpSubject" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpSubject_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem>--SELECT--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Question"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtqstn" runat="server" CssClass="form-control" TextMode="MultiLine" Height="95px" Width="355px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Options"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rdb1" runat="server" CssClass="form-control" GroupName="optn" />
                        <asp:TextBox ID="txtop1" runat="server" CssClass="form-control input-sm" Width="350px"></asp:TextBox>
                        <br />
                        <asp:RadioButton ID="rd2" runat="server" CssClass="form-control " GroupName="optn" />
                        <asp:TextBox ID="txtop2" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
                        <br />
                        <asp:RadioButton ID="rd3" runat="server" CssClass="form-control" GroupName="optn" />
                        <asp:TextBox ID="txtop3" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
                        <br />
                        <asp:RadioButton ID="rd4" runat="server" CssClass="form-control" GroupName="optn" />
                        <asp:TextBox ID="txtop4" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="[Choose your correct answer and save your question]"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="Button1_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="no" HeaderText="No." />
                            <asp:BoundField DataField="qstn" HeaderText="Question" />
                            <asp:BoundField DataField="op1" HeaderText="Option1" />
                            <asp:BoundField DataField="op2" HeaderText="Option2" />
                            <asp:BoundField DataField="op3" HeaderText="Option3" />
                            <asp:BoundField DataField="op4" HeaderText="Option4" />
                            <asp:BoundField DataField="answr" HeaderText="Correct Answer" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Do you want to delete this data?')" CssClass="glyphicon glyphicon-remove" CommandArgument='<%# Eval("q_id") %>' CommandName="vw">Remove</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <br />
        </div>
    </div>
    <div class="col-md-4 single-page-right">
        <%--<uc1:recentfiles runat="server" ID="recentfiles" />--%>

    </div>

</asp:Content>

