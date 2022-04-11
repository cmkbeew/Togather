package team1.togather.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Aspect
@Component
public class SampleLogAdvice {//Aspec을 지시해주는 클래스, @before~afterthrowing이런것들을 포인트컷이라함
	@Before("execution(* jin.md.service.SampleLogService*.*(..))")
	public void logBefore() {
		log.info("(3) logBefore() 수행");
	}
	@Around("execution(* jin.md.service.SampleLogService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) throws Throwable {
		long start = System.currentTimeMillis();
		
		log.info("#(1) target class: "+ pjp.getTarget().getClass());
		log.info("#(2) args: "+ Arrays.deepToString(pjp.getArgs()));
		Object result = null;
		try {
			result = pjp.proceed(); // 비즈니스 메소드로 진행하도록 하는 메솓,
		}catch(Throwable t) {
			System.out.println("예외발생 t: "+t);
		}
		
		long end = System.currentTimeMillis();
		log.info("(4)수행시간: " +(end-start));
		return result;
	}
	@After("execution(* jin.md.service.SampleLogService*.*(..))")
	public void logAfter() {
		log.info("#(5) logafter() 수행");
	}
	@AfterThrowing(pointcut = "execution(* jin.md.service.SampleLogService*.*(..))", throwing="exception")
	//throwing이 있기때문에 이런경우에는 pointcut을 명명해줘야함
	public void logAfterThrowing(Exception exception) {
		log.info("#(5) logAfterThrowing Exception: "+ exception);
	}
}
