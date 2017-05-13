package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

/**
 * Created by lh
 * on 2017/5/3.
 */
public class PageControl extends ActionSupport{
    @Override
    public String execute() throws Exception {
        String pageControl = (String) ServletActionContext.getRequest().getParameter("pageControl");
        ServletActionContext.getRequest().setAttribute("pageControl", pageControl);
        return SUCCESS;
    }
}
