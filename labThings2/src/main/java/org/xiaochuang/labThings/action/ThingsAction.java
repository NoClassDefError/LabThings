package org.xiaochuang.labThings.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.xiaochuang.labThings.entity.Category;
import org.xiaochuang.labThings.entity.Things;
import org.xiaochuang.labThings.service.CategoryService;
import org.xiaochuang.labThings.service.ThingsService;

@Controller("ThingsAction")
public class ThingsAction extends ActionSupport {
    @Autowired
    @Qualifier("ThingsService")
    private ThingsService service;

    private Things things;//struts2模型驱动

    /**
     * 包含了更改功能
     */
    public String addThings() {
        if (service.save(things)) service.sendResponse(ServletActionContext.getResponse(), "success");
        else service.sendResponse(ServletActionContext.getResponse(), "error");
        return NONE;
    }

    public String getThingsById() {
        things = service.getThingsById(things.getThingId() + "");
        if (things != null) return SUCCESS;
        else return ERROR;
    }

    public Things getThings() {
        return things;
    }

    public void setThings(Things things) {
        this.things = things;
    }
}
