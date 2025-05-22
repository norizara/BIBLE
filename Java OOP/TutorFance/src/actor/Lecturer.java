package actor;

import java.util.ArrayList;
import java.util.List;

import academic.Course;

public class Lecturer extends Person implements IAttendee{
	private String lectureCode;
	private List<Course> courses = new ArrayList<>();

	public Lecturer(String lectureCode, String name, String dob) {
		super(name, dob);
		this.lectureCode = lectureCode;
	}

	public String getLectureCode() {
		return lectureCode;
	}

	public void setLectureCode(String lectureCode) {
		this.lectureCode = lectureCode;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public void addCourseLecture(Course course) {
		courses.add(course);
	}
	
	@Override
	public void takeAttendance() {
		System.out.println(name+" is taking attendance");
	}

	public void showCourse(int i) {
		System.out.println(name+" is teaching: ");
		for(Course course: courses) {
			System.out.println(" -"+course.getCourseName());
		}
		
	}
}
