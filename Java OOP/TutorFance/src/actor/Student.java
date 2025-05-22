package actor;

import java.util.ArrayList;
import java.util.List;

import academic.Course;

public class Student extends Person implements IAttendant{
	private String nim;
	private List<Course> courses = new ArrayList<>();
	private int credits = 0;
	
	public Student(String nim, String name, String dob) {
		super(name, dob);
		this.nim = nim;
	}

	public String getNim() {
		return nim;
	}

	public void setNim(String nim) {
		this.nim = nim;
	}
	
	@Override
	public void attend() {
		System.out.println(name + " is attending the class");
	}

	public void showCredits(int i) {
		for (Course course: courses) {
			if(course.getCredit() == i) credits+= course.getCredit();
		}
		System.out.println(name+" has: "+credits+" credits");
	}
	
	
	public void addCourse(Course course) {
		courses.add(course);
	}

}
