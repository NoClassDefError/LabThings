package org.xiaochuang.labThings.action;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.logging.Logger;


public class MyInterceptor extends AbstractInterceptor {
    private static Logger logger = Logger.getLogger(MyInterceptor.class.getName());

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        invocation.addPreResultListener((ActionInvocation invocation1, String resultCode) -> {
            logger.info(invocation1.getInvocationContext().getName() + ".action 返回了" + resultCode);
        });
        logger.info(invocation.getInvocationContext().getName() + ".action 被执行了！");
        return invocation.invoke();
    }
}
