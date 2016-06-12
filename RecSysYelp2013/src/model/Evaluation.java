package model;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.DataModelBuilder;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.eval.RecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.AverageAbsoluteDifferenceRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.RMSRecommenderEvaluator;
import org.apache.mahout.cf.taste.model.DataModel;

public class Evaluation {

	private RecommenderEvaluator evaluator = null;
	private AverageAbsoluteDifferenceRecommenderEvaluator avrgRecommenderEvaluator = null;

	public Evaluation() {
		super();
		evaluator = new RMSRecommenderEvaluator();
		avrgRecommenderEvaluator = new AverageAbsoluteDifferenceRecommenderEvaluator();
	}

	public double RMSE(RecommenderBuilder recBuilder, DataModelBuilder dataModelBuilder, 
			DataModel model, double arg3, double arg4) throws TasteException {
		return evaluator.evaluate(recBuilder, dataModelBuilder, model, arg3, arg4);
	}
	
	public double MAE(RecommenderBuilder recBuilder, DataModelBuilder dataModelBuilder, 
			DataModel model, double arg3, double arg4) throws TasteException {
		return avrgRecommenderEvaluator.evaluate(recBuilder, dataModelBuilder, model, arg3, arg4);
	}
}
