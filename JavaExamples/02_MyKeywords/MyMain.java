class MyMain {
	public static void main(String[] args) {
		System.out.println("Howdie!");
		for (String val : args) {
			System.out.println("Got: " + val);
		}
	System.exit(0);
	}
}