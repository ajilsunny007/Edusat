<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.master" AutoEventWireup="true" CodeFile="quiz.aspx.cs" Inherits="Student_quiz" %>

<%@ Register Src="~/Student/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="blog-head">
        <h2>Welcome to Edusat.com !</h2>
        <p>Here, you can start your online aptitude test based on various subjects. </p>
    </div>
    <div class="col-md-8 blog-left">

        <div>
            <asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>

        </div>
        <asp:MultiView runat="server" ID="MultiView1">
             <asp:View ID="View2" runat="server">
                <table class="table table-condensed">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Choose Subject"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpSubject" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View1" runat="server">
                <div style="text-align: right">
                </div>
                <asp:DataList ID="DataList1" runat="server" CssClass="table table-striped" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("no") %>'></asp:Label>
                        .
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("qstn") %>'></asp:Label>
                        <br />
                        <div style="padding: 5px 25px">
                            <asp:RadioButton ID="rdb1" runat="server" GroupName="optn" Text='<%# Eval("op1") %>' />
                            <br />
                            <asp:RadioButton ID="rdb2" runat="server" GroupName="optn" Text='<%# Eval("op2") %>' />
                            <br />
                            <asp:RadioButton ID="rdb3" runat="server" GroupName="optn" Text='<%# Eval("op3") %>' />
                            <br />
                            <asp:RadioButton ID="rdb4" runat="server" GroupName="optn" Text='<%# Eval("op4") %>' />
                            <br />
                        </div>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("answr") %>' />
                    </ItemTemplate>
                </asp:DataList>
                <center>  <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click"  /></center>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:DataList ID="DataList2" runat="server" CssClass="table table-striped" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("no") %>'></asp:Label>
                        .
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("qstn") %>'></asp:Label>
                        <br />
                        <div style="padding: 5px 25px">
                            <asp:Label ID="Label8" runat="server" Text="You answered : "></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("uranswr") %>'></asp:Label>
                            <br />
                        </div>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("msg") %>' ForeColor='<%# Eval("color") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
                <center>  <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click1" /></center>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <br />
              <div class="jumbotron">
                    <h3>
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h3>
                    <h4>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></h4>
                    <p>
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
                <br />

            </asp:View>
        </asp:MultiView>
         <asp:HiddenField ID="HidQustnCount" runat="server" />

        <%--   <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View3" runat="server">
                <table class="table table-condensed">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Choose Subject"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpSubject" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View1" runat="server">
                
                <br />

                <asp:DataList ID="DataList1" runat="server" CssClass="table table-striped">
                    <ItemTemplate>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("no") %>'></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("qstn") %>'></asp:Label>
                        <br />
                        <div style="padding: 5px 25px">
                            <asp:RadioButton ID="rdb1" runat="server" GroupName="optn" Text='<%# Eval("op1") %>' />
                            <br />
                            <asp:RadioButton ID="rdb2" runat="server" GroupName="optn" Text='<%# Eval("op2") %>' />
                            <br />
                            <asp:RadioButton ID="rdb3" runat="server" GroupName="optn" Text='<%# Eval("op3") %>' />
                            <br />
                            <asp:RadioButton ID="rdb4" runat="server" GroupName="optn" Text='<%# Eval("op4") %>' />
                            <br />
                        </div>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("answr") %>' />
                    </ItemTemplate>
                </asp:DataList>
                <center>  <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click" /></center>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="jumbotron">
                    <h3>
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h3>
                    <h4>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></h4>
                    <p>
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
                <br />
            </asp:View>
        </asp:MultiView>--%>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />

    </div>

</asp:Content>

