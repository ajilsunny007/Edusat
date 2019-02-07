<%@ Control Language="C#" AutoEventWireup="true" CodeFile="recentfiles.ascx.cs" Inherits="Admin_recentfiles" %>
<div class="recent-posts">

    <script>
        function wopen() {
            var left = (screen.width) - (450 / 1.5);
            var top = (screen.height / 2) - (600 / 2);
            window.open('chatroom.aspx', "Chat window",
                'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=450, height=600, top=' + top + ', left=' + left);

        }
    </script>
    <input type="submit" class="btn btn-info" onclick="wopen()" value="Chat with Others" />
    <hr />
    <br />
    <h4>Fresh Jobs</h4>
    <div class="recent-posts-info" style="margin-bottom: 0px">
        <div class="posts-left sngl-img">
            <a href="single.html">
                <img src="../Design/images/techad.jpg" class="img-responsive zoom-img" alt="" />
            </a>
        </div>
        <div class="posts-right">
            <label>English Lecturer</label>
          <%--  <h5><a href="single.html">Finibus Bonorum</a></h5>--%>
            <p>Wanted English Lecturer For Mca Students In Mes-Aimat.Qualification..</p>
            <a href="http://www.mesaimat.ac.in/career" class="btn btn-primary hvr-rectangle-in">Read More</a>
        </div>
        <div class="clearfix"></div>
    </div>
    <hr />
    <div class="recent-posts-info" style="margin-bottom: 0px">
        <div class="posts-left sngl-img">
            <a href="single.html">
                <img src="../Design/images/techad.jpg" class="img-responsive zoom-img" alt="" /></a>
        </div>
        <div class="posts-right">
            <label>Graphics Lecturer</label>
       <%--     <h5><a href="single.html">Finibus Bonorum</a></h5>--%>
            <p>Wanted English Lecturer For Mca Students In Mes-Aimat.Qualification..</p>
            <a href="http://www.mesaimat.ac.in/career" class="btn btn-primary hvr-rectangle-in">Read More</a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
