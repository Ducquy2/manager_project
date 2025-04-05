<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<base href="http://localhost:8080/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Starter</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
<link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
<link href="../static/images/logo.png" href="@{/images/logo.png}"
	rel="shortcut icon" />
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous" />
<!-- Custom style -->
<link href="../static/css/style.css" href="@{/css/style.css}"
	rel="stylesheet" />
<script src="../../js/checkValidate.js"></script>
<style type="text/css">
.asteriskField {
	color: red;
}
</style>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

		<!-- Logo -->
			<a href="/welcome" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>E</b>O</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg">Software</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<li class="dropdown messages-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span
								class="label label-success">4</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">Bạn có 4 tin nhắn</li>
								<li>
									<!-- inner menu: contains the messages -->
									<ul class="menu">
										<li>
											<!-- start message --> <a href="#">
												<div class="pull-left">
													<!-- User Image -->
													<img src="images/user.png" class="img-circle"
														alt="User Image">
												</div> <!-- Message title and timestamp -->
												<h4>
													Đội ngũ hỗ trợ <small><i class="fa fa-clock-o"></i> 5
														mins</small>
												</h4> <!-- The message -->
												<p>Tại sao không mua một chủ đề mới tuyệt vời?</p>
										</a>
										</li>
										<!-- end message -->
									</ul> <!-- /.menu -->
								</li>
								<li class="footer"><a href="#">Xem tất cả tin nhắn</a></li>
							</ul>
						</li>
						<!-- /.messages-menu -->

						<!-- Notifications Menu -->
						<li class="dropdown notifications-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
								class="label label-warning">10</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">Bạn có 10 thông báo</li>
								<li>
									<!-- Inner Menu: contains the notifications -->
									<ul class="menu">
										<li>
											<!-- start notification --> <a href="#"> <i
												class="fa fa-users text-aqua"></i> 5 thành viên mới tham gia hôm nay
										</a>
										</li>
										<!-- end notification -->
									</ul>
								</li>
								<li class="footer"><a href="#">Xem tất cả</a></li>
							</ul>
						</li>
						<!-- Tasks Menu -->
						<li class="dropdown tasks-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span
								class="label label-danger">9</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">Bạn có 9 nhiệm vụ</li>
								<li>
									<!-- Inner menu: contains the tasks -->
									<ul class="menu">
										<li>
											<!-- Task item --> <a href="#"> <!-- Task title and progress text -->
												<h3>
													Thiết kế một số nút <small class="pull-right">20%</small>
												</h3> <!-- The progress bar -->
												<div class="progress xs">
													<!-- Change the css width attribute to simulate progress -->
													<div class="progress-bar progress-bar-aqua"
														style="width: 20%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">20% Hoàn thành</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
									</ul>
								</li>
								<li class="footer"><a href="#">Xem tất cả các nhiệm vụ</a></li>
							</ul>
						</li>
						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <!-- The user image in the navbar-->
								<img src="images/user.png" class="user-image" alt="User Image">
								<!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">${username}</span>
						</a>
							<ul class="dropdown-menu">
								<!-- The user image in the menu -->
								<li class="user-header"><img src="images/user.png"
									class="img-circle" alt="User Image">

									<p>
										${username} - Web Developer <small></small>
									</p></li>
								<!-- Menu Body -->
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
									</div> <!-- /.row -->
								</li>
								<!-- Menu Footer-->
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
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="images/user.png" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${username}</p>
						<!-- Status -->
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>

				<!-- search form (Optional) -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..."> <span class="input-group-btn">
							<button type="submit" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->

				<!-- Sidebar Menu -->
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
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Page Header <small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container">
					<img alt=""
						src="https://www.digite.com/wp-content/uploads/2019/03/Daily-Tasks.png">
					<table class="table table-striped">
						<tbody>
							<tr>
								<td colspan="1">
									<h2>Nhật ký nhiệm vụ cho biểu mẫu công việc hàng ngày</h2> <spring:url
										value="/task/${task.taskId}/taskprogress/save" var="saveURL" />
									<fieldset>
									
										<form:form modelAttribute="taskprogress" method="POST"
											action="${saveURL}" cssClass="well form-horizontal"
											onsubmit="return validatedatelog() && validatenumber()">
											
											<div id="taskInfo">

												<div class="form-group" style="display: none">
													<label class="control-label col-sm-2 requiredField"
														for="date"> Task Id <span class="asteriskField">
															* </span>
													</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-book"></i></span>
															<form:input path="taskId" cssClass="form-control"
																id="taskId" value="${task.taskId}" readonly="true" />
																<form:input path="taskId" cssClass="form-control"
																id="startdate" value="${task.dateStart}" readonly="true" />
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-sm-2 requiredField"
														for="date"> Date Log <span class="asteriskField">
															* </span>
													</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"> </i>
															</div>
															<form:input class="form-control" id="dateLog"
																name="dateLog" path="dateLog" type="date" />
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-2 requiredField">
														Detail Log Task </label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-list-alt"></i></span>
															<form:textarea path="detailLog" id="detailLog"
																placeholder="Detail Log Task" class="form-control"
																required="true" rows="5"></form:textarea>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-sm-2 requiredField"
														for="date"> Progress<span class="asteriskField">
															* </span>
													</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-book"></i></span>
															<form:input path="progress" cssClass="form-control"
																id="progress" placeholder="progress %" required="true" />
														</div>
													</div>
												</div>
												<div class="text-center">
													<button type="submit" class="btn btn-primary">Save</button>
													<a type="button" class="btn btn-primary"
														href="/task/${task.taskId}/displayBarGraph"
														onclick="return confirm('Bạn chắc chắn muốn ngừng thực hiện tác vụ không ?')">Cancel
													</a>
												</div>
											</div>
										</form:form>
									</fieldset>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>


			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">Nguyễn Đức Quý</div>
			<!-- Default to the left -->
			<strong>Project <a href="/welcome">Software</a>
			</strong> 
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Hoạt động gần đây</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Sinh nhật của Quý</h4>

									<p>Sẽ tròn 22 tuổi vào ngày 20 tháng 7</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tiến độ nhiệm vụ</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Thiết kế mẫu tùy chỉnh <span
										class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Nội dung Thống kê</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">Cài đặt chung</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> 
								Báo cáo sử dụng bảng điều khiển
								<input type="checkbox" class="pull-right" checked>
							</label>

							<p>Một số thông tin về tùy chọn cài đặt chung này</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.2.0 -->
	<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>