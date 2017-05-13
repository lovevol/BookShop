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

/**
 * Created by lh
 * on 2017/5/10.
 */
public class RevisePasswordAction extends ActionSupport{
    private String oldPassword;
    private String newPassword1;
    private String newPassword2;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword1() {
        return newPassword1;
    }

    public void setNewPassword1(String newPassword1) {
        this.newPassword1 = newPassword1;
    }

    public String getNewPassword2() {
        return newPassword2;
    }

    public void setNewPassword2(String newPassword2) {
        this.newPassword2 = newPassword2;
    }

    User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");

    @Override
    public void validate() {
        if (oldPassword==null||(!MD5Encode.parseStrToMd5L32(oldPassword).equals(user.getPassword())))
            addFieldError("oldPassword","旧密码有误！");
        else if (newPassword1==null||newPassword2==null||newPassword1.equals("")||newPassword2.equals(""))
            addFieldError("newPassword","新密码格式有误");
        else if(!newPassword1.equals(newPassword2))
            addFieldError("newPassword","两次密码输入不一致");
    }
    @Override
    public String execute() throws Exception {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
        SessionFactory sessionFactory = (SessionFactory) ctx.getBean("sessionFactory");
        Session hbtSession = sessionFactory.openSession();
        Transaction transaction = hbtSession.beginTransaction();
        Query query = hbtSession.createQuery("update User set password = ? where iduser= ?");
        query.setParameter(0, MD5Encode.parseStrToMd5L32(newPassword1));
        query.setParameter(1,user.getIduser());
        query.executeUpdate();
        transaction.commit();
        return SUCCESS;
    }
}
