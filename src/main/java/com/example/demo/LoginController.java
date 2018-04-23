package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@GetMapping(value="/facebook")
	public ModelAndView renderFB() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("facebookindex");
		return mv;
	}
	
	@PostMapping(value="/facebookRedirect")
	public ModelAndView handleRedirect(
			@RequestParam(name="myId") String myId,
			@RequestParam(name="myName") String myName,
			@RequestParam(name="myFriends") String myFriends,
			@RequestParam(name="myEmail") String myEmail,
	HttpServletRequest req) {
		System.out.println(myId + myName + myEmail + myFriends);
		String[] splitted = myFriends.split("/");
		for(int i=0; i<splitted.length ; i++) {
			System.out.println(i + " : " + splitted[i]);
		}
		return new ModelAndView("profile");
	}
	
	@PostMapping(value="/facebookFriends")
	public ModelAndView handlingRedirect(
			@RequestParam(name="myId") String myId,
			@RequestParam(name="myName") String myName,
			@RequestParam(name="myFriends") String myFriends,
			@RequestParam(name="myEmail") String myEmail,
	HttpServletRequest req) {
		System.out.println(myId + myName + myEmail + myFriends);
		String[] splitted = myFriends.split("/");
		for(int i=0; i<splitted.length ; i++) {
			System.out.println(i + " : " + splitted[i]);
		}
		return new ModelAndView("friends");
	}
	@PostMapping(value="/home")
	public ModelAndView home(
			@RequestParam(name="myId") String myId,
			@RequestParam(name="myName") String myName,
			@RequestParam(name="myFriends") String myFriends,
			@RequestParam(name="myEmail") String myEmail,
	HttpServletRequest req) {
		System.out.println(myId + myName + myEmail + myFriends);
		String[] splitted = myFriends.split("/");
		for(int i=0; i<splitted.length ; i++) {
			System.out.println(i + " : " + splitted[i]);
		}
		return new ModelAndView("facebookindex");
	}
	@PostMapping(value="/profile")
	public ModelAndView profile(
			@RequestParam(name="myId") String myId,
			@RequestParam(name="myName") String myName,
			@RequestParam(name="myFriends") String myFriends,
			@RequestParam(name="myEmail") String myEmail,
	HttpServletRequest req) {
		System.out.println(myId + myName + myEmail + myFriends);
		String[] splitted = myFriends.split("/");
		for(int i=0; i<splitted.length ; i++) {
			System.out.println(i + " : " + splitted[i]);
		}
//		ModelAndView profilePage = new ModelAndView();
//		profilePage.setViewName("profile");
//		
//		return profilePage;
		return new ModelAndView("profile");
	}

	
}
