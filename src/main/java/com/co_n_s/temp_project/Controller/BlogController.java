package com.co_n_s.temp_project.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.co_n_s.temp_project.blog.BlogService;



@Controller
public class BlogController {

	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="blogService")
	private BlogService blogService;
	
	@RequestMapping(value = "/blog-my.json", method= RequestMethod.POST)
	public ModelAndView selectMyBlog(@RequestBody HashMap<String, Object> param) throws Exception {
		
		ArrayList<HashMap<String, Object>> result = blogService.selectMyBlog(param);
		System.out.println(result);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@RequestMapping(value = "/insertwriteForm.json", method= RequestMethod.POST)
	public ModelAndView insertwriteForm(@RequestBody HashMap<String, Object> param) throws Exception {
		
		System.out.println(param);
		
		int result = blogService.insertWriteForm(param);
		System.out.println(param);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@RequestMapping(value = "/blog-my", method = RequestMethod.GET)
	public ModelAndView selectMy(Locale locale, Model model) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/blog/blog-my");

		return mv;
	}
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public ModelAndView blogMain(Locale locale, Model model) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/blog");

		return mv;
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public ModelAndView writeBlog(Locale locale, Model model) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/blog/writeForm");

		return mv;
	}
	@RequestMapping(value = "/Freeboard", method = RequestMethod.POST)
	public ModelAndView selectCategoryFreeboard(@RequestBody HashMap<String, Object> param) throws Exception {

		ArrayList<HashMap<String, Object>> result = blogService.selectFreeboard(param);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);

		return mv;
	}
	@RequestMapping(value = "/upbitboard", method = RequestMethod.POST)
	public ModelAndView selectCategoryUpbit(@RequestBody HashMap<String, Object> param) throws Exception {

		ArrayList<HashMap<String, Object>> result = blogService.selectUpbit(param);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);

		return mv;
	}
	@RequestMapping(value = "/bithumbboard", method = RequestMethod.POST)
	public ModelAndView selectCategoryBithumb(@RequestBody HashMap<String, Object> param) throws Exception {

		ArrayList<HashMap<String, Object>> result = blogService.selectBithumb(param);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);

		return mv;
	}
	@RequestMapping(value = "/coinoneboard", method = RequestMethod.POST)
	public ModelAndView selectCategoryCoinone(@RequestBody HashMap<String, Object> param) throws Exception {

		ArrayList<HashMap<String, Object>> result = blogService.selectCoinone(param);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);

		return mv;
	}
}
