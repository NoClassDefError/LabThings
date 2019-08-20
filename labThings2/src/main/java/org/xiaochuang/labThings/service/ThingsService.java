package org.xiaochuang.labThings.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.xiaochuang.labThings.dao.BaseDao;
import org.xiaochuang.labThings.entity.Things;

@Service("ThingsService")
public class ThingsService {

    @Autowired
    @Qualifier("BaseDao")
    protected BaseDao<Things> dao;//泛型限定式依赖注入


}
