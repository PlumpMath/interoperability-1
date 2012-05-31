<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<!-- <xsl:strip-space elements="*" />-->

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
<!-- To give the first element of the complex datatype HD the correct table instead -->
	<xsl:template
		match="HL7v2xStaticDef//Field[@Datatype='HD' and @Table!=0]/Component[1]">
		<xsl:copy>
			<xsl:attribute name="Table">0300</xsl:attribute>
			<xsl:apply-templates
				select="node()|@Name|@Usage|@Datatype|@Length" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template
		match="HL7v2xStaticDef//Field/Component[@Datatype='HD' and @Table!=0]/SubComponent[1]">
		<xsl:copy>
			<xsl:attribute name="Table">0300</xsl:attribute>
			<xsl:apply-templates
				select="node()|@Name|@Usage|@Datatype|@Length" />
		</xsl:copy>
	</xsl:template>
	

	
	<xsl:template match="node()|@*">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>

