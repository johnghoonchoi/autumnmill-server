package jong;

public class Jong {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/*
	 * 
	 * <jsp:useBean id="test" class="jong.Jong" scope="page" />
<% test.setName("testtt"); %>
<%= test.getName() %>
	 */
	
}

