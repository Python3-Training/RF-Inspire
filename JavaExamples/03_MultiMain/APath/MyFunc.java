package APath;

public class MyFunc {

	public static void main(String[] args) {
		System.out.println("JEDI:");
		for (String val : args) {
			System.out.println("Got: " + val);
		}
	System.exit(123);
	}

	public static void justDoIt() {
		System.out.println("JEDI!");
		System.exit(123);
	}

	public static void justDoIt(String[] args) {
		System.out.println("JEDI:");
		for (String val : args) {
			System.out.println("Got: " + val);
		}
	System.exit(123);
	}
}