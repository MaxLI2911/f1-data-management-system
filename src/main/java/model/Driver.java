package model;

import java.util.Date;

public class Driver {
    private int id;
    private String name;
    private String surname;
    private int raceNumber;

    public Driver(int id, String name, String surname, int raceNumber) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.raceNumber = raceNumber;
    }

    @Override
    public String toString() {
        return String.format("ID: %d | %-15s %-15s | Number: %d", id, name, surname, raceNumber);
    }
}