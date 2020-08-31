package org.member.dao;

import org.member.dto.MemberDTO;

import java.util.ArrayList;

public interface MemberDAO {
    // 추가
    void memInsert(MemberDTO member);

    // 전체보기
    ArrayList<MemberDTO> memList();

    // 수정
    int memUpdate(MemberDTO member);

    // 상세보기
    MemberDTO findById(String userid);

    // 삭제
    void memDelete(String userid);

    // 아이디 중복체크
    String idCheck(String userid);

    int loginCheck(String userid, String pwd);

    int getCount();
}
