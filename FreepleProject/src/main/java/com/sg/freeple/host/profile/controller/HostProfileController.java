package com.sg.freeple.host.profile.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sg.freeple.host.profile.service.HostProfileService;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("/host/profile/*")
public class HostProfileController {
	
	@Autowired
	HostProfileService hostProfileService;
	
	@RequestMapping("hostProfilePage")
	public String hostProfilePage(HttpSession session,Model model) {
		
		FP_MemberVo sessionUserInfo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		
		String info = sessionUserInfo.getMb_host_info();
		info = StringEscapeUtils.escapeHtml4(info);
		info = info.replaceAll(" ","&nbsp;");
		info = info.replaceAll("\n","<br>");
		sessionUserInfo.setMb_host_info(info);
		
		model.addAttribute("sessionUserInfo", sessionUserInfo);
		
		return "host/profile/hostProfilePage";
	}
	
	@RequestMapping("updateProfileProcess")
	public String updateProfileProcess(FP_MemberVo fp_MemberVo,MultipartFile [] files ,HttpSession session) {
		
		for(MultipartFile file : files){
			if(file.isEmpty()) {
				continue;
			}
			
			//C 드라이브에 있는 업로드 파일
			String rootFilePath = "C:/uploadFiles/";
			
			// 클라이언트의 요청된 파일의 이름을 가져오는 API..
			String originalFilename = file.getOriginalFilename();
			
			//서버에 저장 될때는 파일명을 중복배제 해야된다..
			//왜냐면 만약에 1.jpg 라는 파일을 서버에 저장할때.. 다른 유저도 1.jpg라는 파일을 저장하게 되면 충돌이나..그래서
			//랜덤 이름 + 시간 = 파일명 만든다.	
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			//확장자명을 유지하면서 서버에 파일이 저장이됨.
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			//오늘 날짜 기준으로 폴더 생성..되면서 저장하고싶은거임.. 그러면 아래의 코드 실행.
			Date today = new Date();
			//날짜를 => 문자로 변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			
			//업로드 파일에 todayFolderName을 붙여서 생성.. (폴더명 : 현재의 날짜로)
			File todayFolder = new File(rootFilePath + todayFolderName);
			
			if(!todayFolder.exists()) {//맨처음 현재 날짜로된 폴더가 존재하지 않으면.. 그 이후엔 그날은 거기에만 저장되는 구조  
				//폴더를 만들어주고..
				todayFolder.mkdirs();
			}
			
			try {
				//실질적 저장 API.. 
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			fp_MemberVo.setMb_image_link(todayFolderName + randomName);
			fp_MemberVo.setMb_image_original_filename(originalFilename);
			
		}
		
		FP_MemberVo sessionUserInfo = (FP_MemberVo)session.getAttribute("sessionUserInfo");
		fp_MemberVo.setMb_no(sessionUserInfo.getMb_no());
	
		hostProfileService.updateHostProfileProcess(fp_MemberVo);
		
		session.removeAttribute("sessionUserInfo");
		
		return "redirect:../../host/main/hostMainPage";
	}
	
	
}
