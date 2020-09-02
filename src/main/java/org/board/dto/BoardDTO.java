package org.board.dto;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "BOARD")
public class BoardDTO {
    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="BOARD_SEQ_GEN")
    @SequenceGenerator(name="BOARD_SEQ_GEN", sequenceName="BOARD_SEQ", allocationSize = 1)
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
