<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>Schedule</h2>
                <table border="1">
                    <tr bgcolor="#949494">
                        <th>Title</th>
                        <th>Professor</th>
                        <th>Day</th>
                    </tr>
                    <xsl:for-each select="Schedule/Lesson/Lecture">
                    <xsl:sort select="Day"/>
                        <tr>
                            <xsl:choose>
                                <xsl:when test="contains(./Day, 'Monday')">
                                    <td bgcolor="#ff0000"> <xsl:value-of select="../Title"/> </td>
                                    <td bgcolor="#ff0000"> <xsl:value-of select="../Professor"/> </td>
                                    <td bgcolor="#ff0000"> <xsl:value-of select="Day"/> </td>
                                </xsl:when>
                                <xsl:when test="contains(./Day, 'Tuesday')">
                                    <td bgcolor="#ffff00"> <xsl:value-of select="../Title"/> </td>
                                    <td bgcolor="#ffff00"> <xsl:value-of select="../Professor"/> </td>
                                    <td bgcolor="#ffff00"> <xsl:value-of select="Day"/> </td>
                                </xsl:when>
                                <xsl:when test="contains(./Day, 'Wednesday')">
                                    <td bgcolor="#ffc0cb"> <xsl:value-of select="../Title"/> </td>
                                    <td bgcolor="#ffc0cb"> <xsl:value-of select="../Professor"/> </td>
                                    <td bgcolor="#ffc0cb"> <xsl:value-of select="Day"/> </td>
                                </xsl:when>
                                <xsl:when test="contains(./Day, 'Thursday')">
                                    <td bgcolor="#008000"> <xsl:value-of select="../Title"/> </td>
                                    <td bgcolor="#008000"> <xsl:value-of select="../Professor"/> </td>
                                    <td bgcolor="#008000"> <xsl:value-of select="Day"/> </td>
                                </xsl:when>
                                <xsl:when test="contains(./Day, 'Friday')">
                                    <td bgcolor="#ffa500"> <xsl:value-of select="../Title"/> </td>
                                    <td bgcolor="#ffa500"> <xsl:value-of select="../Professor"/> </td>
                                    <td bgcolor="#ffa500"> <xsl:value-of select="Day"/> </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td> <xsl:value-of select="../Title"/> </td>
                                    <td> <xsl:value-of select="../Professor"/> </td>
                                    <td> <xsl:value-of select="Day"/> </td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
