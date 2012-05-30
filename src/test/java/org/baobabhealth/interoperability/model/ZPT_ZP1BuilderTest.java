package org.baobabhealth.interoperability.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

import javax.xml.XMLConstants;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.dom.DOMSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import junit.framework.Assert;

import org.baobabhealth.custommodel.v25.message.ZPT_ZP1;
import org.junit.Test;
import org.xml.sax.SAXException;

import ca.uhn.hl7v2.HL7Exception;
import ca.uhn.hl7v2.conf.check.DefaultValidator;
import ca.uhn.hl7v2.conf.parser.ProfileParser;
import ca.uhn.hl7v2.conf.spec.RuntimeProfile;
import ca.uhn.hl7v2.model.Message;
import ca.uhn.hl7v2.parser.CustomModelClassFactory;
import ca.uhn.hl7v2.parser.GenericParser;
import ca.uhn.hl7v2.parser.Parser;

public class ZPT_ZP1BuilderTest {

	@Test
	public void shouldBuildValidMessage() {
		try {
//			ZPT_ZP1 zpt = new ZPT_ZP1Builder().build();
//			Assert.assertNotNull(zpt);
//			Assert.assertNotNull(zpt.getMSH());
//			Assert.assertNotNull(zpt.getMSH().getFieldSeparator());
//			String hl7Message = new GenericParser(new CustomModelClassFactory("org.baobabhealth.custommodel")).encode(zpt);
			InputStream inputStream = getClass().getResourceAsStream("indiv_KRA00001_20120525.xml");
//			InputStream inputStream = getClass().getResourceAsStream("ZPT_ZP1sample.er7");
        	String hl7Message = IOUtils.convertStreamToString(inputStream);
			System.out.println(hl7Message);

			// Load the profile from the classpath
			ProfileParser parser = new ProfileParser(false);
			RuntimeProfile profile = parser.parseClasspath("ZPT_ZP1-ZPT_ZP1.xml");

			Parser customParser = new GenericParser(new CustomModelClassFactory("org.baobabhealth.custommodel"));			
			
			Message message = customParser.parse(hl7Message);
			String encode = customParser.encode(message, "XML");
			System.out.println(encode);
			ZPT_ZP1 msg = (ZPT_ZP1) message;
//			ValidationException[] test = new XMLSchemaRule().test(hl7Message);
//			printErrors(test);
//			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
//			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
//			Document doc = docBuilder.parse(getClass().getResourceAsStream("indiv_KRA00001_20120525.xml"));
//			DOMSource domSource = new DOMSource(doc);
//			validateXML(domSource);
			// Validate
			HL7Exception[] errors = new DefaultValidator().validate(msg, profile.getMessage());
			printErrors(errors);
//			Assert.assertEquals("number of errors", 0, errors.length);
		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	private void printErrors(Exception[] errors) {
		// Each exception is a validation error
		System.out.println("Validation errors: ");
		for (Exception hl7Exception : errors) {
			System.out.println(hl7Exception);
		}
	}
	
	private void validateXML(DOMSource source) throws Exception {
//	    URL schemaFile = new URL("urn:ZPT_ZP1.xsd");
	    SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
//	    Schema schema = schemaFactory.newSchema(schemaFile);
	    Schema schema = schemaFactory.newSchema(new File("ZPT_ZP1.xsd"));

	    Validator validator = schema.newValidator();
	    DOMResult result = new DOMResult();
	    try {
	        validator.validate(source, result); 
	        System.out.println("is valid");
	    } catch (SAXException e) {
	        System.out.println("not valid because " + e.getLocalizedMessage());
	    }
	}
	
	/** Read the contents of the given file. 
	 * @return */
	  String read(String filename) throws IOException {
	    StringBuilder text = new StringBuilder();
	    String NL = System.getProperty("line.separator");
	    Scanner scanner = new Scanner(new FileInputStream(filename));
	    try {
	      while (scanner.hasNextLine()){
	        text.append(scanner.nextLine() + NL);
	      }
	    }
	    finally{
	      scanner.close();
	    }
	    return text.toString();
	  }

}
