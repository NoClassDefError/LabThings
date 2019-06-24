package org.xiaochuang.labThings.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Image {
    private Long thingId;
    private Long logId;
    private Long categoryId;
    private String url;
    private Long imageId;
    @Basic
    @Column(name = "thingId")
    public Long getThingId() {
        return thingId;
    }

    public void setThingId(Long thingId) {
        this.thingId = thingId;
    }

    @Basic
    @Column(name = "logId")
    public Long getLogId() {
        return logId;
    }

    public void setLogId(Long logId) {
        this.logId = logId;
    }

    @Basic
    @Column(name = "categoryId")
    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "url", length = 100)
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Image image = (Image) o;

        if (thingId != null ? !thingId.equals(image.thingId) : image.thingId != null) return false;
        if (logId != null ? !logId.equals(image.logId) : image.logId != null) return false;
        if (categoryId != null ? !categoryId.equals(image.categoryId) : image.categoryId != null) return false;
        return url != null ? url.equals(image.url) : image.url == null;

    }

    @Override
    public int hashCode() {
        int result = thingId != null ? thingId.hashCode() : 0;
        result = 31 * result + (logId != null ? logId.hashCode() : 0);
        result = 31 * result + (categoryId != null ? categoryId.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        return result;
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
}
