
public class BasicLogin implements ILogin {

	private String username, password;
	
	public BasicLogin(String username, String password) {
		this.username = username;
		this.password = password;
	}

	@Override
	public boolean authenticate(String username, String password) {
		if(this.username.equals(username) && this.password.equals(password)) {
			return true;
		}
		return false;
	}

}
