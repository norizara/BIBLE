
public abstract class Message {
	protected ILogin loginType;
	protected String sender;
	protected String reciever;
	protected String message;
	public Message(ILogin loginType, String sender, String reciever, String message) {
		this.loginType = loginType;
		this.sender = sender;
		this.reciever = reciever;
		this.message = message;
	}
	public ILogin getLoginType() {
		return loginType;
	}
	public String getSender() {
		return sender;
	}
	public String getReciever() {
		return reciever;
	}
	public String getMessage() {
		return message;
	}
	
	public abstract void send(String username, String password);
	
}
