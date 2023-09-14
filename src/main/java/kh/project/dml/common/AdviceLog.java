package kh.project.dml.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Aspect
@Component
public class AdviceLog {
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);

	//@Pointcut("execution(타겟메소드)")
	// .. 매개변수 없거나 여러개 있거나..
	// * 1개 이상일때 씀.
	@Pointcut("execution(public * kh.project.dml..*DAO.*(..))")
	public void daoPointCut() {}
	
	@Pointcut("execution(public * kh.project.dml..*Service.*(..))")
	public void servicePointCut() {}
	
	@Pointcut("execution(public * kh.project.dml..*Controller.*(..))")
	public void controllerPointCut() {}
	
	@Around("daoPointCut()")
	public Object aroundDaoLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.debug("▷▷▷["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			if (args[i] instanceof String && ((String) args[i]).contains("password=")) {
	            args[i] = ((String) args[i]).replaceAll("password=\\w+", "password=******");
	        }
			logger.debug("▷▷▷-args["+i+"] "+args[i]+"");
		}
		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		robj = pjp.proceed();  // 타겟메소드 실행 !!! Around 중요메소드
		stopwatch.stop();
		logger.debug("▷▷▷[Dao ▷ "+stopwatch.getTotalTimeMillis()+"ms]"+robj);
		return robj; // 타겟메소드를 호출한 메소드에 return함
	}
	
	@Around("servicePointCut()")
	public Object aroundSrvLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.debug("▷▷["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			if (args[i] instanceof String && ((String) args[i]).contains("password=")) {
	            args[i] = ((String) args[i]).replaceAll("password=\\w+", "password=******");
	        }
			logger.debug("▷▷-args["+i+"] "+args[i]+"");
		}
		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간
		robj = pjp.proceed();  // 타겟메소드 실행 !!! Around 중요메소드
		logger.debug("▷▷[Srv ▷]"+robj);
		return robj; // 타겟메소드를 호출한 메소드에 return함
	}
	
	@Around("controllerPointCut()")
	public Object aroundCtrLog(ProceedingJoinPoint pjp) throws Throwable {
		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간
		
		logger.debug("▷["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			if (args[i] instanceof String && ((String) args[i]).contains("password=")) {
	            args[i] = ((String) args[i]).replaceAll("password=\\w+", "password=******");
	        }
			logger.debug("▷-args["+i+"] "+args[i]+"");
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		robj = pjp.proceed();  // 타겟메소드 실행 !!! Around 중요메소드
		stopwatch.stop();
		logger.debug("▷[Ctr ▷ "+stopwatch.getTotalTimeMillis()+"ms]"+robj);
		return robj; // 타겟메소드를 호출한 메소드에 return함
	}
	
}
