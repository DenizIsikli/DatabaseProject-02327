package org.example;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Photo {
    private final String title;
    private final Date date;

    private final Integer cpr;

    public Photo(String title, Date date, Integer cpr) {
        this.title = title;
        this.date = date;
        this.cpr = cpr;
    }

    public String getTitle() {
        return title;
    }
    public String getDate() {
        final SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyyMMdd");
        return dateFormatter.format(date); }

    public Integer getCPR() {
        return cpr;
    }

    @Override
    public String toString() {
        final String D = ";";
        return getTitle() +D + getDate();
    }

}