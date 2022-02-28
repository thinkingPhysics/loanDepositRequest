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
    <xsl:template match="/">
        <html xml:lang="ru">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title>Оформление заявки</title>
                <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
                <link rel="stylesheet" type="text/css" href="css/main.css" />
            </head>
            <body onload="">
                <div class="container">
                <xsl:apply-templates />
                </div>
                <script type="text/javascript" src="js/main.js"></script>
                <script type="text/javascript" src="js/help.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="parts/header.xsl" />
    <xsl:include href="parts/requestForm.xsl" />
    <xsl:include href="parts/footer.xsl" />
</xsl:stylesheet>
