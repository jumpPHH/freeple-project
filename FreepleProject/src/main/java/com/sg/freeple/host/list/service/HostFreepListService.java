package com.sg.freeple.host.list.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.host.list.mapper.HostFreepListSQLMapper;
import com.sg.freeple.vo.FP_FreepImageVo;
import com.sg.freeple.vo.FP_FreepVo;
import com.sg.freeple.vo.FP_MemberVo;

@Service
public class HostFreepListService {

	@Autowired
	HostFreepListSQLMapper hostFreepListSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getHostFreepDataList(FP_MemberVo fp_MemberVo, String searchType, String searchWord){

		ArrayList<HashMap<String, Object>> hostFreepData = new ArrayList<HashMap<String,Object>>();
		
		//로그인한 유저의 mb_no 
		int mb_no = fp_MemberVo.getMb_no();
		
		//호스트 메인 페이지에 로그인한 호스트가 등록한 프립의 목록을 담음.		
		ArrayList<FP_FreepVo> hostFreepVoList = hostFreepListSQLMapper.selectHostFreepList(searchType,searchWord,mb_no);
		
		for(FP_FreepVo fp_FreepVo : hostFreepVoList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("HostFreepVo", fp_FreepVo);
			hostFreepData.add(map);
		}
		
		return hostFreepData;
	}
	
	
	public ArrayList<HashMap<String, Object>> getHostFreepImagDataList(FP_MemberVo fp_MemberVo, String searchType, String searchWord){
		
		ArrayList<HashMap<String, Object>> hostFreepImageData = new ArrayList<HashMap<String,Object>>();
		
		//로그인한 유저의 mb_no 
		int mb_no = fp_MemberVo.getMb_no();
		
		//호스트 메인 페이지에 로그인한 호스트가 등록한 프립의 목록을 담음.		
		ArrayList<FP_FreepVo> hostFreepVoList = hostFreepListSQLMapper.selectHostFreepList(searchType,searchWord,mb_no);
		
		//호스트 메인 페이지에 로그인한 호스트가 등록한 프립의 목록 (이미지)를 담음.
		//호스트가 프립을 등록하는건 하나가 아니기고 여러개 일수 있기 때문에 프립 갯수에 따라 담아줌.
		
		for(int i = 0; i < hostFreepVoList.size(); i++) {
			int freep_no = hostFreepVoList.get(i).getFreep_no();
			ArrayList<FP_FreepImageVo> hostFreepImageVoList = hostFreepListSQLMapper.selectHostFreepImageList(freep_no);
			
			for(FP_FreepImageVo fp_FreepImageVo : hostFreepImageVoList) {
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("fp_FreepImageVo", fp_FreepImageVo);
				hostFreepImageData.add(map);
			}
		}
		
		return hostFreepImageData;
	}
	
	
	public ArrayList<HashMap<String, Object>> getThumbnail(FP_MemberVo fp_MemberVo, String searchType, String searchWord) {	
		
		ArrayList<HashMap<String, Object>> hostFreepImageData = new ArrayList<HashMap<String,Object>>();
		
		//로그인한 유저의 mb_no 
		int mb_no = fp_MemberVo.getMb_no();
		
		ArrayList<FP_FreepVo> hostGetFreepNoList = hostFreepListSQLMapper.selectGetHostFreepNo(mb_no);
		
		for (int i = 0; i < hostGetFreepNoList.size(); i++) {
			
			int freep_no = hostGetFreepNoList.get(i).getFreep_no();			
			
			ArrayList<FP_FreepImageVo> thumbnailList =  hostFreepListSQLMapper.selectThumbnail(searchType, searchType, mb_no, freep_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("thumbnail", thumbnailList);
			
			hostFreepImageData.add(map);
		}

		return hostFreepImageData;
	}
	
	
	public ArrayList<HashMap<String, Object>> getHostFreepVoCount(FP_MemberVo fp_MemberVo, String searchType, String searchWord){
		
		ArrayList<HashMap<String, Object>> hostFreepVoCountData = new ArrayList<HashMap<String,Object>>();
		
		//로그인한 유저의 mb_no 
		int mb_no = fp_MemberVo.getMb_no();
		
		//검색타입, 검색어에 따라서 프립 갯수를 카운트.
		int hostFreepVoCount = hostFreepListSQLMapper.selectHostFreepListCount(searchType,searchWord,mb_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("hostFreepVoCount", hostFreepVoCount);
		
		hostFreepVoCountData.add(map);

		return hostFreepVoCountData;
	}
	
	
}
