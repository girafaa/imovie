package mp.member.controller;


import java.io.IOException;
import java.security.PrivateKey;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mp.member.bean.Member;
import mp.member.model.MemberDao;
import mp.member.service.MemberService;
import mp.util.RSA;
import mp.util.RSAUtil;

@Controller
public class MemberController {
	private Logger log = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	@Autowired
	private MemberDao memDao;
	@Autowired
	private MemberService memberservice;
	
	private RSAUtil rsaUtil = new RSAUtil();
	
	@RequestMapping("/login")
	public String login(Model model) throws IOException {
		//기존에 RSA 키 존재 여부 확인
	    PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
	    if (key != null) { // 기존 key 파기
	        session.removeAttribute("RSAprivateKey");
	    }
	    // RSA 키 생성
	    RSA rsa = rsaUtil.createRSA();		//새로운 키값 가진 rsa생성
	    model.addAttribute("modulus", rsa.getModulus());	
	    model.addAttribute("exponent", rsa.getExponent());
	    log.debug("modulus : "+rsa.getModulus());	  //b982da0e804995c38d8478e89dd27151857cbceac228a37384ed31b440dda953c9ddb61db66ea3ebe1a2c0c4270e04456bd93fe5cdde97e3a904e38e649eecfd3570de65adfd39b4e246f60d02be4e8e69a44ab8cffe17e90cc23f4bb2ff3136aa7e7efa4cd76ec239f33c736f182768a45d2284050971952adc2043ca3352f9
	    log.debug("exponent : "+rsa.getExponent());	    //10001
	    log.debug("privateKey : "+rsa.getPrivateKey());	 //sun.security.rsa.RSAPrivateCrtKeyImpl@fff48b8c
	    session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
	
		return "member/login";
		
	}

	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String login(String id, String pw, RedirectAttributes ra,Model model) {
		// 개인키 취득
	    PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
	    if (key == null) {
	        ra.addFlashAttribute("resultMsg", "비정상 적인 접근 입니다.");		//이게머지
	        return "redirect:/login";
	    }
	 
	    // session에 저장된 개인키 초기화
	    session.removeAttribute("RSAprivateKey");
	    String idOrigin="";
	    String pwOrigin="";
	    // 아이디/비밀번호 복호화
	    try {
	        idOrigin = rsaUtil.getDecryptText(key, id);
	        pwOrigin = rsaUtil.getDecryptText(key, pw);
	    } catch (Exception e) {
	        ra.addFlashAttribute("resultMsg", "비정상 적인 접근 입니다.");
	        return "redirect:/login";
	    }
	    log.debug("idOrigin : {}",idOrigin);
	    log.debug("pwOrigin : {}",pwOrigin);

		boolean loginflag=memberservice.login(idOrigin, pwOrigin);
	    log.debug("loginflag : {}",loginflag);
		session.setAttribute("loginCondition", loginflag);
	    if(loginflag) {
	    	session.setAttribute("loginId", idOrigin);
	    	session.setAttribute("loginGrade", memberservice.myinfo(idOrigin).getGrade());
	    	
//	    	log.debug("체크여부 : {}",save);
//			//----- 아이디 저장 쿠키------
//			Cookie c = new Cookie("saveid",idOrigin);
//			if(save==null){
//				//저장 체크안할 시 쿠키 제거			
//				c.setMaxAge(0);	
//			}
//			else{
//				c.setMaxAge(1*24*60*60);
//			}
//				c.setPath("/home");
//				response.addCookie(c);	
//	    	
	    	
	    	
	    }else {
	        ra.addFlashAttribute("resultMsg", "로그인실패");
	    	return "redirect:/login";
	    }
		return "redirect:/";
	}
	
	
	
	@RequestMapping("/register")
	public String register() {
		return "member/register";
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(String id, String pw, String birth, String phone, String email,Model model) {
		boolean flag = memberservice.register(id, pw, birth, phone, email);
		if(flag) {
		  model.addAttribute("re_reg_reg", "ok");	
		  return "redirect:/home";
		}else {
			model.addAttribute("re_reg_reg", "no");	
		return "member/register";
		}
	}
//-----------------------------------------------------------------------------------------	
	@RequestMapping(value = {"/myInfo","/myinfo"})//다중매핑(둘중 어느걸로 들어가도 상관 없음)
	public String myinfo(HttpSession session, Model model) {
		String loginid = (String)session.getAttribute("loginId");
		Member member = memberservice.myinfo(loginid);
		model.addAttribute("member",member);
		return "member/myInfo";
	}
	@RequestMapping("/edit")
	public String edit(HttpSession session, Model model) {
		String loginid = (String)session.getAttribute("loginId");
		Member member = memberservice.myinfo(loginid);
		model.addAttribute("member",member);
		return "member/edit";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.POST)
	public String edit(String id,String pw,String phone,String email,HttpSession session,Model model) {
		memberservice.edit(id, pw, phone, email);
		String loginid = (String)session.getAttribute("loginId");
		Member member = memberservice.myinfo(loginid);
		model.addAttribute("member",member);
		return "member/myInfo";
	}
	
	//-----------------------------------------------
	@SuppressWarnings("deprecation")
	@RequestMapping("/logout")
	public String logout(Model model) {
		boolean flag = false;
		try {
			flag = session.getAttribute("loginId")!=null;
			if(!flag) {
				log.debug("로그인상태가 아닙니다.");
				throw new Exception();
			}
			session.invalidate();
//			session.removeValue("loginId");
//			session.removeValue("loginGrade");
//			session.removeValue("loginCondition");
//			session.removeValue("myInfo");
			log.debug("로그아웃 완료");
		} catch (Exception e) {
		    log.debug("로그아웃 실패");	
		}

		return "redirect:/login";
	}
	@RequestMapping({"/idCheck","/idcheck","/id_check"})
	public String idCheck(String id,Model model) {
		log.debug("id={}",id);
		request.setAttribute("re_idCheck", memDao.idCheck(id));
		model.addAttribute("re_idCheck", memDao.idCheck(id));
		
		return "member/register";
		}
	@RequestMapping("/admin")
	public String admin(Model model) {
		List<Member> list = memDao.memberlist();
		model.addAttribute("list",list);
		return "member/admin";
	}
	//--------------------------------------------------------
	@RequestMapping({"/memDelete","/memdelete"})
	public String memdelete(String no,Model model) {
		Member member = memDao.selectMem(no);
		boolean flag=memDao.delete(member.getId(), member.getPw());
		memberservice.message(response, "삭제"+(flag?"성공":"실패"));
		model.addAttribute("re_admin", true);
		return "member/admin";
	}
	
	@RequestMapping(value = {"/memInfo","/meminfo"})//다중매핑(둘중 어느걸로 들어가도 상관 없음)
	public String memInfo(String no,Model model) {
		model.addAttribute("memInfo",memDao.selectMem(no));
		return "member/memInfo";
	}
	@RequestMapping(value = {"/memEdit","/memedit"})//다중매핑(둘중 어느걸로 들어가도 상관 없음)
	public String memEdit(String no,Model model) {
		model.addAttribute("memInfo",memDao.selectMem(no));
		return "member/memedit";
	}
	@RequestMapping(value = {"/memEdit","/memedit"}, method = RequestMethod.POST)//다중매핑(둘중 어느걸로 들어가도 상관 없음)
	public String memEdit(String no,String email,String grade,String phone,String point,Model model) {
		/*log.debug("pw={}",pw);
		log.debug("birth={}",birth);
		log.debug("email={}",email);
		log.debug("grade={}",grade);
		log.debug("phone={}",phone);
		log.debug("point={}",point);*/
		memberservice.adminEdit(no,  email, grade, phone, point);
		model.addAttribute("re_admin",true);
		return "member/admin";
	}
	/*@RequestMapping("/drop")
	public String drop() {
		return "member/drop";
	}*/
	
	
	
}
