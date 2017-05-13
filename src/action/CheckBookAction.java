package action;

import com.opensymphony.xwork2.ActionSupport;
import model.Book;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.util.List;

/**
 * Created by lh
 * on 2017/5/9.
 */
public class CheckBookAction extends ActionSupport {
    private int bookID;
    private Book book;
    public String pass() throws Exception {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
        SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
        Session session1 = sessionFactory.openSession();
        Transaction transaction = session1.beginTransaction();
        Query query = session1.createQuery("update Book set ischecked = 1 where idbooks = ?");
        query.setParameter(0, bookID);
        query.executeUpdate();
        transaction.commit();
        return SUCCESS;
    }
    public String fail() throws Exception {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
        SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
        Session session1 = sessionFactory.openSession();
        Transaction transaction = session1.beginTransaction();
        Query query = session1.createQuery("delete from Book where idbooks = ?");
        Query query1 = session1.createQuery("from Book where idbooks = ?");
        query1.setParameter(0,bookID);
        List list = query1.getResultList();
        query.setParameter(0, bookID);
        query.executeUpdate();
        transaction.commit();
        book = (Book) list.get(0);
        String targetDirectory = ServletActionContext.getServletContext().getRealPath("/image")+"/";
        for(int i = 0; i <=3; i++){
            File file = new File(targetDirectory+book.getUser().getIduser()+book.getIsbn()+i+".jpg");
            if (file.exists()&&file.isFile())
                file.delete();
        }
        return SUCCESS;
    }
    @Override
    public String execute() throws Exception {
        return super.execute();
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}
