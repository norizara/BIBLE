package coba;
import java.util.*;

public class Main {

	public Main() {
		// TODO Auto-generated constructor stub
	}
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Apa kabar kamu?");
		Scanner input = new Scanner(System.in);
		String answer = input.nextLine();
		Author author1 = new Author("Babi");
		System.out.println(author1.getName());
		System.out.println(answer);
		input.close();
	}
}
