<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="paymentfailure.aspx.cs" Inherits="Teacher_paymentfailure" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
     <div class="col-md-8">
         <h2><span style="color:#f66f6f; font-style:italic">OOPS!.. Payment process could not complete. 
           <br />  Click <a href="home.aspx">here</a> to redirect home page
             </span></h2>
     </div>
     <div class="col-md-4">
         <uc1:recentfiles runat="server" ID="recentfiles" />
     </div>
</asp:Content>

