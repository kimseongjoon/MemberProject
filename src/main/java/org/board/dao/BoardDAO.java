package org.board.dao;

import org.board.dto.BoardDTO;
import org.dao.CommonDAO;
import org.member.dto.MemberDTO;

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

        try {
            con = getConnection();

//            String sql = "INSERT INTO BOARD VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            String sql = "INSERT INTO BOARD(NUM, WRITER, SUBJECT, EMAIL, CONTENT, IP, PASSWD) VALUES(BOARD_SEQ.nextval, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql); // 쿼리 실행하는 객체(문자열을 처리할때 statment객체 보다 조금더 편리)
            ps.setString(1, board.getWriter());
            ps.setString(2, board.getSubject());
            ps.setString(3, board.getEmail());
            ps.setString(4, board.getContent());
            ps.setString(5, board.getIp());
            ps.setString(6, board.getPasswd());
            /*ps.setInt(1, board.getNum());
            ps.setString(2, board.getWriter());
            ps.setString(3, board.getSubject());
            ps.setString(4, board.getEmail());
            ps.setString(5, board.getContent());
            ps.setString(6, board.getIp());
            ps.setInt(7, board.getReadcount());
            ps.setInt(8, board.getRef());
            ps.setInt(9, board.getRe_step());
            ps.setInt(10, board.getRe_level());
            ps.setString(11, board.getPasswd());
            ps.setString(12, board.getReg_date());*/

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, ps, null, null);
        }
    }

    public int boardUpdate(BoardDTO boardDTO) {
        return 0;
    }

    public ArrayList<BoardDTO> boardList() {
        return boardList("", "");
    }

    public ArrayList<BoardDTO> boardList(String field, String word) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<BoardDTO> arr = new ArrayList<>();
        String sql = "";

        try {
            con = getConnection();

            if (word.equals("")) {
                sql = "SELECT * FROM BOARD";
            } else {
                sql = "SELECT * FROM BOARD WHERE " + field + " LIKE '%" + word + "%'";
            }
            System.out.println("boardList -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

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
        return 0;
    }

    public int boardCount() {
        return 0;
    }

    public BoardDTO boardView(int num) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        BoardDTO bd = null;

        try {
            con = getConnection();

            String sql = "SELECT * FROM BOARD WHERE NUM = '" + num + "'";
            System.out.println("boardView -> " + sql);

            st = con.createStatement();
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
