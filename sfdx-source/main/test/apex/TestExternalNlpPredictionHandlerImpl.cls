@isTest
private class TestExternalNlpPredictionHandlerImpl {

    @isTest
    private static void testHandlePredictionRequest() {
        try {
            HttpRequest testRequest = new HttpRequest();
            testRequest.setEndpoint('https://test.service.com/model/test1234/predict');
            testRequest.setMethod('GET');
            testRequest.setHeader('Content-Type', 'application/json');
            
            TestPredictionRequestContext reqCtx = new TestPredictionRequestContext.Builder()
                .setPredictionRequestTypes(new Set<NlpPredictions.PredictionRequestType>{
                    NlpPredictions.PredictionRequestType.DETECT_INTENTS,
                    NlpPredictions.PredictionRequestType.EXTRACT_SLOTCLASSES})
                .setInputText('I want to make an appointment')
                .setLanguage('en_US')
                .setTimezone(Timezone.getTimeZone('America/New_York'))
                .setContinuationRequests(new List<HttpRequest> {testRequest})
                .build();
        	ExternalNlpPredictionHandlerImpl handler = new ExternalNlpPredictionHandlerImpl();
         	handler.handlePredictionRequest(reqCtx);
            
            System.assert(reqCtx.getContinuationRequests().size() > 0, 'Expected at least 1 continuation request to be set');
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception');
        }
    }

    @isTest
    private static void testHandlePredictionResponse() {
        try {
            
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception');
        }
    }
}