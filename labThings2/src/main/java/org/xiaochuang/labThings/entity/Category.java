package org.xiaochuang.labThings.entity;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "category")
public class Category {
    private long id;
    private String name;
    private Long parentCategory;
    private String description;
    private Timestamp date;

    private List<Things> things;
    private List<Image> images;

    @Id
    @Column(name = "id", nullable = false)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "parentCategory", nullable = true)
    public Long getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(Long parentCategory) {
        this.parentCategory = parentCategory;
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

        Category category = (Category) o;

        if (id != category.id) return false;
        if (name != null ? !name.equals(category.name) : category.name != null) return false;
        if (parentCategory != null ? !parentCategory.equals(category.parentCategory) : category.parentCategory != null)
            return false;
        if (description != null ? !description.equals(category.description) : category.description != null)
            return false;
        if (date != null ? !date.equals(category.date) : category.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (parentCategory != null ? parentCategory.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }

    @OneToMany
    @JoinColumn(name = "category")
    @LazyCollection(LazyCollectionOption.FALSE)
    public List<Things> getThings() {
        return things;
    }

    public void setThings(List<Things> things) {
        this.things = things;
    }

    @OneToMany
    @JoinColumn(name = "categoryId")
    @LazyCollection(LazyCollectionOption.FALSE)
    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }
}
