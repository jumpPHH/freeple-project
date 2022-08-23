package com.sg.freeple.cafe.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sg.freeple.vo.FP_CafeBoardImageVo;
import com.sg.freeple.vo.FP_CafeBoard_CategoryVo;
import com.sg.freeple.vo.FP_CafeBoard_LikeVo;
import com.sg.freeple.vo.FP_CafeCommentVo;
import com.sg.freeple.vo.FP_WriteBoardVo;

public interface CafeBoardSQLMapper {

	//카페키데고리
	public int createCafeBoardCategory_no();
	
	public void insertCafeBoardCategory(FP_CafeBoard_CategoryVo cafeBoard_CategoryVo);
	
	public ArrayList<FP_CafeBoard_CategoryVo> cafeBoardCategoryList(int cafeNo);
	
	public FP_CafeBoard_CategoryVo selectcafeBoardCategoryList(@Param("cafe_no")int cafe_no, @Param("cafeBoard_Category_no")int cafeBoard_Category_no);

	public void insertCafeBoard(FP_WriteBoardVo writeBoardVo);
	
	public FP_CafeBoard_CategoryVo selectCategoryByNo(int no);
	
	public void deleteBoardCategory(FP_CafeBoard_CategoryVo cafeBoard_CategoryVo);
	
	public void deleteBoardByCategory(int cafeBoard_Category_no);
	
	//카페게시글
	public int createWriteBoardPk();
	
	public ArrayList<FP_WriteBoardVo> selectCafeBoardList(int no);//카테고리안 게시글 목록
	
	public FP_WriteBoardVo selectCafeBoardByNo(int no);
	
	public void deleteCafeBoard(int no);
	
	public void updateCafeBoard(FP_WriteBoardVo writeBoardVo);
	
	public void increaseReadCount(int no);
	
	public ArrayList<FP_WriteBoardVo> selectFullTextByCafe(int cafeNo);
	
	public int countTotalText(int cafeNo);
	
	public int countTextByCategory(@Param("cafe_no")int cafe_no, @Param("cafeBoard_Category_no")int cafeBoard_Category_no);
	
	//댓글
	public void insertComment(FP_CafeCommentVo cafeCommentVo);
	
	public ArrayList<FP_CafeCommentVo> selectCommentListByBoardNo(int boardNo);
	
	public void deleteComment(int no);
	
	public void updateComment(FP_CafeCommentVo cafeCommentVo);
	
	public void deleteCommentByBoard(int boardNo);
	
	public int countCommentByBoardNo(int boardNo);
	
	//좋아요
	public void insertLike(FP_CafeBoard_LikeVo cafeBoard_LikeVo);
	
	public void deleteLike(FP_CafeBoard_LikeVo cafeBoard_LikeVo);
	
	public int selectTotalLikeCount(int boardNo); //게시글 총 좋아요 개수
	
	public int selectMyLikeCheck(FP_CafeBoard_LikeVo cafeBoard_LikeVo); //user가 게시글 좋아요 했는지 안했는지
	
	//게시글 이미지
	
	public void insertCafeBoImage(FP_CafeBoardImageVo cafeBoardImageVo);
	
	public ArrayList<FP_CafeBoardImageVo> selectCafeBoImageByNo(int boardNo);
	
}




























