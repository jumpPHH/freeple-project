package com.sg.freeple.cafe.board.service;

import java.util.ArrayList;
import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.cafe.board.mapper.CafeBoardSQLMapper;
import com.sg.freeple.cafe.mapper.CafeSQLMapper;
import com.sg.freeple.vo.FP_CafeBoardImageVo;
import com.sg.freeple.vo.FP_CafeBoard_CategoryVo;
import com.sg.freeple.vo.FP_CafeBoard_LikeVo;
import com.sg.freeple.vo.FP_CafeCommentVo;
import com.sg.freeple.vo.FP_CafeMemberVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_WriteBoardVo;

@Service
public class CafeBoardServiceImpl {
	
	@Autowired
	private CafeSQLMapper cafeSQLMapper;
	@Autowired
	private CafeBoardSQLMapper cafeBoardSQLMapper;
	
	//게시판 카테고리
	public void createBoardCategory(FP_CafeBoard_CategoryVo cafeBoard_CategoryVo) {
		
		int categoryPK = cafeBoardSQLMapper.createCafeBoardCategory_no();
		cafeBoard_CategoryVo.setCafeBoard_Category_no(categoryPK);
		cafeBoardSQLMapper.insertCafeBoardCategory(cafeBoard_CategoryVo);
	}
	
	public ArrayList<HashMap<String, Object>> getCafeBoardCategoryList(int cafeNo){
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<FP_CafeBoard_CategoryVo> categoryList = cafeBoardSQLMapper.cafeBoardCategoryList(cafeNo);
		
		for(FP_CafeBoard_CategoryVo cafeBoard_CategoryVo : categoryList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cafeBoard_CategoryVo", cafeBoard_CategoryVo);
			dataList.add(map);
		}
		return dataList;
	}
	
	public FP_CafeBoard_CategoryVo getBoardCategoryData(FP_CafeBoard_CategoryVo cafeBoard_CategoryVo) {
		return cafeBoardSQLMapper.selectcafeBoardCategoryList(cafeBoard_CategoryVo.getCafe_no(), cafeBoard_CategoryVo.getCafeBoard_Category_no());
	}
	
	public FP_CafeBoard_CategoryVo getSelectCategoryByNo(int Category_no) {
		return cafeBoardSQLMapper.selectCategoryByNo(Category_no);
	}
	
	public void deleteCafeBoardCategory(FP_CafeBoard_CategoryVo cafeBoard_CategoryVo) {
		cafeBoardSQLMapper.deleteBoardCategory(cafeBoard_CategoryVo);
		cafeBoardSQLMapper.deleteBoardByCategory(cafeBoard_CategoryVo.getCafeBoard_Category_no());
	}
	
	//게시판 글쓰기(+이미지)
	public void writeBoardContent(FP_WriteBoardVo writeBoardVo, ArrayList<FP_CafeBoardImageVo> cafeBoardImageList) {
		
		int writeBoardPk = cafeBoardSQLMapper.createWriteBoardPk();
		writeBoardVo.setWriteBoard_no(writeBoardPk);
		cafeBoardSQLMapper.insertCafeBoard(writeBoardVo);
		
		for(FP_CafeBoardImageVo cafeBoardImageVo : cafeBoardImageList) {
			cafeBoardImageVo.setWriteBoard_no(writeBoardPk);
			cafeBoardSQLMapper.insertCafeBoImage(cafeBoardImageVo);
		}
	}
	//카페 게시글 전체보기
	public ArrayList<HashMap<String, Object>> getFullTextByCafe(int cafe_no){
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<FP_WriteBoardVo> boardList= cafeBoardSQLMapper.selectFullTextByCafe(cafe_no);
		
		for(FP_WriteBoardVo writeBoardVo : boardList) {
			FP_CafeMemberVo cafeMemberVo= cafeSQLMapper.selectCafeMemberByNo(writeBoardVo.getCafeMember_no());
			FP_MemberVo memberVo = cafeSQLMapper.selectByMemberNo(cafeMemberVo.getMb_no());
			FP_CafeBoard_CategoryVo categoryVo= cafeBoardSQLMapper.selectcafeBoardCategoryList(cafe_no,writeBoardVo.getCafeBoard_Category_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cafeMemberVo", cafeMemberVo);
			map.put("writeBoardVo", writeBoardVo);
			map.put("memberVo", memberVo);
			map.put("categoryVo", categoryVo);
			dataList.add(map);
		}
		return dataList;
	}
	
	//카테고리안 게시글 목록 가져오기
	public ArrayList<HashMap<String, Object>> getCafeboardList(int cafeBoard_Category_no){
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<FP_WriteBoardVo> boardList = cafeBoardSQLMapper.selectCafeBoardList(cafeBoard_Category_no);
		
		for(FP_WriteBoardVo writeBoardVo : boardList) {
			FP_CafeMemberVo cafeMemberVo= cafeSQLMapper.selectCafeMemberByNo(writeBoardVo.getCafeMember_no());
			FP_MemberVo memberVo =cafeSQLMapper.selectByMemberNo(cafeMemberVo.getMb_no());
			
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("writeBoardVo", writeBoardVo);
			map.put("memberVo", memberVo);
			map.put("cafeMemberVo",cafeMemberVo);
			dataList.add(map);
		}
		return dataList;
	}
	
	public HashMap<String, Object> getCafeBoardData(int writeBoard_no) { //게시판글 자세히 보기(+이미지)
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_WriteBoardVo writeBoardVo = cafeBoardSQLMapper.selectCafeBoardByNo(writeBoard_no);
		int cafeMemberNo = writeBoardVo.getCafeMember_no();
		FP_CafeMemberVo cafeMemberVo = cafeSQLMapper.selectCafeMemberByNo(cafeMemberNo);
		FP_MemberVo memberVo = cafeSQLMapper.selectByMemberNo(cafeMemberVo.getMb_no());
		
		ArrayList<FP_CafeBoardImageVo> cafeBoImageList = cafeBoardSQLMapper.selectCafeBoImageByNo(writeBoard_no);
		
		map.put("writeBoardVo", writeBoardVo);
		map.put("cafeMemberVo", cafeMemberVo);
		map.put("memberVo",memberVo);
		map.put("cafeBoImageList", cafeBoImageList);
		return map;
	}
	
	public FP_WriteBoardVo getCafeBoardDataByNo(int writeBoard_no) {
		return cafeBoardSQLMapper.selectCafeBoardByNo(writeBoard_no);
	}
	
	//게시글 삭제
	public void deleteCafeBoard(int writeBoard_no) {
		cafeBoardSQLMapper.deleteCafeBoard(writeBoard_no);
		cafeBoardSQLMapper.deleteCommentByBoard(writeBoard_no);
	}
	
	public void updateCafeBoard(FP_WriteBoardVo writeBoardVo) {
		cafeBoardSQLMapper.updateCafeBoard(writeBoardVo);
	}
	
	public void increaseReadCount(int writeBoard_no) {
		cafeBoardSQLMapper.increaseReadCount(writeBoard_no);
	}
	
	public int getCountTotalText(int cafe_no){
		return cafeBoardSQLMapper.countTotalText(cafe_no);
	}
	
	public int getCountTextByCategory(int cafe_no, int cafeBoard_Category_no) {
		return cafeBoardSQLMapper.countTextByCategory(cafe_no, cafeBoard_Category_no);
	}
	
	//댓글
	public void writeComment(FP_CafeCommentVo commentVo) {
		 cafeBoardSQLMapper.insertComment(commentVo);
	}
	
	public ArrayList<HashMap<String, Object>> commentListByBoardNo(int writeBoard_no){
		ArrayList<HashMap<String, Object>> dataList =new ArrayList<HashMap<String,Object>>();
		ArrayList<FP_CafeCommentVo> commentList = cafeBoardSQLMapper.selectCommentListByBoardNo(writeBoard_no);
		
		for(FP_CafeCommentVo cafeCommentVo : commentList) {
		
		FP_CafeMemberVo cafeMemberVo = cafeSQLMapper.selectCafeMemberByNo(cafeCommentVo.getCafeMember_no());
		FP_MemberVo memberVo = cafeSQLMapper.selectByMemberNo(cafeMemberVo.getMb_no());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cafeCommentVo", cafeCommentVo);
		map.put("cafeMemberVo",cafeMemberVo);
		map.put("memberVo", memberVo);
		//System.out.println(cafeCommentVo.getCafeComment_content());
		dataList.add(map);
		}
		
		return dataList;
	}
	
	public void deleteComment(int cafeComment_no) {
		cafeBoardSQLMapper.deleteComment(cafeComment_no);
	}
	
	public void updateComment(FP_CafeCommentVo cafeCommentVo) {
		cafeBoardSQLMapper.updateComment(cafeCommentVo);
	}
	
	public int  getCountCommentByBoardNo(int writeBoard_no) {
		return cafeBoardSQLMapper.countCommentByBoardNo(writeBoard_no);
	}
	
	// 좋아요
	public void doLike(FP_CafeBoard_LikeVo cafeBoard_LikeVo) {
		if(cafeBoardSQLMapper.selectMyLikeCheck(cafeBoard_LikeVo) > 0) {
			cafeBoardSQLMapper.deleteLike(cafeBoard_LikeVo);
		}else {
			cafeBoardSQLMapper.insertLike(cafeBoard_LikeVo);
		}
	}
	
	public boolean isLiked(FP_CafeBoard_LikeVo cafeBoard_LikeVo) {
		if(cafeBoardSQLMapper.selectMyLikeCheck(cafeBoard_LikeVo) >0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	public int getTotalLikeCount(int writeBoard_no) {
		return cafeBoardSQLMapper.selectTotalLikeCount(writeBoard_no);
	}
}












