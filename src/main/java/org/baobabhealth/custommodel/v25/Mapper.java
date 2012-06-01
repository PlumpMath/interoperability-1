package org.baobabhealth.custommodel.v25;

import org.baobabhealth.custommodel.v25.message.ZPT_ZP1;
import org.baobabhealth.custommodel.v25.segment.PID;
import org.openmrs.Person;
import org.openmrs.PersonName;

import ca.uhn.hl7v2.model.v25.datatype.XPN;

public class Mapper {

	public ZPT_ZP1 map(Person person) {
		return new ZPT_ZP1();
	}

	public Person map(ZPT_ZP1 zpt_ZP1) {
		Person person = new Person();
		mapPid(person, zpt_ZP1.getPID());
		return person;
	}

	private void mapPid(Person person, PID pid) {
		mapPatientNames(person, pid.getPatientName());
		person.setGender(pid.getPid8_AdministrativeSex().getValue());
	}

	private void mapPatientNames(Person person, XPN[] patientName) {
		for (XPN xpn : patientName) {
			PersonName personName = new PersonName();
			personName.setFamilyName(xpn.getFamilyName().getSurname().getValue());
			personName.setGivenName(xpn.getGivenName().getValue());
			person.getNames().add(personName);
		}
	}

}
