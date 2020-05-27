function testando(){
	let pag = null;
	$(document).ready(function(){
		$('.page-item').click(function (event){
			pag = $(event.target).val()

			window.location.assign("${pageContext.request.contextPath}/acme?action=addEmpresa");
		})
	})
}

