package org.xiaochuang.labThings.service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class BaseService {
    public void sendResponse(HttpServletResponse response, String s) {
        try {
            response.setCharacterEncoding("utf-8");
            response.setHeader("content-type", "application/x-www-form-urlencoded;charset=utf-8");
            PrintWriter writer = response.getWriter();
            System.out.println("response: " + s);
            writer.write(s);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
