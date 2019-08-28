package org.xiaochuang.labThings.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.xiaochuang.labThings.dao.BaseDao;
import org.xiaochuang.labThings.entity.Category;
import org.xiaochuang.labThings.entity.Things;

@Service("ThingsService")
public class ThingsService extends BaseService {

    @Autowired
    @Qualifier("BaseDao")
    protected BaseDao<Things> dao;//泛型限定式依赖注入

    /**
     * 先查询，有则更改，无则保存
     */
    public boolean save(Things things) {
        if (dao.findById(things.getThingId(), Things.class) == null) {
            return dao.save(things);
        } else return dao.update(things);
    }

    public Things getThingsById(String id) {
        try {
            return dao.findById(Long.parseLong(id), Things.class);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean saveOrUpdate(Things t) {
        Things things = dao.findById(t.getThingId(), Things.class);
        if (things == null) {
            return dao.save(t);
        } else {
            t.setImages(things.getImages());
            t.setLogs(things.getLogs());
            return dao.update(t);
        }
    }
}
