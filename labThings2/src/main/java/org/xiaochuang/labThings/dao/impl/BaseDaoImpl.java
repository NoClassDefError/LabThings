package org.xiaochuang.labThings.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.xiaochuang.labThings.dao.BaseDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Hibernate通用持久层接口实现类
 */
@Transactional(rollbackFor = Exception.class)
@Repository("baseDao")
public class BaseDaoImpl<T> implements BaseDao<T> {
    // 存储泛型的实际参数
    private Class<T> clazz;
    private Session session;
    private Transaction transaction;

    public BaseDaoImpl(){}

    /**
     * 非spring框架注入的用法
     * @param clazz 泛型T的类
     */
    @Deprecated
    public BaseDaoImpl(Class<T> clazz) {
        //获取泛型类型
        //clazz = (Class<T>)((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
//        clazz = GenericsUtils.getSuperClassGenricType(getClass());
        //B<T> b= new B<>();
        //clazz = b.getTclass();
        this.clazz = clazz;
        System.out.println(clazz);
        Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
        configuration.addAnnotatedClass(clazz);
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        session = sessionFactory.openSession();
        transaction = session.beginTransaction();
    }

    @Override
    public Serializable save(T entity) {
        Serializable s = session.save(entity);
        transaction.commit();
        return s;
    }

    @Override
    public void update(T entity) {
        session.update(entity);
        transaction.commit();
    }

    @Override
    public void delete(T entity) {
        session.delete(entity);
        transaction.commit();
    }

    @Override
    public T findById(Serializable oid) {
        T result = (T) session.get(clazz, oid);
        //T result2 = (T) session.createSQLQuery("SELECT  * FROM  huanshijie.UserInfo Where UserID = '" + oid + "'").addEntity(clazz).uniqueResult();
        //System.out.println("result2:" + result2);
        //transaction.commit();
        System.out.println("result:" + result);
        return result;
    }

    @Override
    public Integer findRecordNumByPage(DetachedCriteria detachedCriteria) {
        return null;
    }

    @Override
    public List<T> findByPage(DetachedCriteria detachedCriteria, Integer startIndex, Integer pageSize) {
        return null;
    }

    @Override
    public List<T> findByCriteria(DetachedCriteria detachedCriteria) {
        Criteria criteria = detachedCriteria.getExecutableCriteria(session);
        return criteria.list();
    }

    @Override
    public void executeUpdate(String queryName, Object... objects) {
        for (Object o : objects.clone())
            session.update(o);
        transaction.commit();
    }
}
