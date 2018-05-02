<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Vast+Shadow" rel="stylesheet">
        <link rel="icon" href="img/icone.png">
        <link href="css/bootstrap.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Online</title>
        <link rel="stylesheet" type="text/css" href="css/listar.css">
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
        
        <div id="lista" >
            <form action="" method="post">                       
                Nome:<input class="form-control" type="text" name="nome"/><br>     
                <input class="btn btn-primary" type="submit" value="Buscar"/>       
            </form>
            <br> 

        <%
            request.setCharacterEncoding("utf8");

            String nome = request.getParameter("nome");

            String URL_CONEXAO = "jdbc:mysql://localhost/loja";
            String USUARIO = "root";
            String SENHA = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = DriverManager.getConnection(URL_CONEXAO, USUARIO, SENHA);
            PreparedStatement ps = conexao.prepareStatement("select * from produtos where nome like '%" + nome + "%' ");
            ResultSet resultSet = ps.executeQuery();        

            out.print("<table class='table table-striped table-bordered'>");  
            out.print("<tr><th>Editar</th><th>Código</th><th>Nome</th><th>Qtd</th><th>Preço</th><th>Excluir</th></tr>"); 
             while(resultSet.next()){            
                    out.print("<tr>");                
                           out.print("<td><a class='btn btn-primary' href='cadastrar.jsp?id="+
                                  resultSet.getString("id")+"&nome="+
                                  resultSet.getString("nome")+"&quantidade="+
                                  resultSet.getString("quantidade")+"&preco="+
                                  resultSet.getString("preco")+"'>Editar</a> </td>");               
                           out.print("<td>" + resultSet.getString("id") + "</td>");
                           out.print("<td>" + resultSet.getString("nome") + "</td>");
                           out.print("<td>" + resultSet.getString("quantidade") + "</td>");
                           out.print("<td>" + resultSet.getString("preco") + "</td>");
                           out.print("<td><a class='btn btn-danger' href='excluir.jsp?id="+resultSet.getString("id")+"'>excluir</a> </td>");
                        out.print("</tr>");     
            }
            out.print("</table>");         
            conexao.close();
        %>
        </div>
    </body>
</html>
