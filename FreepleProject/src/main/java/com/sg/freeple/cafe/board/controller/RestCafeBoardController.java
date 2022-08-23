package com.sg.freeple.cafe.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.cafe.board.service.CafeBoardServiceImpl;
import com.sg.freeple.cafe.service.CafeServiceImpl;
import com.sg.freeple.vo.FP_CafeBoard_CategoryVo;
import com.sg.freeple.vo.FP_CafeBoard_LikeVo;
import com.sg.freeple.vo.FP_CafeCommentVo;
import com.sg.freeple.vo.FP_CafeMemberVo;
import com.sg.freeple.vo.FP_CafeVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FP_WriteBoardVo;

@RequestMapping("cafe/cafeBoard/*")
@RestController
public class RestCafeBoardController {
	
	@Autowired
	private CafeBoardServiceImpl cafeBoardService;
	@Autowired
	private CafeServiceImpl cafeService;
	
	//카테고리 생성
	@RequestMapping("produceBoardCategoryProcess")
	public HashMap<String, Object> produceBoardCategoryProcess(FP_CafeBoard_CategoryVo cafeBoard_CategoryVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		cafeBoardService.createBoardCategory(cafeBoard_CategoryVo);
		map.put("result", "success");
		
		return map;
	}
	
	//카테고리 삭제
	@RequestMapping("deleteBoardCategoryProcess")
	public HashMap<String, Object> deleteBoardCategoryProcess(FP_CafeBoard_CategoryVo cafeBoard_CategoryVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		cafeBoardService.deleteCafeBoardCategory(cafeBoard_CategoryVo);
		
		map.put("result", "success");
		return map;
	}
	
	//게시글 삭제
	@RequestMapping("deleteBoard")
	public HashMap<String, Object> deleteBoard(int writeBoard_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(writeBoard_no);
		cafeBoardService.deleteCafeBoard(writeBoard_no);
		
		map.put("result", "success");
		//map.put("data", cafeBoardService.getCafeBoardData(writeboard_no));
		
		return map; 
	}
	
	//댓글
	@RequestMapping("writeComment")
	public HashMap<String, Object> writeComment(FP_CafeCommentVo cafeCommentVo, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		int memberNo = memberVo.getMb_no();
	
		FP_WriteBoardVo writeBoardVo = cafeBoardService.getCafeBoardDataByNo(cafeCommentVo.getWriteBoard_no());
		FP_CafeBoard_CategoryVo cafeBoard_CategoryVo = cafeBoardService.getSelectCategoryByNo(writeBoardVo.getCafeBoard_Category_no());
		
		FP_CafeMemberVo cafeMemberVo = cafeService.getCafeMemberDataByMemberNo(cafeBoard_CategoryVo.getCafe_no(), memberNo);
		int cafeMemberNo = cafeMemberVo.getCafeMember_no();
		cafeCommentVo.setCafeMember_no(cafeMemberNo);
		
		cafeBoardService.writeComment(cafeCommentVo);
		
		map.put("result", "success");
		
		return map;
	}
	@RequestMapping("getCommentList")
	public HashMap<String, Object> getCommentList(int writeBoard_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("data", cafeBoardService.commentListByBoardNo(writeBoard_no));
		
		return map;
	}

	@RequestMapping("deleteComment")
	public HashMap<String, Object> deleteComment(int cafeComment_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		cafeBoardService.deleteComment(cafeComment_no);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("updateComment")
	public HashMap<String, Object> updateComment(FP_CafeCommentVo cafeCommentVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		cafeBoardService.updateComment(cafeCommentVo);
		
		map.put("result", "success");
		return map;
	}
	
	//좋아요
	@RequestMapping("doLike")
	public HashMap<String, Object> doLike(FP_CafeBoard_LikeVo cafeBoard_LikeVo, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo= cafeService.getCafeMemberDataByMemberNo(cafeBoard_LikeVo.getCafe_no(), memberVo.getMb_no());
		cafeBoard_LikeVo.setCafeMember_no(cafeMemberVo.getCafeMember_no());
		
		cafeBoardService.doLike(cafeBoard_LikeVo);
		
		map.put("result", "sucess");;
		
		return map;
	}
	
	@RequestMapping("getTotalLikeCount")
	public HashMap<String, Object> getTotalLikeCount(int writeBoard_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", cafeBoardService.getTotalLikeCount(writeBoard_no));
		
		return map;
	}
	
	@RequestMapping("isLiked")
	public HashMap<String, Object> isLiked(FP_CafeBoard_LikeVo cafeBoard_LikeVo, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		FP_MemberVo memberVo = (FP_MemberVo) session.getAttribute("sessionUserInfo");
		FP_CafeMemberVo cafeMemberVo= cafeService.getCafeMemberDataByMemberNo(cafeBoard_LikeVo.getCafe_no(), memberVo.getMb_no());
		cafeBoard_LikeVo.setCafeMember_no(cafeMemberVo.getCafeMember_no());
	
		map.put("result", "sucess");
		map.put("data", cafeBoardService.isLiked(cafeBoard_LikeVo));
		return map;
	}
} 





































