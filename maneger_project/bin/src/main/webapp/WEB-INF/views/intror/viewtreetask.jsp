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
<base href="http://localhost:8080/" >
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Starter</title>
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
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>R</b>Đ</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Rạng Đông</b> Company</span>
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
								<li class="header">You have 4 messages</li>
								<li>
									<!-- inner menu: contains the messages -->
									<ul class="menu">
										<li>
											<!-- start message --> <a href="#">
												<div class="pull-left">
													<!-- User Image -->
													<img src="dist/img/hung.jpg" class="img-circle"
														alt="User Image">
												</div> <!-- Message title and timestamp -->
												<h4>
													Support Team <small><i class="fa fa-clock-o"></i> 5
														mins</small>
												</h4> <!-- The message -->
												<p>Why not buy a new awesome theme?</p>
										</a>
										</li>
										<!-- end message -->
									</ul> <!-- /.menu -->
								</li>
								<li class="footer"><a href="#">See All Messages</a></li>
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
								<li class="header">You have 10 notifications</li>
								<li>
									<!-- Inner Menu: contains the notifications -->
									<ul class="menu">
										<li>
											<!-- start notification --> <a href="#"> <i
												class="fa fa-users text-aqua"></i> 5 new members joined
												today
										</a>
										</li>
										<!-- end notification -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
							</ul>
						</li>
						<!-- Tasks Menu -->
						<li class="dropdown tasks-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span
								class="label label-danger">9</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 9 tasks</li>
								<li>
									<!-- Inner menu: contains the tasks -->
									<ul class="menu">
										<li>
											<!-- Task item --> <a href="#"> <!-- Task title and progress text -->
												<h3>
													Design some buttons <small class="pull-right">20%</small>
												</h3> <!-- The progress bar -->
												<div class="progress xs">
													<!-- Change the css width attribute to simulate progress -->
													<div class="progress-bar progress-bar-aqua"
														style="width: 20%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">20% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all tasks</a></li>
							</ul>
						</li>
						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <!-- The user image in the navbar-->
								<img src="dist/img/hung.jpg" class="user-image" alt="User Image">
								<!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">${username}</span>
						</a>
							<ul class="dropdown-menu">
								<!-- The user image in the menu -->
								<li class="user-header"><img src="dist/img/hung.jpg"
									class="img-circle" alt="User Image">

									<p>
										${username} - Web Developer <small>Member since Nov.
											2019</small>
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
						<img src="dist/img/hung.jpg" class="img-circle" alt="User Image">
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
							class="glyphicon glyphicon-lock"></i> <span>Account
								Management</span></a></li>

					<li class="active"><spring:url value="/department"
							var="listURL" /> <a class="" href="${listURL}"><i
							class="glyphicon glyphicon-home"></i> <span>Department
								Management</span></a></li>

					<li class="active"><spring:url value="/staff" var="listURL" />
						<a class="" href="${listURL}"><i
							class="glyphicon glyphicon-user"></i> <span>Staff
								Management</span></a></li>

					<li class="active"><a class="" href="/project"><i
							class="glyphicon glyphicon-glass"></i> <span>Project Management</span></a></li>

					<li class="active"><spring:url value="/aboutapp" var="listURL" />
						<a class="" href="${listURL}"><i
							class="glyphicon glyphicon-info-sign"></i> <span>Introduce
								About Web</span></a></li>

					<li class="active"><spring:url value="/aboutteam"
							var="listURL" /> <a class="" href="${listURL}"><i
							class="glyphicon glyphicon-camera"></i> <span>Introduce
								About Team</span></a></li>

					<li class="active"><spring:url value="/feedback/add"
							var="listURL" /> <a class="" href="${listURL}"><i
							class="glyphicon glyphicon-question-sign"></i> <span>Help
								Us !</span></a></li>
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
				<div class="row">
					<hr>
					<h2>Tree Task Of Project : ${project.projectName} </h2>
					<div class="col-sm-4">
						<h2>Search Option</h2>
						<!-- <form> -->
						<div class="form-group">
							<label for="input-search" class="sr-only">Search Tree:</label> <input
								type="input" class="form-control" id="input-search"
								placeholder="Type to search..." value="">
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" class="checkbox"
								id="chk-ignore-case" value="false"> Ignore Case
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" class="checkbox"
								id="chk-exact-match" value="false"> Exact Match
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" class="checkbox"
								id="chk-reveal-results" value="false"> Reveal Results
							</label>
						</div>
						<button type="button" class="btn btn-success" id="btn-search">Search</button>
						<button type="button" class="btn btn-default"
							id="btn-clear-search">Clear</button>
						<!-- </form> -->
					</div>
					<div class="col-sm-4">
						<h2>Tree Task View</h2>
						<div id="treeview-searchable" class=""></div>
					</div>
					<div class="col-sm-4">
						<h2>Results After</h2>
						<div id="search-output"></div>
					</div>
				</div>
			</section>


			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">GVHD: Nguyễn Thanh Bình</div>
			<!-- Default to the left -->
			<strong>Team Graduation Project <a href="#">Rạng Đông
					Company</a>
			</strong> Hùng - Thành - Đại.
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
					<!-- /.control-sidebar-menu -->

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
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
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
	<script src="js/bootstrap-treeview.js"></script>
	<script type="text/javascript">
		$(function() {

			var defaultData = [ {
				text : 'Task Parent 1',
				href : '#parent1',
				tags : [ '4' ],
				nodes : [ {
					text : 'subTask 1',
					href : '#child1',
					tags : [ '2' ],
					nodes : [ {
						text : 'SubsubTask 1',
						href : '#grandchild1',
						tags : [ '0' ]
					}, {
						text : 'SubsubTask 2',
						href : '#grandchild2',
						tags : [ '0' ]
					} ]
				}, {
					text : 'Child 2',
					href : '#child2',
					tags : [ '0' ]
				} ]
			}, {
				text : 'Parent 2',
				href : '#parent2',
				tags : [ '0' ]
			}, {
				text : 'Parent 3',
				href : '#parent3',
				tags : [ '0' ]
			}, {
				text : 'Parent 4',
				href : '#parent4',
				tags : [ '0' ]
			}, {
				text : 'Parent 5',
				href : '#parent5',
				tags : [ '0' ]
			} ];

			var alternateData = [ {
				text : 'Parent 1',
				tags : [ '2' ],
				nodes : [ {
					text : 'Child 1',
					tags : [ '3' ],
					nodes : [ {
						text : 'Grandchild 1',
						tags : [ '6' ]
					}, {
						text : 'Grandchild 2',
						tags : [ '3' ]
					} ]
				}, {
					text : 'Child 2',
					tags : [ '3' ]
				} ]
			}, {
				text : 'Parent 2',
				tags : [ '7' ]
			}, {
				text : 'Parent 3',
				icon : 'glyphicon glyphicon-earphone',
				href : '#demo',
				tags : [ '11' ]
			}, {
				text : 'Parent 4',
				icon : 'glyphicon glyphicon-cloud-download',
				href : '/demo.html',
				tags : [ '19' ],
				selected : true
			}, {
				text : 'Parent 5',
				icon : 'glyphicon glyphicon-certificate',
				color : 'pink',
				backColor : 'red',
				href : 'http://www.tesco.com',
				tags : [ 'available', '0' ]
			} ];

			var $searchableTree = $('#treeview-searchable').treeview({
				data : defaultData,
			});

			var search = function(e) {
				var pattern = $('#input-search').val();
				var options = {
					ignoreCase : $('#chk-ignore-case').is(':checked'),
					exactMatch : $('#chk-exact-match').is(':checked'),
					revealResults : $('#chk-reveal-results').is(':checked')
				};
				var results = $searchableTree.treeview('search', [ pattern,
						options ]);

				var output = '<p>' + results.length + ' matches found</p>';
				$.each(results, function(index, result) {
					output += '<p>- ' + result.text + '</p>';
				});
				$('#search-output').html(output);
			}

			$('#btn-search').on('click', search);
			$('#input-search').on('keyup', search);

			$('#btn-clear-search').on('click', function(e) {
				$searchableTree.treeview('clearSearch');
				$('#input-search').val('');
				$('#search-output').html('');
			});
		});
	</script>
</body>
</html>
