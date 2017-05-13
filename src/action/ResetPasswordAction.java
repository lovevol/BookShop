package action;

import com.opensymphony.xwork2.ActionSupport;
import model.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import projectUtils.MD5Encode;

import java.util.List;

/**
 * Created by lh
 * on 2017/5/10.
 */
public class ResetPasswordAction extends ActionSupport {
    private String userID;
    private String password;
    public String search() throws Exception{
        if (userID==null)
            return SUCCESS;
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
        SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
        Session session1 = sessionFactory.openSession();
        Transaction transaction = session1.beginTransaction();
        Query query = session1.createQuery("from User where iduser = ?");
        query.setParameter(0,userID);
        List list = query.getResultList();
        transaction.commit();
        User user = (User) list.get(0);
        ServletActionContext.getRequest().setAttribute("ResultOfSearch", user);
        return SUCCESS;
    }
    public String resetPassword() throws Exception{
        password = MD5Encode.parseStrToMd5L32("123456");
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
        SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
        Session session1 = sessionFactory.openSession();
        Transaction transaction = session1.beginTransaction();
        Query query = session1.createQuery("update User set password = ? where iduser = ?");
        query.setParameter(0, password);
        query.setParameter(1, userID);
        query.executeUpdate();
        transaction.commit();
        return SUCCESS;
    }
    public String getUserID(){

        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
