package org.board.dto;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "COMMENTBOARD")
public class CommentDTO {
    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator="COMMENT_SEQ_GEN")
    @SequenceGenerator(name = "COMMENT_SEQ_GEN", sequenceName = "COMMENTBOARD_SEQ", allocationSize = 1)
    private long cNum;
    private String userId;
    private String msg;

    @ManyToOne
    @JoinColumn(name = "BNUM")
    private String bNum;

    @CreationTimestamp
    @Column(name = "REGDATE", nullable = false, updatable = false)
    private LocalDateTime regdate;

    @UpdateTimestamp
    @Column(name = "UPDATEDATE", nullable = false)
    private LocalDateTime updateDate;
}
