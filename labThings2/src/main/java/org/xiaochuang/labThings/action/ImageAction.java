package org.xiaochuang.labThings.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.xiaochuang.labThings.dao.BaseDao;
import org.xiaochuang.labThings.entity.Category;
import org.xiaochuang.labThings.entity.Image;
import org.xiaochuang.labThings.entity.Log;
import org.xiaochuang.labThings.entity.Things;


import java.io.*;

@Controller("ImageAction")
public class ImageAction extends ActionSupport {

    @Autowired
    @Qualifier("BaseDao")
    private BaseDao<Image> imageBaseDao;
    @Autowired
    @Qualifier("BaseDao")
    private BaseDao<Things> thingsBaseDao;
    @Autowired
    @Qualifier("BaseDao")
    private BaseDao<Log> logBaseDao;
    @Autowired
    @Qualifier("BaseDao")
    private BaseDao<Category> categoryBaseDao;

    private File imgFile;
    private String imgFileFileName;
    private String imgFileContentType;

    private Image image;
    private int mode;//0为thing,2为log,1为category
    private String id;

    /**
     * org.apache.commons.fileupload.FileUploadBase$SizeLimitExceededException:
     * the request was rejected because its size (2322800) exceeds the configured
     * maximum (2097152)
     */
    public String addImage() {
        image = new Image();
        switch (mode) {
            case 0:
                image.setThings(thingsBaseDao.findById(Long.parseLong(id), Things.class));
                break;
            case 1:
                image.setCategory(categoryBaseDao.findById(Long.parseLong(id), Category.class));
                break;
            case 2:
                image.setLog(logBaseDao.findById(Long.parseLong(id), Log.class));
        }
        String name = "img" + (imageBaseDao.getMaxid() + 1);
        image.setImageId(imageBaseDao.getMaxid() + 1);
        //action只能访问到后者，找不到前者的路径
        //C:\Users\DELL\Desktop\code\labThings\labThings2\src\main\webapp\img\storage
//        ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/")
        //C:\Users\DELL\Desktop\code\labThings\out\artifacts\labThings2_Web_exploded\img\storage\
        String path = "C:\\root\\" + "img";
        System.out.println("save:" + path + " name:" + name);
        image.setUrl("/img/" + name);
        imageBaseDao.save(image);
        try {
            File file = new File(path, name);
            file.createNewFile();
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            IOUtils.copy(new FileInputStream(imgFile), fileOutputStream);
        } catch (IOException e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String deleteImage() {
        Image img = imageBaseDao.findById(image.getImageId(), Image.class);
        if (img == null) return ERROR;
        imageBaseDao.delete(img);
        File file = new File("C:\\root" + img.getUrl());
        System.out.println("delete:"+file.getAbsolutePath());
        if (file.exists()) {
            if (file.delete())
                return SUCCESS;
        }
        return ERROR;
    }

    public File getImgFile() {
        return imgFile;
    }

    public void setImgFile(File imgFile) {
        this.imgFile = imgFile;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public String getImgFileFileName() {
        return imgFileFileName;
    }

    public void setImgFileFileName(String imgFileFileName) {
        this.imgFileFileName = imgFileFileName;
    }

    public String getImgFileContentType() {
        return imgFileContentType;
    }

    public void setImgFileContentType(String imgFileContentType) {
        this.imgFileContentType = imgFileContentType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getMode() {
        return mode;
    }

    public void setMode(int mode) {
        this.mode = mode;
    }
}
