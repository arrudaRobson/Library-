<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <div id="principal" >
            <p align="center" class="alert-success">Deletado com sucesso!</p>
            <img src="img/logo.png"/>
        </div>
        

        <%
        request.setCharacterEncoding("utf8");
                     
        String id = request.getParameter("id");
        String URL_CONEXAO = "jdbc:mysql://localhost/loja";
        String USUARIO = "root";
        String SENHA = "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexao = DriverManager.getConnection(URL_CONEXAO, USUARIO, SENHA);
        PreparedStatement ps = conexao.prepareStatement("delete from produtos where id = '" + id + "' ");
        ps.execute();       

        %>

        
        

    </body>
</html>
