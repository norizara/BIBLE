
public class EmailMessage extends Message {

	public EmailMessage(ILogin loginType, String sender, String reciever, String message) {
		super(loginType, sender, reciever, message);
	}

	
	@Override
	public void send(String username, String password) {
		if(loginType.authenticate(username, password)) {
			System.out.println("Email sent from "+sender+" to "+reciever+": "+message);
		} else {
			System.out.println("Email authentication failed for user: "+username);
		}
	}
}
