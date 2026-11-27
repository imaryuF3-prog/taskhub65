package common;

import javax.servlet.http.HttpSession;

import model.entity.TaskBean;

public class PermissionFilter {
	
	/**
	 * @author H Suzuki
	 * @param session
	 * @param task
	 * @return 権限があるかどうか(true : 権限がある)
	 */
	public static boolean doFilter(HttpSession session, TaskBean task) {
		if(session == null) {
			return false;
		}
		
		String userId = ((UserBean)session.getAttribute("userInfo")).getUserId();
		if(userId.equals(task.getUserId())) {
			return true;
		}
		
		return false;
	}
	
}
