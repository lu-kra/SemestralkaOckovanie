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

public class DodavateliaController {

    //TODO: INSERT

    public int insertDodavatelia (Dodavatelia dodavatelia) {
        int numberOfInsertedRecords = 0;

        String sql = "INSERT INTO dodavatelia (dodavatel, vakcina, datum, faktura, mnozstvo, telcislo, email) VALUES (?,?,?,?,?,?,?)";


        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);

        ){

            ps.setString(1,dodavatelia.getDodavatel());
            ps.setString(2,dodavatelia.getVakcina());
            ps.setDate(3,dodavatelia.getDatum());
            ps.setString(4,dodavatelia.getFaktura());
            ps.setString(5,dodavatelia.getMnozstvo());
            ps.setString(6,dodavatelia.getTelcislo());
            ps.setString(7,dodavatelia.getEmail());


            numberOfInsertedRecords = ps.executeUpdate();

        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
        return numberOfInsertedRecords;

    }

//TODO: SELECT

    public List<Dodavatelia> getAllDodavatelia() {
        List<Dodavatelia> dodavatelias = new ArrayList<>();
        String sql = "SELECT * FROM dodavatelia";
        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dodavatelia dodavatelia = new Dodavatelia(
                        rs.getInt("id"),
                        rs.getString("dodavatel"),
                        rs.getString("vakcina"),
                        rs.getDate("datum"),
                        rs.getString("faktura"),
                        rs.getString("mnozstvo"),
                        rs.getString("telcislo"),
                        rs.getString("email")

                );
                dodavatelias.add(dodavatelia);
            }



        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return  dodavatelias;

    }

//TODO: DELETE

    public int deleteDodavatelia(int id) {
        int numberOfInsertedRecords = 0;


        String sql = "DELETE FROM dodavatelia WHERE id=?";

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

//TODO: GET 1 Dodavatel


    public Dodavatelia getDodavatel(int id) {
        Dodavatelia dodavatelia = null;
        String sql = "SELECT * FROM dodavatelia WHERE id=?";
        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){

            ps.setInt(1,id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dodavatelia dodavatel = new Dodavatelia(
                        rs.getInt("id"),
                        rs.getString("dodavatel"),
                        rs.getString("vakcina"),
                        rs.getDate("datum"),
                        rs.getString("faktura"),
                        rs.getString("mnozstvo"),
                        rs.getString("telcislo"),
                        rs.getString("email")
                );
                dodavatelia = dodavatel;
            }



        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return  dodavatelia;

    }



    //TODO: Edit Dodavatel

    public int updateDodavatelia(Dodavatelia dodavatelia) {
        int numberOfInsertedRecords = 0;

        // String sql = "INSERT INTO languages (progLang, framework, note) VALUES (?,?,?)";

        String sql = " UPDATE dodavatelia SET dodavatel = ?, vakcina = ?, datum = ?, faktura = ?, mnozstvo = ?, telcislo = ?, email = ? WHERE dodavatelia.id = ?";

        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){

            ps.setString(1, dodavatelia.getDodavatel());
            ps.setString(2,dodavatelia.getVakcina());
            ps.setDate(3,dodavatelia.getDatum());
            ps.setString(4,dodavatelia.getFaktura());
            ps.setString(5,dodavatelia.getMnozstvo());
            ps.setString(6,dodavatelia.getTelcislo());
            ps.setString(7,dodavatelia.getEmail());
            ps.setInt(8,dodavatelia.getId());

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


    //TODO: SELECT VAKCINA


    public List<Dodavatelia> getAllVakcina() {
        List<Dodavatelia> dodavatelias = new ArrayList<>();
        String sql = "SELECT vakcina, mnozstvo FROM dodavatelia";
        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dodavatelia dodavatelia = new Dodavatelia(
                        rs.getString("vakcina"),
                        rs.getString("mnozstvo")

                );
                dodavatelias.add(dodavatelia);
            }



        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return  dodavatelias;

    }

}
