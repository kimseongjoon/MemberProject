package org.board.dao;

import org.board.dto.BoardDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {
    private static BoardDAO instance = new BoardDAO();

    public static BoardDAO getInstance() {
        return instance;
    }

    private BoardDAO() {
    }

    private Connection getConnection() throws NamingException, SQLException {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/member");
        return ds.getConnection();
    }

    public void boardInsert(BoardDTO board) {
        Connection con = null; // 디비 연결하는 객체
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "";

        int num = board.getNum();
        int ref = board.getRef();
        int re_step = board.getRe_step();
        int re_revel = board.getRe_level();
        int number = 0;

        try {
            con = getConnection();

            ps = con.prepareStatement("SELECT MAX(NUM) FROM BOARD");
            rs = ps.executeQuery();

            if (rs.next()) { // 테이블에 데이터가 있음. ref를 num의 최대값으로 설정
                number = rs.getInt(1) + 1;
            } else {
                number = 1;
            }

            if (num != 0) { // 답글
                sql = "UPDATE BOARD SET RE_STEP = RE_STEP + 1 WHERE REF = ? AND RE_STEP > ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, ref);
                ps.setInt(2, re_step);
                ps.executeUpdate();

                re_step = re_step + 1; // 부모 re_step에서 +1
                re_revel = re_revel + 1; // 부모 re_level에서 +1
            } else {
                ref = number;
                re_step = 0;
                re_revel = 0;
            }

            sql = "INSERT INTO BOARD(NUM, WRITER, SUBJECT, EMAIL, CONTENT, IP, REF, RE_STEP, RE_LEVEL, PASSWD) VALUES(BOARD_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ? ,?)";
            ps = con.prepareStatement(sql); // 쿼리 실행하는 객체(문자열을 처리할때 statment객체 보다 조금더 편리)
            ps.setString(1, board.getWriter());
            ps.setString(2, board.getSubject());
            ps.setString(3, board.getEmail());
            ps.setString(4, board.getContent());
            ps.setString(5, board.getIp());
            ps.setInt(6, ref);
            ps.setInt(7, re_step);
            ps.setInt(8, re_revel);
            ps.setString(9, board.getPasswd());
//            ps.setString(12, board.getReg_date());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, ps, null, null);
        }
    }

    public int boardUpdate(BoardDTO boardDTO) {
        Connection con = null; // 디비 연결하는 객체
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        int flag = 0;

        try {
            con = getConnection();

            String sql = "UPDATE BOARD SET SUBJECT=?, EMAIL=?, CONTENT=?, REG_DATE=sysdate, IP=? WHERE NUM=? AND PASSWD=?";

            System.out.println("boardUpdate -> " + sql);
            System.out.println("SUBJECT -> " + boardDTO.getSubject());
            System.out.println("EMAIL -> " + boardDTO.getEmail());
            System.out.println("CONTENT -> " + boardDTO.getContent());
            System.out.println("IP -> " + boardDTO.getIp());
            System.out.println("NUM -> " + boardDTO.getNum());
            System.out.println("PASSWD -> " + boardDTO.getPasswd());

            ps = con.prepareStatement(sql);
            ps.setString(1, boardDTO.getSubject());
            ps.setString(2, boardDTO.getEmail());
            ps.setString(3, boardDTO.getContent());
            ps.setString(4, boardDTO.getIp());
            ps.setInt(5, boardDTO.getNum());
            ps.setString(6, boardDTO.getPasswd());

            flag = ps.executeUpdate();


//            String sql = "select PASSWD from BOARD where NUM=" + boardDTO.getNum();
//            st = con.createStatement();
//            rs = st.executeQuery(sql);
/*
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();


            if (rs.next()) {
                if (rs.getString(1).equals(boardDTO.getPasswd())) {
                    sql = "UPDATE BOARD SET SUBJECT=?, EMAIL=?, CONTENT=?, REG_DATE=sysdate, IP=? WHERE NUM=?";

                    System.out.println("boardUpdate -> " + sql);
                    System.out.println("SUBJECT -> " + boardDTO.getSubject());
                    System.out.println("EMAIL -> " + boardDTO.getEmail());
                    System.out.println("CONTENT -> " + boardDTO.getContent());
                    System.out.println("IP -> " + boardDTO.getIp());
                    System.out.println("NUM -> " + boardDTO.getNum());

                    ps = con.prepareStatement(sql);
                    ps.setString(1, boardDTO.getSubject());
                    ps.setString(2, boardDTO.getEmail());
                    ps.setString(3, boardDTO.getContent());
                    ps.setString(4, boardDTO.getIp());
                    ps.setInt(5, boardDTO.getNum());

                    flag = ps.executeUpdate();
                }
            }
*/
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, ps, st, rs);
        }

        return flag;
    }

    public ArrayList<BoardDTO> boardList(int startRow, int endRow) {
        return boardList("", "", startRow, endRow);
    }

    public ArrayList<BoardDTO> boardList(String field, String word, int startRow, int endRow) {
        Connection con = null;
        PreparedStatement ps = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<BoardDTO> arr = new ArrayList<>();
        String sql = "";
        StringBuilder sb = new StringBuilder();

        try {
            con = getConnection();

            if (word.equals("")) {
                sb.append("select * from (");
                sb.append(" select rownum rn, aa.* from (");
                sb.append(" select * from board order by ref desc, re_step asc) aa");
                sb.append(" where rownum <= ?");
                sb.append(" ) where rn>=?");
            }
            else {
                sb.append("select * from (");
                sb.append(" select rownum rn, aa.* from (");
                sb.append(" select * from board where " + field + " like '%" + word + "%'");
                sb.append(" order by ref desc, re_step asc) aa");
                sb.append(" where rownum <= ?");
                sb.append(" ) where rn>=?");
            }

            ps = con.prepareStatement(sb.toString());

            ps.setInt(1, endRow);
            ps.setInt(2, startRow);

            rs = ps.executeQuery();

            while (rs.next()) {
                BoardDTO bd = new BoardDTO();

                bd.setNum(rs.getInt("NUM"));
                bd.setWriter(rs.getString("WRITER"));
                bd.setSubject(rs.getString("SUBJECT"));
                bd.setEmail(rs.getString("EMAIL"));
                bd.setContent(rs.getString("CONTENT"));
                bd.setIp(rs.getString("IP"));
                bd.setReadcount(rs.getInt("READCOUNT"));
                bd.setRef(rs.getInt("REF"));
                bd.setRe_step(rs.getInt("RE_STEP"));
                bd.setRe_level(rs.getInt("RE_LEVEL"));
                bd.setPasswd(rs.getString("PASSWD"));
                bd.setReg_date(rs.getString("REG_DATE"));

                arr.add(bd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return arr;
    }

    public int boardDelete(int num) {
        Connection con = null;
        Statement st = null;
        int flag = 0;

        try {
            con = getConnection();

            String sql = "DELETE FROM BOARD WHERE NUM=" + num;
            System.out.println("boardDelete -> " + sql);

            st = con.createStatement();
            flag = st.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, null);
        }
        return flag;
    }

    public int boardCount() {
        return boardCount("", "");
    }

    public int boardCount(String field, String word) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "";
        int count = 0;

        try {
            con = getConnection();

            if (word.equals("")) {
                sql = "SELECT count(*) FROM BOARD";
            } else {
                sql = "SELECT count(*) FROM BOARD WHERE " + field + " LIKE '%" + word + "%'";
            }

            System.out.println("boardCount -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return count;
    }

    public BoardDTO boardView(int num) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        BoardDTO bd = null;
        String sql = "";

        try {
            con = getConnection();


            st = con.createStatement();
            sql = "UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM=" + num;
            st.executeUpdate(sql);
            sql = "SELECT * FROM BOARD WHERE NUM=" + num;
//            System.out.println("boardView -> " + sql);
            rs = st.executeQuery(sql);

            if (rs.next()) {
                bd = new BoardDTO();

                bd.setNum(rs.getInt("NUM"));
                bd.setWriter(rs.getString("WRITER"));
                bd.setSubject(rs.getString("SUBJECT"));
                bd.setEmail(rs.getString("EMAIL"));
                bd.setContent(rs.getString("CONTENT"));
                bd.setIp(rs.getString("IP"));
                bd.setReadcount(rs.getInt("READCOUNT"));
                bd.setRef(rs.getInt("REF"));
                bd.setRe_step(rs.getInt("RE_STEP"));
                bd.setRe_level(rs.getInt("RE_LEVEL"));
                bd.setPasswd(rs.getString("PASSWD"));
                bd.setReg_date(rs.getString("REG_DATE"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return bd;
    }

    private void closeConnection(Connection con, Statement ps, Statement st, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
