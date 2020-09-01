package org.board.dto;

import lombok.Data;

@Data
public class BoardDTO {
    private int num;
    private String writer;
    private String subject;
    private String email;
    private String content;
    private String ip;
    private int readcount;
    private int ref;
    private int re_step;
    private int re_level;
    private String passwd;
    private String reg_date;
}
