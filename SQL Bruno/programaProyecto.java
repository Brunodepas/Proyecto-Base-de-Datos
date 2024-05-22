import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class programaProyecto {

    public static void main(String[] args) {
        Connection conexion = null;
        try {
            // Cargo los datos necesarios para conectarme a la base de datos que quiero
            String driver = "";
            String base_de_datos = "";
            String user = "";
            String pass = "";
            FileReader archivo = new FileReader("datos.txt");
            BufferedReader br = new BufferedReader(archivo);
            driver = br.readLine();
            base_de_datos = br.readLine();
            user = br.readLine();
            pass = br.readLine();
            br.close();

            // Cargo el controlador JDBC
            Class.forName(driver);
            
            // Me conecto a la base de datos
            conexion = DriverManager.getConnection("jdbc:postgresql://" + base_de_datos, user, pass);
    
            int opcion;
            Scanner entrada = new Scanner(System.in);

            // Menu con las diferentes opciones
            do {
                System.out.println("Menú:");
                System.out.println("1. Cargar un Cine");
                System.out.println("2. Cargar una Sala en un Cine");
                System.out.println("3. Listar los Cines");
                System.out.println("4. Listar los Cines con sus Salas");
                System.out.println("5. Salir");
                System.out.print("Ingresa tu opción: ");
            
                opcion = entrada.nextInt();
                Scanner e = new Scanner(System.in);
                String consulta = "";
                PreparedStatement enviador;
                ResultSet resultado;
                String nom_cine = "";
                String telefono = "";
                String direccion = "";
                int num_sala;
                int cant_butacas;
                switch(opcion) {
                    case 1:
                        cines(conexion);
                        System.out.print("Ingrese el nombre del cine (no se puede repetir con los de arriba): ");
                        nom_cine = e.nextLine();
                        System.out.print("Ingrese el telefono del cine: ");
                        telefono = e.nextLine();
                        System.out.print("Ingrese la direccion del cine: ");
                        direccion = e.nextLine();
    
                        consulta = "insert into proyecto.cine (nom_cine, telefono, direccion) values ('" + nom_cine + "', '" + telefono + "', '" + direccion + "')";
                        enviador = conexion.prepareStatement(consulta);
                        enviador.executeUpdate();
                        break;
                    case 2:
                        salas(conexion);
                        System.out.print("Ingrese el numero de la sala (no se puede repetir con las de arriba): ");
                        num_sala = e.nextInt();
                        e.nextLine();
                        System.out.print("Ingrese la cantidad de butacas de la sala: ");
                        cant_butacas = e.nextInt();
                        e.nextLine();
                        cines(conexion);
                        System.out.print("Ingrese el nombre del cine al que pertenece la sala (tiene que ser uno de los de arriba): ");
                        nom_cine = e.nextLine();
    
                        consulta = "insert into proyecto.salas (num_sala, cant_butacas, nom_cine) values (" + num_sala + ", " + cant_butacas + ", '" + nom_cine + "')";
                        enviador = conexion.prepareStatement(consulta);
                        enviador.executeUpdate();
                        break;
                    case 3:
                        cines(conexion);
                        break;
                    case 4:
                        consulta = "select nom_cine, num_sala from proyecto.cine natural join proyecto.salas order by nom_cine, num_sala";
                        enviador = conexion.prepareStatement(consulta);
                        resultado = enviador.executeQuery();
                        while (resultado.next()) {
                            if (nom_cine.compareTo(resultado.getString("nom_cine")) != 0) {
                                nom_cine = resultado.getString("nom_cine");
                                System.out.println("Cine: " + nom_cine + "\n");
                            }
                            num_sala = resultado.getInt("num_sala");
                            System.out.println("        Numero de Sala: " + num_sala + "\n");
                        }
                        break;
                    case 5:
                        System.out.println("Saliendo del programa...");
                        e.close();
                        break;
                        default:
                        System.out.println("Opción inválida. Por favor, selecciona una opción válida.");
                    }
                } while (opcion != 5);
                entrada.close();
                conexion.close();
        } 
        catch (ClassNotFoundException cnfe) {
            //cnfe.printStackTrace();
            System.err.println("Error cargando el driver: " + cnfe);
        }
        catch (SQLException sqle) {
            //sqle.printStackTrace();
            System.err.println("Error de conexion con: " + sqle);
        }
        catch (IOException a) {
            //a.printStackTrace();
            System.err.println("Error leyendo el archivo: " + a);
        }
    }

    private static void cines(Connection conexion) throws SQLException {
        String consulta = "select * from proyecto.cine order by nom_cine";
        PreparedStatement enviador = conexion.prepareStatement(consulta);
        ResultSet resultado = enviador.executeQuery();
        int i = 1;

        System.out.println("Estos son los nombres de los cines cargados: ");
        while (resultado.next()) {
            String nom_cine = resultado.getString("nom_cine");
            System.out.println(i + "- " + nom_cine);
            i++;
        }
    }

    private static void salas(Connection conexion) throws SQLException {
        String consulta = "select num_sala from proyecto.salas";
        PreparedStatement enviador = conexion.prepareStatement(consulta);
        ResultSet resultado = enviador.executeQuery();
        String cadena = "";

        while (resultado.next()) {
            int num_sala = resultado.getInt("num_sala");
            cadena += num_sala + " | ";
        }
        System.out.println("Estos son las salas cargadas: ");
        System.out.print(cadena + "\n");
    }
}

