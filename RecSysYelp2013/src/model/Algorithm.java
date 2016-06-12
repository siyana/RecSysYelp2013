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

	private static final String RATINGS_PATH = "";

	private DataModel model = null;

	public Algorithm() throws IOException {
		super();
		File ratings = new File(RATINGS_PATH);
		this.model = new FileDataModel(ratings, ",");
	}

	public void svd(int userID) {
		RecommenderBuilder recBuilder = new RecommenderBuilder() {
			public Recommender buildRecommender(DataModel arg0) throws TasteException {
				ALSWRFactorizer factorizer = new ALSWRFactorizer(arg0, 2, 0.05, 100);
				Recommender recommender = new SVDRecommender(arg0, factorizer);
				return recommender;
			}
		};

		printRecommendations(userID, recBuilder, model);
		evaluate(recBuilder, model);

	}

	public void svdplusplus(int userID) throws IOException, TasteException {
		RecommenderBuilder recBuilder = new RecommenderBuilder() {
			public Recommender buildRecommender(DataModel arg0) throws TasteException {
				SVDPlusPlusFactorizer svdFact = new SVDPlusPlusFactorizer(arg0, 2, 20);
				Recommender recommender = new SVDRecommender(arg0, svdFact);
				return recommender;
			}
		};
		 printRecommendations(userID, recBuilder, model);
		 evaluate(recBuilder, model);

	}

	public void user_based(int userID) {
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
		printRecommendations(userID, recBuilder, model);
		evaluate(recBuilder, model);
	}

	public void item_based(int userID) {
		RecommenderBuilder recBuilder = new RecommenderBuilder() {
			public Recommender buildRecommender(DataModel arg0) throws TasteException {
				ItemSimilarity similarity = new PearsonCorrelationSimilarity(arg0);
				Recommender recommender = new GenericItemBasedRecommender(arg0, similarity);
				return recommender;
			}
		};

		printRecommendations(userID, recBuilder, model);
		evaluate(recBuilder, model);
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
