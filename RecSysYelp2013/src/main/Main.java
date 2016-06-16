package main;

import java.io.IOException;

import org.apache.mahout.cf.taste.common.TasteException;

import model.Algorithm;
import model.Algorithm.RecommenderType;
import model.ReadCSVFile;
import model.Data.DataManager;
import model.Data.DataManagerObject;

public class Main {

	public static void main(String[] args) {

		
		ReadCSVFile read = new ReadCSVFile();
		read.savePreferences(Algorithm.TEST_RATINGS_PATH);
		

	}

}
