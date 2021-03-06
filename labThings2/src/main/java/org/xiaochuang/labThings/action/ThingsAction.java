package org.xiaochuang.labThings.action;

import com.opensymphony.xwork2.ActionContext;
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
    @Autowired
    @Qualifier("CategoryService")
    private CategoryService categoryService;

    private Things things;//struts2模型驱动

    private String catId;

    private int mode = 0;//true为添加模式

    /**
     * 包含了更改功能
     */
    public String addThings() {
        mode = 1;
        //ActionContext.getContext().getSession().put("categoryService", categoryService);
//        if (service.save(things)) service.sendResponse(ServletActionContext.getResponse(), "success");
//        else service.sendResponse(ServletActionContext.getResponse(), "error");
        return SUCCESS;
    }

    public String getThingsById() {
        things = service.getThingsById(things.getThingId() + "");
        if (things != null) return SUCCESS;
        else return ERROR;
    }

    public String update() {
        //System.out.println(things.getCategoryEnt().getId());
        //通过catId查找category
        Category category = categoryService.getCategoryById(catId);
        if (category != null) {
            things.setCategoryEnt(category);
            if (service.saveOrUpdate(things)) return SUCCESS;
            else return ERROR;
        } else return ERROR;
    }

    public Things getThings() {
        return things;
    }

    public void setThings(Things things) {
        this.things = things;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public int getMode() {
        return mode;
    }

    public void setMode(int mode) {
        this.mode = mode;
    }
}
