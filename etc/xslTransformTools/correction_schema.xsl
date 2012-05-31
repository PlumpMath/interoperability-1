<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
<!-- To add an Impnote and a UseCase Segment to make the profile correct withe his schema -->
    <xsl:template match="HL7v2xConformanceProfile">
		<xsl:copy>
            <xsl:apply-templates select="@*" />
			<xsl:apply-templates select="MetaData"/>
			<ImpNote><xsl:value-of select="HL7v2xStaticDef/@EventDesc"/></ImpNote>
			<UseCase/>
            <xsl:apply-templates
			select="MetaData/following-sibling::*" />
		</xsl:copy>
    </xsl:template>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
