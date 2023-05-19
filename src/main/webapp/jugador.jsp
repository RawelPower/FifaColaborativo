<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="Fifa.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA23</title>
</head>

<body class="is-preload">
		<div id="page-wrapper">
		<%
		
		%>
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.html" id="logo">FIFA23</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.html">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="jugadores.jsp">FIFA 23 Jugadores</a></li>
										<li><a href="ligas.jsp">FIFA 23 Ligas</a></li>
										<li><a href="equipos.jsp">FIFA 23 Equipos</a></li>
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
										<table style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;">
											<tr style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;">
											<td width="100" style="background-color:white; border-color: black;text-align:center; margin:0;padding: 0 0em 0em 0em;"><h2></h2></td>
											</tr>
										</table>
									</header>
							<%
							%>		
							<!-- Grid -->
							<div class="grid-containerGeneral">
							<%
							BDController connectionBD = new BDController();
							  // DESCRIPTION PLAYER
							String cod_jugador = request.getParameter("cod_jugador");
							String nombre = request.getParameter("nombre"); 
							Carta dataPlayer = connectionBD.getCardbyCodeJugador(Integer.parseInt(cod_jugador));
							ArrayList<Carta> dataPlayerCards = connectionBD.getDataCard(nombre,Integer.parseInt(cod_jugador));
							Jugador dataPlayerTeam = connectionBD.getJugadorbycodeJugador(Integer.parseInt(cod_jugador));
							Carta dataCardNamePlayer = connectionBD.getCardbyPKs(nombre,Integer.parseInt(cod_jugador));
							
							//Filtrado de nombre 
							if(dataPlayerCards.size()==1){
								Carta carta = dataPlayerCards.get(0);
								%>
								<!-- Se inicializa por simple -->
									<div class="c1">
									  <div class="grid-container" style="background-image: url('images/cartas/<%out.print(carta.getNombre().toUpperCase()); %>.png');">
										  <div class="A"  style = "color : white;"><%out.print(carta.getRat()); %></div>
										  <div class="B" style = "color : white;"><%out.print(carta.getPos()); %></div>
										  <div class="C"><img src="images/paises/<%out.print(dataPlayerTeam.getPais()); %>.png" style="float: right; position: relative; width: 45%;"></div>
										  <div class="D"><img src="images/equipos/<%out.print(dataPlayerTeam.getCod_equipo()); %>.png" style="float: right; position: relative; width: 45%;"></div>
										  <div class="E"><img src="images/jugadores/<%out.print(dataPlayerTeam.getCod_jugador()); %>.png" style="float: right; position: relative; width: 80%;"></div>
										  <div class="F"  style = "color : white;"><%out.print(dataPlayerTeam.getNombre()); %></div>
										  <div class="G"  style = "color : white;"><%out.print(carta.getPac()); %> PAC &nbsp;&nbsp;|&nbsp;&nbsp; <%out.print(carta.getDri());%> DRI<br> <%out.print(carta.getSho());%> SHO   &nbsp;|&nbsp;&nbsp; <%out.print(carta.getDef());%> DEF<br><%out.print(carta.getPas());%> PAS   &nbsp;&nbsp;|&nbsp;&nbsp; <%out.print(carta.getPhy());%> PHY</div>
										 </div>
								  </div>
								  
								  <div class="b">
							   			<!-- STATS && BAR: USE FUNCTION- IF?) -->
							   
								  <div class="grid-container2" >
									  <div class="grid-container2">
										  <div class="a2">PACE</div>
										  <!-- INSERT ? -->
										  <!-- CONTROLLER AVERAGE STATS -->
										  
										  <div class="b2" style="color:#<% out.print(connectionBD.backgroundColorLetter(carta.getPac()));%>;"><%out.print(carta.getPac());%></div>

										  <!-- CONTROLLER BAR PROGRESS -->
										  
										  <div class="c2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(carta.getPac()));%>; width:<% out.print(connectionBD.changeBarSize(carta.getPac()));%>px;"></div>
										  
										  <% 
											
										   %>
										  <div class="d2">SHOOTING</div>
										  <div class="e2" style="color:#<% out.print(connectionBD.backgroundColorLetter(carta.getSho()));%>;"><%out.print(carta.getSho());%></div>
										  <div class="f2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(carta.getSho()));%>; width:<% out.print(connectionBD.changeBarSize(carta.getSho()));%>px;"></div>
										  <% 
											
										   %>
										  
										  <div class="g2">PASSING</div>
										  <div class="h2" style="color:#<% out.print(connectionBD.backgroundColorLetter(carta.getPas()));%>;"><%out.print(carta.getPas());%></div>
										  <div class="i2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(carta.getPas()));%>; width:<% out.print(connectionBD.changeBarSize(carta.getPas()));%>px;"></div>
										  <% 
											
										   %>
										  <div class="j2">DRIBBLING</div>
										  <div class="k2" style="color:#<% out.print(connectionBD.backgroundColorLetter(carta.getDri()));%>;"><%out.print(carta.getDri());%></div>
										  <div class="l2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(carta.getDri()));%>; width:<% out.print(connectionBD.changeBarSize(carta.getDri()));%>px;"></div>
										  <% 
											
										   %>
										  <div class="m2">DEFENDING</div>
										  <div class="n2" style="color:#<% out.print(connectionBD.backgroundColorLetter(carta.getDef()));%>;"><%out.print(carta.getDef());%></div>
										  <div class="o2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(carta.getDef()));%>; width:<% out.print(connectionBD.changeBarSize(carta.getDef()));%>px;"></div>
										  <% 
											
										   %>
										  <div class="p2">PHYSICALITY</div>
										  <div class="q2" style="color:#<% out.print(connectionBD.backgroundColorLetter(carta.getPhy()));%>;"><%out.print(carta.getPhy());%></div>
										  <div class="r2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(carta.getPhy()));%>; width:<% out.print(connectionBD.changeBarSize(carta.getPhy()));%>px;"></div>
									</div>
								 </div>
							  </div>
								  
								 <% 
								
							}else{%>
							
							
							<!-- Se inicializa por simple -->
								<div class="c1">
								  <div class="grid-container" style="background-image: url('images/cartas/SIMPLE.png');">
									  <div class="A"><%out.print(dataPlayer.getRat()); %></div>
									  <div class="B"><%out.print(dataPlayer.getPos()); %></div>
									  <div class="C"><img src="images/paises/<%out.print(dataPlayerTeam.getPais()); %>.png" style="float: right; position: relative; width: 45%;"></div>
									  <div class="D"><img src="images/equipos/<%out.print(dataPlayerTeam.getCod_equipo()); %>.png" style="float: right; position: relative; width: 45%;"></div>
									  <div class="E"><img src="images/jugadores/<%out.print(dataPlayerTeam.getCod_jugador()); %>.png" style="float: right; position: relative; width: 80%;"></div>
									  <div class="F"><%out.print(dataPlayerTeam.getNombre()); %></div>
									  <div class="G" ><%out.print(dataPlayer.getPac()); %> PAC &nbsp;&nbsp;|&nbsp;&nbsp; <%out.print(dataPlayer.getDri());%> DRI<br> <%out.print(dataPlayer.getSho());%> SHO   &nbsp;|&nbsp;&nbsp; <%out.print(dataPlayer.getDef());%> DEF<br><%out.print(dataPlayer.getPas());%> PAS   &nbsp;&nbsp;|&nbsp;&nbsp; <%out.print(dataPlayer.getPhy());%> PHY</div>
									 </div>
							  </div>
							    <div class="b">
							   			<!-- STATS && BAR: USE FUNCTION- IF?) -->
							   
								  <div class="grid-container2" >
									  <div class="grid-container2">
										  <div class="a2">PACE</div>
										  <!-- INSERT ? -->
										  <!-- CONTROLLER AVERAGE STATS -->
										  
										  <div class="b2" style="color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getPac()));%>;"><%out.print(dataPlayer.getPac());%></div>

										  <!-- CONTROLLER BAR PROGRESS -->
										  
										  <div class="c2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getPac()));%>; width:<% out.print(connectionBD.changeBarSize(dataPlayer.getPac()));%>px;"></div>
										  
										  <% 
											
										   %>
										  <div class="d2">SHOOTING</div>
										  <div class="e2" style="color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getSho()));%>;"><%out.print(dataPlayer.getSho());%></div>
										  <div class="f2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getSho()));%>; width:<% out.print(connectionBD.changeBarSize(dataPlayer.getSho()));%>px;"></div>
										  <% 
											
										   %>
										  
										  <div class="g2">PASSING</div>
										  <div class="h2" style="color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getPas()));%>;"><%out.print(dataPlayer.getPas());%></div>
										  <div class="i2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getPas()));%>; width:<% out.print(connectionBD.changeBarSize(dataPlayer.getPas()));%>px;"></div>
										  <% 
											
										   %>
										  <div class="j2">DRIBBLING</div>
										  <div class="k2" style="color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getDri()));%>;"><%out.print(dataPlayer.getDri());%></div>
										  <div class="l2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getDri()));%>; width:<% out.print(connectionBD.changeBarSize(dataPlayer.getDri()));%>px;"></div>
										  <% 
											
										   %>
										  <div class="m2">DEFENDING</div>
										  <div class="n2" style="color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getDef()));%>;"><%out.print(dataPlayer.getDef());%></div>
										  <div class="o2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getDef()));%>; width:<% out.print(connectionBD.changeBarSize(dataPlayer.getDef()));%>px;"></div>
										  <% 
											
										   %>
										  <div class="p2">PHYSICALITY</div>
										  <div class="q2" style="color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getPhy()));%>;"><%out.print(dataPlayer.getPhy());%></div>
										  <div class="r2" style="background-color:#<% out.print(connectionBD.backgroundColorLetter(dataPlayer.getPhy()));%>; width:<% out.print(connectionBD.changeBarSize(dataPlayer.getPhy()));%>px;"></div>
									</div>
								 </div>
							  </div>
							 <% 
							}
							
							%>
							
							</div>
							<div class="grid-containerGeneral">
								<div class="c1"  style="padding-left:5px; padding-top:5px;text-align: center;">								
									<table style="border-color:white; background-color:white;">					
										<tr style="border-color:white; background-color:white;">			
										<% for(Carta c: dataPlayerCards){ %>
											
											<td style="border-color:white; background-color:white;">
											<a href="jugador.jsp?cod_jugador=<%=c.getCod_jugador()%>&nombre=<%= c.getNombre() %>">										
											<div
											class="
											<%
											if(c.getNombre().equalsIgnoreCase("SIMPLE")){
												out.print("Simple");
											} else{
												out.print(c.getNombre());
											}											
												%>
											
											" style="text-align: center;"><%out.print(c.getRat());%>
											</div>
											</a>	
											</td>
											
											<%} %>
																
										</tr>
									</table>
									</a>
								</div>
								
								
								<div class="b"></div>
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
			<script type="text/javascript">
			  function handleClick(nombreCarta)
			  {
				  ''
				  location.reload();
			  
			  }
			</script>

</body>

</html>