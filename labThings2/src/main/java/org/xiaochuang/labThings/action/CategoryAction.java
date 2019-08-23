package org.xiaochuang.labThings.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.xiaochuang.labThings.entity.Category;
import org.xiaochuang.labThings.entity.Things;
import org.xiaochuang.labThings.service.CategoryService;

import java.util.List;

@Controller("CategoryAction")
public class CategoryAction extends ActionSupport {

    private String data;

    @Autowired
    @Qualifier("CategoryService")
    private CategoryService service;

    private List<Things> list;

    private Category category;

    /**
     * 前端传来物品类别data，返回它的子类
     */
    public String getSonCategory() {
        if (!data.isEmpty())
            service.sendResponse(ServletActionContext.getResponse(),
                    service.getJson(service.getCategoryById(data)));
        else service.sendResponse(ServletActionContext.getResponse(),
                service.getJson(null));
        return NONE;
    }

    public String getCategoryById() {
        category = service.getCategoryById(data);
        if (category != null)
            return SUCCESS;
        else return ERROR;
    }

    /**
     * 获取该类下的物品
     */
    public String getThings() {
        Category category = service.getCategoryById(data);
        if (category != null) {
            list = category.getThings();
            return SUCCESS;
        } else return ERROR;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public List<Things> getList() {
        return list;
    }

    public void setList(List<Things> list) {
        this.list = list;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
