<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- This xsl file change the place of node in a structure -->
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="HL7v2xConformanceProfile/HL7v2xStaticDef/Segment[@Name='PV2']">
        <xsl:copy>
           <!--recopie of the attribute of the father node-->
            <xsl:apply-templates select="@*" />
            <!--creation of a variable of the field I would transfer-->
            <xsl:variable name="reten">
                <xsl:copy-of select="Field[@Name='Retention Indicator']"/>
            </xsl:variable>
            <xsl:for-each select="Field">
                <xsl:choose>
                    <xsl:when test="@Name='Special Program Code'">
                        <!-- copy this field -->
                        <xsl:copy-of select="."/>
                        <!-- add this field as brother -->
                        <xsl:copy-of select="$reten"/>
                    </xsl:when>
                    <xsl:when test="@Name='Retention Indicator'">
                        <!--don't do anything-->
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- copy all the field you don't need to move -->
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
        
    </xsl:template>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
