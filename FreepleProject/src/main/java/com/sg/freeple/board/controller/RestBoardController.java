package com.sg.freeple.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.board.service.FreeBoardService;
import com.sg.freeple.vo.FP_FreeBoardLikeVo;
import com.sg.freeple.vo.FP_MemberVo;

@RestController
@RequestMapping("/board/freeboard/*")
public class RestBoardController {
	
	@Autowired
	private FreeBoardService boardService;
	
	@RequestMapping("doLike")
	public HashMap<String, Object> doLike(FP_FreeBoardLikeVo boardLikeVo, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_MemberVo memberVo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int memberNo = memberVo.getMb_no();
		
		boardLikeVo.setMember_no(memberNo);
		
		boardService.doLike(boardLikeVo);
		
		map.put("result", "success");
		
		return map;			
	}
	
	@RequestMapping("getTotalLikeCount")
	public HashMap<String, Object> getTotalLikeCount(int board_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", boardService.getTotalLikeCount(board_no));
		
		return map;   
		
	}
	
	@RequestMapping("isLiked")
	public HashMap<String, Object> isLiked(FP_FreeBoardLikeVo boardLikeVo , HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FP_MemberVo memberVo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int memberNo = memberVo.getMb_no();
		boardLikeVo.setMember_no(memberNo);
		
		map.put("result", "success");
		map.put("data", boardService.isLiked(boardLikeVo));
		
		return map;
	}
	
}