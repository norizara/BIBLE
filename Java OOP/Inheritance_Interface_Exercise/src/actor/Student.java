package actor;

public class Student extends Actor implements IAttendant {

	private String NIM;
	
	public Student(String NIM, String Name, String DOB) {
		super(Name, DOB);
		this.NIM = NIM;
	}

	public String getNIM() {
		return NIM;
	}
	
}
