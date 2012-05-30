#!/bin/sh
xsltproc /home/sdoxsee/Downloads/IHE_Messaging_Workbench_Lib_And_Project/xslTransformTools/XsltProfileTransformer.xsl /home/sdoxsee/workspace/interoperability/src/main/resources/ZPT_ZP1-ZPT_ZP1.xml > /home/sdoxsee/workspace/interoperability/src/main/resources/ZPT_ZP1-ZPT_ZP1-CorrectGenericError.xml 

xsltproc /home/sdoxsee/Downloads/IHE_Messaging_Workbench_Lib_And_Project/xslTransformTools/predicate_transform.xsl /home/sdoxsee/workspace/interoperability/src/main/resources/ZPT_ZP1-ZPT_ZP1-CorrectGenericError.xml > /home/sdoxsee/workspace/interoperability/src/main/resources/ZPT_ZP1-ZPT_ZP1-PredicateTransform.xml 

xsltproc /home/sdoxsee/Downloads/IHE_Messaging_Workbench_Lib_And_Project/xslTransformTools/correction_schema.xsl /home/sdoxsee/workspace/interoperability/src/main/resources/ZPT_ZP1-ZPT_ZP1-PredicateTransform.xml > /home/sdoxsee/workspace/interoperability/src/main/resources/ZPT_ZP1-ZPT_ZP1-SchemaError.xml 

xsltproc /home/sdoxsee/Downloads/IHE_Messaging_Workbench_Lib_And_Project/xslTransformTools/correct-table.xsl /home/sdoxsee/workspace/interoperability/src/main/resources/ZPT_ZP1-ZPT_ZP1-SchemaError.xml > /home/sdoxsee/workspace/interoperability/src/main/resources/ZPT_ZP1-ZPT_ZP1-CorrectTable.xml 

