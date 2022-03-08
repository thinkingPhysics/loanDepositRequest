<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:obj="urn:ru:ilb:meta:TestApp:Document"
        xmlns:req="urn:ru:ilb:meta:TestApp:DocumentListRequest"
        xmlns:res="urn:ru:ilb:meta:TestApp:DocumentListResponse"
        exclude-result-prefixes="xsl req res obj"
        version="1.0">
    <xsl:output
            media-type="application/xhtml+xml"
            method="xml"
            encoding="UTF-8"
            indent="yes"
            omit-xml-declaration="no"
            doctype-public="-//W3C//DTD XHTML 1.1//EN"
            doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />
    <xsl:template match="success">
        <xsl:apply-templates />
        <div align="center" class="success">
            <h1 class="mb-5">Ваша заявка зарегистрирована!</h1>
            <div>
                <div class="mb-5">
                    <h2 class="mb-3">Ожидайте рассмотрения в течение 2 (двух) рабочих дней</h2>
                    <img src="img/smile.png" class="smile mt-4 mb-5" width="150"></img><br/>
                    <a href="index.php" class="btn btn-primary w-25">На главную</a>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
