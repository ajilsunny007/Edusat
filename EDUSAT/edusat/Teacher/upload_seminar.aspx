<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="upload_seminar.aspx.cs" Inherits="Teacher_upload_seminar" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Upload Seminars</h2>
        <p>Please Upload Seminar Reports Based On Latest Topics.</p>
    </div>
    <div class="col-md-8 blog-left">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">My Topics</a></li>
            <li><a data-toggle="tab" href="#menu1">Add New Topics</a></li>
        </ul>
        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="no" HeaderText="No." />
                                <asp:BoundField DataField="topic" HeaderText="Topic" />
                                <asp:BoundField DataField="uploadedon" HeaderText="Uploaded On" />
                                <asp:BoundField DataField="category" HeaderText="Category" />
                                <asp:BoundField DataField="status" HeaderText="Status" />

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="glyphicon glyphicon-open-file" CommandArgument='<%# Eval("abstractfile") %>' CommandName="vw">View</asp:LinkButton>
                                        <%--                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="glyphicon glyphicon-remove" CommandArgument='<%# Eval("seminarid") %>' CommandName="dl" OnClientClick="return confirm('Do you want to delete this data?')">Delete</asp:LinkButton>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="menu1" class="tab-pane fade">
                <br />
                <table class="table-condensed">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcategory" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Topic Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txttopic" runat="server" CssClass="form-control" placeholder="Enter topic name " Width="334px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Upload small description"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtdesc" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter a description about project" Height="185px" Width="338px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Upload Image of Abstact"></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload ID="flupimage" runat="server" CssClass="form-control" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Upload Complete Abstract"></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload ID="flupabstract" runat="server" CssClass="form-control" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

