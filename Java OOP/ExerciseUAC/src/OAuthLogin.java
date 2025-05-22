
public class OAuthLogin implements ILogin {
	private String token;
	public OAuthLogin(String token) {
		this.token = token;
	}

	@Override
	public boolean authenticate(String username, String password) {
		if(this.token == password) {
			return true;
		}
		return false;
	}

}
