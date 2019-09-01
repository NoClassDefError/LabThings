package org.xiaochuang.labThings.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.xiaochuang.labThings.dao.BaseDao;
import org.xiaochuang.labThings.entity.Category;

import java.util.List;
import java.util.Set;

@Service("CategoryService")
public class CategoryService extends BaseService {
    @Autowired
    @Qualifier("BaseDao")
    protected BaseDao<Category> dao;

    public Category getCategoryById(String id) {
        try {
            return dao.findById(Long.parseLong(id), Category.class);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Category> getCategories(){
//        System.out.println("finding Categories");
        return dao.findAll(Category.class);
    }
    /**
     * 只更新对象中非关联的属性
     */
    public boolean saveOrUpdate(Category c) {
        Category category = dao.findById(c.getId(), Category.class);
        if (category == null) {
            return dao.save(c);
        } else {
            //要先将c与category进行比对，将category的关联属性注入进c
            c.setImages(category.getImages());
            c.setThings(category.getThings());
            return dao.update(c);
        }
    }

    public boolean delete(Category c) {
        Category category = dao.findById(c.getId(), Category.class);
        if (category != null) {
            dao.delete(category);
            return true;
        } else return false;
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
            sb.deleteCharAt(sb.length() - 1);//删去最后一个逗号
            return sb + "]";
        } else return null;
    }
}
