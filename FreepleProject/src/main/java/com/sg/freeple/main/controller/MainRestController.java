package com.sg.freeple.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sg.freeple.freep.service.FreepService;
import com.sg.freeple.vo.FP_FreepCategoryVo;

@RestController
@RequestMapping("/main/*")
public class MainRestController {
	
	@Autowired
	private FreepService freepService;
	
	@RequestMapping("getCategory")
	public HashMap<String, Object> getCategory(){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FP_FreepCategoryVo> categoryList = freepService.getAllCategoryList();
		
		map.put("categoryList", categoryList);
		map.put("categoryListSize", categoryList.size());
		return map;
	}
}












