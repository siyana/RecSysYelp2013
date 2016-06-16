package model.Data;

public class User extends DataManagerObject {

	
	public User(int objID, float avgRating) {
		super(objID, avgRating);
	}

	public int getUserID() {
		return super.getObjID();
	}

	public float getAvgRating() {
		return super.getAvgRating();
	}
	
	
}
