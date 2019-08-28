package org.xiaochuang.labThings.action;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.xiaochuang.labThings.dao.BaseDao;
import org.xiaochuang.labThings.entity.Log;
import org.xiaochuang.labThings.entity.Things;

@Controller("LogAction")
public class LogAction extends ActionSupport {

    @Autowired
    @Qualifier("BaseDao")
    BaseDao<Log> dao;

    @Autowired
    @Qualifier("BaseDao")
    BaseDao<Things> thingsBaseDao;

    private Log log;
    private long thingId;

    public String addLog(){
        Things t = thingsBaseDao.findById(thingId,Things.class);
        if(t!=null)
        log.setThings(t);
        dao.save(log);
        return SUCCESS;
    }

    public String deleteLog(){

        dao.delete(log);
        return SUCCESS;
    }

    public Log getLog() {
        return log;
    }

    public void setLog(Log log) {
        this.log = log;
    }

    public long getThingId() {
        return thingId;
    }

    public void setThingId(long thingId) {
        this.thingId = thingId;
    }
}
