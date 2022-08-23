package com.sg.freeple.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sg.freeple.vo.FP_BoardImageVo;
import com.sg.freeple.vo.FP_BoardVo;
import com.sg.freeple.vo.FP_FreeBoardCommentVo;
import com.sg.freeple.vo.FP_FreeBoardLikeVo;

public interface FreeBoardSQLMapper {
	
	public int createBoardPk();
	
	public int createCommentPk();
	
	public void insertBoard(FP_BoardVo boardVo);
	
	public ArrayList<FP_BoardVo> selectAll(
			@Param("searchType") String searchType,
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum
			); 
	
	public int selectCount(
			@Param("searchType") String searchType,
			@Param("searchWord") String searchWord
			);
	
//	
	public FP_BoardVo selectByNo(int boardNo);
//	
	public void increaseReadCount(int boardNo);
	public void deleteByNo(int boardNo);
	public void updateTitleAndContent(FP_BoardVo boardVo);
	
	public void insertImage(FP_BoardImageVo boardImageVo);
	public ArrayList<FP_BoardImageVo> selectBoardImage(int boardNo);
	
	public void insertLike(FP_FreeBoardLikeVo boardLikeVo);
	public void deleteLike(FP_FreeBoardLikeVo boardLikeVo);
	public int selectTotalLikeCount(int boardNo);
	public int selectMyLikeCount(FP_FreeBoardLikeVo boardLikeVo);
	
	public void insertComment(FP_FreeBoardCommentVo commentVo);
	public ArrayList<FP_FreeBoardCommentVo> selectCommentList(int boardNo);
	public void deleteComment(int commentNo);
	public int selectCommentCount(int boardNo);
	
}