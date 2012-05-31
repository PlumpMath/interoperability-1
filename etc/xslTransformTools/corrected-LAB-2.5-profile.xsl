<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <!-- <xsl:strip-space elements="*" />-->
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
    <!-- Begin of seg group error correction -->
    <!-- Corrected Meta data in the generated profile -->
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
<!-- End of Meta data correction table -->
    <!-- Begin of SegGroup name error correction BEGIN -->
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
            <xsl:attribute name="Datatype">ID</xsl:attribute>
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
    
    <!-- End of Seg Group Name Error Correction -->
  <!-- To corrected Datatype HD in Laboratory profile 2-5 --> 
    <xsl:template
        match="HL7v2xConformanceProfile/HL7v2xStaticDef//Field[@Datatype='HD']">
        <xsl:copy>
            <!--recopie of the attribute of the father node-->
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="Component">
                <xsl:choose>
                    <xsl:when test="@Name='namespace ID'">
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
                    <xsl:when test="@Name='universal ID'">
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
                    <xsl:when test="@Name='universal ID type'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/>
                                <xsl:for-each select="node()">
                                <xsl:copy-->
                            <xsl:attribute name="Usage">C</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length|@Table"/>
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
    <xsl:template
        match="HL7v2xConformanceProfile/HL7v2xStaticDef//Component[@Datatype='HD']">
        <xsl:copy>
            <!--recopie of the attribute of the father node-->
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="SubComponent">
                <xsl:choose>
                    <xsl:when test="@Name='namespace ID'">
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
                    <xsl:when test="@Name='universal ID'">
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
                    <xsl:when test="@Name='universal ID type'">
                        <xsl:copy>
                            <!--xsl:apply-templates select="@*"/>
                                <xsl:for-each select="node()">
                                <xsl:copy-->
                            <xsl:attribute name="Usage">C</xsl:attribute>
                            <xsl:apply-templates select="node()|@Name|@Datatype|@Length|@Table"/>
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
    <!-- End of HD datatype Correction -->
    <!-- Correction of Datatype EI as defined in LTW -->
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
    <!-- End of correction of Datatype EI -->
 <!-- Correction of Datatype CX as defined in LTW-->
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
    <!-- End of correction of datatype CX -->
   
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>


