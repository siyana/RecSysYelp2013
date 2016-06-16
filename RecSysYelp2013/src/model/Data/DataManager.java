package model.Data;

import java.util.ArrayList;
import java.util.Iterator;

import model.ReadCSVFile;
import model.ReadCSVFile.AverageRatingsType;

public class DataManager {

	private ArrayList<DataManagerObject> users = null;
	private ArrayList<DataManagerObject> items = null;

	public DataManager() {
		super();
		ReadCSVFile reader = new ReadCSVFile("");
		users = reader.readAverageRatings(AverageRatingsType.AverageRatingsTypeUser);
		items = reader.readAverageRatings(AverageRatingsType.AverageRatingsTypeItem);
	}
	/*
	 * @category Getters and setters
	 * */
	
	public ArrayList<DataManagerObject> getUsers() {
		return users;
	}
	public void setUsers(ArrayList<DataManagerObject> users) {
		this.users = users;
	}
	public ArrayList<DataManagerObject> getItems() {
		return items;
	}
	public void setItems(ArrayList<DataManagerObject> items) {
		this.items = items;
	}
	
	/*
	 * @category Helpers
	 * */
	
	public float averageStarsForUser(int userID){
		for (DataManagerObject dataManagerObject : users) {
			if (dataManagerObject.getObjID() == userID){
				return dataManagerObject.getAvgRating();
			}
		}
		return 0;
	}
	
	public float averageStarsForItem(int itemID){
		for (DataManagerObject dataManagerObject : items) {
			if (dataManagerObject.getObjID() == itemID){
				return dataManagerObject.getAvgRating();
			}
		}
		return 0;
	}
}
