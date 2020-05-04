<%@ tag language="java"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ attribute name="title" required="true" rtexprvalue="true"%>
<%@ attribute name="breadcrumb" required="true" rtexprvalue="true"%>
<%@ attribute name="content" fragment="true"%>

<!DOCTYPE html>
<html>
<head>
<title>${title}</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/css/bootadmin.min.css">

<!--Script alert-->
  	<script src="${pageContext.request.contextPath}/assets/admin/js/sweetalert2.all.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/admin/js/jqueryalert.min.js"></script>
	
</head>
<body class="bg-light">

	<nav class="navbar navbar-expand navbar-dark bg-primary">
		<a class="sidebar-toggle mr-3" href="#"><i class="fa fa-bars"></i></a>
		<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard/index.jsp">Projeto</a>

		<div class="navbar-collapse collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<a href="#" id="dd_user" class="nav-link dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-user"></i> 
						${user.nome}
					</a>
					
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="dd_user">
						<a href="${pageContext.request.contextPath}/controllerLogout" class="dropdown-item">Sair</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>

	<div class="d-flex">
		<div class="sidebar sidebar-dark bg-dark">
			<br/>
			<ul class="list-unstyled">
				<li>
					<a href="${pageContext.request.contextPath}/admin/empresas/empresas.jsp">
						<img src="${pageContext.request.contextPath}/admin/Images/empresa.png" width="30px" style="margin-bottom: 10px"/> Empresa
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/funcionarios/funcionarios.jsp">
						<img src="${pageContext.request.contextPath}/admin/Images/funcionario.png" width="30px" style="margin-bottom: 10px"/> Funcionários
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/dependentes/dependentes.jsp">
						<img src="${pageContext.request.contextPath}/admin/Images/dependente.png" width="30px" style="margin-bottom: 8px"/> Dependentes
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/departamentos/departamentos.jsp">
						<img src="${pageContext.request.contextPath}/admin/Images/departamento.png" width="30px" style="margin-bottom: 10px"/> Departamentos
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/cargos/cargos.jsp">
						<img src="${pageContext.request.contextPath}/admin/Images/cargos.png" width="30px" style="margin-bottom: 10px"/> Cargos
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/usuarioController?action=lista"> <!-- onclick="Listar()" -->
						<img src="${pageContext.request.contextPath}/admin/Images/usuario.png" width="30px" style="margin-bottom: 10px"/> Usuários
					</a>
				</li>
				<li>
					<a href = "${pageContext.request.contextPath}/admin/permissao/permissao.jsp">
						<img src="${pageContext.request.contextPath}/admin/Images/permissao.png" width="30px" style="margin-bottom: 10px"/> Permissão
					</a>
				</li>
			</ul>
		</div>

		<div class="content p-4">
			<nav aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item">
			    	<a href="${pageContext.request.contextPath}/admin/dashboard/index.jsp">Home</a>
			    </li>
			    <li class="breadcrumb-item active" aria-current="page">${breadcrumb}</li>
			  </ol>
			</nav>
			<div class="card mb-4">
				<div class="card-body">
					<jsp:invoke fragment="content"></jsp:invoke>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/assets/admin/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/admin/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/admin/js/bootadmin.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/admin/chart/chart.js"></script>
	
<%-- 	<script src="${pageContext.request.contextPath}/assets/admin/js/cadastrar-listar-users.js"></script> --%>
	
	
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