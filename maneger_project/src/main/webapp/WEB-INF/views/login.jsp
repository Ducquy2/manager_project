<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Login</title>
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
<!-- iCheck -->
<link rel="stylesheet" href="plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="/login"></b>Đăng nhập</a>
		</div>
		<c:if test="${not empty param.error}">
			<div class="alert alert-danger" role="alert">Sai Tên Hoặc Mật
				Khẩu !</div>
		</c:if>
		<c:if test="${not empty param.logout}">
			<div class="alert alert-success" role="alert">Đăng xuất thành công !</div>
		</c:if>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Đăng nhập để bắt đầu</p>
			<form action="/login" method="POST">
				<div class="form-group has-feedback">
					<input type="email" class="form-control" id="email" name="email"
						placeholder="Email"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Password"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label style="margin-left: 20px"> <input type="checkbox" name="remember-me">
								Nhớ mật khẩu
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">Đăng nhập</button>
					</div>

					<!-- /.col -->
				</div>
			</form>

			<div class="social-auth-links text-center">
				<p>- OR -</p>
				<a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i
					class="fa fa-facebook"></i> Đăng nhập bằng Facebook</a> 
				<a href="#" class="btn btn-block btn-social btn-google btn-flat"><i
					class="fa fa-google-plus"></i> Đăng nhập bằng Google+</a>
			</div>
			<!-- /.social-auth-links -->

			<a href="#">Quên mật khẩu</a><br> <a href="/registration"
				class="text-center">Đăng ký thành viên mới</a>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

</body>
</html>
