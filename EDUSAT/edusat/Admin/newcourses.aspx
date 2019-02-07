<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="newcourses.aspx.cs" Inherits="newcourses" %>

<%@ Register Src="~/Admin/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="blog-head">
        <h2>Upload Course</h2>
    </div>
    <div class="col-md-8 blog-left">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                 <div class="form-group">
                    <table class="table-condensed">
                        <tr>
                            <td>
                                <asp:Label ID="Label20" runat="server" CssClass="control-label" Text="Name of Course"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcname" runat="server" CssClass="form-control" placeholder="Enter course name"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label26" runat="server" Text="Abbrevation"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtabbr" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label21" runat="server" CssClass="control-label" Text="Duration (in year)"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpduration" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                                    <asp:ListItem>0.5</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label22" runat="server" CssClass="control-label" Text="Fees"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtfees" runat="server" CssClass="form-control" placeholder="Enter total fee"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label23" runat="server" CssClass="control-label" Text="Choose Category"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:DropDownList ID="drpcat" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                                    <asp:ListItem>Diploma</asp:ListItem>
                                    <asp:ListItem>Under Graduation</asp:ListItem>
                                    <asp:ListItem>Post Graduation</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style1"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label24" runat="server" CssClass="control-label" Text="Year/Semester"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpsemoryr" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                                    <asp:ListItem>Year</asp:ListItem>
                                    <asp:ListItem>Semester</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label25" runat="server" CssClass="control-label" Text="Semester Count"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpsemcount" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btn_save" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btn_save_Click" />
                                <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnupdate_Click" />
                                <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="btnclear_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <asp:Label ID="lblmsg" runat="server" CssClass="control-label" Text=""></asp:Label>

                    <asp:HiddenField ID="HiddenField1" runat="server" />

                </div>
                <div>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="courseid" CssClass="table table-striped" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="SL.No" HeaderText="SL.No" />
                            <asp:BoundField DataField="cname" HeaderText="Course" />
                            <asp:BoundField DataField="abbrev" HeaderText="Abbrevation" />
                            <asp:BoundField DataField="duration" HeaderText="Duration(in year)" />
                            <asp:BoundField DataField="class_type" HeaderText="Classification" />
                            <asp:BoundField DataField="fees" HeaderText="Fee" />
                            <asp:BoundField DataField="category" HeaderText="Year/Semester" />

                            <asp:BoundField DataField="sem_count" HeaderText="Total Semesters" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="glyphicon glyphicon-edit" CommandArgument='<%# Eval("courseid") %>' CommandName="vw">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" />
                    </asp:GridView>

                </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="col-md-4 single-page-right">

      <%--  <uc1:recentfiles runat="server" ID="recentfiles" />--%>
    </div>

</asp:Content>

