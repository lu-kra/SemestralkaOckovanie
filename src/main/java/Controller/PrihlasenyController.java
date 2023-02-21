package Controller;

import Model.Dodavatelia;
import Model.Prihlaseny;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PrihlasenyController {

//TODO: INSERT

    public int insertPrihlaseny (Prihlaseny prihlaseny) {
        int numberOfInsertedRecords = 0;

        String sql = "INSERT INTO prihlaseny (meno, priezvisko, rodnecislo, pohlavie, vek, vakcina, poistovna, ulica, ulicacislo, psc, obec, telcislo, email, status, password, role) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";


    try (
    Connection con = DatabaseConnectionManager.getConnection();
    PreparedStatement ps = con.prepareStatement(sql);

    ){

        ps.setString(1,prihlaseny.getMeno());
        ps.setString(2,prihlaseny.getPriezvisko());
        ps.setString(3,prihlaseny.getRodnecislo());
        ps.setString(4,prihlaseny.getPohlavie());
        ps.setString(5,prihlaseny.getVek());
        ps.setString(6,prihlaseny.getVakcina());
        ps.setString(7,prihlaseny.getPoistovna());
        ps.setString(8,prihlaseny.getUlica());
        ps.setString(9,prihlaseny.getUlicacislo());
        ps.setInt(10,prihlaseny.getPsc());
        ps.setString(11,prihlaseny.getObec());
        ps.setString(12,prihlaseny.getTelcislo());
        ps.setString(13,prihlaseny.getEmail());
        ps.setString(14,prihlaseny.getStatus());
        ps.setString(15,prihlaseny.getPassword());
        ps.setInt(16,prihlaseny.getRole());



    numberOfInsertedRecords = ps.executeUpdate();

    } catch (NamingException | SQLException e) {
        e.printStackTrace();
    }
        return numberOfInsertedRecords;

}

//TODO: Login

    public Prihlaseny getLogin(String email) {
        Prihlaseny prihlaseny = null;
        String sql = "SELECT * FROM prihlaseny WHERE email=?";
        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){

            ps.setString(1,email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                prihlaseny = new Prihlaseny(
                        rs.getString("meno"),
                        rs.getString("priezvisko"),
                        rs.getString("rodnecislo"),
                        rs.getString("pohlavie"),
                        rs.getString("vek"),
                        rs.getString("vakcina"),
                        rs.getString("poistovna"),
                        rs.getString("ulica"),
                        rs.getString("ulicacislo"),
                        rs.getInt("psc"),
                        rs.getString("obec"),
                        rs.getString("telcislo"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("role"),
                        rs.getString("status")

                );
            }



        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return  prihlaseny;

    }

//TODO: SELECT

    public List<Prihlaseny> getAllPrihlaseny() {
        List<Prihlaseny> prihlasenies = new ArrayList<>();
        String sql = "SELECT * FROM prihlaseny";
        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){


            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Prihlaseny prihlaseny = new Prihlaseny(
                        rs.getInt("id"),
                        rs.getString("meno"),
                        rs.getString("priezvisko"),
                        rs.getString("rodnecislo"),
                        rs.getString("pohlavie"),
                        rs.getString("vek"),
                        rs.getString("vakcina"),
                        rs.getString("poistovna"),
                        rs.getString("ulica"),
                        rs.getString("ulicacislo"),
                        rs.getInt("psc"),
                        rs.getString("obec"),
                        rs.getString("telcislo"),
                        rs.getString("email"),
                        rs.getString("status")

                );
                prihlasenies.add(prihlaseny);
            }

        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return  prihlasenies;

    }



//TODO: DELETE

    public int deletePrihlaseny(int id) {
        int numberOfInsertedRecords = 0;


        String sql = "DELETE FROM prihlaseny WHERE id=?";

        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){

            ps.setInt(1,id);


            numberOfInsertedRecords = ps.executeUpdate();
            //alebo
            //return ps.executeUpdate();

        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
        // Because try can throw exception
        //return 0;
        //alebo
        return numberOfInsertedRecords;

    }


//TODO: SELECT NEZAOCKOVANY

    public List<Prihlaseny> getAllNezaockovany() {
        List<Prihlaseny> prihlasenies = new ArrayList<>();
        String sql = "SELECT * FROM prihlaseny WHERE status = 'nezaockovany'";
        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){


            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Prihlaseny prihlaseny = new Prihlaseny(
                        rs.getInt("id"),
                        rs.getString("meno"),
                        rs.getString("priezvisko"),
                        rs.getString("rodnecislo"),
                        rs.getString("pohlavie"),
                        rs.getString("vek"),
                        rs.getString("vakcina"),
                        rs.getString("poistovna"),
                        rs.getString("ulica"),
                        rs.getString("ulicacislo"),
                        rs.getInt("psc"),
                        rs.getString("obec"),
                        rs.getString("telcislo"),
                        rs.getString("email"),
                        rs.getString("status")

                );
                prihlasenies.add(prihlaseny);
            }

        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return  prihlasenies;

    }


//TODO: SELECT ZAOCKOVANY

    public List<Prihlaseny> getAllZaockovany() {
        List<Prihlaseny> prihlasenies = new ArrayList<>();
        String sql = "SELECT * FROM prihlaseny WHERE status = 'zaockovany'";
        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){


            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Prihlaseny prihlaseny = new Prihlaseny(
                        rs.getInt("id"),
                        rs.getString("meno"),
                        rs.getString("priezvisko"),
                        rs.getString("rodnecislo"),
                        rs.getString("pohlavie"),
                        rs.getString("vek"),
                        rs.getString("vakcina"),
                        rs.getString("poistovna"),
                        rs.getString("ulica"),
                        rs.getString("ulicacislo"),
                        rs.getInt("psc"),
                        rs.getString("obec"),
                        rs.getString("telcislo"),
                        rs.getString("email"),
                        rs.getString("status")

                );
                prihlasenies.add(prihlaseny);
            }

        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return  prihlasenies;

    }

}

