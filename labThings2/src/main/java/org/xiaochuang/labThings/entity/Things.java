package org.xiaochuang.labThings.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity
public class Things {
    private long thingId;
    private Long category;
    private String description;
    private String imageUrl;
    private String name;
    private Timestamp date;

    @Id
    @Column(name = "thingId", nullable = false)
    public long getThingId() {
        return thingId;
    }

    public void setThingId(long thingId) {
        this.thingId = thingId;
    }

    @Basic
    @Column(name = "category", nullable = true)
    public Long getCategory() {
        return category;
    }

    public void setCategory(Long category) {
        this.category = category;
    }

    @Basic
    @Column(name = "description", nullable = true, length = 300)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "imageUrl", nullable = true, length = 100)
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 100)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "date", nullable = true)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Things things = (Things) o;

        if (thingId != things.thingId) return false;
        if (category != null ? !category.equals(things.category) : things.category != null) return false;
        if (description != null ? !description.equals(things.description) : things.description != null) return false;
        if (imageUrl != null ? !imageUrl.equals(things.imageUrl) : things.imageUrl != null) return false;
        if (name != null ? !name.equals(things.name) : things.name != null) return false;
        if (date != null ? !date.equals(things.date) : things.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (thingId ^ (thingId >>> 32));
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (imageUrl != null ? imageUrl.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
