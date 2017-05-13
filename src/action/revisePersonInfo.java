package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import hibernate.HibernateUtils;
import model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Map;

/**
 * Created by Zxc-Hugo on 2017/5/8.
 */
public class revisePersonInfo extends ActionSupport {

    String username;
    String phone;
    String qq;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    @Override
    public String execute() throws Exception {
        Map httpSession = ActionContext.getContext().getSession();
        User user = (User) httpSession.get("user");

        if(user == null)
            return ERROR;

        Session session = HibernateUtils.getSession();
        Transaction tx = session.beginTransaction();

        user.setPhone(phone);
        user.setQq(qq);
        user.setUsername(username);
        session.update(user);

        tx.commit();
        httpSession.put("user", user);
        HibernateUtils.destorySession();
        return SUCCESS;
    }
}
