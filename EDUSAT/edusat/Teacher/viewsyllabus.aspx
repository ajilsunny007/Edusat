﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teacher.master" AutoEventWireup="true" CodeFile="viewsyllabus.aspx.cs" Inherits="Admin_viewsyllabus" %>

<%@ Register Src="~/Teacher/recentfiles.ascx" TagPrefix="uc1" TagName="recentfiles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <<div class="blog-head">
        <h2></h2>
    </div>
    <div class="col-md-8 blog-left">
        <iframe id="iFrame1" scrolling="yes" style="width: 100%; height: 800px" runat="server" />
    </div>
    <div class="col-md-4 single-page-right">
        <uc1:recentfiles runat="server" ID="recentfiles" />
    </div>

</asp:Content>
