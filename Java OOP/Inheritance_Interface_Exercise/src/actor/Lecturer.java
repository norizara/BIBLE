package actor;

public class Lecturer extends Actor implements IAttendee1{

	private String NID;
	
	public Lecturer(String NID, String Name, String DOB) {
		super(Name, DOB);
		this.NID = NID;
	}

}
