package model.Data;

import java.util.ArrayList;
import java.util.Iterator;

import model.ReadCSVFile;
import model.ReadCSVFile.AverageRatingsType;

public class DataManager {

	private ArrayList<DataManagerObject> users = null;
	private ArrayList<DataManagerObject> items = null;

	private float allUsersAverage = 0;
	private float allItemsAverage = 0;

	public DataManager() {
		super();
		ReadCSVFile reader = new ReadCSVFile("");
		users = reader.readAverageRatings(AverageRatingsType.AverageRatingsTypeUser);
		this.allUsersAverage = average(users);

		items = reader.readAverageRatings(AverageRatingsType.AverageRatingsTypeItem);		
		this.allItemsAverage = average(items);
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

	private float average(ArrayList<DataManagerObject> set){
		float avg = 0;
		for (DataManagerObject dataManagerObject : set) {
			avg += dataManagerObject.getAvgRating();
		}
		return avg/set.size();
	}

	public float averageStarsForUser(int userID){
		for (DataManagerObject dataManagerObject : users) {
			if (dataManagerObject.getObjID() == userID){
				return dataManagerObject.getAvgRating();
			}
		}
		return this.allUsersAverage;
	}

	public float averageStarsForItem(int itemID){
		for (DataManagerObject dataManagerObject : items) {
			if (dataManagerObject.getObjID() == itemID){
				return dataManagerObject.getAvgRating();
			}
		}
		return this.allItemsAverage;
	}
}
