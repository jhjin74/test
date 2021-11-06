package com.co_n_s.temp_project.Controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExchangeController {
	
	
	@RequestMapping(value = "/exchange/upbit", method = RequestMethod.GET)
	public ModelAndView exchangeUpbit(Locale locale, Model model) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/exchange/upbit");

		return mv;
	}
	
	@RequestMapping(value = "/exchange/bithumb", method = RequestMethod.GET)
	public ModelAndView exchangeBithumb(Locale locale, Model model) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/exchange/bithumb");

		return mv;
	}
}
