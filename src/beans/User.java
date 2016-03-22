/**
 * 
 */
package beans;

/**
 * @author halfopen
 *
 */
public class User {
	private int id;

	private String name;
	private String password;
	private String email;
	private int loginTimes;
	private String lastLoginTime;
	private int userType;/*0:管理员 1:普通*/
	private int userStatus; /*0:待审阅 1:正常 3:锁定 */
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLoginTimes() {
		return loginTimes;
	}
	public void setLoginTimes(int loginTimes) {
		this.loginTimes = loginTimes;
	}
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	
	
}
