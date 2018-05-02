<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Vast+Shadow" rel="stylesheet">
        <link rel="icon" href="img/icone.png">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/listar.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Online</title>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">Library Online</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="cadastrar.jsp">Adiciona Livro</a></li>
					<li><a href="listar.jsp">Livros</a></li>
				</ul>
			</div>
		</div>
	</div>
        <%
            request.setCharacterEncoding("utf8");
            String id = request.getParameter("id")==null?"":request.getParameter("id");
            String nome = request.getParameter("nome")==null?"":request.getParameter("nome");
                   
            String quantidade = request.getParameter("quantidade")==null?"":request.getParameter("quantidade");
         
            String preco = request.getParameter("preco");
     
            
        %>
        <div id="cad" >
            <h1>Cadastro de livros</h1><br>                                
                <form action="salvar.jsp" method="get">
                    Código:<input placeholder="Este campo é gerado pelo sistema!!!" class="form-control" style="background-color: #dddddd;border:1px solid black;"  type="text" name="id" value="<%=id%>" readonly/> 
                        Nome:<input class="form-control" type="text" name="nome"  value="<%=nome%>"/>
                        Quantidade:<input class="form-control" type="text" name="quantidade"  value="<%=quantidade%>"/> 
                        Preço:<input class="form-control" type="text" name="preco" <%=preco%> /><br>
                        <input class="btn btn-primary" type="submit" value="Cadastrar"/>                
                </form>
        </div>                
    </body>
</html>
