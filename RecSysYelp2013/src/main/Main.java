package main;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.LocalTime;

import model.Algorithm;
import model.ReadCSVFile;

public class Main {

	public static void main(String[] args) {
		System.out.println("Started: " + LocalTime.now());
		String pathToResultNotesFile = System.getProperty("user.dir") + "/resources/mapped/results.txt";
		String resultsFilename = "preferences_3_hybrid_weighted";
		String comment = "\ncold start decision: if item based is used, get item avg, else get user avg \nhybrid: weighted - 0.6*userBased + 0.4 * other";
		
		//userBased
		double threshold = 0.1;
		//svd
		int numFeature = 2;
		double lamda = 0.1; 
		int numIterations = 100; 
		//svd++
		int numFeaturePP = 2;
		int numIterationsPP = 10;
		
		ReadCSVFile read = new ReadCSVFile(resultsFilename);
		read.savePreferences(
				Algorithm.TEST_RATINGS_PATH, 	  //path to test data set 
				threshold, 						  //userBased params
				numFeature, lamda, numIterations, //svd params
				numFeaturePP, numIterationsPP 	  //svd++ params
				);
		
		String resultParams = "\nFile name: " + resultsFilename + "\n"
				+ "userBased: threshold: " + threshold + "\n"
				+ "svd: numFeatures: " + numFeature + ", lambda: " + lamda + ", numIterations: " + numIterations + "\n"
				+ "svd++: numFeatures: " + numFeaturePP + ", numIterations: " + numIterationsPP
				+ comment;

		try {
			Files.write(Paths.get(pathToResultNotesFile), resultParams.getBytes(), StandardOpenOption.APPEND);
		} catch (IOException ioe){
			ioe.printStackTrace();
		}
		System.out.println("Finished: " + LocalTime.now());
	}

}
