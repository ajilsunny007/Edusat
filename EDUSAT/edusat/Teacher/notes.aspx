<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="notes.aspx.cs" Inherits="Student_notes" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Study Materials</h2>
    </div>
    <div class="col-md-8 blog-left">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                        <td>
                            <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-primary" OnClick="btnView_Click" />
                        </td>
                    </tr>
                </table>
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnView" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <%--<asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("download_type") %>' CssClass=""></asp:Label>
                        <h3>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("topic") %>' CommandArgument='<%# Eval("note_id") %>'></asp:LinkButton></h3>
                        <br />
                        <hr />
                    </ItemTemplate>
                </asp:ListView>--%>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <%-- <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="note_id" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="no" HeaderText="No." />
                                  <asp:BoundField DataField="topic" HeaderText="Topic" />
                                  <asp:BoundField DataField="download_type" HeaderText="Download Type" />
                                <asp:BoundField DataField="rate" HeaderText="Rate" />
                               
                                <asp:TemplateField HeaderText="Quality">
                                    <ItemTemplate>
                                        <asp:Label ID="lblqual" runat="server" Text='<%# Eval("qual") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("note_path") %>' CssClass="glyphicon glyphicon-open-file">View</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>--%>
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <div style="text-align:center; border:1px #00a54f solid;margin:8px;padding:15px;border-radius:8px">
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("download_type") %>' CssClass="label label-info"></asp:Label>
                            <br />
                             <br />
                            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="img-rounded" Height="173px" Width="153px" CommandName='<%# Eval("note_path") %>' CommandArgument='<%# Eval("note_id") %>' ImageUrl='<%# Eval("image_file") %>' />
                            <br />
                          <b>  <asp:Label ID="Label11" runat="server" Text='<%# Eval("topic") %>'></asp:Label></b>
                            <br />
                          
                          <i> <asp:Label ID="Label3" runat="server" Text="Rating: "></asp:Label> <asp:Label ID="Label1" runat="server" Text='<%# Eval("qual") %>'></asp:Label></i>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:Label ID="lblmsg" runat="server" Font-Italic="True"></asp:Label>
            </ContentTemplate>
          <%--  <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
            </Triggers>--%>
        </asp:UpdatePanel>


    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

