<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <h4 style="color:#4cc47d"> <span>Create an account||Its free and always will be.</span></h4>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="table-condensed">
                <tr>
                    <td>
                        <table class="table-condensed">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Choose User type"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="1">Student</asp:ListItem>
                                        <asp:ListItem Value="2">Teacher</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            </table>
                    </td>
                   
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <table class="table-condensed">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtfname" runat="server" CssClass="form-control" placeholder="Enter First Name"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Last Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtlname" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="E-Mail Id "></asp:Label>
                                            <br /> <asp:Label ID="Label17" runat="server" CssClass="control-label" Text="(your username)"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter E-Mail Id"></asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <asp:Label ID="Label16" runat="server" CssClass="control-label" Text="Mobile number"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtphno" runat="server" CssClass="form-control" placeholder="Enter Mobile Number" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="Choose Course"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpcourse" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" CssClass="control-label" Text="Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" CssClass="control-label" Text="Confirm Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtcpwd" runat="server" CssClass="form-control" placeholder="Re-Type Password" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnlogin_student" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnlogin_student_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <table class="table-condensed">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text="First Name" placeholder="Enter First Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtfname1" runat="server" CssClass="form-control" placeholder="Enter First Name"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" CssClass="control-label" Text="Last Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtlname1" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
                                        </tdtxtlname1
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" CssClass="control-label" Text="E-Mail Id"></asp:Label>
                                              <br /> <asp:Label ID="Label18" runat="server" CssClass="control-label" Text="(your username)"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtemail1" runat="server" CssClass="form-control" placeholder="Enter e-Mail"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtphno1" runat="server" CssClass="form-control" placeholder="Enter mobile number"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" CssClass="control-label" Text="Course you taken"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpcoursetaken" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" CssClass="control-label" Text="Qualification"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpQualif" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label15" runat="server" CssClass="control-label" Text="Experiance"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpExperiance" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" CssClass="control-label" Text="Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtpwd1" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" CssClass="control-label" Text="Confirm Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtcpwd1" runat="server" CssClass="form-control" placeholder="Re-Type Password" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Button ID="btn_teacher" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btn_teacher_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

