package model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by lh
 * on 2017/4/23.
 */
@Entity
@Table(name = "shopping_records", schema = "bookshopdb", catalog = "")
public class ShoppingRecords {
    private int idshoppingRecords;
    private Date date;
    private int number;
    private byte isfinished;

    @Id
    @Column(name = "idshopping_records", nullable = false)
    public int getIdshoppingRecords() {
        return idshoppingRecords;
    }

    public void setIdshoppingRecords(int idshoppingRecords) {
        this.idshoppingRecords = idshoppingRecords;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "number", nullable = false)
    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Basic
    @Column(name = "isfinished", nullable = false)
    public byte getIsfinished() {
        return isfinished;
    }

    public void setIsfinished(byte isfinished) {
        this.isfinished = isfinished;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ShoppingRecords that = (ShoppingRecords) o;

        if (idshoppingRecords != that.idshoppingRecords) return false;
        if (number != that.number) return false;
        if (isfinished != that.isfinished) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idshoppingRecords;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + number;
        result = 31 * result + (int) isfinished;
        return result;
    }
}
