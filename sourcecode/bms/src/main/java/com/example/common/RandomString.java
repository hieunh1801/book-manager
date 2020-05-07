package com.example.common;

import java.util.Random;

public class RandomString {
	private int lenght;
	public RandomString() {
		this.lenght = 10;
	}
	public RandomString(int lenght) {
		this.lenght = lenght;
	}
	public String random() {
		int leftLimit = 97; // letter 'a'
		int rightLimit = 122; // letter 'z'
		
		Random random = new Random();
		StringBuilder buffer = new StringBuilder(this.lenght);
		for (int i = 0; i < this.lenght; i++) {
			int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
			buffer.append((char) randomLimitedInt);
		}
		String generatedString = buffer.toString();

		return generatedString;
	}
}
