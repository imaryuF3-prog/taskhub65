package common;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

public class AuthenticationFilter {
	private static long LIMIT_HOUR = 12;
	
	public static boolean doFilterInternal(HttpSession session) {
		if(session == null) {
			return false;
		}
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
		LocalDateTime loginTime = LocalDateTime.parse(((String) session.getAttribute("loginTime")), formatter);
		LocalDateTime currentTime = LocalDateTime.now();
		
		if(currentTime.isBefore(loginTime.plusHours(LIMIT_HOUR))) {
			return true;
		}
		
		return false;
	}
}
