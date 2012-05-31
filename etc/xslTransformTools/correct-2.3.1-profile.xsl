<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <!-- <xsl:strip-space elements="*" />-->
    
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="HL7v2xStaticDef//SegGroup[@Name='TIIMING'and @LongName='TIIMING']">
        <xsl:copy>
            <xsl:attribute name="Name">TIMING</xsl:attribute>
            <xsl:attribute name="LongName">TIMING</xsl:attribute>
            <xsl:apply-templates select="node()|@Usage|@Min|@Max" />
        </xsl:copy>
    </xsl:template>
    <xsl:template
        match="HL7v2xStaticDef//SegGroup[contains(@Name, '.') or contains(@LongName, '.')]/SegGroup">
        <xsl:copy>
            <xsl:attribute name="Usage">O</xsl:attribute>
            <xsl:attribute name="Min">0</xsl:attribute>
            <xsl:attribute name="Max">*</xsl:attribute>
            <xsl:apply-templates select="node()|@LongName|@Name" />
        </xsl:copy>
    </xsl:template>
    <xsl:template
        match="HL7v2xStaticDef//SegGroup[contains(@Name, '.')or contains(@LongName, '.')]">
        <xsl:apply-templates select="node()" />
    </xsl:template>
    <xsl:template
        match="HL7v2xStaticDef//Field[@Datatype='XON']/Component[@Name='identifier type code']">
        <xsl:copy>
            <xsl:attribute name="Datatype">IS</xsl:attribute>
            <xsl:apply-templates
                select="node()|@Name|@Usage|@Length|@Table" />
        </xsl:copy>
    </xsl:template>
    <xsl:template match="HL7v2xStaticDef//Field[@Datatype='varies']">
        <xsl:copy>
            <xsl:attribute name="Datatype">Varies</xsl:attribute>
            <xsl:apply-templates
                select="node()|@Name|@Usage|@Min|@Max|@Length" />
        </xsl:copy>
    </xsl:template>
    <xsl:template
        match="HL7v2xStaticDef//Field[@Datatype='NDL']/Component[@Name='name'and @Datatype='CNS']">
        <xsl:copy>
            <xsl:attribute name="Datatype">CNN</xsl:attribute>
            <xsl:apply-templates select="node()|@Name|@Usage|@Length" />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@*">
        <xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
    </xsl:template>
    <xsl:template match="HL7v2xStaticDef//Predicate"></xsl:template>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>

