<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<title>Projeto</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="FrameworkCss/bootadmin/css/bootstrap.min.css">
	<link rel="stylesheet" href="FrameworkCss/bootadmin/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="FrameworkCss/bootadmin/css/bootadmin.min.css">
	
	</head>
	<body class="bg-light">
	
		<nav class="navbar navbar-expand navbar-dark bg-primary">
			<a class="sidebar-toggle mr-3" href="#"><i class="fa fa-bars"></i></a>
			<a class="navbar-brand" href="index.jsp">Projeto</a>
	
			<div class="navbar-collapse collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
						<a href="#" id="dd_user" class="nav-link dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-user"></i> 
							<% String nome = (String) request.getAttribute("email");%>
							<%=nome.replace("@gmail.com", "").replace("d", "D")%>
						</a>
						
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="dd_user">
							<a href="login.jsp" class="dropdown-item">Sair</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	
		<div class="d-flex">
			<div class="sidebar alert alert-primary">
				<br/>
				<ul class="list-unstyled">
					<li><a href="pages/empresas/empresas.jsp">Empresas</a></li>
					<li><a href="pages/funcionarios/funcionarios.jsp">Funcionários</a></li>
					<li><a href="pages/dependentes/dependentes.jsp">Dependentes</a></li>
					<li><a href="pages/departamentos/departamentos.jsp">Departamentos</a></li>
					<li><a href="pages/cargos/cargos.jsp">Cargos</a></li>
					<li><a href="pages/usuarios/usuarios.jsp">Usuários</a></li>
				</ul>
			</div>
	
			<div class="content p-4">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item">
				    	<a href="pages/dashboard/index.jsp">Home</a>
				    </li>
				    <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
				  </ol>
				</nav>
				<div class="card mb-4">
					<div class="card-body">
						<section class="content">
				
			  <section class="content-header">
				<canvas id="barChart" width="250" height="110"></canvas>
		     </section>
	     
	     </section>
					</div>
				</div>
			</div>
		</div>
	
		<script src="FrameworkCss/bootadmin/js/jquery.min.js"></script>
		<script src="FrameworkCss/bootadmin/js/bootstrap.bundle.min.js"></script>
		<script src="FrameworkCss/bootadmin/js/bootadmin.min.js"></script>
		<script src="FrameworkCss/bootadmin/chart/chart.js"></script>
		
		 <script>
		
		 const ctxB = document.getElementById("barChart").getContext('2d');
		 const myBarChart = new Chart(ctxB, {type: 'bar',
		 	data: {labels: ["Funcionários", "Departamentos", "Usuários", "Dependentes", "Empresas"],
		 	 datasets: [{label: 'Cadastros',data: [12, 19, 13, 17, 21, 14],
			 backgroundColor: [
			 'rgba(255, 99, 132, 0.2)',
			 'rgba(54, 162, 235, 0.2)',
			 'rgba(255, 206, 86, 0.2)',
			 'rgba(75, 192, 192, 0.2)',
			 'rgba(153, 102, 255, 0.2)',
			 'rgba(255, 159, 64, 0.2)'
			 ],
			 borderColor: [
			 'rgba(255,99,132,3)',
			 'rgba(54, 162, 235, 3)',
			 'rgba(255, 206, 86, 3)',
			 'rgba(75, 192, 192, 3)',
			 'rgba(153, 102, 255, 3)',
			 'rgba(255, 159, 64, 3)'
			 ],
		 borderWidth: 1}]},
		 	options: {
		 		scales: {
					 yAxes: [{
		 				ticks: {
		 				beginAtZero: true
		 				}
					 }]
		 		}
		 	}
		 }); 
		</script>
	</body>
</html>