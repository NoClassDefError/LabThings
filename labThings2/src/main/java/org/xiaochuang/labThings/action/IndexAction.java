package org.xiaochuang.labThings.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.xiaochuang.labThings.service.CategoryService;

@Controller("IndexAction")
public class IndexAction extends ActionSupport {
    @Autowired
    @Qualifier("CategoryService")
    private CategoryService service;

    public String execute() {
        ActionContext.getContext().getSession().put("list",service.getCategories());
//        if (service.save(things)) service.sendResponse(ServletActionContext.getResponse(), "success");
//        else service.sendResponse(ServletActionContext.getResponse(), "error");
        return SUCCESS;
    }

}
