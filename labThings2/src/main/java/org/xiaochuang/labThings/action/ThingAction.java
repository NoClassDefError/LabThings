package org.xiaochuang.labThings.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.xiaochuang.labThings.service.CategoryService;

@Controller("ThingAction")
public class ThingAction extends ActionSupport {

    private String data;

    @Autowired
    @Qualifier("CategoryService")
    private CategoryService service;

    /**
     * 前端传来物品类别data，返回它的子类
     */
    public String getSonCategory() {
        if (data != null)
            service.sendResponse(ServletActionContext.getResponse(),
                    service.getJson(service.getCategoryById(data)));
        else service.sendResponse(ServletActionContext.getResponse(),
                service.getJson(null));
        return NONE;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

}
