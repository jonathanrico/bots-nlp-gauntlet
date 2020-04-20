@isTest
private class TestExternalNlpPredictionHandlerImpl {

    private static final String MOCK_TEST_ENDPOINT = 'https://test.service.com/model/test1234/predict';

    @isTest
    private static void testHandlePredictionRequest() {
        try {
            HttpRequest testRequest = new HttpRequest();
            testRequest.setEndpoint(MOCK_TEST_ENDPOINT);
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

        ExternalNlpMockAPICalloutMockImpl mockResponse = new ExternalNlpMockAPICalloutMockImpl();

        HttpRequest testRequest = new HttpRequest();
        testRequest.setEndpoint(MOCK_TEST_ENDPOINT);
        testRequest.setMethod('GET');
        testRequest.setHeader('Content-Type', 'application/json');

        Test.setMock(HttpCalloutMock.class, mockResponse);

        try {

            TestPredictionResponseContext respCtx = new TestPredictionResponseContext.Builder()
            .setPredictionRequestTypes(new Set<NlpPredictions.PredictionRequestType>{
                NlpPredictions.PredictionRequestType.DETECT_INTENTS,
                NlpPredictions.PredictionRequestType.EXTRACT_SLOTCLASSES})
            .setAvailableMlIntents(new Map<String, TestMlIntent>{
                'Make_Appointment' => new TestMlIntent.Builder()
                    .setName('Make_Appointment')
                    .setLabel('Make Appointment')
                    .build(),
                'Lookup_Appointment' => new TestMlIntent.Builder()
                    .setName('Lookup_Appointment')
                    .setLabel('Lookup Appointment')
                    .build(),
                'Cancel_Appointment' => new TestMlIntent.Builder()
                    .setName('Cancel_Appointment')
                    .setLabel('Cancel Appointment')
                    .build()
            })
            .setAvailableMlSlotClasses(new Map<String, TestMlSlotClass>{
                'Car_Make' => new TestMlSlotClass.Builder()
                    .setName('Car_Make')
                    .setLabel('Car Make')
                    .setDataType(NlpPredictions.MlSlotClassDataType.TEXT_SLOT_CLASS)
                    .build(),
                'Appointment_Type' => new TestMlSlotClass.Builder()
                    .setName('Appointment_Type')
                    .setLabel('Appointment Type')
                    .setDataType(NlpPredictions.MlSlotClassDataType.TEXT_SLOT_CLASS)
                    .build()
            })
            .setContinuationResponses(new List<HttpResponse> {mockResponse.respond(testRequest)})
            .build();

            ExternalNlpPredictionHandlerImpl handler = new ExternalNlpPredictionHandlerImpl();
            handler.handlePredictionResponse(respCtx);

            List<NlpPredictions.MlIntentPrediction> intentPredictions = respCtx.getDetectedMlIntents();
            System.assertEquals(1, intentPredictions.size());
            System.assertEquals('Make_Appointment', intentPredictions.get(0).getIntentName());
            System.assertEquals(0.9984889, intentPredictions.get(0).getConfidence());

            List<NlpPredictions.ExtractedMlSlotClassValue> extractedSlotClassValues = respCtx.getExtractedSlotClassValues();
            System.assertEquals(2, extractedSlotClassValues.size());
            System.assertEquals('Car_Make', extractedSlotClassValues.get(0).getSlotClassName());
            System.assertEquals(0.9984889, extractedSlotClassValues.get(0).getConfidence());
            System.assertEquals('Tesla', extractedSlotClassValues.get(0).getNormalizedTextValue());
            System.assertEquals('Appointment_Type', extractedSlotClassValues.get(1).getSlotClassName());
            System.assertEquals(0.9984889, extractedSlotClassValues.get(1).getConfidence());
            System.assertEquals('Repair', extractedSlotClassValues.get(1).getNormalizedTextValue());

        } catch (Exception e) {
            System.assert(false, 'Unexpected exception');
        }
    }
}