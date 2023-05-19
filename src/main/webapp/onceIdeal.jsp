<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="Fifa.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>Proyecto Web FIFA23</title>
</head>

<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Logo -->
			<h1>
				<a href="index.jsp" id="logo">FIFA23</a></a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
			<ul>
				<li class="current"><a href="index.jsp">Inicio</a></li>
				<li><a href="#">Listados</a>
					<ul>
						<li><a href="ligas.jsp">FIFA 23 Ligas</a></li>
						<li><a href="equipos.jsp">FIFA 23 Equipos</a></li>
						<li><a href="jugadores.jsp">FIFA 23 Jugadores</a></li>
					</ul></li>
				<li><a href="#">Operaciones</a>
					<ul>
						<li><a href="#">Jugadores</a>
							<ul>
								<li><a href="operaciones.jsp?tipo=altajugador">Alta
										Jugador</a></li>
								<li><a href="#">Baja Jugador</a></li>
								<li><a href="#">Modificar Jugador</a></li>
							</ul></li>
						<li><a href="#">Equipos</a>
							<ul>
								<li><a href="#">Alta Equipo</a></li>
								<li><a href="#">Baja Equipo</a></li>
								<li><a href="#">Modificar Equipo</a></li>
							</ul></li>
						<li><a href="#">Ligas</a>
							<ul>
								<li><a href="#">Alta Liga</a></li>
								<li><a href="#">Baja Liga</a></li>
								<li><a href="#">Modificar Liga</a></li>
							</ul></li>
						<li><a href="#">Cartas</a>
							<ul>
								<li><a href="#">Alta Carta</a></li>
								<li><a href="#">Baja Carta</a></li>
								<li><a href="#">Modificar Carta</a></li>
							</ul></li>
					</ul></li>
				<li><a href="#">Simulador</a>
					<ul>
						<li><a href="#">Construye tu Equipo</a></li>
					</ul></li>
			</ul>
			</nav>
		</div>
		<!-- Main -->
		<section class="wrapper style1" style="height:500px;">
		<div class="container">
			<div id="content">

				<!-- Content -->
				<%
				BDController connectionBD = new BDController();
				ArrayList<Liga> listAllLiga = connectionBD.listLiga();
				ArrayList<Carta> listCardOneParameter = connectionBD.getListCardSimplePlayers("GK");
				ArrayList<Carta> listCardTwoParameter = connectionBD.getListCardSimplePlayersTwoParameters("DF", "CB");
				ArrayList<Carta> listCardThreeParameter = connectionBD.getListCardSimplePlayersThreeParameters("CM", "CAM", "CDM");
				


				%>
				<article> 
				<section class="col-6 col-12-narrower">
				<h2 align="center"  >ONCE IDEAL</h2>
				<form action="operaciones.jsp?tipo=altaequipo" method="post">
					<div class="row gtr-50">
						<div>
						<h3>PORTERO</h4>
							<center>
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%

									for (int i = 0; i < listCardOneParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardOneParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%=j.getNombre() %>
									</option>
									<%		}
										}%>
								</select>
							</center>
						</div>
							<div >
						<h3>DEFENSA</h4>
							<center>
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									for (int i = 0; i < listCardTwoParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardTwoParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%= j.getNombre() %>
									</option>
									<%
										}
									} %>
								</select>
							</center>
							
							<center style="margin-Top: 10px; ">
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									for (int i = 0; i < listCardTwoParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardTwoParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"> <%= j.getNombre() %>
									</option>
									<%
										}
									} %>
								</select>
							</center>
						</div>
						<div>
						<h3>LATERAL IZQUIERDO</h4>
							<center>
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									
									listCardOneParameter = connectionBD.getListCardSimplePlayers("LB");
									for (int i = 0; i < listCardOneParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardOneParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%=j.getNombre()%>
									</option>
									<%} 
									}
									%>
								</select>
							</center>
						</div>
						<div>
						<h3>LATERAL DERECHO</h4>
							<center>
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									listCardOneParameter = connectionBD.getListCardSimplePlayers("RB");
									for (int i = 0; i < listCardOneParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardOneParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%= j.getNombre() %>
									</option>
									<%
										}
									} %>
								</select>
							</center>
						</div>
						<div>
							<h3 >DELANTERO</h4>
							<center style="margin-Top: 10px;">
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									listCardTwoParameter = connectionBD.getListCardSimplePlayersTwoParameters("ST", "CF");
									for (int i = 0; i < listCardTwoParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardTwoParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%= j.getNombre() %>
									</option>
									<%
										}
									} %>
								</select>
							</center>
							
							<center style="margin-Top: 15px; ">
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									for (int i = 0; i < listCardTwoParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardTwoParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"> <%= j.getNombre() %>
									</option>
									<%
										}
									} %>
								</select>
							</center>
							</div>
						</div>					
					</div>	
						
					</div>

				
					<div class="row gtr-50">
						<div>
						<h3 style="margin-Top: 15px;">CENTRO CAMPISTA</h4>
							<center>
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									for (int i = 0; i < listCardThreeParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardThreeParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%= j.getNombre() %>
									</option>
									<%} 
									}%>
								</select>
							</center>
							<center  style="margin-Top: 10px; ">
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									for (int i = 0; i < listCardThreeParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardThreeParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%= j.getNombre() %>
									</option>
									<%
										}
										} %>
								</select>
							</center>			
						</div>
						<div>
						<h3 style="margin-Top: 20px; " >EXTREMO IZQUIERDO</h4>
							<center>
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									listCardTwoParameter = connectionBD.getListCardSimplePlayersTwoParameters("LM", "LW");
									for (int i = 0; i < listCardTwoParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardTwoParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
		
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%= j.getNombre() %>
									</option>
									<%} 
									}%>
								</select>
							</center>
						</div>	
						<div>
						<h3 style="margin-Top: 20px; " >EXTREMO DERECHO</h4>
							<center>
								<select name="cod_jugador" id="cod_jugador" value="cod_jugador" style="padding: 18px; ">
									<%
									
									listCardTwoParameter = connectionBD.getListCardSimplePlayersTwoParameters("RM", "RW");
									for (int i = 0; i < listCardTwoParameter.size(); i++){
										ArrayList<Jugador> listJugador = connectionBD.getJugadorByCodeJugador(listCardTwoParameter.get(i).getCod_jugador());
										for(Jugador j : listJugador){
									%> 
									<option value="<%=j.getCod_jugador()%>" data-image="images/ligas/1.png"><%= j.getNombre() %>
									</option>
									<%} 
									}%>
								</select>
							</center>
						</div>
						<div style="padding-top: 22px; margin-Top: 80px">
						<ul class="actions">
							<li><input type="submit" class="button alt" value="ENVIAR ONCE IDEAL" /></li>
						</ul>
					</div>	
											
					</div>					

				</form>
				</section> </article>
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
						<li><a href="jugadores.asp">Listado de Jugadores</a></li>
						<li><a href="equipos.asp">Listado de Equipos</a></li>
						<li><a href="ligas.asp">Listado de Ligas</a></li>

					</ul>
					</section>
					<section class="col-3 col-6-narrower col-12-mobilep">
					<h3>Más Opciones</h3>
					<ul class="links">
						<li><a href="altaJugador.jsp">Alta Jugador</a></li>
						<li><a href="altaEquipo.jsp">Alta Equipo</a></li>
						<li><a href="altaLiga.jsp">Alta Liga</a></li>
						<li><a href="altaCarta.jsp">Alta Carta</a></li>
						<li><a href="modifiJugador.jsp">Modificar Jugador</a></li>
						<li><a href="modifiEquipo.jsp">Modificar Equipo</a></li>
						<li><a href="modifiLiga.jsp">Modificar Liga</a></li>
						<li><a href="modifiCarta.jsp">Modificar Carta</a></li>
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
								<textarea name="message" id="message" placeholder="Message"
									rows="5"></textarea>
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" class="button alt"
										value="Enviar Email" /></li>
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
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
				<li><a href="#" class="icon fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
				<li><a href="#" class="icon fa-google-plus"><span
						class="label">Google+</span></a></li>
			</ul>

			<!-- Copyright -->
			<div class="copyright">
				<ul class="menu">
					<li>&copy; FIFA 23. Todos los derechos reservados</li>
					<li>Design: <a href="https://www.centronelson.org">Centro
							Nelson</a></li>
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
	<script src="assets/js/index.js"></script>
	<script src="assets/js/dropdown.js"></script>
	<script src="js/msdropdown/jquery-1.3.2.min.js" type="text/javascript"></script>
	<script src="js/msdropdown/jquery.dd.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/prashantchaudhary/ddslick/master/jquery.ddslick.min.js" ></script>
	
	
	
	
	

</body>

</html>