package org.xiaochuang.labThings.dao;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.xiaochuang.labThings.entity.Category;

import java.util.List;

@Repository("BaseDao")
public class BaseDao<T> extends HibernateDaoSupport{

    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public void save(T t) {
        this.getHibernateTemplate().save(t);
    }

    public void update(T t) {
        this.getHibernateTemplate().update(t);
    }

    public T findById(String id, Class<T> tClass) {
        return this.getHibernateTemplate().get(tClass, id);
    }

    public void delete(T t) {
        this.getHibernateTemplate().delete(t);
    }

    public List getSons(Category category) {
        DetachedCriteria detachedCriteria = (DetachedCriteria) this.getSession().createCriteria(Category.class);
        if (category == null) detachedCriteria.add(Restrictions.eq("parentCategory", null));
        else detachedCriteria.add(Restrictions.eq("parentCategory", category.getId()));
        return this.getHibernateTemplate().findByCriteria(detachedCriteria);
    }
}
