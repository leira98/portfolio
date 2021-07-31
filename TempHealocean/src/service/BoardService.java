package service;

import vo.*;
import entity.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class BoardService {
	BoardEntity en;
	public BoardService() {
		en = new BoardEntity();
	}
	
	public void insertBoard(BoardVO board) throws Exception {	
		en.insertBoard(board);
    }
	
	public int getBoardCount() throws Exception {
		return en.getBoardCount();
    }

   public ArrayList getBoardList(int start, int end) throws Exception {
    		return en.getBoardList(start, end);
   }
   
   public BoardVO getBoard(int num) throws Exception {
      		return en.getBoard(num);
   }
   
   public BoardVO updateGetBoard(int num) throws Exception  {
			return en.updateGetBoard(num);
	    }
   
   public int updateBoard(BoardVO board) throws Exception {
			return en.updateBoard(board);
   }
     
   public int deleteBoard(int num, String passwd) throws Exception {    	   
   			return en.deleteBoard(num, passwd);
   }
}
