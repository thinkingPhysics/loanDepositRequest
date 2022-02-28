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
    <xsl:template match="menu">
        <xsl:apply-templates />
        <div align="center" class="mainMenu">
            <h1 class="mb-5">Добро пожаловать!</h1>
            <div>
                <div class="mb-5">
                    <h2 class="mb-3">Услуги частным лицам</h2>
                    <a href="request.php?clientType=client&amp;productType=loan">Заявка на кредит</a>
                    <br/>
                    <a href="request.php?clientType=client&amp;productType=deposit">Открытие вклада</a>
                </div>
                <div>
                    <h2 class="mb-3">Услуги предпринимателям
                        <br/>и организациям
                    </h2>
                    <a href="request.php?clientType=organization&amp;productType=loan">Заявка на кредит</a>
                    <br/>
                    <a href="request.php?clientType=organization&amp;productType=deposit">Открытие вклада</a>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>