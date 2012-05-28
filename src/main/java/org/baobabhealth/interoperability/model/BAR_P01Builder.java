package org.baobabhealth.interoperability.model;

import java.text.SimpleDateFormat;

import ca.uhn.hl7v2.model.DataTypeException;
import ca.uhn.hl7v2.model.v25.message.BAR_P01;
import ca.uhn.hl7v2.model.v25.segment.MSH;

public class BAR_P01Builder {

	private static final String BLAH = "BLAH";

	public BAR_P01 build() throws DataTypeException {
		BAR_P01 message = new BAR_P01();
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
		mshSegment.getMessageType().getMessageCode().setValue("BAR");
		mshSegment.getMessageType().getTriggerEvent().setValue("P01");
		mshSegment.getMessageType().getMessageStructure().setValue("BAR_P01");
//		mshSegment.getMessageType().getMessageCode().setValue("ZPR");
//		mshSegment.getMessageType().getTriggerEvent().setValue("R01");
//		mshSegment.getMessageType().getMessageStructure().setValue("ZPR_R01");
	}

	private String now() {
		return new SimpleDateFormat("yyyyMMddHHmmssZ").format(new java.util.Date());
	}

}
