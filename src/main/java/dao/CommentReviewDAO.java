package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CommentReviewDTO;
import dto.PhotoDTO;

public class CommentReviewDAO {
	private static CommentReviewDAO instance = null;
	public synchronized static CommentReviewDAO getInstance() {
		if(instance == null) {
			instance = new CommentReviewDAO();
		}
		return instance;
	}
	
	private CommentReviewDAO() {
		super();
	}
	
	private Connection getConnection() throws Exception {
		Context iContext = new InitialContext();
		DataSource ds = (DataSource)iContext.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int insert(CommentReviewDTO dto) throws Exception{
		String sql = "insert into COMMENTREVIEW(REVIEWID, BODY, SCORE, STOREID, USERNO, WRITEDATE, TOTALLIKE)"
				+ " values(COMMENTREVIEW_REVIEWID_SEQ.nextval, ?, ?, ?, ?, sysdate, 0)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getBody());
			pstat.setInt(2, dto.getScore());
			pstat.setInt(3, dto.getStoreID());
			pstat.setInt(4, dto.getUserNo());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public ArrayList<CommentReviewDTO> selectByStoreID(int storeID) throws Exception{
		String sql = "select * from COMMENTREVIEW where STOREID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, storeID);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs);
			}
		}
	}
	
	public ArrayList<CommentReviewDTO> selectByUserNo(int userNo) throws Exception{
		String sql = "select * from COMMENTREVIEW where USERNO = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, userNo);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs);
			}
		}
	}
	
	public int getCurrval() throws Exception{
		String sql = "select COMMENTREVIEW_REVIEWID_SEQ.currval from dual";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public int insertPhoto(String sysName, String oriName, int cReviewID) throws Exception{
		String sql = "insert into PHOTO(IMAGEID, ORINAME, SYSNAME, cReviewID)"
				+ " values(PHOTO_IMAGEID_SEQ.nextval, ?, ?, ?)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, sysName);
			pstat.setString(2, oriName);
			pstat.setInt(3, cReviewID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public ArrayList<PhotoDTO> selectPhoto(int cReviewID) throws Exception{
		String sql = "select IMAGEID, ORINAME, SYSNAME from PHOTO where CREVIEWID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, cReviewID);
			try(ResultSet rs = pstat.executeQuery();){
				ArrayList<PhotoDTO> result = new ArrayList<>();
				while(rs.next()) {
					int imageID = rs.getInt("IMAGEID");
					String oriName = rs.getString("ORINAME");
					String sysName = rs.getString("SYSNAME");
					result.add(new PhotoDTO(imageID, oriName, sysName));
				}
				return result;
			}
		}
	}
	
	private ArrayList<CommentReviewDTO> transAllRsToList(ResultSet rs) throws Exception{
		ArrayList<CommentReviewDTO> result = new ArrayList<>();
		while(rs.next()) {
			int reviewID = rs.getInt("REVIEWID");
			String body = rs.getString("BODY");
			int score = rs.getInt("SCORE");
			int storeID = rs.getInt("STOREID");
			int userNo = rs.getInt("USERNO");
			Timestamp writeDate = rs.getTimestamp("WRITEDATE");
			int totalLike = rs.getInt("TOTALLIKE");
			
			result.add(new CommentReviewDTO(reviewID, body, score, storeID, userNo, writeDate, totalLike));
		}
		return result;
	}
	
	
}
