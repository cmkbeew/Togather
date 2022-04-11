package team1.togather.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import team1.togather.domain.GroupTab;
import team1.togather.domain.Member;
import team1.togather.service.GroupTabService;

public class LoginInterceptor implements HandlerInterceptor {
	private GroupTabService groupTabService;
	// controller로 보내기 전에 처리하는 인터셉터
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        

        
        HttpSession session = request.getSession();
        Member m = (Member)session.getAttribute("m");
        if(m==null) {
        	response.sendRedirect("../member/login.do");
        	return false;
        }
        	
        	/*ModelMap modelMap = modelAndView.getModelMap();
        	Object GroupTab = modelMap.get("updateList");
        	modelAndView = new ModelAndView("groupTab/groupUpdate", "updateList", GroupTab);
        	return true;*/
        	
        
        //모임 수정하기했을때 세션 mnum가져와서 멤인그룹 그레이드 검색후 패스 로직
        
        
        
        return true;
    }
	// controller의 handler가 끝나면 처리됨
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

        
        /*ModelMap modelMap = modelAndView.getModelMap();
        //GroupTab updateList = (GroupTab) modelMap.get("updateList");
        Object GroupTab = modelMap.get("updateList");
        System.out.println("포스트핸들러 gseq: "+GroupTab.toString());*/
        
        
        
    }
 
 // view까지 처리가 끝난 후에 처리됨
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        

        
        
    }    

}
