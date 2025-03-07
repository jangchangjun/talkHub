package org.jun.talkhub.model.vo;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
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


}


