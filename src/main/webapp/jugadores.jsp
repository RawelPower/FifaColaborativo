<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Fifa.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA23</title>
</head>
<body class="is-preload">
		<div id="page-wrapper">
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.jsp" id="logo">FIFA23</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.jsp">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="ligas.jsp">Opción 1</a></li>
										
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Opción 1</a>
											<ul>
												<li><a href="altajugador.jsp">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 2</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 3</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 4</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
									</ul>
								</li>
								<li ><a href="#">Simulador</a>
									<ul>
										<li><a href="creador.jsp">Opción 1</a></li>
									</ul>
								</li>
							</ul>
						</nav>

				</div>

			<!-- Main -->
				<section class="wrapper style1">
					<div class="container">
						<div id="content">

							<!-- Content -->
						
								<article>
									<header>
										<table >
											<tr style="border:0px;" >	
												<td style="background-color: white;"><h2>Jugadores</h2></td><td style="text-align: right;background-color: white;""></td>
											</tr>
										</table>
									</header>
									
									<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>Nombre</th>
											<th width='325' colspan="3"></th>
											<th style="text-align: center;">RAT</th>
											<th style="text-align: center;">POS</th>
											<th style="text-align: center;">CARTA</th>
											<th style="text-align: center;">PRECIO</th>
											<th style="text-align: center;">SKI</th>
											<th style="text-align: center;">WF</th>
											<th style="text-align: center;">PAC</th>
											<th style="text-align: center;">SHO</th>
											<th style="text-align: center;">PAS</th>
											<th style="text-align: center;">DRI</th>
											<th style="text-align: center;">DEF</th>
											<th style="text-align: center;">PHI</th>
											<th style="text-align: center;">ALTURA</th>
										</tr>
									</thead>
										<% 
										BDController connectionBD = new BDController();
										ArrayList<Liga> listLeague = connectionBD.listLiga();
										ArrayList<Equipo> listTeam = connectionBD.listEquipo();
										
										
										String cod_equipo = request.getParameter("cod_equipo");
										%>
										
									<tbody>
										<%
										ArrayList<Jugador> listPlayers = connectionBD.listJugadorCod_Team(Integer.parseInt(cod_equipo));

													for (int i = 0 ;  i < listPlayers.size(); i++){
										%>
										<tr>
										<!--  INSERT HERE HIPERLINK TO JUGADOR.JSP -->
											<td width='60' rowspan="2">
											<a href="jugador.jsp?cod_jugador=<%= listPlayers.get(i).getCod_jugador()%>&nombre=all" >
											<img src="images/jugadores/<%out.print(listPlayers.get(i).getCod_jugador()); %>.png" style="float: right; position: relative; width: 100%;">
											</a>
											</td>
											<td width='325' colspan="3" style="padding-left: 15px;">
											<a href="jugador.jsp?cod_jugador=<%= listPlayers.get(i).getCod_jugador()%>">
											<%out.print(listPlayers.get(i).getNombre()); %>
											</a>
											</td>
											<%
											ArrayList<Carta> listCards = connectionBD.listCartaSIMPLE(listPlayers.get(i).getCod_jugador());

											for(int q = 0 ;  q < listCards.size(); q++){
																									
												%>
												
													
											<td rowspan="2" width='60' style="text-align: center; background-color:yellow; color : black; padding: 1px 2px 0 4px;"><%out.print(listCards.get(q).getRat());%></td>	
											<td rowspan="2" width='60' style="text-align: center;"><%out.print(listCards.get(q).getPos()); %></td>
											<td rowspan="2" width='100' style="text-align: center;"><%out.print(listCards.get(q).getNombre()); %></td>  
											<td rowspan="2" width='100' style="text-align: center;"><%out.print(listCards.get(q).getPrecio()); %></td> 
											<td rowspan="2" width='60' style="text-align: center;"><%out.print(listCards.get(q).getFiligranas()); %></td> 
											<td rowspan="2" width='60' style="text-align: center;"><%out.print(listCards.get(q).getPierna_mala()); %></td>
											<td rowspan="2" width='60' style="text-align: center;background-color:<%= connectionBD.backgroundColor(listCards.get(q).getPac())%>"><%out.print(listCards.get(q).getPac()); %></td> 
											<td rowspan="2" width='60' style="text-align: center;background-color:<%= connectionBD.backgroundColor(listCards.get(q).getSho())%>"><%out.print(listCards.get(q).getSho()); %></td> 
											<td rowspan="2" width='60' style="text-align: center;background-color:<%= connectionBD.backgroundColor(listCards.get(q).getPas())%>"><%out.print(listCards.get(q).getPas()); %></td> 
											<td rowspan="2" width='60' style="text-align: center;background-color:<%= connectionBD.backgroundColor(listCards.get(q).getDri())%>"><%out.print(listCards.get(q).getDri()); %></td> 
											<td rowspan="2" width='60' style="text-align: center;background-color:<%= connectionBD.backgroundColor(listCards.get(q).getDef())%>"><%out.print(listCards.get(q).getDef());%></td> 
											<td rowspan="2" width='60' style="text-align: center;background-color:<%= connectionBD.backgroundColor(listCards.get(q).getPhy())%>"><%out.print(listCards.get(q).getPhy()); %></td>
																						
																	
											
															
													
											<%} %>
											<td rowspan="2" width='60' style="text-align: center;"><%out.print(listPlayers.get(i).getAltura()+" cm"); %></td>  
											
												
										</tr>
											
										<tr>
										
										<!--  INSERT HERE HIPERLINK TO EQUIPOS.JSP -->
											<%Equipo dataTeam  = connectionBD.getEquipo(listPlayers.get(i).getCod_equipo()); %>
										  <td width='45' style="text-align: right;">
										  <a href="Equipos.jsp?cod_liga=<%= dataTeam.getCod_liga()%>">
										  <img src="images/equipos/<%out.print(listPlayers.get(i).getCod_equipo()); %>.png" style="float: right; position: relative; width: 80%;">
										  </a>
										  </td>
										  <td width='50' style="text-align: center;">
										  <img src="images/paises/<%out.print(listPlayers.get(i).getPais()); %>.png" style="float: right; position: relative; width: 80%;">									  
										  </td>
										  
										  <!--  INSERT HERE HIPERLINK TO JUGADOR.JSP -->
										  
										  
										  <td width='230'>
										  <% Equipo codLeague = connectionBD.getEquipo(listPlayers.get(i).getCod_equipo()); %>
										  <a href="Equipos.jsp?cod_liga=<%= dataTeam.getCod_liga()%>">
										  <img src="images/ligas/<%									 	
											  out.print(codLeague.getCod_liga());										  										  
										  %>.png" style="float: left; position: relative; width: 20%;">
										  </a>									  										
										  </td>
										</tr>
											
										<%} %>
									</tbody>
									
											
									
								</table>
							</div>

									
								</article>

						</div>
					</div>
				</section>
			

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Listados</h3>
								<ul class="links">
									<li><a href="jugadores.asp">Listado de Ligas</a></li>
									
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Más Opciones</h3>
								<ul class="links">
									<li><a href="operaciones.jsp?tipo=altaJugador">Opción 1</a></li>
									
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Información</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Enviar Email" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; FIFA 23. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>