package com.sg.freeple.member.signup.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sg.freeple.member.signup.service.SignUpService;
import com.sg.freeple.vo.FP_MemberVo;

@Controller
@RequestMapping("member/signup/*")
public class SignUpController {

	@Autowired
	private SignUpService signUpService;
	
	//@회원가입 페이지 1 (약관 동의)
	@RequestMapping("acceptPage")
	public String acceptPage() {

		return "member/signup/acceptPage";
	}
	
	//@회원가입 페이지 2 (회원가입 페이지)
	@RequestMapping("signupPage")
	public String signupPage() {

		return "member/signup/signupPage";
	}
	
	//회원가입할때 등록 세부 로직처리 
	@RequestMapping("signupProcess")
	public String signupProcess(FP_MemberVo fp_MemberVo, MultipartFile file) {
		
			if(!file.isEmpty()) {
				
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
				signUpService.signupRegister(fp_MemberVo);
			}

		return "member/signup/signupCompletePage";
	} 
	
	//회원가입할때 메일 인증 관련 (X->O)
	@RequestMapping("signupEmailAuthProcess")
	public String signupEmailAuthProcess(String auth_key) {
		
		signUpService.mailAuth(auth_key);
		
		return "member/signup/signupMailAuthComplete";
	}
	
	
}
