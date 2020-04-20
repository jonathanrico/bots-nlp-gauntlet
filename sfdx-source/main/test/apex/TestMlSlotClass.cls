@isTest
public class TestMlSlotClass implements NlpPredictions.MlSlotClass {

    private String name;
    private String label;
	private NlpPredictions.MlSlotClassDataType dataType;
    
	public TestMlSlotClass(TestMlSlotClass.Builder builder) {
        this.name = builder.name;
        this.label = builder.label;
        this.dataType = builder.dataType;
    }
    
    public String getName() {
        return this.name;
    }

    public String getLabel() {
        return this.label;
    }

    public NlpPredictions.MlSlotClassDataType getDataType() {
        return this.dataType;
    }
    
    public class Builder {

        private String name;
    	private String label;
        private NlpPredictions.MlSlotClassDataType dataType;

		public Builder setName(String name){
            this.name = name;
            return this;
        }

		public Builder setLabel(String label){
            this.label = label;
            return this;
        }

		public Builder setDataType(NlpPredictions.MlSlotClassDataType dataType){
            this.dataType = dataType;
            return this;
        }
        
        public TestMlSlotClass build(){
            return new TestMlSlotClass(this);
        }
    }
    
}