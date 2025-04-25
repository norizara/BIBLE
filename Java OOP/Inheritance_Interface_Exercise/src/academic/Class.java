package academic;

import java.util.ArrayList;
import java.util.HashMap;

import actor.IAttendant;
import actor.IAttendee1;
import actor.Lecturer;
import actor.Student;

public class Class {

	private String classCode;
	private int semester;
	private String year;
	public Course course;
	
	
	private ArrayList<Student> students = new ArrayList<Student>();
	private Lecturer lecturer;
	
	public HashMap<Course, Lecturer> lecHashMap = new HashMap<Course, Lecturer>();
	
	public Class(String classCode, int semester, String year) {
		this.classCode = classCode;
		this.semester = semester;
		this.year = year;
	}
	
	public void addStudent(Student student) {
		students.add(student);
	}
	
	public void addLecturer(Lecturer lecturer, Course course) {
		lecHashMap.put(course, lecturer);
	}

	public void addCourse(Course course) {
		this.course = course;
	}
	
	public int getSemester() {
		return semester;
	}

	public String getYear() {
		return year;
	}

	public ArrayList<Student> getStudents() {
		return students;
	}

	public Lecturer getLecturer() {
		return lecturer;
	}

	public void attend(IAttendant student) {
		
	}

	public void takeAttendance(IAttendee1 lec1) {
		// TODO Auto-generated method stub
		
	}
	
}
