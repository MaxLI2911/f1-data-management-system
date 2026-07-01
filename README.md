# Formula 1 Data Management System

Project created by:
* Szymon Frelik
* Maksim Lubentsov

## Project Description

### Topic

The project is a relational database designed for managing a Formula 1 World Championship racing season. It focuses on the sporting and statistical aspects of the competition.

### Functionality

* Team management
* Driver management
* Race calendar management
* Recording qualifying and race session results
* Generating overall standings (leaderboards) for individual seasons
* Executing statistical queries

### Database Structure

1. **Dictionary tables:** `countries`, `addresses`, `team_status`, `races_results_status` — ensure a high degree of data normalization, eliminating information redundancy.
2. **Resource management tables:** `teams`, `drivers`, `circuits`, `seasons` — store information about the entities participating in the competitions.
3. **Results tables:** `races`, `races_results`, `races_qualifying` — handle the relationships between drivers, teams, and events, storing sporting metrics.

## Running the Java Application

```bash
cd java
mvn clean compile
mvn exec:java -Dexec.mainClass="Main"
