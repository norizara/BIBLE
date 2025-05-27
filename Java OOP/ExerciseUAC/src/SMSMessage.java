
public class SMSMessage extends Message {

	public SMSMessage(ILogin loginType, String sender, String reciever, String message) {
		super(loginType, sender, reciever, message);
	}

	@Override
	public void send(String username, String password) {
		if(loginType.authenticate(username, password)) {
			System.out.println("SMS sent from "+sender+" to "+reciever+": "+message);
		} else {
			System.out.println("SMS authentication failed for user: "+username);
		}
	}
}
