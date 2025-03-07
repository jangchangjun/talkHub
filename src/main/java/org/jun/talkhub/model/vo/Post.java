package org.jun.talkhub.model.vo;

import java.util.Date;

public class Post {
    private int id;
    private String writerId;
    private String title;
    private String category;
    private String text;
    private int views;
    private int likes;
    private Date writerAt;
    private Date modifiedAt;

    public Post() {
    }

    public Post(int id, String writerId, String title, String category, String text, int views, int likes, Date writerAt, Date modifiedAt) {
        this.id = id;
        this.writerId = writerId;
        this.title = title;
        this.category = category;
        this.text = text;
        this.views = views;
        this.likes = likes;
        this.writerAt = writerAt;
        this.modifiedAt = modifiedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWriterID() {
        return writerId;
    }

    public void setWriterID(String writerID) {
        this.writerId = writerID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public Date getWriterAt() {
        return writerAt;
    }

    public void setWriterAt(Date writerAt) {
        this.writerAt = writerAt;
    }

    public Date getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(Date modifiedAt) {
        this.modifiedAt = modifiedAt;
    }
}


