package com.valent.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Approval {
    private int approvalId;
    private int userId;
    private int postId;
    private int isChecked;
}
