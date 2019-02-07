<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Student_home" %>

<%@ Register Src="~/Student/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        $(document).ready(function () {
            function alignModal() {
                var modalDialog = $(this).find(".modal-dialog");

                // Applying the top margin on modal dialog to align it vertically center
                modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
            }
            // Align modal when it is displayed
            $(".modal").on("shown.bs.modal", alignModal);

            // Align modal when user resize the window
            $(window).on("resize", function () {
                $(".modal:visible").each(alignModal);
            });

        });

        //$(document).ready(function () {
        //    $("#myModal").modal('show');
        //});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Hi welcome,</h2>
    </div>
    <div class="col-md-8 blog-left">
       <p>EDUSAT is a comprehensive tool providing information to students those who were studying in Schools, Colleges.  
          This is a totally web based search engine, its main aim is that provide all education services to students. 
           As the idea of online education is getting more popular day by day and is growing dramatically so the opportunities for studying online make easier in this site with the help of online teachers. 
           The portal provides detailed information about latest news, exam notifications, syllabus, textbooks, ppts, pdfs, ebooks, seminar reports….etc and all those information needed for students.
       </p> 
        <br>
        <p>
          At present time schools, colleges is running various programs as full time courses. The students who can study as full time students can facilitate from these education programs. The timings make it difficult to study for students who are doing some jobs or are unable to attend regular classes due to any other reason. Because of current economic crisis in the country most of the parents are unable to afford the expenditures of higher education so many students especially the ones belonging to lower or middle class.  The online education program would help such students and students who are not allowed to attend classes. There were different skills for different students some of them are not good in their studies. Some of them are not interested preparing notes, seminars.. etc
        </p>
        <br>
        <br />
        <p>
         All those students which are not able to acquire education due to financial problems, or not good in studies, or a chance of cause diseases are unable to attend regular  classes. Some of due to their jobs or any other reason will surely be interested in this sort of  learning. This education portal will strengthen and will promote ease of seeking education for students
        </p>

        <%--<input type="button" data-toggle="modal" data-target="#myModal" />--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="myModal" class="modal fade" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title">Check Your Knowledge</h4>
                            </div>
                            <div class="modal-body">
                                <asp:MultiView runat="server" ID="MultiView1">
                                    <asp:View ID="View1" runat="server">
                                       
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
                                        <center>  <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click"  /></center>
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
                                        <center>  <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click1" /></center>
                                    </asp:View>
                                    <asp:View ID="View2" runat="server">
                                        <br />
                                        <br />
                                        <div class="jumbotron" style="background-color: #f8d69a; text-align: center">

                                            <h3>
                                                <asp:Label ID="Label4" runat="server" Text="Label" ForeColor="#993333"></asp:Label></h3>
                                            <h4>
                                                <asp:Label ID="Label6" runat="server" Text="Label" ForeColor="#993333"></asp:Label></h4>
                                            <p>
                                                &nbsp;
                                            </p>
                                            <p>
                                                <asp:Label ID="Label5" runat="server" Text="Label" ForeColor="#990033"></asp:Label>
                                            </p>
                                        </div>

                                        <br />

                                    </asp:View>
                                </asp:MultiView>
                                <asp:HiddenField ID="HidQustnCount" runat="server" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />

    </div>


</asp:Content>

