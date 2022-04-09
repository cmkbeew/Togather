package team1.togather.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import team1.togather.domain.Member;

public class AdminInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        

        
        HttpSession session = request.getSession();
        Member m = (Member)session.getAttribute("m");
        if(m.getAthur() !=0) {
        	response.sendRedirect("/");
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

        
        
    }
 
 // view까지 처리가 끝난 후에 처리됨
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        

        
        
    }   
}
