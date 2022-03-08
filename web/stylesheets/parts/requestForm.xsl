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
    <xsl:template match="title">
        <h2 class="pageTitle">
            <xsl:apply-templates />
        </h2>
    </xsl:template>
    <xsl:template match="request">
        <xsl:variable name="clientType" select="clientType"/>
        <xsl:variable name="product" select="product"/>
        <form action="reg.php?clientType={$clientType}&amp;productType={$product}" method="POST" class="needs-validation" id="regForm" novalidate="true">
            <div class="form-group">
                <div class="row row-centered justify-content-center" id="regCard">
                    <div id="leftCol" class="col-md-4 card bg-light">
                        <xsl:choose>
                            <xsl:when test="$clientType = 'organization'">
                                <legend class="pb-0 pt-3">1. Данные организация</legend>
                                <h5>Руководитель</h5>
                            </xsl:when>
                            <xsl:otherwise>
                                <legend class="pb-3 pt-3">1. Ваши данные</legend>
                            </xsl:otherwise>
                        </xsl:choose>
                        <fieldset>
                            <label class="form-label">Фамилия</label>
                            <input class="form-control" name="surname" pattern="(([a-zA-Z' -]{{1,33}})|([а-яА-ЯЁё-]{{1,33}}))" type="text" placeholder="Иванов" required="true" />
                            <label class="form-label">Имя</label>
                            <input class="form-control" name="name" pattern="(([a-zA-Z' -]{{1,33}})|([а-яА-ЯЁё-]{{1,33}}))" type="text"  placeholder="Иван" required="true" />
                            <label class="form-label">Отчество</label>
                            <input class="form-control" name="patronym" pattern="(([a-zA-Z' -]{{1,33}})|([а-яА-ЯЁё-]{{1,33}}))" type="text"  placeholder="Иванович" required="true" />
                            <label class="form-label">ИНН</label>
                            <input class="form-control" name="inn"  pattern="(\d{{10}})|(\d{{12}})" type="text"  placeholder="3664069397" required="true" />
                            <label>Дата рождения</label>
                            <input class="form-control" name="dateOfBirth" type="date"  required="true" value="2000-01-01" />
                            <label class="pt-3">Паспорт</label>
                            <div class="input-group">
                                <input class="form-control" name="passportSeries" pattern="\d{{4}}" type="text"  placeholder="Серия" required="true" />
                                <input class="form-control" name="passportNumber" pattern="\d{{6}}" type="text"  placeholder="Номер" required="true" />
                            </div>
                            <div class="pb-3">
                                <label>Дата выдачи</label>
                                <input id="passportDate" class="form-control" name="passportDate" type="date" required="true" />
                            </div>
                            <xsl:if test="$clientType = 'organization'">
                                <h5 class="pt-3">Организация</h5>
                                <div class="pb-2">
                                    <label>Название организации</label>
                                    <input class="form-control" name="orgName" type="text" placeholder="Название организации" required="true" />
                                    <label>Адрес организации</label>
                                    <input class="form-control" name="orgAddress" type="text"  placeholder="Адрес организации" required="true" />
                                    <label>ИНН</label>
                                    <input class="form-control" name="orgINN" pattern="(\d{{10}})|(\d{{12}})" min="1" type="text"  placeholder="7727563778" required="true" />
                                    <label>ОГРН</label>
                                    <input class="form-control" name="orgOGRN" pattern="\d{{13}}" type="text"  min="1" placeholder="1057749631994" required="true" />
                                    <label>КПП</label>
                                    <input class="form-control" name="orgKPP" pattern="\d{{9}}" type="text"  min="1" placeholder="639095579" required="true" />
                                </div>
                                <br/>
                            </xsl:if>
                        </fieldset>
                    </div>
                    <xsl:choose>
                        <xsl:when test="$product = 'loan'">
                            <div class="col-md-4 card bg-light">
                                <fieldset>
                                    <legend class="pt-3 pb-3">2. Параметры кредита</legend>
                                    <label>Дата открытия</label>
                                    <input class="form-control" name="openDate" type="date" required="true" />
                                    <label>Срок (мес.)</label>
                                    <input class="form-control" name="termInMonths" type="text" min="1" required="true" />
                                    <label>Сумма кредита ₽</label>
                                    <input class="form-control" name="loanAmount" type="text" min="1000" required="true" />
                                    <label>Вид платежа</label>
                                    <div class="form-group">
                                        <select size="1" class="form-control" name="loanPaymentSchedule">
                                            <option value="annuitet">аннуитетный</option>
                                            <!--                                            <option value="diff">дифференцированный</option>-->
                                        </select>
                                        <span><button type="button" id="help1" class="btn btn-outline-info mt-2" onclick="showHint('loan')" >?</button></span>
                                        <div id="helpText" class="mt-2"></div></div>
                                </fieldset>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <div class="col-md-4 card bg-light">
                                <fieldset>
                                    <legend class="pt-3 pb-3">2. Параметры вклада</legend>
                                    <label>Дата открытия</label>
                                    <input class="form-control" name="openDate" type="date" required="true" />
                                    <label>Срок (мес.)</label>
                                    <input class="form-control" name="termInMonths" type="text"  min="1" required="true" />
                                    <label>Годовая ставка (%)</label>
                                    <input class="form-control" name="depositRate" type="text" required="true" />
                                    <label>Периодичность капитализации</label>
                                    <select size="1" class="form-control" name="depositCapitalization">
                                        <option value="everyMonth" selected="true">Ежемесячно</option>
                                        <option value="onClose">При закрытии вклада</option>
                                    </select>
                                    <span><button type="button" id="help2" class="btn btn-outline-info mt-2" onclick="showHint('deposit')" >?</button></span>
                                    <div id="helpText" class="mt-2"></div>
                                </fieldset>
                            </div>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
                <div align="center" id="errorContainer" class="d-none">
                    <span>Обнаружены следующие ошибки: </span><br/>
                    <span class="text-danger" id="errorText"> </span>
                </div>
                <p class="d-flex justify-content-center mt-2"><input type="submit" value="Отправить заявку" class="btn btn-primary" /></p>
                <br/>
            </div>
        </form>
    </xsl:template>
</xsl:stylesheet>
