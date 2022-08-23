package com.sg.freeple.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sg.freeple.board.service.FreeBoardService;
import com.sg.freeple.vo.FP_BoardImageVo;
import com.sg.freeple.vo.FP_BoardVo;
import com.sg.freeple.vo.FP_FreeBoardCommentVo;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/board/*")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeboardService;
	
	@RequestMapping("mainPage")
	public String mainPage(Model model , String searchType , String searchWord , @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		
		ArrayList<HashMap<String, Object>> dataList = freeboardService.getBoardDataList(searchType,searchWord,pageNum);
		model.addAttribute("dataList", dataList);
		
		int boardCount = freeboardService.getBoardCount(searchType, searchWord);
		
		int totalPageCount = (int)Math.ceil(boardCount/10.0);
		int startPage = ((pageNum-1)/5)*5+1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage= totalPageCount;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPageNum", pageNum);
		model.addAttribute("totalPageCount", totalPageCount);
		
		String additionalParam = "";
		if(searchType != null && searchWord != null ) {
			additionalParam += "&searchType=" + searchType;
			additionalParam += "&searchType=" + searchWord;
		}
		
		model.addAttribute("additionalParam", additionalParam);
	
		return "board/mainPage";
		
	}
	
	@RequestMapping("writeContentPage")
	public String writeContentPage() {
		
		return "board/writeContentPage";
	}
	
	@RequestMapping("writeContentProcess")
	public String writeContentProcess(FP_BoardVo param , MultipartFile [] files , HttpSession session) {
		
		ArrayList<FP_BoardImageVo> boardImageVoList = new ArrayList<FP_BoardImageVo>();
	
		for(MultipartFile file : files) {
			
			if(file.isEmpty()) {continue;}
			
			String rootFilePath = "C:/uploadFiles/";
			
			String originalFilename = file.getOriginalFilename();
			
			String randomName = UUID.randomUUID().toString();
			randomName +="_"+System.currentTimeMillis();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
				
			File todayFolder = new File(rootFilePath + todayFolderName);
			if(todayFolder.exists()== false) {
				todayFolder.mkdirs();
			}
			
			try {
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			FP_BoardImageVo boardImageVo = new FP_BoardImageVo();
			boardImageVo.setImage_link(todayFolderName + randomName);
			boardImageVo.setImage_original_filename(originalFilename);
			
			boardImageVoList.add(boardImageVo);
		}
		
		FP_MemberVo sessionUser = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		int mb_no = sessionUser.getMb_no();
		
		param.setMb_no(mb_no);
		
		freeboardService.writeContent(param, boardImageVoList);
		
		return "redirect:./mainPage";
	}
	
	@RequestMapping("readContentPage")
	public String readContentPage(int board_no , Model model) {
		
		freeboardService.increasereadCount(board_no);
		HashMap<String , Object> data = freeboardService.getBoardData(board_no);
		
		FP_BoardVo boardVo = (FP_BoardVo)data.get("boardVo");
		String content = boardVo.getBoard_content(); 
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp;");
		content = content.replaceAll("\n", "<br>");
		boardVo.setBoard_content(content);
		
		
		ArrayList<HashMap<String, Object>> commentDataList = freeboardService.getCommentList(board_no);
		
		model.addAttribute("data", data); //HashMap<String , Object> data = freeboardService.getBoardData(board_no);
		model.addAttribute("commentDataList", commentDataList); //ArrayList<HashMap<String, Object>> commentDataList = freeboardService.getCommentList(board_no);
		
		return "board/readContentPage"; 
	}
	
	@RequestMapping("deleteContentProcess")
	public String deleteContentProcess(int board_no) {
		
		freeboardService.deleteContent(board_no);
		
		return "redirect:./mainPage";
	}
	
	@RequestMapping("updateContentPage")
	public String updateContentPage(int board_no , Model model) {
		
		HashMap<String, Object> data = freeboardService.getBoardData(board_no);
		model.addAttribute("data", data);
		
		return "board/updateContentPage";
	}
	
	@RequestMapping("updateContentProcess")
	public String updateContentProcess(FP_BoardVo param) {
		
		freeboardService.updateContent(param);
		
		return "redirect:./mainPage";
	}
	
	@RequestMapping("writeCommentProcess")
	public String writeCommentProcess(FP_FreeBoardCommentVo commentVo) {    
		
		freeboardService.writeComment(commentVo);
	
		return "redirect:./readContentPage?board_no=" + commentVo.getBoard_no(); 
	}
	
	@RequestMapping("getCommentList")
	public HashMap<String, Object> getCommentList(int board_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("data", freeboardService.getCommentList(board_no));
		
		return map;
	}
	
	@RequestMapping("deleteCommentProcess")
	public String deleteCommentProcess(int comment_no , int board_no) {
		
		freeboardService.deleteComment(comment_no);
		
		return "redirect:./readContentPage?board_no=" + board_no; 
	}

}