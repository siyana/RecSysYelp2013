package model.Data;

public class Item extends DataManagerObject {
	
	public Item(int objID, float avgRating) {
		super(objID, avgRating);
	}
	public int getItemID() {
		return super.getObjID();
	}
	public float getAvgRating() {
		return super.getAvgRating();
	}
	
	
}
