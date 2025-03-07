package org.jun.talkhub.model.vo;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostLike {
    private int id;
    private String userId;
    private int postId;
    private Date createdAt;
}
