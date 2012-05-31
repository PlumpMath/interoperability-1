<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- This xsl file change the place of node in a structure -->
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template
        match="HL7v2xConformanceProfile/HL7v2xStaticDef//Field[@Datatype='CX']">
        <xsl:copy>
            <!--recopie of the attribute of the father node-->
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="Component">
                <xsl:choose>
                   <xsl:when test="@Name='assigning authority'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*"/>
                            
                            <xsl:for-each select="node()">
                                <xsl:copy>
                                    <xsl:attribute name="Usage">C</xsl:attribute>
                                    <xsl:apply-templates select="node()|@Name|@Table|@Datatype|@Length"/>
                                </xsl:copy>
                            </xsl:for-each> 
                        </xsl:copy>
                        
                        
                  </xsl:when>  
                    <xsl:when test="@Name='universal ID type'">
                        <!-- don't copy doesn't exist in the standard -->
                        
              <!--add this field as brother -->
                        <Component Name="assigning facility" Usage="O" Datatype="HD" Length="9">
                            <SubComponent Name="namespace ID" Usage="O" Datatype="IS" Length="3"
                                Table="0300"> </SubComponent>
                            <SubComponent Name="universal ID" Usage="C" Datatype="ST" Length="3"> </SubComponent>
                            <SubComponent Name="universal ID type" Usage="C" Datatype="ID"
                                Length="3" Table="0301"> </SubComponent>
                        </Component>
                         
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
