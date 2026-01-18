package model;

public class Season {
    private int id;
    private int year;
    private String description;

    public Season(int id, int year, String description) {
        this.id = id;
        this.year = year;
        this.description = description;
    }

    @Override
    public String toString() {
        return String.format("ID: %d | Year: %d | Era: %s", id, year, description);
    }


}