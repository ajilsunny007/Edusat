<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Teacher_home" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blog-head">
        <h2>Hi Welcome,</h2>
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
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>
</asp:Content>

