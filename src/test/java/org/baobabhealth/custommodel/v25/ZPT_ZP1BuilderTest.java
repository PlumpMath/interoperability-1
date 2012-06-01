package org.baobabhealth.custommodel.v25;

import static org.mockito.Mockito.mock;

import org.baobabhealth.custommodel.v25.message.ZPT_ZP1;
import org.junit.Test;
import org.mockito.Mockito;
import org.openmrs.Person;

import ca.uhn.hl7v2.model.DataTypeException;

public class ZPT_ZP1BuilderTest {

	@Test
	public void test() throws DataTypeException {
		Person person = mock(Person.class);
		ZPT_ZP1 zpt = new ZPT_ZP1Builder().build();
	}

}
