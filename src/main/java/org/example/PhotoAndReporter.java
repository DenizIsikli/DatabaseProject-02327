package org.example;
import java.util.Date;

public class PhotoAndReporter {
	private final Reporter reporter;
	private final Photo photo;

	public PhotoAndReporter(String title, Date date, Integer cpr, String firstName, String lastName, Integer addressId, String Telephone_num, String Email) {
		reporter = new Reporter(cpr, firstName, lastName, addressId, Telephone_num, Email);
		photo = new Photo(title, date);
	}

	public Reporter getReporter() {
		return reporter;
	}

	public Photo getPhoto() {
		return photo;
	}
}
