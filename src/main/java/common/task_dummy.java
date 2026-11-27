package common;

public class task_dummy {
	static int PERFECT_SCORE = 100;
	static int PASSING_SCORE = 70;
	
	public static boolean judge(int score) {
		boolean test = false;
		
		if(score >= PASSING_SCORE) {
			test = true;
		}
		return test;
	}
}
