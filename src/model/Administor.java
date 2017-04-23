package model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by lh
 * on 2017/4/23.
 */
@Entity
public class Administor {
    private String idadministor;
    private String name;
    private String password;

    @Id
    @Column(name = "idadministor", nullable = false, length = 15)
    public String getIdadministor() {
        return idadministor;
    }

    public void setIdadministor(String idadministor) {
        this.idadministor = idadministor;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 45)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Administor that = (Administor) o;

        if (idadministor != null ? !idadministor.equals(that.idadministor) : that.idadministor != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idadministor != null ? idadministor.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }
}
