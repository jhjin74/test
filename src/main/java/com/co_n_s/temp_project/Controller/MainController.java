package com.co_n_s.temp_project.Controller;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(Locale locale, Model model, HashMap<String, Object> param, HttpServletRequest request) throws Exception {

		
		System.out.println(param);
		
		HttpSession session = request.getSession();
		System.out.println("session = " + session.getAttribute("user_nick"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		
		return mv;
	}
	
	@RequestMapping(value = "/bitcoin.ds", method = RequestMethod.GET)
	public ModelAndView detailBitcoin(Locale locale, Model model, HashMap<String, Object> param) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/detail/bitcoin");
		mv.addObject("name", "Bitcoin");
		
		return mv;
	}
	
}
