package org.xiaochuang.labThings.service;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.xiaochuang.labThings.dao.BaseDao;
import org.xiaochuang.labThings.entity.Category;

import java.util.List;

@Service("CategoryService")
public class CategoryService extends BaseService {
    @Autowired
    @Qualifier("BaseDao")
    protected BaseDao<Category> dao;

    public Category getCategoryById(String id) {
        return dao.findById(id, Category.class);
    }

    /**
     * 设法查询数据库中一个分类的叶子结点，根节点传入null
     */
    public String getJson(Category category) {
        StringBuilder sb = new StringBuilder("[");
        List list = dao.getSons(category);
        if (!list.isEmpty()) {
            for (Object c : list) {
                Category cat = (Category) c;
                sb.append("{\"title\":\"")
                        .append(cat.getName())
                        .append("\",\"id\":\"")
                        .append(cat.getId())
                        .append("\",\"children\":[],\"spread\":\"true\"},");
            }
            sb.deleteCharAt(sb.length()-1);//删去最后一个逗号
            return sb + "]";
        } else return null;
    }
}
