package org.baobabhealth.custommodel.v25;

import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.mock;

import java.io.IOException;

import org.baobabhealth.custommodel.v25.message.ZPT_ZP1;
import org.baobabhealth.custommodel.v25.segment.PID;
import org.junit.Assert;
import org.junit.Test;
import org.openmrs.Person;

import ca.uhn.hl7v2.HL7Exception;
import ca.uhn.hl7v2.conf.ProfileException;
import ca.uhn.hl7v2.conf.parser.ProfileParser;
import ca.uhn.hl7v2.conf.spec.RuntimeProfile;
import ca.uhn.hl7v2.model.v25.datatype.XPN;
import ca.uhn.hl7v2.parser.CustomModelClassFactory;
import ca.uhn.hl7v2.parser.EncodingNotSupportedException;
import ca.uhn.hl7v2.parser.GenericParser;
import ca.uhn.hl7v2.parser.Parser;
import ca.uhn.hl7v2.util.FileCodeMapper;
import ca.uhn.hl7v2.util.Home;

public class MapperTest {

	@Test
	public void shouldReturnNonNullObjectsFromMapping() {
		Person person = mock(Person.class);
		ZPT_ZP1 message = new Mapper().map(person);
		assertNotNull(message);
		Person p = new Mapper().map(new ZPT_ZP1());
		assertNotNull(p);
	}

	@Test
	public void shouldTakeZPT_ZP1AndCreatePerson() throws Exception {
		ZPT_ZP1 message = initializeMessage();
		Person person = new Mapper().map(message);
		PID pid = message.getPID();
		assertPatientNames(person, pid.getPatientName());
		assertEquals("patient gender", pid.getPid8_AdministrativeSex().getValue(),
				person.getGender());
		
	}
	
	@Test
	public void testName() throws Exception {
		System.out.println(Home.getHomeDirectory().getAbsolutePath());
		FileCodeMapper.main(null);
	}

	private void assertPatientNames(Person person, XPN[] patientNames) {
		for (XPN xpn : patientNames) {
			assertEquals("family name", xpn.getFamilyName().getSurname().getValue(), 
					person.getFamilyName());
			assertEquals("given name", xpn.getGivenName().getValue(), 
					person.getGivenName());
		}
	}

	private ZPT_ZP1 initializeMessage() throws ProfileException, IOException,
			HL7Exception, EncodingNotSupportedException {
		String messageString = IOUtils.convertStreamToString(getClass()
				.getResourceAsStream("ZPT_ZP1-sample.xml"));
		// Load the profile from the classpath
		ProfileParser parser = new ProfileParser(false);
		RuntimeProfile profile = parser
				.parseClasspath("org/baobabhealth/custommodel/v25/ZPT_ZP1-conformance-profile.xml");

		Parser customParser = new GenericParser(new CustomModelClassFactory(
				"org.baobabhealth.custommodel"));

		ZPT_ZP1 message = (ZPT_ZP1)customParser.parse(messageString);
		return message;
	}

}
