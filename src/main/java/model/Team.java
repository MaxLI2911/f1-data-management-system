package model;
public class Team {
    private int id;
    private String name;
    private String engineSupplier;
    private String principal;

    public Team(int id, String name, String engineSupplier, String principal) {
        this.id = id;
        this.name = name;
        this.engineSupplier = engineSupplier;
        this.principal = principal;
    }

    @Override
    public String toString() {
        return String.format("ID: %d | Team: %-25s | Engine suplier: %-10s | Prinicipal: %s",
                id, name, engineSupplier, principal);
    }
}