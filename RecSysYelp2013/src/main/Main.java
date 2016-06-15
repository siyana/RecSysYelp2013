package main;

import java.io.IOException;

import org.apache.mahout.cf.taste.common.TasteException;

import model.Algorithm;
import model.Algorithm.RecommenderType;
import model.ReadCSVFile;

public class Main {

	public static void main(String[] args) {
		Algorithm alg;
		
		try {
//			ReadCSVFile read = new ReadCSVFile();
//			read.run(Algorithm.TEST_RATINGS_PATH);
			
			alg = new Algorithm();
		alg.svdPlusPlus();
//			System.out.println("Preference: " + alg.getPreference(1, 1, RecommenderType.RecommenderTypeUserBased));
//			System.out.println("Preference: " + alg.getPreference(1, 1, RecommenderType.RecommenderTypeSVD));
//			System.out.println("Preference: " + alg.getPreference(1, 1, RecommenderType.RecommenderTypeItemBased));
//			System.out.println("Preference: " + alg.getPreference(1, 1, RecommenderType.RecommenderTypeSVDPlusPlus));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TasteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
