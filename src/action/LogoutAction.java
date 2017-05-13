package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;

/**
 * Created by lh
 * on 2017/5/7.
 */
public class LogoutAction extends ActionSupport {
    @Override
    public String execute() throws Exception {
        Map httpSession = ActionContext.getContext().getSession();
        httpSession.clear();
        return SUCCESS;
    }
}
