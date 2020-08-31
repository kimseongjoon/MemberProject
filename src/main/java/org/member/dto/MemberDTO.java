package org.member.dto;

import lombok.Data;

@Data
public class MemberDTO {
    private String name;
    private String userid;
    private String pwd;
    private String phone;
    private String email;
    private int admin;
}
