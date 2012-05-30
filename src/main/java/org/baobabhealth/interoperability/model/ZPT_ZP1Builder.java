package org.baobabhealth.interoperability.model;

import java.text.SimpleDateFormat;

import org.baobabhealth.custommodel.v25.message.ZPT_ZP1;
import org.baobabhealth.custommodel.v25.segment.MSH;

import ca.uhn.hl7v2.model.DataTypeException;

public class ZPT_ZP1Builder {

	private static final String BLAH = "BLAH";

	public ZPT_ZP1 build() throws DataTypeException {
		ZPT_ZP1 message = new ZPT_ZP1();
		// Populate the MSH Segment
		MSH mshSegment = message.getMSH();
//		1 Field Separator
		mshSegment.getFieldSeparator().setValue("|");
//		2 Encoding Characters
		mshSegment.getEncodingCharacters().setValue("^~\\&");
//		3 Sending Application
//		4 Sending Facility
//		5 Receiving Application
//		6 Receiving Facility
//		7 Date Time of Message
		mshSegment.getDateTimeOfMessage().getTime().setValue(now());
//		8 Security
//		9 Message Type
		setMessageType(mshSegment);
//		10 Message Control ID
		mshSegment.getMessageControlID().setValue("ID");
//		11 Processing ID
		mshSegment.getProcessingID().getProcessingID().setValue("HL70207");
//		12 Version ID
		mshSegment.getVersionID().getVersionID().setValue(message.getVersion());
//		13 SequenceNumber
//		14 ContinuationPointer
//		15 AcceptAcknowledgementType
//		16 ApplicationAcknowledgementType
//		17 CountryCode
		mshSegment.getCountryCode().setValue("U0399");
//		18 CharacterSet
		mshSegment.getCharacterSet(0).setValue("UTF-8");
//		19 PrincipalLanguageOfMessage
		mshSegment.getPrincipalLanguageOfMessage().getText().setValue("U0296");
//		20 AlternateCharacterSetHandlingScheme 
		mshSegment.getAlternateCharacterSetHandlingScheme().setValue("U0356");
//		21 MessageProfileIdentifier 
		mshSegment.getMessageProfileIdentifier(0).getEntityIdentifier().setValue(BLAH);
		return message;
	}

	private void setMessageType(MSH mshSegment) throws DataTypeException {
//		mshSegment.getMessageType().getMessageCode().setValue("BAR");
//		mshSegment.getMessageType().getTriggerEvent().setValue("P01");
//		mshSegment.getMessageType().getMessageStructure().setValue("BAR_P01");
		mshSegment.getMessageType().getMessageCode().setValue("ZPT");
		mshSegment.getMessageType().getTriggerEvent().setValue("ZP1");
		mshSegment.getMessageType().getMessageStructure().setValue("ZPT_ZP1");
	}

	private String now() {
		return new SimpleDateFormat("yyyyMMddHHmmssZ").format(new java.util.Date());
	}

}
