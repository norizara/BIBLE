package cicinenemama;

import java.util.ArrayList;

public class Customer {

	String name;
	int age;
	ArrayList<Ticket> tickets = new ArrayList<Ticket>();
	public Customer(String name, int age) {
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	public ArrayList<Ticket> getTickets() {
		return tickets;
	}
	
	public void addTicket(Ticket ticket) {
		tickets.add(ticket);
	}
	
}
