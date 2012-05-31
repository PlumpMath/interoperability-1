#!/bin/sh
xsltproc xslTransformTools/XsltProfileTransformer.xsl src/main/resources/ZPT_ZP1-ZPT_ZP1.xml > src/main/resources/ZPT_ZP1-ZPT_ZP1-CorrectGenericError.xml 
xsltproc xslTransformTools/predicate_transform.xsl src/main/resources/ZPT_ZP1-ZPT_ZP1-CorrectGenericError.xml > src/main/resources/ZPT_ZP1-ZPT_ZP1-PredicateTransform.xml 
xsltproc xslTransformTools/correction_schema.xsl src/main/resources/ZPT_ZP1-ZPT_ZP1-PredicateTransform.xml > src/main/resources/ZPT_ZP1-ZPT_ZP1-SchemaError.xml 
xsltproc xslTransformTools/correct-table.xsl src/main/resources/ZPT_ZP1-ZPT_ZP1-SchemaError.xml > src/main/resources/ZPT_ZP1-ZPT_ZP1-CorrectTable.xml 

