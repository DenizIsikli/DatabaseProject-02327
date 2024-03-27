package org.example;
import java.io.IOException;
import java.util.List;
import java.io.File;
import java.sql.*;

public class LoaderExample {

	public static void main(String[] args) {
		PhotosAndReportersLoader loader = new PhotosAndReportersLoader();
		try {
            File csv_file = new File("src/main/java/org/example/uploads.csv");

            List<PhotoAndReporter> photosAndReporters = loader.loadPhotosAndReporters(csv_file.getAbsolutePath());

			for(PhotoAndReporter photoAndReporter : photosAndReporters) {
                tableSchemeInsert("INSERT INTO reporters (cpr, first_name, last_name, street_name, civic_number, zip_code, country) VALUES ("
                        + photoAndReporter.getReporter().getCPR() + ", '"
                        + photoAndReporter.getReporter().getFirstName()
                        + "', '" + photoAndReporter.getReporter().getLastName()
                        + "', '" + photoAndReporter.getReporter().getStreetName()
                        + "', " + photoAndReporter.getReporter().getCivicNumber()
                        + ", " + photoAndReporter.getReporter().getZIPCode()
                        + ", '" + photoAndReporter.getReporter().getCountry()
                        + "');");
                tableSchemeInsert("INSERT INTO photos (title, date) VALUES ('"
                        + photoAndReporter.getPhoto().getTitle()
                        + "', '" + photoAndReporter.getPhoto().getDate()
                        + "');");
			}


		} catch (IOException e) {
			e.printStackTrace();
		}
	}

    public static void tableSchemeInsert(String sql_query) {
        String host = "localhost";
        String port = "3306";
        String database = "projectdatabase";
        String cp = "utf8";

        String username = "root";
        String password = "mypassword";

        final String url = "jdbc:mysql://" + host + ":" + port + "/" + database + "?characterEncoding=" + cp;

        try {
            List<String> sqlInserts = List.of(
                    sql_query
            );

            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();
            for(String sqlInsert : sqlInserts) {
                statement.executeUpdate(sqlInsert);
            }
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
