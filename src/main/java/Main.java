import dao.RaceDAO;
import dao.TeamDAO;
import dao.DriverDAO;
import dao.SeasonDAO;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        TeamDAO teamDAO = new TeamDAO();
        SeasonDAO seasonDAO = new SeasonDAO();
        DriverDAO driverDAO = new DriverDAO();
        RaceDAO raceDAO = new RaceDAO();

        while (true) {
            System.out.println("\n--- F1 Management System Menu ---");
            System.out.println("1. List all Teams");
            System.out.println("2. List all Drivers");
            System.out.println("3. Get Team points for Season");
            System.out.println("4. Get List of seasons");
            System.out.println("5. Get Driver age at the time of race");
            System.out.println("0. Exit");
            System.out.print("Choice: ");

            int choice = scanner.nextInt();
            if (choice == 0) break;

            switch (choice) {
                case 1:
                    teamDAO.getAllTeams().forEach(System.out::println);
                    break;
                case 2:
                    driverDAO.getAllDrivers().forEach(System.out::println);
                    break;
                case 3:
                    try {
                        System.out.print("Enter Team ID: ");
                        int tid = scanner.nextInt();
                        System.out.print("Enter Season ID: ");
                        int sid = scanner.nextInt();
                        if (!teamDAO.exists(tid)) {
                            System.err.println("Error: Team with ID " + tid + " does not exist!");
                        }
                        else if (!seasonDAO.exists(sid)) {
                            System.err.println("Error: Season with ID " + sid + " does not exist!");
                        }
                        else {
                            int pts = driverDAO.getTeamPoints(tid, sid);
                            System.out.println(">>> Total points for team " + tid + " in season " + sid + ": " + pts);
                        }
                    } catch (InputMismatchException e) {
                        System.err.println("Invalid input! Please enter only numeric IDs.");
                        scanner.next();
                    }
                    break;
                case 4:
                    System.out.println("\n--- List of F1 Seasons ---");
                    seasonDAO.getAllSeasons().forEach(System.out::println);
                    break;
                case 5:
                    try {
                        System.out.print("Enter Driver ID: ");
                        int drId = scanner.nextInt();
                        System.out.print("Enter Race ID: ");
                        int rcId = scanner.nextInt();

                        if (!driverDAO.exists(drId)) {
                            System.err.println("Error: Driver ID " + drId + " not found!");
                        } else if (!raceDAO.exists(rcId)) {
                            System.err.println("Error: Race ID " + rcId + " not found!");
                        } else {
                            Integer age = driverDAO.getAgeAtRace(drId, rcId);
                            if (age != null) {
                                System.out.println(">>> Driver age at the time of race: " + age + " years.");
                            } else {
                                System.out.println("No data found for this combination.");
                            }
                        }
                    } catch (InputMismatchException e) {
                        System.err.println("Invalid input! Please enter numeric IDs.");
                        scanner.next();
                    }
                    break;
                default:
                    System.out.println("Invalid choice!");
            }
        }
    }
}