@isTest
public class TestPredictionRequestContext implements NlpPredictions.PredictionRequestContext {
    
    private Set<NlpPredictions.PredictionRequestType> predictionRequestTypes;
    private String inputText;
    private String language;
    private Timezone timeZone;
    private List<HttpRequest> continuationRequests;
    
    public TestPredictionRequestContext(TestPredictionRequestContext.Builder builder) {
        this.predictionRequestTypes = builder.predictionRequestTypes;
        this.inputText = builder.inputText;
        this.language = builder.language;
        this.timeZone = builder.timeZone;
        this.continuationRequests = builder.continuationRequests;
    }
    
    public Set<NlpPredictions.PredictionRequestType> getPredictionRequestTypes(){
        return this.predictionRequestTypes;
    }
    
    public String getInputText(){
        return this.inputText;
    }
    
    public String getLanguage(){
        return this.language;
    }
    
    public TimeZone getTimeZone(){
        return this.timeZone;
    }

    public List<HttpRequest> getContinuationRequests(){
        return this.continuationRequests;
    }
    
    public class Builder {

        private Set<NlpPredictions.PredictionRequestType> predictionRequestTypes;
        private String inputText;
        private String language;
        private Timezone timeZone;
        private List<HttpRequest> continuationRequests;
    
        public Builder setPredictionRequestTypes(Set<NlpPredictions.PredictionRequestType> predictionRequestTypes){
            this.predictionRequestTypes = predictionRequestTypes;
            return this;
        }

        public Builder setInputText(String inputText){
            this.inputText = inputText;
            return this;
        }

		public Builder setLanguage(String language){
            this.language = language;
            return this;
        }

		public Builder setTimezone(Timezone timeZone){
            this.timeZone = timeZone;
            return this;
        }

		public Builder setContinuationRequests(List<HttpRequest> continuationRequests){
            this.continuationRequests = continuationRequests;
            return this;
        }
        
        public TestPredictionRequestContext build(){
            return new TestPredictionRequestContext(this);
        }
        
    }
    
}