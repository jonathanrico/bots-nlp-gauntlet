@isTest
public class TestPredictionResponseContext implements NlpPredictions.PredictionResponseContext {
    
    private Set<NlpPredictions.PredictionRequestType> predictionRequestTypes;
    private Map<String, TestMlIntent> availableMlIntents;
    private Map<String, TestMlSlotClass> availableMlSlotClasses;
    private List<HttpResponse> continuationResponses;
    private List<NlpPredictions.MlIntentPrediction> intentPredictions;
	private List<NlpPredictions.ExtractedMlSlotClassValue> extractedSlotClasses;
    
	public TestPredictionResponseContext(TestPredictionResponseContext.Builder builder) {
        this.predictionRequestTypes = builder.predictionRequestTypes;
        this.availableMlIntents = builder.availableMlIntents;
        this.availableMlSlotClasses = builder.availableMlSlotClasses;
        this.continuationResponses = builder.continuationResponses;
    }
    
    public Set<NlpPredictions.PredictionRequestType> getPredictionRequestTypes(){
        return this.predictionRequestTypes;
    }
    
    public Map<String, TestMlIntent> getAvailableMlIntents() {
        return this.availableMlIntents;
    }
    
    public Map<String, TestMlSlotClass> getAvailableMlSlotClasses() {
        return this.availableMlSlotClasses;
    }
    
    public List<HttpResponse> getContinuationResponses() {
        return this.continuationResponses;
    }

	public List<NlpPredictions.MlIntentPrediction> getDetectedMlIntents(){
        return this.intentPredictions;
    }

	public List<NlpPredictions.ExtractedMlSlotClassValue> getExtractedSlotClassValues(){
        return this.extractedSlotClasses;
    }
    
    public void setDetectedMlIntents(List<NlpPredictions.MlIntentPrediction> intentPredictions){
        this.intentPredictions = intentPredictions;
    }
    
    public void setExtractedSlotClassValues(List<NlpPredictions.ExtractedMlSlotClassValue> extractedSlotClasses) {
		this.extractedSlotClasses = extractedSlotClasses;
    }
    
    public class Builder {

        private Set<NlpPredictions.PredictionRequestType> predictionRequestTypes;
        private Map<String, TestMlIntent> availableMlIntents;
        private Map<String, TestMlSlotClass> availableMlSlotClasses;
        private List<HttpResponse> continuationResponses;

		public Builder setPredictionRequestTypes(Set<NlpPredictions.PredictionRequestType> predictionRequestTypes){
            this.predictionRequestTypes = predictionRequestTypes;
            return this;
        }

		public Builder setAvailableMlIntents(Map<String, TestMlIntent> availableMlIntents){
            this.availableMlIntents = availableMlIntents;
            return this;
        }
        
		public Builder setAvailableMlSlotClasses(Map<String, TestMlSlotClass> availableMlSlotClasses){
            this.availableMlSlotClasses = availableMlSlotClasses;
            return this;
        }

		public Builder setContinuationResponses(List<HttpResponse> continuationResponses){
            this.continuationResponses = continuationResponses;
            return this;
        }
        
        public TestPredictionResponseContext build(){
            return new TestPredictionResponseContext(this);
        }
    }
    
}