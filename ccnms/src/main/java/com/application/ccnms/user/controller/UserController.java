package com.application.ccnms.user.controller;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccnms.user.dto.UserDTO;
import com.application.ccnms.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/register")
	public ModelAndView registerUser() throws Exception {
		return new ModelAndView("/user/register");
	}
	
	@PostMapping("/register")
	public @ResponseBody String register(HttpServletRequest request, UserDTO userDTO) throws Exception {
		String userEmailYN = request.getParameter("userEmailYN");
		if (userEmailYN == null) {
			userEmailYN = "N";
		}
		else userEmailYN = "Y";
		userDTO.setEmailYN(userEmailYN);
		
		String emailDomain = request.getParameter("emailDomain");
		String email = request.getParameter("email");
		if (emailDomain != "") {
			email += emailDomain;
		}
		userDTO.setEmail(email);
		if (userService.addUser(userDTO) == true) {
			String userId = userDTO.getUserId();
			userService.getEmailCheck(email, userId);
		}
		String jsScript = "<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
			   jsScript +="</script>";
		
		return jsScript;
	}
	
	@PostMapping("/duplicateUserId")
	public @ResponseBody String duplicateUserId(@RequestParam("userId") String userId) throws Exception{
		return userService.checkDuplicateUserId(userId);
	}
	
	@GetMapping("/loginUser")
	public ModelAndView loginUser() throws Exception {
		return new ModelAndView("/user/loginUser");
	}
	
	@PostMapping("/loginUser")
	public ModelAndView loginUser(HttpServletRequest request, UserDTO userDTO) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		
		if(userService.loginUser(userDTO) != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userDTO.getUserId());
			session.setAttribute("role", "user");
			session.setAttribute("myKeepCnt", userService.getMyKeepCnt(userDTO.getUserId()));
			session.setAttribute("myCartCnt", userService.getMyCartCnt(userDTO.getUserId()));
			session.setAttribute("myOrderCnt", userService.getMyOrderCnt(userDTO.getUserId()));
			
			if (!userService.getEmailIdentify(userDTO.getUserId())) {
				mv.setViewName("/user/authenticationEmail");
			}
			else {
				mv.setViewName("redirect:/");
			}
		}
		else {
			mv.setViewName("/user/loginUser");
			mv.addObject("menu", "miss");
		}
		return mv;
	}
	@GetMapping("/logout")
	public @ResponseBody String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		String jsScript = "<script>";
			   jsScript +="location.href='" + request.getContextPath() + "/'";
		       jsScript +="</script>";
	
		return jsScript;
	}
	
	@PostMapping("/emailAuthentication")
	public ModelAndView emailAuthentication (UserDTO userDTO, HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();
		if(!userService.emailAuthentication(userDTO)) {
			session.setAttribute("identify", "fail");
			return new ModelAndView("/user/authenticationEmail");
		}
		else 
			return new ModelAndView("redirect:/");
	}
	
	@GetMapping("/findUser")
	public ModelAndView findUser (@RequestParam("find") String find) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("find", find);
		mv.setViewName("/user/findUser");
		return mv;
	}
	@GetMapping("/findId") 
	public @ResponseBody String findId (@RequestParam("userNm") String userNm, @RequestParam("email") String email) throws Exception {
		return userService.getFindId(userNm, email);
	}
	
	@GetMapping("/findPw")
	public @ResponseBody String findPw (@RequestParam("userId") String userId, @RequestParam("email") String email) throws Exception {
		return userService.getFindPw(userId, email);
	}
	
	@PostMapping("/changePw")
	public ModelAndView changePw (UserDTO userDTO) throws Exception {
		userService.modifyPw(userDTO);
		return new ModelAndView("redirect:/");
	}
	
	@GetMapping("/updateLike")
	public ResponseEntity<Object> updateLike (@RequestParam ("writer") String writer) throws Exception {
		userService.addLikePoint(writer);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
