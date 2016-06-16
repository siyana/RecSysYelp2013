package model.Data;

public class DataManagerObject {
	private int objID;
	private float avgRating;
	
	public DataManagerObject(int objID, float avgRating) {
		super();
		this.objID = objID;
		this.avgRating = avgRating;
	}

	public int getObjID() {
		return objID;
	}

	public float getAvgRating() {
		return avgRating;
	}
	
	
}
