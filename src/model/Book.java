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
public class Book {
    private int idbooks;
    private String isbn;
    private double bookprice;
    private String description;
    private String bookname;
    private byte isfinished;

    @Id
    @Column(name = "idbooks", nullable = false)
    public int getIdbooks() {
        return idbooks;
    }

    public void setIdbooks(int idbooks) {
        this.idbooks = idbooks;
    }

    @Basic
    @Column(name = "isbn", nullable = false, length = 45)
    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    @Basic
    @Column(name = "bookprice", nullable = false, precision = 0)
    public double getBookprice() {
        return bookprice;
    }

    public void setBookprice(double bookprice) {
        this.bookprice = bookprice;
    }

    @Basic
    @Column(name = "description", nullable = true, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "bookname", nullable = false, length = 40)
    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
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

        Book book = (Book) o;

        if (idbooks != book.idbooks) return false;
        if (Double.compare(book.bookprice, bookprice) != 0) return false;
        if (isfinished != book.isfinished) return false;
        if (isbn != null ? !isbn.equals(book.isbn) : book.isbn != null) return false;
        if (description != null ? !description.equals(book.description) : book.description != null) return false;
        if (bookname != null ? !bookname.equals(book.bookname) : book.bookname != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = idbooks;
        result = 31 * result + (isbn != null ? isbn.hashCode() : 0);
        temp = Double.doubleToLongBits(bookprice);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (bookname != null ? bookname.hashCode() : 0);
        result = 31 * result + (int) isfinished;
        return result;
    }
}
