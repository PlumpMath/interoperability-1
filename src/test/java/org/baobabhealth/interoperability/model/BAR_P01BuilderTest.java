package org.baobabhealth.interoperability.model;

import junit.framework.Assert;

import org.junit.Test;

import ca.uhn.hl7v2.HL7Exception;
import ca.uhn.hl7v2.conf.check.DefaultValidator;
import ca.uhn.hl7v2.conf.parser.ProfileParser;
import ca.uhn.hl7v2.conf.spec.RuntimeProfile;
import ca.uhn.hl7v2.model.v25.message.BAR_P01;
import ca.uhn.hl7v2.parser.PipeParser;

public class BAR_P01BuilderTest {

	@Test
	public void shouldBuildValidMessage() {
		try {
			BAR_P01 message = new BAR_P01Builder().build();
			Assert.assertNotNull(message);
			Assert.assertNotNull(message.getMSH());
			Assert.assertNotNull(message.getMSH().getFieldSeparator());
			String hl7Message = new PipeParser().encode(message);
			System.out.println(hl7Message);

			// Load the profile from the classpath
			ProfileParser parser = new ProfileParser(false);
			RuntimeProfile profile = parser.parseClasspath("BAR_P01.xml");

			BAR_P01 msg = (BAR_P01) (new PipeParser()).parse(hl7Message);

			// Validate
			HL7Exception[] errors = new DefaultValidator().validate(msg, profile.getMessage());
			printErrors(errors);
			Assert.assertEquals("number of errors", 0, errors.length);
		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	private void printErrors(HL7Exception[] errors) {
		// Each exception is a validation error
		System.out.println("Validation errors: ");
		for (HL7Exception hl7Exception : errors) {
			System.out.println(hl7Exception);
		}
	}

}
