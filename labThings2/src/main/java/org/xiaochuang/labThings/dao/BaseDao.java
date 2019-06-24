package org.xiaochuang.labThings.dao;

import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Hibernate通用的持久层接口
 */
public interface BaseDao<T> {
    /**
     * 保存
     *
     * @return oid
     */
    public Serializable save(T entity);

    /**
     * 更新
     */
    public void update(T entity);

    /**
     * 删除
     */
    public void delete(T entity);

    /**
     * 通过对象标识符获取对象
     *
     * @return 标识符对应的对象，没找大则返回null
     */
    public T findById(Serializable oid);

    /**
     * 查找满足条件的总记录数
     */
    Integer findRecordNumByPage(DetachedCriteria detachedCriteria);

    /**
     * 向分页对象中设置记录
     *
     * @param detachedCriteria 离线查询对象
     * @param startIndex       开始索引
     * @param pageSize         每页记录数
     */
    List<T> findByPage(DetachedCriteria detachedCriteria, Integer startIndex, Integer pageSize);

    /**
     * 通过条件查询
     */
    List<T> findByCriteria(DetachedCriteria detachedCriteria);

    /**
     * 通用更新方法
     *
     * @param queryName 命名查询的名字，在映射文件中定义
     * @param objects   参数列表
     */
    public void executeUpdate(String queryName, Object... objects);
}
