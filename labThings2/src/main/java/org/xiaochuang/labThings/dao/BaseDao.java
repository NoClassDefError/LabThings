package org.xiaochuang.labThings.dao;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.xiaochuang.labThings.entity.Category;

import java.util.List;

@Repository("BaseDao")
public class BaseDao<T> extends HibernateDaoSupport {

    @Autowired
    @Qualifier("sessionFactory")
    public void init(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    public void save(T t) {
        this.getHibernateTemplate().save(t);
    }

    public void update(T t) {
        this.getHibernateTemplate().update(t);
    }

    public T findById(String id, Class<T> tClass) {
        return this.getHibernateTemplate().get(tClass, Long.parseLong(id));
    }

    public void delete(T t) {
        this.getHibernateTemplate().delete(t);
    }

    public List getSons(Category category) {
        Session session = this.getSession();
        Criteria criteria = session.createCriteria(Category.class);
        List list;
        if (category == null) {
            Query query = session.createQuery("from Category where parentCategory is null");
            //criteria.add(Restrictions.isEmpty("parentCategory"));
            list = query.list();
        } else {
            criteria.add(Restrictions.eq("parentCategory", category.getId()));
            list = criteria.list();
        }
        return list;
    }
}
