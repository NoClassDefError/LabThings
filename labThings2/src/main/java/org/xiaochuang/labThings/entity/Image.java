package org.xiaochuang.labThings.entity;

import javax.persistence.*;

@Entity
@Table(name = "image")
public class Image {
    private String url;
    private Long imageId;

    private Things things;
    private Log log;
    private Category category;

    @Basic
    @Column(name = "url", length = 100)
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Id
    @Basic
    @Column(name = "imageId")
    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name= "thingId")
    public Things getThings() {
        return things;
    }

    public void setThings(Things things) {
        this.things = things;
    }

    @ManyToOne
    @JoinColumn(name = "logId")
    public Log getLog() {
        return log;
    }

    public void setLog(Log log) {
        this.log = log;
    }

    @ManyToOne
    @JoinColumn(name = "categoryId")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
