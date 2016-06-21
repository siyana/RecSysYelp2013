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
		String pathToTrainErrorsNotesFile = System.getProperty("user.dir") + "/resources/mapped/train_rmse.txt";
		String resultsFilename = "submission_test";
		String comment = "\ncold start decision: get avg ot item avg and user avg \nhybrid: none";
		
		//userBased
		double threshold = 0.5;
		//svd
		int numFeature = 2;
		double lamda = 0.1; 
		int numIterations = 100; 
		//svd++
		int numFeaturePP = 2;
		int numIterationsPP = 10;
		
		ReadCSVFile read = new ReadCSVFile(resultsFilename);
		read.savePreferences(
				Algorithm.SUBMISSION_TEST_RATINGS_PATH, 	  //path to test data set 
				threshold, 						  //userBased params
				numFeature, lamda, numIterations, //svd params
				numFeaturePP, numIterationsPP 	  //svd++ params
				);
		
//		String resultParams = "\nFile name: " + resultsFilename + "\n"
//				+ "userBased: threshold: " + threshold + "\n"
//				+ "svd: numFeatures: " + numFeature + ", lambda: " + lamda + ", numIterations: " + numIterations + "\n"
//				+ "svd++: numFeatures: " + numFeaturePP + ", numIterations: " + numIterationsPP
//				+ comment;
		
//		Algorithm alg;
//		try {
//			alg = new Algorithm();
//			alg.setThreshold(threshold);
//			alg.setNumFeature(numFeature);
//			alg.setLamda(lamda);
//			alg.setNumIterations(numIterations);
//			alg.setNumFeaturePP(numFeaturePP);
//			alg.setNumIterationsPP(numIterationsPP);
//			
//			alg.estimateAlgorithms();
//			
//			String resultErrorParams = "\nFile name: " + resultsFilename + "\n"
//					+ "user based: " + alg.getUserBasedRMSE() + "\n"
//					+ "item based: " + alg.getItemBasedRMSE() + "\n"
//					+ "svd: " + alg.getSvdRMSE() + "\n"
//					+ "svd++: " + alg.getSvdPlusPlusRMSE() + "\n";
//			
//			try {
//				Files.write(Paths.get(pathToTrainErrorsNotesFile), resultErrorParams.getBytes(), StandardOpenOption.APPEND);
//			} catch (IOException ioe){
//				ioe.printStackTrace();
//			}
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		

//		try {
//			Files.write(Paths.get(pathToResultNotesFile), resultParams.getBytes(), StandardOpenOption.APPEND);
//		} catch (IOException ioe){
//			ioe.printStackTrace();
//		}
		System.out.println("Finished: " + LocalTime.now());
	}

}
