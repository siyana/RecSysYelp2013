package model;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.svd.ALSWRFactorizer;
import org.apache.mahout.cf.taste.impl.recommender.svd.SVDPlusPlusFactorizer;
import org.apache.mahout.cf.taste.impl.recommender.svd.SVDRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

public class Algorithm {

	public enum RecommenderType {
		RecommenderTypeSVD,
		RecommenderTypeSVDPlusPlus,
		RecommenderTypeUserBased,
		RecommenderTypeItemBased
	}

	public static final String userDir = System.getProperty("user.dir");
	public static final String TRAINING_RATINGS_PATH = userDir + "/resources/mapped/yelp_training_set_review_train.csv";
	public static final String TEST_RATINGS_PATH = userDir + "/resources/mapped/yelp_training_set_review_test.csv";

	private DataModel model = null;
	private DataModel testModel = null;
	private Recommender userBasedRec = null;
	private Recommender itemBasedRec = null;
	private Recommender svdRec = null;
	private Recommender svdPlusPlusRec = null;

	public Algorithm() throws IOException {
		super();
		File ratings = new File(TRAINING_RATINGS_PATH);
		this.model = new FileDataModel(ratings, ",");
		this.testModel = new FileDataModel(new File(TEST_RATINGS_PATH));
	}
	
	public void calculatePreferences(){
		
	}

	public float getPreference(int userID, int itemID, RecommenderType type) {
		Recommender recommender = null;
		try {
			switch (type) {
			case RecommenderTypeSVD:
				recommender = svd();
				break;
			case RecommenderTypeSVDPlusPlus:
				recommender = svdPlusPlus();
				break;
			case RecommenderTypeItemBased:
				recommender = itemBased();
				break;
			case RecommenderTypeUserBased:
				recommender = userBased();
				break;

			default:
				break;
			}
			float preference = recommender.estimatePreference(userID, itemID);
			if (preference == Float.NaN) {
				preference = 0;
			}
			return preference;
		} catch (TasteException e) {
//			e.printStackTrace();
			return -1;
		} catch (IOException e) {
//			e.printStackTrace();
			return -1;
		}
	}

	public Recommender svd() throws TasteException {
		if(this.svdRec == null) {
			RecommenderBuilder recBuilder = new RecommenderBuilder() {
				public Recommender buildRecommender(DataModel arg0) throws TasteException {
					ALSWRFactorizer factorizer = new ALSWRFactorizer(arg0, 2, 0.05, 100);
					Recommender recommender = new SVDRecommender(arg0, factorizer);
					return recommender;
				}
			};
			
			
			this.svdRec = recBuilder.buildRecommender(model);
		}

		return this.svdRec;
		//		printRecommendations(userID, recBuilder, model);
		//		evaluate(recBuilder, model);

	}

	public Recommender svdPlusPlus() throws IOException, TasteException {
		if(this.svdPlusPlusRec == null) {
			RecommenderBuilder recBuilder = new RecommenderBuilder() {
				public Recommender buildRecommender(DataModel arg0) throws TasteException {
					SVDPlusPlusFactorizer svdFact = new SVDPlusPlusFactorizer(arg0, 2, 20);
					Recommender recommender = new SVDRecommender(arg0, svdFact);
					return recommender;
				}
			};
			this.svdPlusPlusRec = recBuilder.buildRecommender(model);
			evaluate(recBuilder, testModel);
		}
				
		return this.svdPlusPlusRec;

		//		 printRecommendations(userID, recBuilder, model);
		//		 evaluate(recBuilder, model);
	}

	public Recommender userBased() throws TasteException {
		if (this.userBasedRec == null) {
			RecommenderBuilder recBuilder = new RecommenderBuilder() {
				public Recommender buildRecommender(DataModel arg0) throws TasteException {
					// TODO Auto-generated method stub
					// find user to user similarities
					UserSimilarity similarity = new PearsonCorrelationSimilarity(arg0);
					UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.05, similarity, arg0);

					// create recommender
					UserBasedRecommender recommender = new GenericUserBasedRecommender(arg0, neighborhood, similarity);
					return recommender;
				}
			};
			
			this.userBasedRec = recBuilder.buildRecommender(model);
		}
		
		return this.userBasedRec;
		//		printRecommendations(userID, recBuilder, model);
		//		evaluate(recBuilder, model);
	}

	public Recommender itemBased() throws TasteException {
		
		if (this.itemBasedRec == null) {
			RecommenderBuilder recBuilder = new RecommenderBuilder() {
				public Recommender buildRecommender(DataModel arg0) throws TasteException {
					ItemSimilarity similarity = new PearsonCorrelationSimilarity(arg0);
					Recommender recommender = new GenericItemBasedRecommender(arg0, similarity);
					return recommender;
				}
			};
			
			this.itemBasedRec = recBuilder.buildRecommender(model);
		}
		
		return this.itemBasedRec;
		//		printRecommendations(userID, recBuilder, model);
		//		evaluate(recBuilder, model);
	}

	private void printRecommendations(int id, RecommenderBuilder recBuilder, DataModel model) {
		try {
			long startTime = System.nanoTime();
			List<RecommendedItem> recommendations = recBuilder.buildRecommender(model).recommend(id, 10);
			for (RecommendedItem recommendation : recommendations) {
				System.out.println("Recommendation: " + recommendation);
			}
			long endTime = System.nanoTime();

			System.out.println("Elapsed time:" + (endTime - startTime));
		} catch (TasteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void evaluate(RecommenderBuilder recBuilder, DataModel model) {
		try {
			Evaluation ev = new Evaluation();
			System.out.println("MAE: " + ev.MAE(recBuilder, null, model, 0.7, 0.1));
			System.out.println("RMSE: " + ev.RMSE(recBuilder, null, model, 0.7, 0.1));
		} catch (TasteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
