package com.sg.freeple.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.board.mapper.FreeBoardSQLMapper;
import com.sg.freeple.member.login.mapper.LoginSQLMapper;
import com.sg.freeple.vo.FP_BoardImageVo;
import com.sg.freeple.vo.FP_BoardVo;
import com.sg.freeple.vo.FP_FreeBoardCommentVo;
import com.sg.freeple.vo.FP_FreeBoardLikeVo;
import com.sg.freeple.vo.FP_MemberVo;

@Service
public class FreeBoardService {
	
	@Autowired
	private FreeBoardSQLMapper freeboardSQLMapper;
	@Autowired
	private LoginSQLMapper loginSQLMapper;
	
	public void writeContent(FP_BoardVo boardVo , ArrayList<FP_BoardImageVo> boardImageVoList) {
		
		int boardPK = freeboardSQLMapper.createBoardPk();
		boardVo.setBoard_no(boardPK);
		freeboardSQLMapper.insertBoard(boardVo);
		
		for(FP_BoardImageVo boardImageVo : boardImageVoList) {
			boardImageVo.setBoard_no(boardPK);
			freeboardSQLMapper.insertImage(boardImageVo);
		}
		
	}
	
	public ArrayList<HashMap<String, Object>> getBoardDataList(String searchType , String searchWord, int pageNum) {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<FP_BoardVo> boardList = freeboardSQLMapper.selectAll(searchType,searchWord,pageNum);
		
		for(FP_BoardVo boardVo : boardList) {
			int mb_no = boardVo.getMb_no();
			FP_MemberVo memberVo = loginSQLMapper.selectByNo(mb_no);
			int boardNo = boardVo.getBoard_no();
			int commentCount = freeboardSQLMapper.selectCommentCount(boardNo);
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("boardVo", boardVo);
			map.put("commentCount", commentCount);
			
			dataList.add(map);	
		}
		
		return dataList;
	}

	
	public HashMap<String, Object> getBoardData(int boardNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_BoardVo boardVo = freeboardSQLMapper.selectByNo(boardNo);
		int mb_no = boardVo.getMb_no();
		FP_MemberVo memberVo = loginSQLMapper.selectByNo(mb_no);
		
		ArrayList<FP_BoardImageVo> boardImageVoList = freeboardSQLMapper.selectBoardImage(boardNo);
		
		map.put("boardVo", boardVo);
		map.put("memberVo", memberVo);
		map.put("boardImageVoList", boardImageVoList);
		
		return map;
	}
	
	public int getBoardCount(String searchType , String searchWord) {
		return freeboardSQLMapper.selectCount(searchType, searchWord);
	}
	
	public void increasereadCount(int boardNo) {
		freeboardSQLMapper.increaseReadCount(boardNo);
	}
	
	public void deleteContent(int boardNo) {
		freeboardSQLMapper.deleteByNo(boardNo);
	}
	
	public void updateContent(FP_BoardVo boardVo) {
		freeboardSQLMapper.updateTitleAndContent(boardVo);
	}
	
	public void doLike(FP_FreeBoardLikeVo boardLikeVo) {
		if(freeboardSQLMapper.selectMyLikeCount(boardLikeVo) > 0) {
			freeboardSQLMapper.deleteLike(boardLikeVo);
		}else {
			freeboardSQLMapper.insertLike(boardLikeVo);
		}
	}
	
	public boolean isLiked(FP_FreeBoardLikeVo boardLikeVo) {
		
		if(freeboardSQLMapper.selectMyLikeCount(boardLikeVo)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public int getTotalLikeCount(int boardNo) {
		return freeboardSQLMapper.selectTotalLikeCount(boardNo);
	}
	
	public void writeComment(FP_FreeBoardCommentVo commentVo) {
		freeboardSQLMapper.insertComment(commentVo);
	}
	
	public ArrayList<HashMap<String, Object>> getCommentList(int boardNo){
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<FP_FreeBoardCommentVo> commentVoList = freeboardSQLMapper.selectCommentList(boardNo);
		
		for(FP_FreeBoardCommentVo commentVo : commentVoList) {
			int memberNo = commentVo.getMember_no();
			FP_MemberVo memberVo = loginSQLMapper.selectByNo(memberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("commentVo", commentVo);
			map.put("memberVo", memberVo);
			datas.add(map);
		}
		
		return datas;
	}
	
	public void deleteComment(int boardNo) {
		freeboardSQLMapper.deleteComment(boardNo);		
	}
	
	public int selectCommentCount(int commentNo) {
		return freeboardSQLMapper.selectCommentCount(commentNo);
	}
	
}