package org.baobabhealth.interoperability.model;

import java.io.InputStream;

import junit.framework.Assert;

import org.junit.Ignore;
import org.junit.Test;

import ca.uhn.hl7v2.HL7Exception;
import ca.uhn.hl7v2.model.Message;
import ca.uhn.hl7v2.model.v25.datatype.XPN;
import ca.uhn.hl7v2.model.v25.message.ADT_A01;
import ca.uhn.hl7v2.model.v25.segment.MSH;
import ca.uhn.hl7v2.parser.EncodingNotSupportedException;
import ca.uhn.hl7v2.parser.GenericParser;
import ca.uhn.hl7v2.parser.Parser;

public class PersonTest {

	@Ignore
	@Test
	public void shouldParseXmlFormat() {
		String inputFileType = ".xml";
		assertParsesCorrectlyForInputType(inputFileType);        
	}
	
	@Ignore
	@Test
	public void shouldParsePipeFormat() {
		String inputFileType = ".hl7";
		assertParsesCorrectlyForInputType(inputFileType);        
	}

	private void assertParsesCorrectlyForInputType(String inputFileType) {
		Parser p = new GenericParser();

        Message hapiMsg;
        try {
        	// example derived from http://www.interfaceware.com/example_hl7_message.html
			InputStream inputStream = getClass().getResourceAsStream("adt_a01_sample" + inputFileType);
        	String msg = IOUtils.convertStreamToString(inputStream);
        	hapiMsg = p.parse(msg);
        } catch (EncodingNotSupportedException e) {
            Assert.fail();
            return;
        } catch (HL7Exception e) {
            Assert.fail();
            return;
        }
        
        ADT_A01 adtMsg = (ADT_A01)hapiMsg;
        MSH msh = adtMsg.getMSH();
//        String msgType = msh.getMessageType().getMessageCode().getValue();
        String msgTrigger = msh.getMessageType().getTriggerEvent().getValue();

//        Assert.assertEquals("ADT", msgType);
        Assert.assertEquals("A01", msgTrigger);

        XPN patientName = adtMsg.getPID().getPatientName(0);
        String familyName = patientName.getFamilyName().getSurname().getValue();
        
        Assert.assertEquals("DOE", familyName);
	}
}

//String msg = "MSH|^~\\&|EPIC|EPICADT|SMS|SMSADT|199912271408|CHARRIS|ADT^A01|1817457|D|2.5|\r"
//+ "PID||0493575^^^2^ID 1|454721||DOE^JOHN^^^^|DOE^JOHN^^^^|19480203|M||B|254 MYSTREET AVE^^MYTOWN^OH^44123^USA||(216)123-4567|||M|NON|400003403~1129086|\r"
//+ "NK1||ROE^MARIE^^^^|SPO||(216)123-4567||EC|||||||||||||||||||||||||||\r"
//+ "PV1||O|168 ~219~C~PMA^^^^^^^^^||||277^ALLEN MYLASTNAME^BONNIE^^^^|||||||||| ||2688684|||||||||||||||||||||||||199912271408||||||002376853";
//try {
//	FileWriter fstream = new FileWriter("out.txt");
//	BufferedWriter out = new BufferedWriter(fstream);
//	out.write(msg);
//	out.close();
//} catch (IOException e1) {
//	e1.printStackTrace();
//}

