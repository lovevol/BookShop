package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import hibernate.HibernateUtils;
import model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import projectUtils.MD5Encode;

import java.util.List;
import java.util.Map;

/**
 * Created by ZxcHugo on 2017/5/7.
 */
public class RegisterAction extends ActionSupport {

    String userID;          // 不为空
    String username;        // 不为空4-16
    String password;        // >6
    String passwordRepeat;
    String qq;          // 可以为空
    String phone;       // 可以为空

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordRepeat() {
        return passwordRepeat;
    }

    public void setPasswordRepeat(String passwordRepeat) {
        this.passwordRepeat = passwordRepeat;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String execute() throws Exception {
        Map httpRequest = (Map) ActionContext.getContext().get("request");
        Session session = HibernateUtils.getSession();
        Transaction tx = session.beginTransaction();
        List list = session.createQuery("from User where iduser=:userid")
                .setParameter("userid", userID).list();
        tx.commit();
        if(list.size() != 0) {
            httpRequest.put("errorMsgRegister", "该学号已被注册!");
            return ERROR;
        }

        password = MD5Encode.parseStrToMd5L32(password);
        tx = session.beginTransaction();
        User user = new User();
        user.setIduser(userID);
        user.setUsername(username);
        user.setPassword(password);
        user.setPhone(phone);
        user.setQq(qq);
        session.save(user);
        tx.commit();
        HibernateUtils.destorySession();
        return SUCCESS;
    }
}
