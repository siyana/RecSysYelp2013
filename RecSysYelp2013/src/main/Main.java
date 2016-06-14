package main;

import java.io.IOException;

import model.Algorithm;

public class Main {

	public static void main(String[] args) {
		Algorithm alg;
		
		try {
			alg = new Algorithm();
			alg.user_based(1);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
