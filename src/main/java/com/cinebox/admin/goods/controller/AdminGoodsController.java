package com.cinebox.admin.goods.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cinebox.cscenter.vo.Criteria;
import com.cinebox.cscenter.vo.SearchCriteria;

public interface AdminGoodsController {
	public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public ModelAndView modifyGoodsForm(@RequestParam("movie_id") int movie_id,
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ResponseEntity modifyGoodsInfo( @RequestParam("movie_id") String movie_id,
                                 @RequestParam("mod_type") String mod_type,
                                 @RequestParam("value") String value,
			                     HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public void  removeGoodsImage(@RequestParam("movie_id") int movie_id, @RequestParam("image_number") int image_number, @RequestParam("image_file_name") String image_file_name,
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public void  addNewGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public void modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public String deleteNewGoods(int movie_id) throws Exception;
	
	public ModelAndView searchMovie(@ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request) throws Exception; 
}
