<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- This xsl file change the place of node in a structure -->
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="HL7v2xConformanceProfile/HL7v2xStaticDef//Field[@Datatype='EI']">
        <xsl:copy>
            <!--recopie of the attribute of the father node-->
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="Component">
                <xsl:choose>
                    <xsl:when test="@Name='entity identifier'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/-->
                            <!--xsl:for-each select="node()"-->
                            <!--xsl:copy-->
                            <xsl:attribute name="Usage">R</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length|@Table"/>
                            <!--/xsl:copy>
                                </xsl:for-each-->
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when test="@Name='namespace ID'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/-->
                            <!--xsl:for-each select="node()"-->
                            <!--xsl:copy-->
                            <xsl:attribute name="Usage">C</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length"/>
                            <!--/xsl:copy>
                            </xsl:for-each-->
                        </xsl:copy>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- copy all the field you don't need to move -->
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>

    </xsl:template>
    
    <xsl:template match="HL7v2xConformanceProfile/HL7v2xStaticDef//Field[@Datatype='CX']">
        <xsl:copy>
            <!--recopie of the attribute of the father node-->
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="Component">
                <xsl:choose>
                    <xsl:when test="@Name='assigning authority'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/-->
                            <!--xsl:for-each select="node()"-->
                            <!--xsl:copy-->
                            <xsl:attribute name="Usage">R</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length|@Table"/>
                            <!--/xsl:copy>
                                </xsl:for-each-->
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when test="@Name='identifier type code'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/-->
                            <!--xsl:for-each select="node()"-->
                            <!--xsl:copy-->
                            <xsl:attribute name="Usage">RE</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length"/>
                            <!--/xsl:copy>
                                </xsl:for-each-->
                        </xsl:copy>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- copy all the field you don't need to move -->
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
        
    </xsl:template>
    <xsl:template match="HL7v2xConformanceProfile/HL7v2xStaticDef//Component[@Datatype='EI']">
        <xsl:copy>
            <!--recopie of the attribute of the father node-->
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="SubComponent">
                <xsl:choose>
                    <xsl:when test="@Name='entity identifier'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/-->
                            <!--xsl:for-each select="node()"-->
                            <!--xsl:copy-->
                            <xsl:attribute name="Usage">R</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length|@Table"/>
                            <!--/xsl:copy>
                                </xsl:for-each-->
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when test="@Name='namespace ID'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/-->
                            <!--xsl:for-each select="node()"-->
                            <!--xsl:copy-->
                            <xsl:attribute name="Usage">C</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length"/>
                            <!--/xsl:copy>
                                </xsl:for-each-->
                        </xsl:copy>
                    </xsl:when>            
                    <xsl:otherwise>
                        <!-- copy all the field you don't need to move -->
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>

    </xsl:template>
    
    <xsl:template match="HL7v2xConformanceProfile/HL7v2xStaticDef//Component[@Datatype='CX']">
        <xsl:copy>
            <!--recopie of the attribute of the father node-->
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="SubComponent">
                <xsl:choose>
                    <xsl:when test="@Name='assigning authority'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/-->
                            <!--xsl:for-each select="node()"-->
                            <!--xsl:copy-->
                            <xsl:attribute name="Usage">R</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length|@Table"/>
                            <!--/xsl:copy>
                                </xsl:for-each-->
                        </xsl:copy>
                    </xsl:when>
                    <xsl:when test="@Name='identifier type code'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/-->
                            <!--xsl:for-each select="node()"-->
                            <!--xsl:copy-->
                            <xsl:attribute name="Usage">C</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length"/>
                            <!--/xsl:copy>
                                </xsl:for-each-->
                        </xsl:copy>
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
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
