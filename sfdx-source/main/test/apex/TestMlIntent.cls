@isTest
public class TestMlIntent implements NlpPredictions.MlIntent {

    private String name;
    private String label;

	public TestMlIntent(TestMlIntent.Builder builder) {
        this.name = builder.name;
        this.label = builder.label;
    }
    
    public String getName() {
        return this.name;
    }

    public String getLabel() {
        return this.label;
    }
    
    public class Builder {

        private String name;
    	private String label;

		public Builder setName(String name){
            this.name = name;
            return this;
        }

		public Builder setLabel(String label){
            this.label = label;
            return this;
        }
        
        public TestMlIntent build(){
            return new TestMlIntent(this);
        }
    }
    
}