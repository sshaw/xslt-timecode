<?xml version="1.0"?>
<!--
     Name: timecode
     Author: Skye Shaw (skye.shaw@gmail.com)
     Description: A pure, dependency free, XSLT 1.0 library for video timecode manipulation.
     Homepage: https://github.com/sshaw/xslt-timecode
     License: Released under the MIT License: www.opensource.org/licenses/MIT
     Copyright (c): 2011-2016 Skye Shaw. All rights reserved.
   -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:tc="http://screenstaring.com/xslt/timecode">

    <xsl:param name="tc:default-fps" select="29.97"/>

    <xsl:template name="tc:hours">
	<xsl:param name="timecode"/>

	<xsl:call-template name="tc:_part-if-valid">
	    <xsl:with-param name="timecode" select="$timecode"/>
	    <xsl:with-param name="part">h</xsl:with-param>
	</xsl:call-template>
    </xsl:template>

    <xsl:template name="tc:minutes">
	<xsl:param name="timecode"/>

	<xsl:call-template name="tc:_part-if-valid">
	    <xsl:with-param name="timecode" select="$timecode"/>
	    <xsl:with-param name="part">m</xsl:with-param>
	</xsl:call-template>
    </xsl:template>

    <xsl:template name="tc:seconds">
	<xsl:param name="timecode"/>

	<xsl:call-template name="tc:_part-if-valid">
	    <xsl:with-param name="timecode" select="$timecode"/>
	    <xsl:with-param name="part">s</xsl:with-param>
	</xsl:call-template>
    </xsl:template>

    <xsl:template name="tc:frames">
	<xsl:param name="timecode"/>

	<xsl:call-template name="tc:_part-if-valid">
	    <xsl:with-param name="timecode" select="$timecode"/>
	    <xsl:with-param name="part">f</xsl:with-param>
	</xsl:call-template>
    </xsl:template>

    <xsl:template name="tc:add">
	<xsl:param name="timecode1"/>
	<xsl:param name="fps1"/>
	<xsl:param name="drop-frame1"/>
	<xsl:param name="timecode2"/>
	<xsl:param name="fps2"/>
	<xsl:param name="drop-frame2"/>

	<xsl:call-template name="tc:_arithmetic">
	    <xsl:with-param name="op">+</xsl:with-param>
	    <xsl:with-param name="timecode1" select="$timecode1"/>
	    <xsl:with-param name="fps1" select="$fps1"/>
	    <xsl:with-param name="drop-frame1" select="$drop-frame1"/>
	    <xsl:with-param name="timecode2" select="$timecode2"/>
	    <xsl:with-param name="fps2" select="$fps2"/>
	    <xsl:with-param name="drop-frame2" select="$drop-frame2"/>
	</xsl:call-template>
    </xsl:template>

    <xsl:template name="tc:subtract">
	<xsl:param name="timecode1"/>
	<xsl:param name="fps1"/>
	<xsl:param name="drop-frame1"/>
	<xsl:param name="timecode2"/>
	<xsl:param name="fps2"/>
	<xsl:param name="drop-frame2"/>

	<xsl:call-template name="tc:_arithmetic">
	    <xsl:with-param name="op">-</xsl:with-param>
	    <xsl:with-param name="timecode1" select="$timecode1"/>
	    <xsl:with-param name="fps1" select="$fps1"/>
	    <xsl:with-param name="drop-frame1" select="$drop-frame1"/>
	    <xsl:with-param name="timecode2" select="$timecode2"/>
	    <xsl:with-param name="fps2" select="$fps2"/>
	    <xsl:with-param name="drop-frame2" select="$drop-frame2"/>
	</xsl:call-template>
    </xsl:template>

    <xsl:template name="tc:multiply">
	<xsl:param name="timecode"/>
	<xsl:param name="fps"/>
	<xsl:param name="drop-frame"/>
	<xsl:param name="by"/>

	<xsl:call-template name="tc:_arithmetic">
	    <xsl:with-param name="op">*</xsl:with-param>
	    <xsl:with-param name="timecode1" select="$timecode"/>
	    <xsl:with-param name="fps1" select="$fps"/>
	    <xsl:with-param name="drop-frame1" select="$drop-frame"/>
	    <xsl:with-param name="by" select="$by"/>
	</xsl:call-template>
    </xsl:template>

    <xsl:template name="tc:divide">
	<xsl:param name="timecode"/>
	<xsl:param name="fps"/>
	<xsl:param name="drop-frame"/>
	<xsl:param name="by"/>

	<xsl:call-template name="tc:_arithmetic">
	    <xsl:with-param name="op">/</xsl:with-param>
	    <xsl:with-param name="timecode1" select="$timecode"/>
	    <xsl:with-param name="fps1" select="$fps"/>
	    <xsl:with-param name="drop-frame1" select="$drop-frame"/>
	    <xsl:with-param name="by" select="$by"/>
	</xsl:call-template>
    </xsl:template>

    <xsl:template name="tc:from-frames">
	<xsl:param name="frames"/>
	<xsl:param name="fps" select="$tc:default-fps"/>
	<xsl:param name="drop-frame"/>
	<xsl:param name="delimiter" select="':'"/>
	<xsl:param name="frame-delimiter" select="':'"/>

	<xsl:variable name="frames-to-drop">
	    <xsl:call-template name="tc:_frames-to-drop">
		<xsl:with-param name="fps" select="$fps"/>
		<xsl:with-param name="drop-frame" select="$drop-frame"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="frames-per-minute" select="round($fps) * 60 - $frames-to-drop"/>
	<xsl:variable name="frames-per-ten-minutes" select="$fps * 60 * 10"/>
	<xsl:variable name="d" select="floor($frames div $frames-per-ten-minutes)"/>
	<xsl:variable name="m" select="$frames mod $frames-per-ten-minutes"/>
	<xsl:variable name="total-frames">
	    <xsl:choose>
		<xsl:when test="$m &gt; $frames-to-drop">
		    <xsl:value-of select="$frames + $frames-to-drop * 9 * $d + $frames-to-drop * floor(($m - $frames-to-drop) div $frames-per-minute)"/>
		</xsl:when>
		<xsl:otherwise>
		    <xsl:value-of select="$frames + $frames-to-drop * 9 * $d"/>
		</xsl:otherwise>
	    </xsl:choose>
	</xsl:variable>

	<xsl:variable name="frames-part">
	    <xsl:call-template name="tc:_pad-part">
	      <xsl:with-param name="part">
		    <xsl:value-of select="$total-frames mod round($fps)"/>
		</xsl:with-param>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="seconds-part">
	    <xsl:call-template name="tc:_pad-part">
		<xsl:with-param name="part">
		    <xsl:value-of select="floor($total-frames mod (round($fps) * 60) div round($fps))"/>
		</xsl:with-param>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="minutes-part">
	    <xsl:call-template name="tc:_pad-part">
		<xsl:with-param name="part">
		    <xsl:value-of select="floor($total-frames mod (round($fps) * 60 * 60) div (round($fps) * 60))"/>
		</xsl:with-param>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="hours-part">
	    <xsl:call-template name="tc:_pad-part">
		<xsl:with-param name="part">
		    <xsl:value-of select="floor($total-frames div (round($fps) * 60 * 60))"/>
		</xsl:with-param>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:if test="number($hours-part) &gt;= 0 and number($minutes-part) &gt;= 0 and number($seconds-part) &gt;= 0 and number($frames-part) &gt;= 0">
	    <xsl:value-of select="concat($hours-part, $delimiter, $minutes-part, $delimiter, $seconds-part, $frame-delimiter, $frames-part)"/>
	</xsl:if>
    </xsl:template>

    <xsl:template name="tc:to-frames">
	<xsl:param name="timecode"/>
	<xsl:param name="fps" select="$tc:default-fps"/>
	<xsl:param name="drop-frame"/>

	<xsl:variable name="_drop-frame">
	    <xsl:call-template name="tc:_is-drop-frame">
		<xsl:with-param name="timecode" select="$timecode"/>
		<xsl:with-param name="drop-frame" select="$drop-frame"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="hours">
	    <xsl:call-template name="tc:hours">
		<xsl:with-param name="timecode" select="$timecode"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="minutes">
	    <xsl:call-template name="tc:minutes">
    		<xsl:with-param name="timecode" select="$timecode"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="seconds">
	    <xsl:call-template name="tc:seconds">
    		<xsl:with-param name="timecode" select="$timecode"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="frames">
	    <xsl:call-template name="tc:frames">
    		<xsl:with-param name="timecode" select="$timecode"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="total-frames">
	    <xsl:value-of select="$frames +
				  $seconds * round($fps) +
				  $minutes * round($fps) * 60 +
				  $hours * round($fps) * 3600"/>
	</xsl:variable>

	<xsl:variable name="total-minutes" select="60 * $hours + $minutes"/>
	<xsl:variable name="frames-to-drop">
	    <xsl:call-template name="tc:_frames-to-drop">
		<xsl:with-param name="fps" select="$fps"/>
		<xsl:with-param name="drop-frame" select="$_drop-frame = 'true'"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:value-of select="$total-frames - $frames-to-drop * ($total-minutes - floor($total-minutes div 10))"/>
    </xsl:template>

    <xsl:template name="tc:convert">
	<xsl:param name="timecode"/>
	<xsl:param name="drop-frame"/>
	<xsl:param name="fps" select="$tc:default-fps"/>
	<xsl:param name="to-drop-frame" select="$drop-frame"/>
	<xsl:param name="to-fps" select="$tc:default-fps"/>
	<xsl:param name="delimiter" select="':'"/>
	<xsl:param name="frame-delimiter" select="':'"/>

	<xsl:variable name="_drop-frame">
	    <xsl:call-template name="tc:_is-drop-frame">
		<xsl:with-param name="timecode" select="$timecode"/>
		<xsl:with-param name="drop-frame" select="$drop-frame"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="valid">
	    <xsl:call-template name="tc:valid">
		<xsl:with-param name="timecode" select="$timecode"/>
		<xsl:with-param name="drop-frame" select="$_drop-frame = 'true'"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:if test="$valid = 'true'">
	    <xsl:variable name="frames">
		<xsl:call-template name="tc:to-frames">
    		    <xsl:with-param name="timecode" select="$timecode"/>
    		    <xsl:with-param name="drop-frame" select="$_drop-frame = 'true'"/>
    		    <xsl:with-param name="fps" select="$fps"/>
		</xsl:call-template>
	    </xsl:variable>

	    <xsl:call-template name="tc:from-frames">
    		<xsl:with-param name="frames" select="$frames"/>
    		<xsl:with-param name="drop-frame" select="$to-drop-frame"/>
    		<xsl:with-param name="fps" select="$to-fps"/>
		<xsl:with-param name="delimiter" select="$delimiter"/>
		<xsl:with-param name="frame-delimiter" select="$frame-delimiter"/>
	    </xsl:call-template>
	</xsl:if>
    </xsl:template>

    <xsl:template name="tc:valid">
	<xsl:param name="timecode"/>
	<xsl:param name="fps" select="$tc:default-fps"/>
	<xsl:param name="drop-frame"/>

	<xsl:variable name="hours">
	    <xsl:call-template name="tc:_part">
		<xsl:with-param name="timecode" select="$timecode"/>
		<xsl:with-param name="part">h</xsl:with-param>
	    </xsl:call-template>
	</xsl:variable>
	<xsl:variable name="minutes">
	    <xsl:call-template name="tc:_part">
		<xsl:with-param name="timecode" select="$timecode"/>
		<xsl:with-param name="part">m</xsl:with-param>
	    </xsl:call-template>
	</xsl:variable>
	<xsl:variable name="seconds">
	    <xsl:call-template name="tc:_part">
		<xsl:with-param name="timecode" select="$timecode"/>
		<xsl:with-param name="part">s</xsl:with-param>
	    </xsl:call-template>
	</xsl:variable>
	<xsl:variable name="frames">
	    <xsl:call-template name="tc:_part">
		<xsl:with-param name="timecode" select="$timecode"/>
		<xsl:with-param name="part">f</xsl:with-param>
	    </xsl:call-template>
	</xsl:variable>

	<!-- TODO: More flexible with length, e.g., allow TC@FPS, etc... -->
	<!-- the values of $minutes, $seconds, ... are padded with 0?! -->
	<xsl:choose>
	    <xsl:when test="string-length($timecode) = 11 and
			    $hours   &gt;= 0 and $hours   &lt; 100 and
			    $minutes &gt;= 0 and $minutes &lt; 100 and
			    $seconds &gt;= 0 and $seconds &lt; 60  and
			    $frames  &gt;= 0 and $frames &lt; $fps">
		<xsl:choose>
		    <xsl:when test="$drop-frame">
			<xsl:call-template name="tc:_valid-drop-frame">
	    		    <xsl:with-param name="minutes" select="number($minutes)"/>
	    		    <xsl:with-param name="seconds" select="number($seconds)"/>
	    		    <xsl:with-param name="frames" select="number($frames)"/>
			</xsl:call-template>
		    </xsl:when>
		    <xsl:otherwise>
			<xsl:value-of select="true()"/>
		    </xsl:otherwise>
		</xsl:choose>
	    </xsl:when>
	    <xsl:otherwise>
		<xsl:value-of select="false()"/>
	    </xsl:otherwise>
	</xsl:choose>
    </xsl:template>

    <!--
	 ##############################
	 # Private Templates
	 ##############################
    -->
    <xsl:template name="tc:_frames-to-drop">
	<xsl:param name="fps"/>
	<xsl:param name="drop-frame"/>

	<xsl:choose>
	    <xsl:when test="$drop-frame">
		<xsl:value-of select="ceiling($fps * 0.066666)"/>
	    </xsl:when>
	    <xsl:otherwise>0</xsl:otherwise>
	</xsl:choose>
    </xsl:template>

    <xsl:template name="tc:_valid-drop-frame">
	<xsl:param name="minutes"/>
	<xsl:param name="seconds"/>
	<xsl:param name="frames"/>

	<xsl:value-of select="$seconds != 0 or ($frames != 0 and $frames != 1) or ($minutes mod 10 = 0)"/>
    </xsl:template>

    <xsl:template name="tc:_part">
	<xsl:param name="timecode"/>
	<xsl:param name="part"/>
	<xsl:choose>
	    <xsl:when test="$part = 'h' or $part = 'H'">
		<xsl:value-of select="substring($timecode, 1, 2)"/>
	    </xsl:when>
	    <xsl:when test="$part = 'm' or $part = 'M'">
		<xsl:value-of select="substring($timecode, 4, 2)"/>
	    </xsl:when>
	    <xsl:when test="$part = 's' or $part = 'S'">
		<xsl:value-of select="substring($timecode, 7, 2)"/>
	    </xsl:when>
	    <xsl:when test="$part = 'f' or $part = 'F'">
		<xsl:value-of select="substring($timecode, 10, 2)"/>
	    </xsl:when>
	    <xsl:otherwise>
	    </xsl:otherwise>
	</xsl:choose>
    </xsl:template>

    <xsl:template name="tc:_is-drop-frame">
	<xsl:param name="timecode"/>
	<xsl:param name="drop-frame"/>
	<!-- Only check delimiter if $drop-frame is not set -->
	<xsl:value-of select="$drop-frame = true() or (string-length($drop-frame) = 0 and (substring($timecode, 9, 1) = ';' or substring($timecode, 9, 1) = '.'))"/>
    </xsl:template>

    <xsl:template name="tc:_part-if-valid">
	<xsl:param name="timecode"/>
	<xsl:param name="part"/>
	<xsl:variable name="valid">
	    <xsl:call-template name="tc:valid">
		<xsl:with-param name="timecode" select="$timecode"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:if test="$valid = 'true'">
	    <xsl:call-template name="tc:_part">
		<xsl:with-param name="timecode" select="$timecode"/>
		<xsl:with-param name="part" select="$part"/>
	    </xsl:call-template>
	</xsl:if>
    </xsl:template>

    <xsl:template name="tc:_pad-part">
	<xsl:param name="part"/>
	<xsl:choose>
	    <xsl:when test="$part &gt;= 0 and $part &lt;= 9">
		<xsl:value-of select="concat('0', $part)"/>
	    </xsl:when>
	    <xsl:otherwise>
		<xsl:value-of select="$part"/>
	    </xsl:otherwise>
	</xsl:choose>
    </xsl:template>

    <xsl:template name="tc:_arithmetic">
	<xsl:param name="op"/>
	<xsl:param name="timecode1"/>
	<xsl:param name="fps1"/>
	<xsl:param name="drop-frame1"/>
	<xsl:param name="timecode2"/>
	<xsl:param name="fps2"/>
	<xsl:param name="drop-frame2"/>
	<!-- Only used if we're multiplying or dividing -->
	<xsl:param name="by" select="1"/>

	<xsl:variable name="_drop-frame1">
	    <xsl:call-template name="tc:_is-drop-frame">
		<xsl:with-param name="timecode" select="$timecode1"/>
		<xsl:with-param name="drop-frame" select="$drop-frame1"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="_drop-frame2">
	    <xsl:call-template name="tc:_is-drop-frame">
		<xsl:with-param name="timecode" select="$timecode2"/>
		<xsl:with-param name="drop-frame" select="$drop-frame2"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="tc1-valid">
	    <xsl:call-template name="tc:valid">
		<xsl:with-param name="timecode" select="$timecode1"/>
		<xsl:with-param name="drop-frame" select="$_drop-frame1 = 'true'"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="tc2-valid">
	    <xsl:call-template name="tc:valid">
		<xsl:with-param name="timecode" select="$timecode2"/>
		<xsl:with-param name="drop-frame" select="$_drop-frame2 = 'true'"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:variable name="_fps1">
	    <xsl:choose>
		<xsl:when test="$fps1"><xsl:value-of select="$fps1"/></xsl:when>
		<xsl:otherwise><xsl:value-of select="$tc:default-fps"/></xsl:otherwise>
	    </xsl:choose>
	</xsl:variable>

	<xsl:variable name="_fps2">
	    <xsl:choose>
		<xsl:when test="$fps2"><xsl:value-of select="$fps2"/></xsl:when>
		<xsl:otherwise><xsl:value-of select="$_fps1"/></xsl:otherwise>
	    </xsl:choose>
	</xsl:variable>

	<xsl:variable name="frames1">
	    <xsl:call-template name="tc:to-frames">
		<xsl:with-param name="timecode" select="$timecode1"/>
		<xsl:with-param name="fps" select="$_fps1"/>
		<xsl:with-param name="drop-frame" select="$_drop-frame1 = 'true'"/>
	    </xsl:call-template>
	</xsl:variable>

	<xsl:choose>
	    <xsl:when test="$op = '+' or $op = '-'">
		<xsl:variable name="frames2">
		    <xsl:call-template name="tc:to-frames">
			<xsl:with-param name="timecode" select="$timecode2"/>
			<xsl:with-param name="fps" select="$_fps2"/>
			<xsl:with-param name="drop-frame" select="$_drop-frame2 = 'true'"/>
		    </xsl:call-template>
		</xsl:variable>

		<xsl:choose>
		    <xsl:when test="$tc1-valid != 'true' or $tc2-valid != 'true'">NaN</xsl:when>
		    <xsl:when test="$op = '+'">
			<xsl:call-template name="tc:from-frames">
			    <xsl:with-param name="frames" select="$frames1 + $frames2"/>
			    <xsl:with-param name="fps" select="$_fps1"/>
			    <xsl:with-param name="drop-frame" select="$_drop-frame1 = 'true'"/>
			</xsl:call-template>
		    </xsl:when>

		    <xsl:when test="$op = '-'">
			<xsl:call-template name="tc:from-frames">
			    <xsl:with-param name="frames" select="$frames1 - $frames2"/>
			    <xsl:with-param name="fps" select="$_fps1"/>
			    <xsl:with-param name="drop-frame" select="$_drop-frame1 = 'true'"/>
			</xsl:call-template>
		    </xsl:when>
		</xsl:choose>
	    </xsl:when>

	    <!-- and $by -->
	    <xsl:when test="$op = '/' or $op = '*'">
      		<xsl:choose>
		    <xsl:when test="$tc1-valid != 'true'">NaN</xsl:when>
      		    <xsl:when test="$op = '/'">
      			<xsl:call-template name="tc:from-frames">
      			    <xsl:with-param name="frames" select="floor($frames1 div $by)"/>
			    <xsl:with-param name="fps" select="$_fps1"/>
			    <xsl:with-param name="drop-frame" select="$_drop-frame1 = 'true'"/>
      			</xsl:call-template>
      		    </xsl:when>

      		    <xsl:when test="$op = '*'">
      			<xsl:call-template name="tc:from-frames">
      			    <xsl:with-param name="frames" select="$frames1 * $by"/>
			    <xsl:with-param name="fps" select="$_fps1"/>
			    <xsl:with-param name="drop-frame" select="$_drop-frame1 = 'true'"/>
      			</xsl:call-template>
      		    </xsl:when>
      		</xsl:choose>
	    </xsl:when>

	    <xsl:otherwise>NaN</xsl:otherwise>
	</xsl:choose>
    </xsl:template>
</xsl:stylesheet>
