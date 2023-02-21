package Model;

import java.math.BigInteger;
import java.sql.Date;

public class Dodavatelia {
    private Integer id;
    private String dodavatel;
    private String vakcina;
    private Date datum;
    private String faktura;
    private String mnozstvo;
    private String telcislo;
    private String email;

    public Dodavatelia(Integer id, String dodavatel, String vakcina, Date datum, String faktura, String mnozstvo, String telcislo, String email) {
        this.id = id;
        this.dodavatel = dodavatel;
        this.vakcina = vakcina;
        this.datum = datum;
        this.faktura = faktura;
        this.mnozstvo = mnozstvo;
        this.telcislo = telcislo;
        this.email = email;
    }

    public Dodavatelia(String dodavatel, String vakcina, Date datum, String faktura, String mnozstvo, String telcislo, String email) {
        this.dodavatel = dodavatel;
        this.vakcina = vakcina;
        this.datum = datum;
        this.faktura = faktura;
        this.mnozstvo = mnozstvo;
        this.telcislo = telcislo;
        this.email = email;
    }

    public Dodavatelia(String vakcina, String mnozstvo) {
        this.vakcina = vakcina;
        this.mnozstvo = mnozstvo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDodavatel() {
        return dodavatel;
    }

    public void setDodavatel(String dodavatel) {
        this.dodavatel = dodavatel;
    }

    public String getVakcina() {
        return vakcina;
    }

    public void setVakcina(String vakcina) {
        this.vakcina = vakcina;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public String getFaktura() {
        return faktura;
    }

    public void setFaktura(String faktura) {
        this.faktura = faktura;
    }

    public String getMnozstvo() {
        return mnozstvo;
    }

    public void setMnozstvo(String mnozstvo) {
        this.mnozstvo = mnozstvo;
    }

    public String getTelcislo() {
        return telcislo;
    }

    public void setTelcislo(String telcislo) {
        this.telcislo = telcislo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
