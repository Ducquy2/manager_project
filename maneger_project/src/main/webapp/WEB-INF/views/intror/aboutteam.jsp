 <%@ page contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html> 


This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.

  
 <html> 
 <head> 
 <meta charset="utf-8"> 
 <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
 <title>Starter</title> 
  
 <meta 
 	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" 
 	name="viewport"> 

 <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"> 

 <link rel="stylesheet" 
 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> 
 
 <link rel="stylesheet" 
 	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> 
 
 <link rel="stylesheet" href="dist/css/AdminLTE.min.css"> 

   
 <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css"> 
 <link href="../static/images/logo.png" href="@{/images/logo.png}" 
 	rel="shortcut icon" /> 
 <link 
 	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" 
 	rel="stylesheet" 
 	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" 
 	crossorigin="anonymous" /> 

 <link href="css/style.css" rel="stylesheet" /> 
 <link href="css/inforteam.css" rel="stylesheet" /> 
 <body class="hold-transition skin-blue sidebar-mini"> 
 	<div class="wrapper" style="margin-top: -5.5%"> 
 
 		<header class="main-header"> 

 			 
 			<a href="/welcome" class="logo">
 				<span class="logo-mini"></span> 
 				<span class="logo-lg">Company</span> 
 			</a> 

 			   
 			<nav class="navbar navbar-static-top" role="navigation"> 
 				
 				<a href="#" class="sidebar-toggle" data-toggle="offcanvas" 
 					role="button"> <span class="sr-only">Toggle navigation</span> 
 				</a> 
 				
 				<div class="navbar-custom-menu"> 
 					<ul class="nav navbar-nav"> 
 						
 						<li class="dropdown messages-menu"> 
 							<a href="#" class="dropdown-toggle" 
 							data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span 
 								class="label label-success">4</span> 
 						</a> 
 							<ul class="dropdown-menu"> 
 								<li class="header">You have 4 messages</li> 
 								<li> 
 									
 									<ul class="menu"> 
 										<li> 
 											 <a href="#"> 
 												<div class="pull-left"> 
 													
 													<img src="dist/img/user.png" class="img-circle" 
 														alt="User Image"> 
 												</div>
 												<h4> 
 													Support Team <small><i class="fa fa-clock-o"></i> 5 
 														mins</small> 
 												</h4>
 												<p>Why not buy a new awesome theme?</p> 
 										</a> 
 										</li> 
 										
 									</ul> 
 								</li> 
 								<li class="footer"><a href="#">See All Messages</a></li> 
 							</ul> 
 						</li> 
 						
 						<li class="dropdown notifications-menu"> 
 							<a href="#" class="dropdown-toggle" 
 							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span 
 								class="label label-warning">10</span> 
 						</a> 
 							<ul class="dropdown-menu"> 
 								<li class="header">You have 10 notifications</li> 
 								<li> 
 	
 									<ul class="menu"> 
 										<li> 
 											 <a href="#"> <i 
 												class="fa fa-users text-aqua"></i> 5 new members joined today 
 										</a> 
 										</li> 

 									</ul> 
 								</li> 
 								<li class="footer"><a href="#">View all</a></li> 
 							</ul> 
 						</li> 
 						
 						<li class="dropdown tasks-menu"> 
 							 <a href="#" class="dropdown-toggle" 
 							data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span 
 								class="label label-danger">9</span> 
 						</a> 
 							<ul class="dropdown-menu"> 
 								<li class="header">You have 9 tasks</li> 
 								<li> 
 
 									<ul class="menu"> 
 										<li> 
 											Task item <a href="#"> 
 												<h3> 
 													Design some buttons <small class="pull-right">20%</small> 
 												</h3> The progress bar 
 												<div class="progress xs"> 

 													<div class="progress-bar progress-bar-aqua" 
 														style="width: 20%" role="progressbar" aria-valuenow="20" 
 														aria-valuemin="0" aria-valuemax="100"> 
 														<span class="sr-only">20% Complete</span> 
 													</div> 
 												</div> 
 										</a> 
 										</li> 
 										
 									</ul> 
 								</li> 
 								<li class="footer"><a href="#">View all tasks</a></li> 
 							</ul> 
 						</li> 

 						<li class="dropdown user user-menu"> 
 							 <a href="#" class="dropdown-toggle" 
 							data-toggle="dropdown">
 								<img src="dist/img/user.png" class="user-image" alt="User Image"> 

 								<span class="hidden-xs">${username}</span> 
 						</a> 
 							<ul class="dropdown-menu"> 

 								<li class="user-header"><img src="dist/img/hung.jpg" 
 									class="img-circle" alt="User Image"> 

 									<p> 
 										${username} - Web Developer <small></small> 
 									</p></li> 

 								<li class="user-body"> 
 									<div class="row"> 
 										<div class="col-xs-4 text-center"> 
 											<a href="#">Followers</a> 
 										</div> 
 										<div class="col-xs-4 text-center"> 
 											<a href="#">Sales</a> 
 										</div> 
 										<div class="col-xs-4 text-center"> 
 											<a href="#">Friends</a> 
 										</div> 
 									</div>
 								</li> 

 								<li class="user-footer"> 
 									<div class="pull-left"> 
 										<a href="#" class="btn btn-default btn-flat">Profile</a> 
 									</div> 
 									<div class="pull-right"> 
 										<form action="/logout" method="get"> 
 											<button class="btn btn-md btn-danger btn-block" 
 												name="registration" type="Submit">Logout</button> 
 										</form> 
 									</div> 
 								</li> 
 							</ul> 
 						</li> 

 						<li><a href="#" data-toggle="control-sidebar"><i 
 								class="fa fa-gears"></i></a></li> 
 					</ul> 
 				</div> 
 			</nav> 
 		</header> 

 		<aside class="main-sidebar"> 

 
 			<section class="sidebar"> 


 				<div class="user-panel"> 
 					<div class="pull-left image"> 
 						<img src="dist/img/user.png" class="img-circle" alt="User Image"> 
 					</div> 
 					<div class="pull-left info"> 
						<p>${username}</p>
 						
 						<a href="#"><i class="fa fa-circle text-success"></i> Online</a> 
 					</div> 
 				</div> 


				<ul class="sidebar-menu">
													<li class="header">HEADER</li>
													<!-- Optionally, you can add icons to the links -->
													<li class="active"><a href="/account"><i
															class="glyphicon glyphicon-lock"></i> <span>Quản lý tài khoản</span></a></li>
																
													<li class="active"><a class="" href="/department"><i
															class="glyphicon glyphicon-home"></i> <span>Quản lý phòng ban</span></a></li>

													<li class="active"><a class="" href="/staff"><i
															class="glyphicon glyphicon-user"></i> <span>Quản lý nhân viên</span></a></li>

													<li class="active"><a class="" href="/project"><i
															class="glyphicon glyphicon-glass"></i> <span>Quản lý dự án</span></a></li>
															
													<li class="active"><a class="" href="/getfeedback"><i
															class="glyphicon glyphicon-wrench"></i> <span>Quản lý phản hồi</span></a></li>
																
													<li class="active"><a class="" href="/aboutapp"><i
															class="glyphicon glyphicon-info-sign"></i> <span>Giới thiệu về Web</span></a></li>

													<li class="active"><a class="" href="/aboutteam"><i
															class="glyphicon glyphicon-camera"></i> <span>Giới thiệu về đội ngũ!</span></a></li>

													<li class="active"><a class="" href="/feedback/add"><i
															class="glyphicon glyphicon-question-sign"></i> <span>Help Us !</span></a></li>
												</ul>

 			</section> 
 
 		</aside> 


 		<div class="content-wrapper"> 
 			<section class="content" 
 				style="background-image: url(/images/backgroud.jpg)"> 
 				<div class="container" style="width: 90%"> 
 					<div class="row"> 
 						<div class="text-center"> 
 							<h1>Thông Tin Thành Viên</h1> 
 						</div> 
 						<div class="row"> 
 							<div class="col-md-4"> 
 								<div class="well"> 
 									<img class="thumbnail img-responsive" alt="duc quy" 
 										src="images/quy.jpg" /> <span> Tôi là Nguyễn Đức Quý, 
 										Sinh viên năm 4 hệ công nghệ thông tin - Trường Đại học công nghệ đông á. Định hướng nghề nghiệp của tôi là trở 
 										thành lập trình viên, kỹ năng ngôn ngữ chính của tôi là Java-Web, nodejs, reactjs và Angular.</span> 
 								</div> 
 							</div> 
 						</div> 
 					</div> 
 				</div> 
 			</section> 

 		</div> 


 		<footer class="main-footer"> 
 
 			<div class="pull-right hidden-xs">GVHD: Ngô Thị Hoa</div> 
  
 			<strong> Project |<a href="#">Company</a> 
 			</strong>| Tên sinh viên: Nguyễn Đức Quý |
 		</footer> 

 		<aside class="control-sidebar control-sidebar-dark"> 
 			 Create the tabs  
 			<ul class="nav nav-tabs nav-justified control-sidebar-tabs"> 
 				<li class="active"><a href="#control-sidebar-home-tab" 
 					data-toggle="tab"><i class="fa fa-home"></i></a></li> 
 				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i 
 						class="fa fa-gears"></i></a></li> 
 			</ul> 
 			
 			<div class="tab-content"> 
 			
 				<div class="tab-pane active" id="control-sidebar-home-tab"> 
 					<h3 class="control-sidebar-heading">Recent Activity</h3> 
 					<ul class="control-sidebar-menu"> 
 						<li><a href="javascript::;"> <i 
 								class="menu-icon fa fa-birthday-cake bg-red"></i> 

 								<div class="menu-info"> 
 									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4> 

 									<p>Will be 23 on April 24th</p> 
 								</div> 
 						</a></li> 
 					</ul> 
 					

 					<h3 class="control-sidebar-heading">Tasks Progress</h3> 
 					<ul class="control-sidebar-menu"> 
 						<li><a href="javascript::;"> 
 								<h4 class="control-sidebar-subheading"> 
 									Custom Template Design <span 
 										class="label label-danger pull-right">70%</span> 
 								</h4> 

 								<div class="progress progress-xxs"> 
 									<div class="progress-bar progress-bar-danger" 
 										style="width: 70%"></div> 
 								</div> 
 						</a></li> 
 					</ul> 
 				

 				</div> 
 				
 				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div> 
 				
 				<div class="tab-pane" id="control-sidebar-settings-tab"> 
					<form method="post"> 
 						<h3 class="control-sidebar-heading">General Settings</h3> 

 						<div class="form-group"> 
 							<label class="control-sidebar-subheading"> Report panel usage <input type="checkbox" class="pull-right" checked> 
 							</label> 

 							<p>Some information about this general settings option</p> 
 						</div> 

					</form> 
 				</div> 

 			</div> 
 		</aside> 
 		<div class="control-sidebar-bg"></div> 
 	</div> 
 	<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script> 

 	<script src="bootstrap/js/bootstrap.min.js"></script> 

 	<script src="dist/js/app.min.js"></script> 
 </body> 
 </html> 
