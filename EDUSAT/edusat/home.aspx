<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>University a Educational Category Flat Bootstarp Responsive Website Template | Home :: w3layouts</title>
    <link href="Design/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary JavaScript plugins) -->
    <script src="Design/js/bootstrap.js"></script>
    <!-- Custom Theme files -->
    <link href="Design/css/style.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="University Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script src="Design/js/jquery.min.js"></script>
    <script src="Design/js/bootstrap.js"></script>

    <style type="text/css">
        .auto-style1 {
            color: #00FF00;
        }
    </style>

</head>
<body>
    <!-- banner -->
    <script src="Design/js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
    <div class="banner">
        <div class="header">
            <div class="logo">
                <a href="index.html">
                    <img src="Design/images/logo edd.jpg" alt="" /></a>
            </div>
            <div class="top-menu">
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="home.aspx">Home</a></li>
                        <%-- <li><a href="login.aspx">Sign In</a></li>      --%>
                        <li class="#"><a href="seminars.aspx">Seminar Topics</a></li>
                        <li><a href="syllabus.aspx">Syllabus</a></li>
                        <li><a href="notes.aspx">Notes</a></li>
                        <li><a href="contactus.aspx">Contact</a></li>
                        <li><a href="login.aspx">Log In<span class="glyphicon glyphicon-log-in"></span></a></li>
                    </ul>
                </div>
            </div>
            <!-- script-for-menu -->
            <script>
                $("span.menu").click(function () {
                    $("ul.navig").slideToggle("slow", function () {
                    });
                });
            </script>
            <!-- script-for-menu -->

            <div class="clearfix"></div>
        </div>
        <div class="slider">
            <div class="caption">
                <div class="container">
                    <div class="callbacks_container">
                        <ul class="rslides" id="slider">
                            <li>
                                <h3>Edusat.com</h3>
                            </li>
                            <li>
                                <h3>Seminar Topics</h3>
                            </li>
                            <li>
                                <h3>Study Materials</h3>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner-grids">
            <div class="container">
                <div class="col-md-4 banner-grid">
                    <h3>Being Human</h3>
                    <div class="banner-grid-sec">
                        <div class="grid_info">
                            <div class="blg-pic">
                                <img src="Design/images/k3075517.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="blg-pic-info">
                                <h4><a href="#">Needs  A- blood</a></h4>
                                <p>Urgently required 2 units of A- blood.Please contact Akhil:7736243625</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="grid_info">
                            <div class="blg-pic">
                                <img src="Design/images/k3075517.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="blg-pic-info">
                                <h4><a href="#">Needs O- blood</a></h4>
                                <p>Urgently required 4 units of O- blood.Please contact Akhil:7736243625</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <%--<div class="more">
                            <a href="blog.html">See more from the Blog ></a>
                        </div>--%>
                    </div>
                </div>
                <div class="col-md-4 banner-grid">
                    <h3>News Feed</h3>
                    <div class="banner-grid-sec">
                        <div class="news-grid">
                            <h4><a href="http://mgu.ac.in/">MG University</a></h4>
                             <a href="http://mgu.ac.in/index.php?option=com_content&view=article&id=529">Latest Results</a>  <a href="http://mgu.ac.in/index.php?option=com_content&view=article&id=1373">Time Tables</a> <a href="http://mgu.ac.in/index.php?option=com_content&view=article&id=1684">Exam Notification</a>  
                        </div>
                        <div class="news-grid">
                            <h4><a href="http://www.keralauniversity.ac.in/">Kerala University</a></h4>
                            <a href="http://exams.keralauniversity.ac.in/Login/index.php?reslt=1">Latest Results</a>  <a href="http://exams.keralauniversity.ac.in/Login/index.php?timetab=1">Time Tables</a> <a href="http://exams.keralauniversity.ac.in/Login/index.php?noti=1">Exam Notification</a>
                        </div>
                        <div class="news-grid">
                            <h4><a href="http://www.universityofcalicut.info/">Calicut University</a></h4>
                            <a href="http://61.0.254.181/CuPbhavan/curesults.php">Latest Results</a>  <a href="http://www.universityofcalicut.info/index.php?option=com_content&task=view&id=745&Itemid=325">Time Tables</a> <a href="http://www.universityofcalicut.info/index.php?option=com_content&task=view&id=744&Itemid=324">Exam Notification</a>
                        </div>
                        <%--<div class="news-grid">
                            <h4><a href="#">Vivamus tempus ligula</a></h4>
                            <p>Aliquam sem velit, rhoncus sed arcu eu viverra.</p>
                        </div>--%>
                    </div>
                </div>
                <div class="col-md-4 banner-grid">
                    <h3>Subscribe</h3>
                    <div class="banner-grid-sec news_sec">
                        <div class="news-ltr">
                            <h4><a href="#">Keep updated with us</a></h4>
                            <p>Sign Up for Newsletter for our latest updates..</p>
                        </div>
                        <form>
                            <input type="text" placeholder="Email Address*" required="">
                            <input type="submit" value="SEND">
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!---->
    <div class="welcome">
	 <div class="container">
		 <h2>Education is the key to sucess.Take the key from us and explore the world of Wisdom.</h2>
		 <div class="welcm_sec">
			 <div class="col-md-9 campus">
				 <div class="campus_head">
					 <h3>Welcome</h3>
					 <p>EDUSAT is a comprehensive tool providing information to students those who were studying in Colleges.This is a totally web based search engine, its main aim is that provide all education services to students.</p>
				 </div>
				 <div class="col-md-3 wel_grid">
					 <img src="Design/images/icon02.jpg" class="img-responsive" alt=""/>
					 <h5><a href="seminars.aspx">Seminar Topics</a></h5>
					 <p>You can find out Latest seminar topics, seminar reports, abstracts from here.</p>
				 </div>
				 <div class="col-md-3 wel_grid">
					 <img src="Design/images/icon5.png" class="img-responsive" alt=""/>
					 <h5><a href="notes.aspx">Notes</a></h5>
					 <p>We have extensive stock of pdf,ppt,text book notes.</p>
				 </div>
				 <div class="col-md-3 wel_grid">
					 <img src="Design/images/icon6.gif" class="img-responsive" alt=""/>
					 <h5><a href="syllabus.aspx">Syllabus</a></h5>
					 <p>Update syllabus lit of various universities</p>
				 </div>
				 <div class="col-md-3 wel_grid">
					 <img src="Design/images/icon03.png" class="img-responsive" alt=""/>
					 <h5><a href="Student/quiz.aspx">Quiz</a></h5>
					 <p>Online apptitude test based on different courses</p>
				 </div>
				 <div class="clearfix"></div>
				 <div class="more_info">
						 <a href="login.aspx">More Info....</a>
				 </div>
			 </div>
			 <div class="col-md-3 testimonal">
					<h3>Quotes of the Day</h3>
					<div class="testimnl-grid">
						 <a href="#"><p>Happiness is when what you think, what you say, and what you do are in harmony.</p></a>
						 <h5>Mahatma Gandhi</h5>
					</div>
					<div class="testimnl-grid">
						 <a href="#"><p>If you want to shine like a sun, first burn like a sun.</p></a>
						 <h5>A. P. J. Abdul Kalam</h5>
					</div>
					<div class="testimnl-grid">
						 <a href="#"><p>When you want something, all the universe conspires in helping you to achieve it.</p></a>
						 <h5>Paulo Coelho</h5>
					</div>
			 </div>
			 <div class="clearfix"></div>
		 </div>
	 </div>
</div>
<!---->
<%--<div class="news">
	 <div class="container">
		 <h3>Top News</h3>
		  <div class="event-grids">			
		     <div class="col-md-4 event-grid">
				 <div class="date">
				     <h4>26</h4>
					 <span>08/2012</span>
				 </div>				 
			     <div class="event-info">
					  <h5><a href="#">Etiam malesuada feugiat rutrum purus quis vulputate.</a></h5>
						<p>Praesent sagittis in enim vel cursus. Aenean velit ante, maximus ac placerat at, 
						volutpat et orci. Aliquam eu tellus orci.</p>					
				 </div>
				 <div class="clearfix"></div>				 			 
			 </div>
			 <div class="col-md-4 event-grid">
				 <div class="date">
				     <h4>24</h4>
					 <span>06/2012</span>
				 </div>				 
			     <div class="event-info">
					  <h5><a href="#">Etiam malesuada feugiat rutrum purus quis vulputate.</a></h5>
						<p>Praesent sagittis in enim vel cursus. Aenean velit ante, maximus ac placerat at, 
						volutpat et orci. Aliquam eu tellus orci.</p>					
				 </div>
				 <div class="clearfix"></div>				 			 
			 </div>
			 <div class="col-md-4 event-grid">
				 <div class="date">
				     <h4>20</h4>
					 <span>04/2012</span>
				 </div>				 
			     <div class="event-info">
					  <h5><a href="#">Etiam malesuada feugiat rutrum purus quis vulputate.</a></h5>
						<p>Praesent sagittis in enim vel cursus. Aenean velit ante, maximus ac placerat at, 
						volutpat et orci. Aliquam eu tellus orci.</p>					
				 </div>
				 <div class="clearfix"></div>				 			 
			 </div>
			 <div class="clearfix"></div>	
		 </div>
	 </div>
</div>--%>
<!---->
<div class="footer">
	 <div class="container">
		 <div class="ftr-sec">
			 <div class="col-md-4 ftr-grid">
				 <h3>Edusat</h3>
				 <p class="auto-style1">EDUSAT is a comprehensive tool providing information to students those who were studying in Colleges.This is a totally web based search engine, its main aim is that provide all education services to students.</p>
				 <p><span>The portal provides detailed information about latest news, exam notifications, syllabus, textbooks, ppts, pdfs, ebooks, seminar reports</span></p>
			 </div>
			 <div class="col-md-4 ftr-grid2">
				 <h3>Pages</h3>
				 <ul>
					 <li><a href="index.html"><span></span>Home</a></li>
					 <li><a href="seminars.aspx"><span></span>Seminar Topics</a></li>
					 <li><a href="program.html"><span></span>Syllabus</a></li>
					 <li><a href="notes.aspx"><span></span>Notes</a></li>	
				     <li><a href="contact.html"><span></span>Contact</a></li>
				 </ul>
			 </div>
			 <div class="col-md-4 ftr-grid3">
				 <h3>Follow Us</h3>
				 <ul>
					 <li><a href="https://www.facebook.com/"><span></span>Facebook</a></li>
					 <li><a href="about.html"><span></span>Twitter</a></li>
					 <li><a href="gallery.html"><span></span>Google Plus</a></li>
					 <li><a href="blog.html"><span></span>Instagram</a></li>	
					 <li><a href="about.html"><span></span>Whatsapp</a></li>
					
				 </ul>
			 </div>
			 <div class="clearfix"></div>
		 </div>
	 </div>
</div>
    <!---->
    <div class="copywrite">
        <div class="container">
            <p>2016 © Edusat. All rights reserved | Design by Edusat Technologies</p>
        </div>
    </div>

    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
