package Model;

public class Prihlaseny {
    private Integer id;
    private String meno;
    private String priezvisko;
    private String rodnecislo;
    private String pohlavie;
    private String vek;
    private String vakcina;
    private String poistovna;
    private String ulica;
    private String ulicacislo;
    private Integer psc;
    private String obec;
    private String telcislo;
    private String email;
    private String password;
    private Integer role;
    private String status;


    public Prihlaseny(Integer id, String meno, String priezvisko, String rodnecislo, String pohlavie, String vek, String vakcina, String poistovna, String ulica, String ulicacislo, Integer psc, String obec, String telcislo, String email, String status) {
        this.id = id;
        this.meno = meno;
        this.priezvisko = priezvisko;
        this.rodnecislo = rodnecislo;
        this.pohlavie = pohlavie;
        this.vek = vek;
        this.vakcina = vakcina;
        this.poistovna = poistovna;
        this.ulica = ulica;
        this.ulicacislo = ulicacislo;
        this.psc = psc;
        this.obec = obec;
        this.telcislo = telcislo;
        this.email = email;
        this.status = status;
    }

    public Prihlaseny(String meno, String priezvisko, String rodnecislo, String pohlavie, String vek, String vakcina, String poistovna, String ulica, String ulicacislo, Integer psc, String obec, String telcislo, String email,String status, String password, Integer role) {
        this.meno = meno;
        this.priezvisko = priezvisko;
        this.rodnecislo = rodnecislo;
        this.pohlavie = pohlavie;
        this.vek = vek;
        this.vakcina = vakcina;
        this.poistovna = poistovna;
        this.ulica = ulica;
        this.ulicacislo = ulicacislo;
        this.psc = psc;
        this.obec = obec;
        this.telcislo = telcislo;
        this.email = email;
        this.status = status;
        this.password = password;
        this.role = role;
    }

    public Prihlaseny(String email, String password, Integer role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public Prihlaseny(String meno, String priezvisko, String rodnecislo, String pohlavie, String vek, String vakcina, String poistovna, String ulica, String ulicacislo, Integer psc, String obec, String telcislo, String email, String password, Integer role, String status) {
        this.meno = meno;
        this.priezvisko = priezvisko;
        this.rodnecislo = rodnecislo;
        this.pohlavie = pohlavie;
        this.vek = vek;
        this.vakcina = vakcina;
        this.poistovna = poistovna;
        this.ulica = ulica;
        this.ulicacislo = ulicacislo;
        this.psc = psc;
        this.obec = obec;
        this.telcislo = telcislo;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMeno() {
        return meno;
    }

    public void setMeno(String meno) {
        this.meno = meno;
    }

    public String getPriezvisko() {
        return priezvisko;
    }

    public void setPriezvisko(String priezvisko) {
        this.priezvisko = priezvisko;
    }

    public String getRodnecislo() {
        return rodnecislo;
    }

    public void setRodnecislo(String rodnecislo) {
        this.rodnecislo = rodnecislo;
    }

    public String getPohlavie() {
        return pohlavie;
    }

    public void setPohlavie(String pohlavie) {
        this.pohlavie = pohlavie;
    }

    public String getVek() {
        return vek;
    }

    public void setVek(String vek) {
        this.vek = vek;
    }

    public String getVakcina() {
        return vakcina;
    }

    public void setVakcina(String vakcina) {
        this.vakcina = vakcina;
    }

    public String getPoistovna() {
        return poistovna;
    }

    public void setPoistovna(String poistovna) {
        this.poistovna = poistovna;
    }

    public String getUlica() {
        return ulica;
    }

    public void setUlica(String ulica) {
        this.ulica = ulica;
    }

    public String getUlicacislo() {
        return ulicacislo;
    }

    public void setUlicacislo(String ulicacislo) {
        this.ulicacislo = ulicacislo;
    }

    public Integer getPsc() {
        return psc;
    }

    public void setPsc(Integer psc) {
        this.psc = psc;
    }

    public String getObec() {
        return obec;
    }

    public void setObec(String obec) {
        this.obec = obec;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
