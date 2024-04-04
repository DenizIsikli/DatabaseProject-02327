package org.example;
import java.util.Date;

public class PhotoAndReporter {
 private final Reporter reporter;
 private final Photo photo;

	public PhotoAndReporter(String title, Date date, Integer cpr, Integer cpr2, String firstName, String lastName, String streetName, Integer civicNumber, String city, Integer zipCode, String country) {
		reporter = new Reporter(cpr, firstName, lastName, streetName, civicNumber, city, zipCode, country);
		photo = new Photo(title, date, cpr);
	}

 public Reporter getReporter() {
  return reporter;
 }

 public Photo getPhoto() {
  return photo;
 }
}