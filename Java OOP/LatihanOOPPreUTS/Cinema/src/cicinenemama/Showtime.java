package cicinenemama;

import java.util.ArrayList;

public class Showtime {

	String time;
	String date;
	Movie movie;
	ArrayList<Ticket> tickets = new ArrayList<Ticket>();
	
	public Showtime(String time, String date, Movie movie) {
		this.time = time;
		this.date = date;
		this.movie = movie;
	}
	public String getTime() {
		return time;
	}
	public String getDate() {
		return date;
	}
	public Movie getMovie() {
		return movie;
	}
	public ArrayList<Ticket> getTickets() {
		return tickets;
	}

	public void addTicket(Ticket ticket) {
		tickets.add(ticket);
	}
	
	
	
}
