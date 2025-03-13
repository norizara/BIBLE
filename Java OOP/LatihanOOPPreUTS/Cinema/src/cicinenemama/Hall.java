package cicinenemama;

import java.util.ArrayList;

public class Hall {
	int hallNumber;
	int capacity;
	ArrayList<Showtime> showtimes = new ArrayList<Showtime>();
	
	Hall(int hallNumber, int capacity) {
		this.hallNumber = hallNumber;
		this.capacity = capacity;
	}
	public int getHallNumber() {
		return hallNumber;
	}

	public int getCapacity() {
		return capacity;
	}

	public ArrayList<Showtime> getShowtimes() {
		return showtimes;
	}

	public void addShowtime(Showtime showtime) {
		showtimes.add(showtime);
	}


}
