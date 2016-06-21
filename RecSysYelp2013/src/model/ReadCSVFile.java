package model;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import model.Algorithm.RecommenderType;
import model.Data.DataManagerObject;

public class ReadCSVFile {

	public enum AverageRatingsType {
		AverageRatingsTypeUser,
		AverageRatingsTypeItem
	}
	private static final String USERS_AVG_PATH = Algorithm.userDir + "/resources/mapped/users_average_ratings.csv";
	private static final String BUSINESS_AVG_PATH = Algorithm.userDir + "/resources/mapped/business_average_ratings.csv";
	private String resultFileName;
	private String resultFilePath;;
	private FileWriter fileWriter = null;

	public ReadCSVFile(String resultFileName){
		this.resultFileName = resultFileName;
		resultFilePath = Algorithm.userDir + "/resources/mapped/" + resultFileName + ".csv";
	}
	public ArrayList<DataManagerObject> readAverageRatings(AverageRatingsType type) {
		String path = avgRatingsPathForType(type);
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		ArrayList<DataManagerObject> list = new ArrayList<DataManagerObject>();

		try {
			br = new BufferedReader(new FileReader(path));
			while ((line = br.readLine()) != null) {
				String[] splitedLine = line.split(cvsSplitBy);
				DataManagerObject obj = parsedObject(splitedLine);
				if (obj != null ) {
					list.add(obj);
				}
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	private DataManagerObject parsedObject(String[] line){
		int id = Integer.parseInt(line[0]);
		float stars = Float.parseFloat(line[1]);
		return new DataManagerObject(id,stars);
	}

	private String avgRatingsPathForType (AverageRatingsType type) {
		String path = "";
		switch (type) {
		case AverageRatingsTypeUser:
			path = USERS_AVG_PATH;
			break;
		case AverageRatingsTypeItem:
			path = BUSINESS_AVG_PATH; 
			break;
		default:
			break;
		}

		return path;
	}

	public void savePreferences(String trainingSetFilePath, double threshold, 
			int numFeature, double lamda, int numIterations,
			int numFeaturePP, int numIterationsPP) {
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";

		try {
			Algorithm alg = new Algorithm();
			alg.setThreshold(threshold);
			alg.setNumFeature(numFeature);
			alg.setLamda(lamda);
			alg.setNumIterations(numIterations);
			alg.setNumFeaturePP(numFeaturePP);
			alg.setNumIterationsPP(numIterationsPP);
			fileWriter = new FileWriter(resultFilePath);
			br = new BufferedReader(new FileReader(trainingSetFilePath));
			while ((line = br.readLine()) != null) {
				String[] splitedLine = line.split(cvsSplitBy);
				int userID = Integer.parseInt(splitedLine[0]);
				int itemID = Integer.parseInt(splitedLine[1]);
//				float realPreference = Integer.parseInt(splitedLine[2]);
//				float svdPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeSVD);
//				float svdPlusPlusPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeSVDPlusPlus);
//				float userBasedPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeUserBased);
//				float itemBasedPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeItemBased);
//				String csvLine = userID + "," + itemID + "," + realPreference + 
//						"," + svdPreference + "," + svdPlusPlusPreference +
//						"," + userBasedPreference + "," + itemBasedPreference;
//				writeToCSV(csvLine);
				
				float userBasedPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeUserBased);
				String csvLine = userID + "," + itemID + "," + userBasedPreference;
				writeToCSV(csvLine);

			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();

		} finally {		
			try {
				fileWriter.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println("Done");
	}

	public void writeToCSV(String line) {	  
		try {
			fileWriter.append(line);
			fileWriter.append("\n");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
