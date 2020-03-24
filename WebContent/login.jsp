<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Login</title>

   	<!-- Alert -->
   	<link rel="stylesheet" href="FrameworkCss/bootadmin/css/bootstrap.min.css">
    <script src="FrameworkCss/bootadmin/js/jquery.min.js"></script>
    <script src="FrameworkCss/bootadmin/js/popper.min.js"></script>
    <script src="FrameworkCss/bootadmin/js/bootstrap.bundle.min"></script>

    <!-- Bootstrap core CSS -->
	<link href="FrameworkCss/bootadmin/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Favicons -->
	<!-- <link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
	<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico"> -->
	<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="FrameworkCss/singin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <form class="form-signin" action="empresaController" method="post">
	  <!-- <img class="mb-4" src="/docs/4.4/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
	  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
	  <label for="inputEmail" class="sr-only">Email address</label>
	  <input type="email" name="email" id="email" class="form-control" placeholder="Email" required autofocus><br>
	  <label for="inputPassword" class="sr-only">Password</label>
	  <input type="password" name="senha" id="senha" class="form-control" placeholder="Password" required>
	  <!-- <div class="checkbox mb-3">
	    <label>
	      <input type="checkbox" value="remember-me"> Remember me
	    </label>
	  </div> -->
	  <button id="btnLogar" class="btn btn-lg btn-primary btn-block" type="submit" >Logar</button>

	  <div class="alert alert-secondary" style="background-color: #F5F5F5; border: none;">
	  	<%String mensagem = (String) request.getAttribute("mensagem");
			if (mensagem == null){
				mensagem = "";
			}
	  	%>
      	<strong><%=mensagem%></strong>
      </div> 
	    
	  <p class="mt-5 mb-3 text-muted">&copy;DS</p>
	</form>
	
  </body>
 <script type="text/javascript">
 </script>
</html>