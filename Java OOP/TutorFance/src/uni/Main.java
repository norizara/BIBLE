package uni;

import actor.Student;
import actor.Lecturer;

import java.util.*;

import academic.Class;
import academic.Course;

public class Main {

	public static void main(String[] args) {
		//Student(nim, name, dob)
		ArrayList<Student> students = new ArrayList<>();
		students.add(new Student("2809312213", "David", "16-7-1999"));
    students.add(new Student("2809333797", "Donne", "7-7-1999"));
		
		//Lecturer(lecturerCode, name, dob)
		Lecturer lec1 = new Lecturer("D7732", "Shamuell", "9-9-1999");
		
		//Class(classCode, semester, year)
		Class cl1 = new Class("11LE", 2, "2024/2025"); 
		//Course(courseCode, courseName, credit)
		Course co1 = new Course("COMP990323", "Object Oriented Programming", 2);
		
		cl1.addCourse(co1);
		
		//addStudent(Student)
		cl1.addStudent(students.get(0));
		cl1.addStudent(students.get(1));
		//addLecturer(Lecturer)
		cl1.addLecturer(lec1, co1);
		
		//attend(IAttendant)
		cl1.attend(students.get(0));
		cl1.attend(students.get(1));
		//takeAttendance(IAttendee)
		cl1.takeAttendance(lec1);
		
		cl1.showTodayAttendance();
		
		//showCredits(semester)
		students.get(0).showCredits(2);
		
		//showCourse(semester)
		lec1.showCourse(2);
	}
}