package org.example;

public class Reporter {

    private final Integer cpr;
    private final String firstName;
    private final String lastName;
    private final Integer addressId;

    private final String Telephone_num;
    private final String Email;

    public Reporter(Integer cpr, String firstName, String lastName, Integer addressId, String Telephone_num, String Email) {
        this.cpr = cpr;
        this.firstName = firstName;
        this.lastName = lastName;
        this.addressId =addressId;
        this.Telephone_num = Telephone_num;
        this.Email = Email;
    }


    public Integer getCPR() { return cpr; }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public int getAddressId() {
        return addressId;
    }

    public String getTelephone_num() {
        return Telephone_num;
    }

    public String getEmail() {
        return Email;
    }

    @Override
    public String toString() {
        final String D = ";";

        return getCPR() + D + getFirstName() + D + getLastName() + D + getAddressId();
    }

}

