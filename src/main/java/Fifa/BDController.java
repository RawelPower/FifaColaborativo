package Fifa;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

public class BDController {
	private Connection connection;

	/**
	 * void constructor
	 */
	public BDController() {
		super();

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fifa", "root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	// -- FUNCTIONS TEAM? --

	/**
	 * ListEquipo
	 * 
	 * @return ArrayList<Equipo>
	 */

	public ArrayList<Equipo> listEquipo() {
		ArrayList<Equipo> list = new ArrayList();
		String sql = "SELECT*FROM equipos";
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Equipo equipo = new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getInt("cod_liga"));
				list.add(equipo);
			}
			statement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * GetTeamsbyCodeLeague
	 * 
	 * @return ArrayList<Equipo>
	 */

	public ArrayList<Equipo> getTeamsbyCodeLeague(int cod_liga) {
		ArrayList<Equipo> list = new ArrayList();
		String sql = "SELECT*FROM equipos WHERE cod_liga ='" + cod_liga + "';";
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Equipo equipo = new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getInt("cod_liga"));
				list.add(equipo);
			}
			statement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * GetEquipo
	 * 
	 * @param cod_team by cod_equipo
	 * @return Equipo
	 */

	public Equipo getEquipo(int cod_team) {
		Equipo getTeam = null;

		String sql = "SELECT*FROM equipos WHERE cod_equipo = '" + cod_team + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				getTeam = new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getInt("cod_liga"));

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return getTeam;
	}

	/**
	 * VerifyEquipo
	 * 
	 * @param cod_equipo
	 * @return boolean
	 */
	public boolean verifyEquipo(int cod_equipo) {
		String sql = "SELECT*FROM equipos WHERE cod_equipo = '" + cod_equipo + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * GetcodeTeam
	 * 
	 * @param codeLiga
	 * @return Equipo
	 */
	public Equipo getcodeTeam(int codeLiga) {
		Equipo codeTeam = null;
		String sql = "SELECT*from equipos WHERE equipos.cod_liga = '" + codeLiga + "';";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				codeTeam = new Equipo(rs.getInt("cod_equipo"));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return codeTeam;

	}

	/**
	 * removeEquipo by integer
	 * 
	 * @param cod_equipo
	 */
	public void removeEquipo(int cod_equipo) {

		String sql = "DELETE FROM equipos WHERE cod_equipo = '" + cod_equipo + "';";
		// System.out.println("Exeption in query from removeEquipo : " + sql);

		try (Statement statement = this.connection.createStatement()) {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	/**
	 * setEquipo
	 * @param cod_equipo
	 * @param nombre
	 * @param cod_liga
	 */
	public void setEquipo(int cod_equipo, String nombre, int cod_liga) {
		String sql = "UPDATE equipos SET nombre='"+nombre+"',cod_liga ='"+cod_liga+"' WHERE cod_equipo = '"+cod_equipo+"';";
		System.out.println("Exeption in query from setEquipo : " + sql);
		
		try(Statement statement =  this.connection.createStatement();) {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	// -- ENDS FUNCTIONS TEAM --

	// -- FUNCTIONS JUGADOR? --
	/**
	 * getJugadorByCodeJugador
	 * 
	 * @param cod_equipo
	 * @return ArrayList<Jugador>
	 */

	public ArrayList<Jugador> getJugadorByCodeJugador(int cod_jugador) {
		ArrayList<Jugador> jugador = new ArrayList<>();
		String sql = "SELECT*FROM jugadores WHERE cod_jugador = '" + cod_jugador + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Jugador jugadorList = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre"),
						rs.getInt("cod_equipo"), rs.getString("pierna"), rs.getInt("altura"), rs.getString("pais"));
				jugador.add(jugadorList);

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jugador;
	}
	
	/**
	 * listAllJugador()
	 * @return
	 */
	public ArrayList<Jugador> listAllJugador() {
		ArrayList<Jugador> list = new ArrayList<>();
		String sql = "SELECT*FROM jugadores;";
		// System.out.println("Exeption in query from listAllJugador : " + sql);

		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Jugador jugador = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre"), rs.getInt("cod_equipo"),
						rs.getString("pierna"), rs.getInt("altura"), rs.getString("pais"));
				list.add(jugador);
			}
			statement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * ListJugador
	 * 
	 * @param cod_team
	 * @return ArrayList<Jugador>
	 */

	public ArrayList<Jugador> listJugadorCod_Team(int cod_team) {
		ArrayList<Jugador> list = new ArrayList<>();
		String sql = "SELECT*FROM jugadores WHERE cod_equipo ='" + cod_team + "';";
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Jugador jugador = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre"), rs.getInt("cod_equipo"),
						rs.getString("pierna"), rs.getInt("altura"), rs.getString("pais"));
				list.add(jugador);
			}
			statement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * GetJugador
	 * 
	 * @param cod_equipo
	 * @return ArrayList<Jugador>
	 */

	public ArrayList<Jugador> getJugador(int cod_equipo) {
		ArrayList<Jugador> jugador = new ArrayList<>();
		String sql = "SELECT*FROM jugadores WHERE cod_equipo = '" + cod_equipo + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Jugador jugadorList = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre"),
						rs.getInt("cod_equipo"), rs.getString("pierna"), rs.getInt("altura"), rs.getString("pais"));
				jugador.add(jugadorList);

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jugador;
	}

	/**
	 * GetJugadorbycodeJugador
	 * 
	 * @param cod_jugador
	 * @return Jugador
	 */

	public Jugador getJugadorbycodeJugador(int cod_jugador) {
		Jugador jugador = null;
		String sql = "SELECT*FROM jugadores WHERE cod_jugador = '" + cod_jugador + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				jugador = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre"), rs.getInt("cod_equipo"),
						rs.getString("pierna"), rs.getInt("altura"), rs.getString("pais"));

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jugador;
	}

	/**
	 * VerifyJugador
	 * 
	 * @param cod_jugador
	 * @return boolean
	 */

	public boolean verifyJugador(int cod_jugador) {
		String sql = "SELECT*FROM jugadores WHERE cod_jugador = '" + cod_jugador + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * getNewCodJugador by integer
	 * 
	 * @return
	 */
	public int getNewCodJugador() {
		int codJugador = 0;

		// String sql = "SELECT MAX(cod_jugador) from jugadores";
		String sql = "SELECT cod_jugador from jugadores WHERE cod_jugador in( SELECT MAX(cod_jugador) from jugadores)";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				codJugador = rs.getInt("cod_jugador");
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return codJugador;
	}

	/**
	 * lasCodePlayer
	 * 
	 * @return Integer
	 */
	public int lastCodePlayer() {
		int code = 0;
		String sql = "SELECT cod_jugador FROM jugadores ORDER BY cod_jugador DESC LIMIT 0,1";
		try {
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				code = rs.getInt("cod_jugador");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return code;
	}

	/**
	 * removePlayer by cod_jugador (PK)
	 * 
	 * @param cod_jugador
	 */

	public void removePlayer(int cod_jugador) {
		String sql = "DELETE FROM jugadores WHERE cod_jugador = '" + cod_jugador + "';";
		// System.out.println("Exeption in query from removePlayer : " + sql);
		try (Statement statement = this.connection.createStatement()) {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * addEquipo
	 * 
	 * @param Equipo team
	 */
	public void addEquipo(Equipo team) {

		String sql = "INSERT INTO equipos (cod_equipo, nombre, cod_liga) VALUES ('" + team.getCod_equipo() + "','"
				+ team.getNombre() + "','" + team.getCod_liga() + "')";
		System.out.println("Exeption in query from addEquipo : " + sql);

		try (Statement statement = this.connection.createStatement()) {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * lastCodeEquipo
	 * 
	 * @return Integer
	 */
	public int lastCodeEquipo() {
		int lastcode = 0;

		String sql = "SELECT cod_equipo FROM equipos WHERE cod_equipo IN (SELECT MAX(cod_equipo) FROM equipos);";
		System.out.println("Exeption in query from lastCodeEquipo : " + sql);

		try (Statement statement = this.connection.createStatement()) {

			ResultSet rs = statement.executeQuery(sql);

			while (rs.next()) {
				lastcode = rs.getInt("cod_equipo");
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lastcode;
	}

	public void setJugador (int cod_jugador, String nombre, int cod_equipo, String pierna, int altura, String pais) {
		String sql = "UPDATE jugadores set nombre ='"+nombre+"', cod_equipo ='"+cod_equipo+"', pierna='"+
	pierna+"', altura='"+altura+"', pais='"+pais+"' WHERE cod_jugador='"+cod_jugador+"';";
		//System.out.println("Exeption in query from setJugador : " + sql);
		
		try {
			Statement statement = this.connection.createStatement();
			statement.executeUpdate(sql);
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

				
	}

	// -- ENDS FUNCTIONS JUGADOR --

	// -- FUNCTIONS CARDS? --
	
	/**
	 * getListCardSimplePlayers
	 * @param firstPosition
	 * @return
	 */
	public ArrayList<Carta>getListCardSimplePlayers(String firstPosition){
		ArrayList<Carta> listPlayers = new ArrayList<>();
		String sql = "SELECT * FROM cartas WHERE nombre = 'SIMPLE' AND pos = '"+firstPosition+"';";
		System.out.println("Exception in query from getListCardSimplePlayers : " + sql);

		try(Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Carta carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
				listPlayers.add(carta);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return listPlayers;
	}
	/**
	 * getListCardSimplePlayersTwoParameters
	 * @param firstPosition
	 * @param secondPosition
	 * @return
	 */
	public ArrayList<Carta>getListCardSimplePlayersTwoParameters(String firstPosition, String secondPosition){
		ArrayList<Carta> listPlayers = new ArrayList<>();
		String sql = "SELECT * FROM cartas WHERE nombre = 'SIMPLE' AND (pos = '"+firstPosition+"' OR pos = '"+secondPosition+"');";
		System.out.println("Exception in query from getListCardSimplePlayersTwoParameters : " + sql);

		try(Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Carta carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
				listPlayers.add(carta);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return listPlayers;
	}
	/**
	 * getListCardSimplePlayersThreeParameters
	 * @param firstPosition
	 * @param secondPosition
	 * @return
	 */
	public ArrayList<Carta>getListCardSimplePlayersThreeParameters(String firstPosition, String secondPosition, String thirdPosition){
		ArrayList<Carta> listPlayers = new ArrayList<>();
		String sql = "SELECT * FROM cartas WHERE nombre = 'SIMPLE' AND (pos = '"+firstPosition+"' OR pos = '"+secondPosition+"' OR pos= '"+thirdPosition+"');";
		System.out.println("Exception in query from getListCardSimplePlayersThreeParameters : " + sql);
		try(Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Carta carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
				listPlayers.add(carta);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return listPlayers;
	}
	
	/**
	 * ListCarta
	 * 
	 * @return
	 */
	public ArrayList<Carta> listCarta() {
		ArrayList<Carta> list = new ArrayList();
		String sql = "SELECT*FROM cartas";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Carta carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
				list.add(carta);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * ListCartaSIMPLE
	 * 
	 * @param cod_player
	 * @return ArrayList<Carta>
	 */

	public ArrayList<Carta> listCartaSIMPLE(int cod_player) {
		ArrayList<Carta> list = new ArrayList();
		String sql = "SELECT*FROM cartas where nombre = 'SIMPLE'  AND cod_jugador='" + cod_player + "';";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Carta carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
				list.add(carta);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * GetCarta
	 * 
	 * @param nombre      of card
	 * @param cod_jugador
	 * @return Carta
	 */
	public Carta getCarta(String nombre, int cod_jugador) {
		Carta carta = null;
		String sql = "SELECT * FROM cartas WHERE nombre = '" + nombre + "' AND cod_jugador = '" + cod_jugador + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return carta;
	}

	/**
	 * GetCardbyCodeJugador
	 * 
	 * @param cod_jugador
	 * @return Carta
	 */

	public Carta getCardbyCodeJugador(int cod_jugador) {
		Carta dataPlayer = new Carta();

		String sql = "SELECT*FROM cartas WHERE cod_jugador = '" + cod_jugador + "';";

		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				dataPlayer = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dataPlayer;
	}

	/**
	 * GetCardbyPKs
	 * 
	 * @param nameCard
	 * @param cod_jugador
	 * @return Carta dataPlayer
	 */
	public Carta getCardbyPKs(String nameCard, int cod_jugador) {
		Carta dataPlayer = new Carta();

		String sql = "SELECT*FROM cartas WHERE nombre = '" + nameCard + "'  AND cod_jugador = '" + cod_jugador + "';";

		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				dataPlayer = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dataPlayer;
	}

	/**
	 * GetDataCard
	 * 
	 * @param cod_jugador
	 * @return ArrayList<Carta>
	 */
	public ArrayList<Carta> getDataCard(String nombre, int cod_jugador) {

		ArrayList<Carta> dataPlayer = new ArrayList<>();

		String sql;
		if (nombre.equalsIgnoreCase("all")) {
			sql = "SELECT*FROM cartas WHERE cod_jugador = '" + cod_jugador + "' ORDER BY rat;";
		} else {

			sql = "SELECT*FROM cartas WHERE cod_jugador = '" + cod_jugador + "'  AND nombre = '" + nombre
					+ "' ORDER BY rat;";
		}

		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Carta dataPlayer1 = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
				dataPlayer.add(dataPlayer1);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dataPlayer;
	}

	/**
	 * verifyCarta
	 * 
	 * @param nombre
	 * @param cod_jugador
	 * @return boolean
	 */

	public boolean verifyCarta(String nombre, int cod_jugador) {
		String sql = "SELECT * FROM `cartas` WHERE nombre = '" + nombre + "' AND cod_jugador = '" + cod_jugador + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * addNewPlayer
	 * 
	 * @param nombre
	 * @param cod_equipo
	 * @param pierna
	 * @param altura
	 * @param pais
	 */
	public void addNewPlayer(Jugador jugador) {

		String sql = "INSERT INTO jugadores (cod_jugador, nombre, cod_equipo, pierna, altura, pais) VALUES('"
				+ jugador.getCod_jugador() + "','" + jugador.getNombre() + "','" + jugador.getCod_equipo() + "','"
				+ jugador.getPierna() + "','" + jugador.getAltura() + "','" + jugador.getPais() + "')";
		// System.out.println("Exception in sql from addNewPlayer: " + sql);

		try (Statement statement = this.connection.createStatement()) {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// -- ENDS FUNCTIONS CARDS --

	// -- FUNCTIONS LEAGUE? --

	/**
	 * getLiga_by_codeLiga
	 * 
	 * @param cod_liga
	 * @return Object Liga
	 */
	public Liga getLiga_by_codeLiga(int cod_liga) {
		Liga liga = null;
		String sql = "SELECT*FROM ligas WHERE cod_liga = '" + cod_liga + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				liga = new Liga(rs.getInt("cod_liga"), rs.getString("nombre"), rs.getString("pais"));

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return liga;
	}

	/**
	 * GetLiga
	 * 
	 * @param cod_liga
	 * @return ArrayList<Liga>
	 */

	public ArrayList<Liga> getLiga(int cod_liga) {
		ArrayList<Liga> liga = new ArrayList<>();
		String sql = "SELECT*FROM ligas WHERE cod_liga = '" + cod_liga + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Liga liga1 = new Liga(rs.getInt("cod_liga"), rs.getString("nombre"), rs.getString("pais"));
				liga.add(liga1);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return liga;
	}

	/**
	 * ListLiga
	 * 
	 * @return
	 */
	public ArrayList<Liga> listLiga() {
		ArrayList<Liga> list = new ArrayList();
		String sql = "SELECT*FROM ligas";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Liga liga = new Liga(rs.getInt("cod_liga"), rs.getString("nombre"), rs.getString("pais"));
				list.add(liga);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * GetTeambyCodeLeague
	 * 
	 * @param cod_league
	 * @return
	 */
	public ArrayList<Equipo> getTeam(int cod_league) {
		ArrayList<Equipo> list = new ArrayList<>();
		String sql = "SELECT*FROM equipos WHERE cod_liga = '" + cod_league + "'";

		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Equipo getTeam = new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getInt("cod_liga"));
				list.add(getTeam);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * VerifyLiga
	 * 
	 * @param cod_liga
	 * @return boolean
	 */

	public boolean verifyLiga(int cod_liga) {
		String sql = "SELECT*FROM ligas WHERE cod_liga = '" + cod_liga + "'";
		try (Statement statement = this.connection.createStatement()) {
			ResultSet rs = statement.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * removeLiga by integer
	 * 
	 * @param cod_liga
	 */

	public void removeLiga(int cod_liga) {

		String sql = "DELETE FROM ligas WHERE cod_liga = '" + cod_liga + "';";
		// System.out.println("Exeption in query from removeremoveLigaEquipo : " + sql);

		try (Statement statement = this.connection.createStatement()) {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * addLiga
	 * 
	 * @param Liga
	 */

	public void addLiga(Liga liga) {

		String sql = "INSERT INTO ligas (cod_liga,nombre, pais) VALUES ('" + liga.getCod_liga() + "','"
				+ liga.getNombre() + "','" + liga.getPais() + "');";
		System.out.println("Exeption in query from addLiga : " + sql);

		try (Statement statement = this.connection.createStatement()) {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * lasCodeLiga
	 * 
	 * @return integer
	 */
	public int lastCodeLiga() {
		int lastCode = 0;
		String sql = "SELECT cod_liga FROM ligas WHERE cod_liga IN (SELECT MAX(cod_liga) FROM ligas);";
		System.out.println("Exeption in query from lastCodeLiga : " + sql);

		try (Statement statement = this.connection.createStatement()) {

			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				lastCode = rs.getInt("cod_liga");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lastCode;
	}

	/**
	 * setDataLiga (UPDATE DATA FROM LIGA)
	 * 
	 * @param cod_liga
	 * @param nombre
	 * @param pais
	 */

	public void setDataLiga(int cod_liga, String nombre, String pais) {
		String sql = "UPDATE ligas SET nombre ='" + nombre + "', pais = '" + pais + "' WHERE cod_liga = '" + cod_liga
				+ "';";
		// System.out.println("Exeption in query from setDataLiga : " + sql);

		try {
			Statement statement = this.connection.createStatement();
			statement.executeUpdate(sql);
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// -- ENDS FUNCTIONS LEAGUE --

	// -- DETAILLS OF .HTML? --

	/**
	 * BackgroundColor
	 * 
	 * @param numas
	 * @return string with references color
	 */
	public String backgroundColor(int numas) {

		if (numas > 0 && numas < 50) {
			return "red";
		} else if (numas >= 50 && numas < 60) {
			return "#fb8c00";
		} else if (numas >= 60 && numas < 70) {
			return "#e9bc0b";
		} else if (numas >= 70 && numas < 90) {
			return "green";
		} else if (numas >= 90 && numas < 100) {
			return "darkgreen";
		}
		return "black";
	}

	/**
	 * BackgroundColorLetter
	 * 
	 * @param numas
	 * @return string with references color
	 */

	public String backgroundColorLetter(int numas) {

		if (numas > 0 && numas < 50) {
			return "f44336";
		} else if (numas >= 50 && numas < 60) {
			return "fb8c00";
		} else if (numas >= 60 && numas < 80) {
			return "e9bc0b";
		} else if (numas >= 80 && numas < 90) {
			return "4caf50";
		} else if (numas >= 90 && numas < 100) {
			return "007e33";
		}
		return "black";
	}

	/**
	 * changeBarSize
	 * 
	 * @param numas
	 * @return string with size of bar
	 */
	public String changeBarSize(int numas) {

		if (numas > 0 && numas < 10) {
			return "30";
		} else if (numas >= 10 && numas < 20) {
			return "60";
		} else if (numas >= 20 && numas < 30) {
			return "90";
		} else if (numas >= 30 && numas < 40) {
			return "120";
		} else if (numas >= 40 && numas < 50) {
			return "150";
		} else if (numas >= 50 && numas < 60) {
			return "180";
		} else if (numas >= 60 && numas < 70) {
			return "210";
		} else if (numas >= 70 && numas < 80) {
			return "240";
		} else if (numas >= 80 && numas < 90) {
			return "270";
		} else if (numas >= 90 && numas < 100) {
			return "300";
		} else {
			return "0";
		}

	}

	/**
	 * validate Character
	 * 
	 * @param name
	 * @return boolean
	 */
	public boolean validateCharacterLetter(String name) {
		for (int i = 0; i < name.trim().length(); i++) {
			if (isLetterAlphabetic(name.charAt(i))) {
				return true;
			}
		}
		return false;
	}

	/**
	 * validateCharacterDigit
	 * 
	 * @param number
	 * @return boolean
	 */

	public boolean validateCharacterDigit(String number) {

		for (int i = 0; i < number.length(); i++) {
			if (Character.isDigit(number.charAt(i))) {
				return true;
			}
		}

		return false;
	}

	/**
	 * isLetterAlphabetic
	 * 
	 * @param char
	 * @return boolean
	 */
	public boolean isLetterAlphabetic(char text) {
		String patron = "^[a-zA-Z]+$";
		Pattern p = Pattern.compile(patron);
		Matcher m = p.matcher(String.valueOf(text));

		return m.matches();
	}
	// -- ENDS DETAILLS OF .HTML? --

}
