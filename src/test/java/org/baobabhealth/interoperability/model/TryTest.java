//package org.baobabhealth.interoperability.model;
//
//import java.util.Arrays;
//
//import org.junit.Test;
//
//import ca.uhn.hl7v2.HL7Exception;
//import ca.uhn.hl7v2.conf.check.DefaultValidator;
//import ca.uhn.hl7v2.conf.parser.ProfileParser;
//import ca.uhn.hl7v2.conf.spec.RuntimeProfile;
//import ca.uhn.hl7v2.model.v24.message.ACK;
//import ca.uhn.hl7v2.parser.PipeParser;
//
//public class TryTest {
//
//	@Test
//	public void testName() throws Exception {
//	    // Load the profile from the classpath
//	    ProfileParser parser = new ProfileParser(false);
//	    RuntimeProfile profile = parser.parseClasspath("conf.xml");
//
//	    // Create a message to validate
//	    String message = "MSH|^~\\&|||||||ACK^A01|1|D|2.4|||||CAN|wrong|F^^HL70001^x^^HL78888|\r"; //note HL7888 doesn't exist
//	    ACK msg = (ACK) (new PipeParser()).parse(message);
//	        
//	    // Validate
//	        HL7Exception[] errors = new DefaultValidator().validate(msg, profile.getMessage());
//	        
//	        // Each exception is a validation error
//	        System.out.println("Validation errors: " + Arrays.asList(errors));
//	        for (HL7Exception hl7Exception : errors) {
//	        	System.out.println(hl7Exception);
//			}
//	}
//}
