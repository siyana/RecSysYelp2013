package model;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import model.Algorithm.RecommenderType;

public class ReadCSVFile {

	private static final String FILE_PATH = Algorithm.userDir + "/resources/mapped/preferences.csv";
	private FileWriter fileWriter = null;

	public void run(String path) {

		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";

		try {
			Algorithm alg = new Algorithm();
			fileWriter = new FileWriter(FILE_PATH);
			br = new BufferedReader(new FileReader(path));
			while ((line = br.readLine()) != null) {
				String[] splitedLine = line.split(cvsSplitBy);
				int userID = Integer.parseInt(splitedLine[0]);
				int itemID = Integer.parseInt(splitedLine[1]);
				float realPreference = Integer.parseInt(splitedLine[2]);
				float svdPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeSVD);
				float svdPlusPlusPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeSVDPlusPlus);
				float userBasedPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeUserBased);
				float itemBasedPreference = alg.getPreference(userID, itemID, RecommenderType.RecommenderTypeItemBased);
				String csvLine = userID + "," + itemID + "," + realPreference + 
						"," + svdPreference + "," + svdPlusPlusPreference +
						"," + userBasedPreference + "," + itemBasedPreference;
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
