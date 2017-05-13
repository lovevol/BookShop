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
public class LoginAction extends ActionSupport {

    String userID;
    String password;

    public String getUserID() {
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

    @Override
    public String execute() throws Exception {
        if(userID.equals("88888888")&&password.equals("88888888"))
            return "administrator";
        Map httpSession = ActionContext.getContext().getSession();
        Map httpRequest = (Map) ActionContext.getContext().get("request");
        if(userID == null || password == null || userID.equals("") || password.equals("")) {
            httpRequest.put("errorMsgLogin", "账号或密码输入错误!");
            return ERROR;
        }

        Session session = HibernateUtils.getSession();
        Transaction tx = session.beginTransaction();
        password = MD5Encode.parseStrToMd5L32(password);
        System.out.println(userID+password);
        List list = session.createQuery("from User where iduser=:userid")
                .setParameter("userid", userID).list();
        tx.commit();
        // 查询结果为空
        if(list.size() == 0) {
            httpRequest.put("errorMsgLogin", "用户不存在!");
            return ERROR;
        }
        // 密码错误
        User user = (User) list.get(0);
        if(!password.equals(user.getPassword())) {
            httpRequest.put("errorMsgLogin", "密码错误!");
            return ERROR;
        }
        httpSession.put("user", user);
        HibernateUtils.destorySession();
        System.out.println("success");
        if(userID.equals("88888888")&&password.equals("88888888"))
            return "administrator";
        return SUCCESS;
    }

}
