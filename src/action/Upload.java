package action;

import com.opensymphony.xwork2.ActionSupport;
import model.Book;
import model.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.io.*;

/**
 * Created by lh
 * on 2017/4/14.
 */
public class Upload extends ActionSupport {
    private Book book;
    private File file[];
    private String fileName[];
    @Override
    public String execute() throws Exception {
        book.setIschecked((byte) 0);
        book.setIsfinished((byte) 0);
        User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
        book.setUser(user);
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session1 = sessionFactory.openSession();
        Transaction transaction = session1.beginTransaction();
        session1.save(book);
        transaction.commit();
        session1.close();
        sessionFactory.close();
        String targetDirectory ="D:\\IdeaProjects\\BookShop\\web\\image\\";
        for(int i = 0; i < file.length; i++){
            InputStream is = new FileInputStream(file[i]);
            OutputStream os = new FileOutputStream(targetDirectory+book.getUser().getIduser()+book.getIsbn()+i+".jpg");
            byte[] buffer = new byte[1024];
            int count = 0;
            while ((count=is.read(buffer))>0){
                os.write(buffer,0,count);
            }
            os.close();
            is.close();
        }
        return "success";
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public File[] getFile() {
        return file;
    }

    public void setFile(File[] file) {
        this.file = file;
    }

    public String[] getFileName() {
        return fileName;
    }

    public void setFileName(String[] fileName) {
        this.fileName = fileName;
    }
}
