<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match='/'>
		<!-- Place this two line as License in the profile  -->
	<xsl:comment>
		This HL7 Message profile was written by the INRIA IHE-Development Team for 
		IHE Europe PLACE_HERE_LICENCE_TEXT 
	</xsl:comment>
		<xsl:apply-templates select="node()|@*"/>
	</xsl:template>
	<xsl:template match="node()">
		<xsl:copy>
			<xsl:apply-templates select="node()|@*"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="text()">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="@*">
		<xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	<xsl:template match="HL7v2xStaticDef//Predicate"></xsl:template>
</xsl:stylesheet>