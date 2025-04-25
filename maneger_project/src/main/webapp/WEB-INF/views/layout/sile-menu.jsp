<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="dist/img/hung.jpg" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>Lê Tử Hùng</p>
						<!-- Status -->
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>



				<!-- Sidebar Menu -->
				<ul class="sidebar-menu">
					<li class="header">HEADER</li>
					<!-- Optionally, you can add icons to the links -->
					<li class="active"><a href="/account"><i
							class="glyphicon glyphicon-lock"></i><span>Quản lý tài khoản</span></a></li>
							
					<li class="active"><spring:url value="/department"
							var="listURL" /> <a class="" href="${listURL}" ><i
							class="glyphicon glyphicon-home"></i>
							 <span>Quản lý phòng ban</span></a></li>
							
					<li class="active"><spring:url value="/staff" var="listURL" />
						<a class="" href="${listURL}" ><i
							class="glyphicon glyphicon-user"></i> <span>Quản lý nhân viên</span></a></li>
							
					<li class="treeview"><a href="/project"><i
							class="glyphicon glyphicon-glass"></i> <span>Project
								Management</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="/project"><i class="glyphicon glyphicon-folder-open"></i> Quản lý dự án</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-folder-open"></i> Quản lý nhiệm vụ</a></li>
						</ul>
					</li>
					
					<li class="active"><spring:url value="/aboutapp" var="listURL" />
						<a class="" href="${listURL}" ><i class="glyphicon glyphicon-info-sign"></i> 
						<span>Giới thiệu về Web</span></a></li>
							
					<li class="active"><spring:url value="/aboutteam"
							var="listURL" /> <a class="" href="${listURL}" ><i class="glyphicon glyphicon-camera"></i>
							<span>Giới thiệu về đội ngũ!</span></a></li>
							
					<li class="active"><spring:url value="/feedback/add" var="listURL" />
						<a href="${listURL}" ><i class="glyphicon glyphicon-question-sign"></i>
						<span>Help Us !</span></a></li>
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