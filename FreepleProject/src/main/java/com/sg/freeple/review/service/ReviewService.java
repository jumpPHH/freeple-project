package com.sg.freeple.review.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.freep.mapper.FreepSQLMapper;
import com.sg.freeple.review.mapper.ReviewSQLMapper;
import com.sg.freeple.vo.FP_FreepReviewImageVo;
import com.sg.freeple.vo.FP_FreepReviewVo;
import com.sg.freeple.vo.FP_MemberVo;
import com.sg.freeple.vo.FreepReviewAllInfoVo;

@Service
public class ReviewService {

	@Autowired
	private ReviewSQLMapper reviewSQLMapper;

	public void reviewRegister(FP_FreepReviewVo fp_FreepReviewVo,
			ArrayList<FP_FreepReviewImageVo> fP_FreepReviewImageVoList) {

		int reviewPk = reviewSQLMapper.createReviewPk();
		fp_FreepReviewVo.setReview_no(reviewPk);
		reviewSQLMapper.insertReview(fp_FreepReviewVo);	
		
		for (FP_FreepReviewImageVo fp_FreepReviewImageVo : fP_FreepReviewImageVoList) {
			fp_FreepReviewImageVo.setReview_no(reviewPk);	 
			reviewSQLMapper.insertReviewImage(fp_FreepReviewImageVo);

		}

	}

	public ArrayList<HashMap<String, Object>> getReviewDataList() {
		
		ArrayList<HashMap<String, Object>> reviewDataList = new ArrayList<HashMap<String,Object>>();
		

		ArrayList<FP_FreepReviewVo> fp_FreepReviewVoList = reviewSQLMapper.selectReviewAll();
		for(FP_FreepReviewVo fp_FreepReviewVo : fp_FreepReviewVoList) {
			int mb_no = fp_FreepReviewVo.getMb_no();
			int review_no = fp_FreepReviewVo.getReview_no();
			FP_MemberVo fp_MemberVo = reviewSQLMapper.selectMemberByNo(mb_no);
			
			
			ArrayList<FP_FreepReviewImageVo> fp_FreepReviewImageVoList = reviewSQLMapper.selectImageByNo(review_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fp_FreepReviewVo", fp_FreepReviewVo);
			map.put("fp_MemberVo", fp_MemberVo);
			map.put("fp_FreepReviewImageVoList", fp_FreepReviewImageVoList);
			
			reviewDataList.add(map);
		}
		
			return reviewDataList;
			
		}
		
		
		//ArrayList<FP_FreepReviewImageVo> fp_FreepReviewImageVoList = reviewSQLMapper.selectImageByNo(review_no);
		//map.put("fp_FreepReviewImageVoList", fp_FreepReviewImageVoList);	
		
	public void deleteMyReview(int review_no) {
		reviewSQLMapper.deleteMyReviewByNo(review_no);
		reviewSQLMapper.deleteReviewImageByReviewNo(review_no);
	}

	public void deleteReviewImage(int review_image_no) {
		reviewSQLMapper.deleteReviewImageByNo(review_image_no);
	}

	public HashMap<String, Object> getReviewUpdateDataList(int review_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		FP_FreepReviewVo fp_FreepReviewVo = reviewSQLMapper.selectReviewByNo(review_no);
		int mb_no = fp_FreepReviewVo.getMb_no();
		FP_MemberVo fp_MemberVo = reviewSQLMapper.selectMemberByNo(mb_no);

		map.put("fp_FreepReviewVo", fp_FreepReviewVo);
		map.put("fp_MemberVo", fp_MemberVo);

		ArrayList<FP_FreepReviewImageVo> fP_FreepReviewImageVoList = reviewSQLMapper.selectImageByNo(review_no);

		map.put("fP_FreepReviewImageVoList", fP_FreepReviewImageVoList);

		return map;
	}

	public void selectReviewImageNo() {

		reviewSQLMapper.selectReviewImageAll();
	}

	public void updateReviewData(FP_FreepReviewVo fp_FreepReviewVo,
			ArrayList<FP_FreepReviewImageVo> fP_FreepReviewImageVoList) {

		reviewSQLMapper.updateReviewData(fp_FreepReviewVo);

		for (FP_FreepReviewImageVo fp_FreepReviewImageVo : fP_FreepReviewImageVoList) {
			reviewSQLMapper.insertReviewImage(fp_FreepReviewImageVo);
		}

	}
}
