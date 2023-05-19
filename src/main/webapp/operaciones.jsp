<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="Fifa.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Fifa.BDController"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*,java.util.*"%>


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

		<%
		//variables glovales

		BDController connectionBD = new BDController();

		//OPERACIONES
		String tipo = request.getParameter("tipo");
		String message = "";
		switch (tipo) {

		case "altajugador":

			String nombre = request.getParameter("nombre");
			String pierna = request.getParameter("pierna");
			String cod_equipo = request.getParameter("cod_equipo");
			String pais = request.getParameter("pais");
			String altura = request.getParameter("altura");
			int CODE_NEW_PLAYER = (connectionBD.getNewCodJugador()) + 1;
			
			if(connectionBD.verifyEquipo(Integer.parseInt(cod_equipo))){
				Jugador jugador = new Jugador(CODE_NEW_PLAYER, nombre, Integer.parseInt(cod_equipo), pierna,
						Integer.parseInt(altura), pais);
						connectionBD.addNewPlayer(jugador);

						message = "Se ha dado de alta al jugador";
			}else{
						message = "El equipo no existe en la base de datos";

			}
			

			break;

		case "bajajugador":

			int cod_jugador = Integer.parseInt(request.getParameter("cod_jugador"));
			if (connectionBD.verifyJugador(cod_jugador)) {
				connectionBD.removePlayer(cod_jugador);

				message = "Se ha dado de baja al jugador";

			} else {

				message = "El jugador no existe en la base de datos";
			}
			break;

		case "bajaequipo":

			cod_equipo = request.getParameter("cod_equipo");

			if (connectionBD.verifyEquipo(Integer.parseInt(cod_equipo))) {
				connectionBD.removeEquipo(Integer.parseInt(cod_equipo));

				message = "Se ha dado de baja al equipo";

			} else {

				message = "El equipo no existe en la base de datos";
			}

			break;

		case "bajaliga":

			String cod_liga = request.getParameter("cod_liga");

			if (connectionBD.verifyLiga(Integer.parseInt(cod_liga))) {
				connectionBD.removeLiga(Integer.parseInt(cod_liga));

				message = "Se ha dado de baja la liga";

			} else {
				message = "La liga no existe en la base de datos";
			}
			break;

		case "altaequipo":

			int new_code_equipo = (connectionBD.lastCodeEquipo()) + 1;
			nombre = request.getParameter("nombre");
			cod_liga = request.getParameter("cod_liga");

			if (connectionBD.validateCharacterLetter(nombre) && connectionBD.validateCharacterDigit(cod_liga)) {

				if (connectionBD.verifyLiga(Integer.parseInt(cod_liga))) {

			Equipo new_equipo = new Equipo(new_code_equipo, nombre, Integer.parseInt(cod_liga));
			connectionBD.addEquipo(new_equipo);

			message = "Se ha dado de alta el equipo";

				} else {
			message = "el equipo no existe en la base de datos";
				}

			} else {
				message = "Los caracteres ingresados no son validos";
			}

			break;

		case "altaliga":

			int new_code_liga = (connectionBD.lastCodeLiga()) + 1;
			nombre = request.getParameter("nombre");
			pais = request.getParameter("pais");

			if (connectionBD.validateCharacterLetter(nombre) && connectionBD.validateCharacterLetter(pais)) {

				Liga new_liga = new Liga(new_code_liga, nombre, pais);
				connectionBD.addLiga(new_liga);
				message = "Se ha dado de alta la liga";

			} else {
				message = "Los caracteres ingresados no son validos";
			}

			break;
			
		case "modificarLiga":
			nombre = request.getParameter("nombre");
			pais = request.getParameter("pais");
			cod_liga = request.getParameter("cod_liga");
			connectionBD.setDataLiga(Integer.parseInt(cod_liga), nombre, pais);
			message = "Los datos de la liga han sido modificados";
			break;
			
		case "modificarJugador":
			
			nombre = request.getParameter("nombre");
			pierna =  request.getParameter("pierna");
			cod_equipo = request.getParameter("cod_equipo");
			pais = request.getParameter("pais");
			altura = request.getParameter("altura");
			cod_jugador = Integer.parseInt(request.getParameter("cod_jugador"));
			
			connectionBD.setJugador(cod_jugador, nombre, Integer.parseInt(cod_equipo), pierna, Integer.parseInt(altura), pais);
			message = "Los datos del jugador han sido modificados";

			break;
		
		case "modificarEquipo":
			nombre = request.getParameter("nombre");
			cod_liga = request.getParameter("cod_liga");
			cod_equipo = request.getParameter("cod_equipo");
			
			connectionBD.setEquipo(Integer.parseInt(cod_equipo), nombre, Integer.parseInt(cod_liga));
			message = "Los datos del equipo han sido modificados";

			break;

		}
		%>
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

				<article> <section class="col-6 col-12-narrower">
				<h3 style="text-align: center; font-weight: bold;">
					<%
					out.print(message.toUpperCase());
					%>
				</h3>

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

</body>

</html>