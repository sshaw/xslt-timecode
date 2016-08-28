<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:tc="http://screenstaring.com/xslt/timecode">

    <xsl:import href="timecode.xsl"/>

    <xsl:template name="tests">
	<!--
	     ####################
	     # from-frames
	     ####################
	-->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: defaults to 29.97 ND</xsl:with-param>
	    <xsl:with-param name="expect">00:01:00:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1800</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 1@29.97 ND</xsl:with-param>
	    <xsl:with-param name="expect">00:00:00:01</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 1800@29.97 DF</xsl:with-param>
	    <xsl:with-param name="expect">00:01:00:02</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1800</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 1800@29.97 ND</xsl:with-param>
	    <xsl:with-param name="expect">00:01:00:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1800</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="false()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 215999@29.97 ND</xsl:with-param>
	    <xsl:with-param name="expect">01:59:59:29</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">215999</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 1387252@29.97 DF</xsl:with-param>
	    <xsl:with-param name="expect">12:51:28:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1387252</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 1387252@29.97</xsl:with-param>
	    <xsl:with-param name="expect">12:50:41:22</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1387252</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="false()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 00:00:00:01@30</xsl:with-param>
	    <xsl:with-param name="expect">00:00:00:01</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1</xsl:with-param>
		    <xsl:with-param name="fps">30</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames 215999@29.97</xsl:with-param>
	    <xsl:with-param name="expect">01:59:59:29</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">215999</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!-- 23.98 -->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 1800@23.98</xsl:with-param>
	    <xsl:with-param name="expect">00:01:15:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1800</xsl:with-param>
		    <xsl:with-param name="fps">23.98</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 215999@23.98</xsl:with-param>
	    <xsl:with-param name="expect">02:29:59:23</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">215999</xsl:with-param>
		    <xsl:with-param name="fps">23.98</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!-- 24 -->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 1800@24</xsl:with-param>
	    <xsl:with-param name="expect">00:01:15:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1800</xsl:with-param>
		    <xsl:with-param name="fps">24</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!-- 59.94 -->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 1800@54.94 ND</xsl:with-param>
	    <xsl:with-param name="expect">00:00:30:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1800</xsl:with-param>
		    <xsl:with-param name="fps">59.94</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: 215999@54.94 DF</xsl:with-param>
	    <xsl:with-param name="expect">01:00:03:35</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">215999</xsl:with-param>
		    <xsl:with-param name="fps">59.94</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames 3600@59.94 DF</xsl:with-param>
	    <xsl:with-param name="expect">00:01:00:04</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">3600</xsl:with-param>
		    <xsl:with-param name="fps">59.94</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames 1387252@59.94 DF</xsl:with-param>
	    <xsl:with-param name="expect">06:25:44:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1387252</xsl:with-param>
		    <xsl:with-param name="fps">59.94</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!-- With delimiters  -->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: custom delimiters</xsl:with-param>
	    <xsl:with-param name="expect">00/01/00-00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">1800</xsl:with-param>
		    <xsl:with-param name="delimiter">/</xsl:with-param>
		    <xsl:with-param name="frame-delimiter">-</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!-- Invald frames -->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: invalid frames foo</xsl:with-param>
	    <xsl:with-param name="expect"></xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">foo</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:from-frames: invalid frames -100</xsl:with-param>
	    <xsl:with-param name="expect"></xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:from-frames">
		    <xsl:with-param name="frames">-100</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>


	<!--
	     ####################
	     # to-frames
	     ####################
	-->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:00:00:00</xsl:with-param>
	    <xsl:with-param name="expect">0</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">00:00:00:00</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:00:00:01@29.97</xsl:with-param>
	    <xsl:with-param name="expect">1</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">00:00:00:01</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:01:00:00@29.97</xsl:with-param>
	    <xsl:with-param name="expect">1800</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">00:01:00:00</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:01:00:02@29.97 DF</xsl:with-param>
	    <xsl:with-param name="expect">1800</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">00:01:00:02</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:01:00.02@29.97 DF delimiter '.'</xsl:with-param>
	    <xsl:with-param name="expect">1800</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">00:01:00.02</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:01:00.02@29.97 DF delimiter ';'</xsl:with-param>
	    <xsl:with-param name="expect">1800</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">00:01:00;02</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 12:51:28:00@29.97 DF</xsl:with-param>
	    <xsl:with-param name="expect">1387252</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">12:51:28:00</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 12:50:41:22@29.97</xsl:with-param>
	    <xsl:with-param name="expect">1387252</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">12:50:41:22</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:01:00:02@30 DF</xsl:with-param>
	    <xsl:with-param name="expect">1800</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
    		    <xsl:with-param name="timecode" select="'00:01:00:02'"/>
    		    <xsl:with-param name="drop-frame" select="true()"/>
    		    <xsl:with-param name="fps" select="30"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames 00:10:00:00@30 DF</xsl:with-param>
	    <xsl:with-param name="expect">17982</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
    		    <xsl:with-param name="timecode" select="'00:10:00:00'"/>
    		    <xsl:with-param name="drop-frame" select="true()"/>
    		    <xsl:with-param name="fps" select="30"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:01:00:04@59.94</xsl:with-param>
	    <xsl:with-param name="expect">3604</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">00:01:00:04</xsl:with-param>
		    <xsl:with-param name="fps">59.94</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: 00:01:00:04@59.94 DF</xsl:with-param>
	    <xsl:with-param name="expect">3600</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">00:01:00:04</xsl:with-param>
		    <xsl:with-param name="fps">59.94</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: invalid timecode 01:02:03:04:</xsl:with-param>
	    <xsl:with-param name="expect">NaN</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">01:02:03:04:</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:to-frames: invalid timecode 100</xsl:with-param>
	    <xsl:with-param name="expect">NaN</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:to-frames">
		    <xsl:with-param name="timecode">100</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!--
	     ####################
	     # Parsing
	     ####################
	 -->

	<xsl:variable name="tc-ndf">01:02:03:04</xsl:variable>
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:hours: 01:02:03:04</xsl:with-param>
	    <xsl:with-param name="expect">01</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:hours">
		    <xsl:with-param name="timecode" select="$tc-ndf"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:minutes: 01:02:03:04</xsl:with-param>
	    <xsl:with-param name="expect">02</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:minutes">
		    <xsl:with-param name="timecode" select="$tc-ndf"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:seconds: 01:02:03:04</xsl:with-param>
	    <xsl:with-param name="expect">03</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:seconds">
		    <xsl:with-param name="timecode" select="$tc-ndf"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:frames: 01:02:03:04</xsl:with-param>
	    <xsl:with-param name="expect">04</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:frames">
		    <xsl:with-param name="timecode" select="$tc-ndf"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:variable name="tc-df">01:02:03;04</xsl:variable>
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:hours: 01:02:03;04</xsl:with-param>
	    <xsl:with-param name="expect">01</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:hours">
		    <xsl:with-param name="timecode" select="$tc-df"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:minutes: 01:02:03;04</xsl:with-param>
	    <xsl:with-param name="expect">02</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:minutes">
		    <xsl:with-param name="timecode" select="$tc-df"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:seconds: 01:02:03;04</xsl:with-param>
	    <xsl:with-param name="expect">03</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:seconds">
		    <xsl:with-param name="timecode" select="$tc-df"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:frames: 01:02:03;04</xsl:with-param>
	    <xsl:with-param name="expect">04</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:frames">
		    <xsl:with-param name="timecode" select="$tc-df"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!--
	     ####################
	     # Conversion
	     ####################
	-->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">convert: 00:01:00:00 to drop frame</xsl:with-param>
	    <xsl:with-param name="expect">00:01:00:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:convert">
		    <xsl:with-param name="timecode">00:01:00:02</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		    <xsl:with-param name="to-drop-frame" select="false()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>


	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">convert: 00:01:00:02@29.97 DF to ND</xsl:with-param>
	    <xsl:with-param name="expect">00:01:00:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:convert">
		    <xsl:with-param name="timecode">00:01:00:02</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		    <xsl:with-param name="to-drop-frame" select="false()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">convert: 00:01:00:00@29.97 DF to 59.94 ND</xsl:with-param>
	    <xsl:with-param name="expect">00:00:30:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:convert">
		    <xsl:with-param name="timecode">00:01:00:02</xsl:with-param>
		    <xsl:with-param name="fps" select="29.97"/>
		    <xsl:with-param name="drop-frame" select="true()"/>
		    <xsl:with-param name="to-fps" select="59.94"/>
		    <xsl:with-param name="to-drop-frame" select="false()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">convert: format 00:01:00:02 as 00:01:00.02</xsl:with-param>
	    <xsl:with-param name="expect">00:01:00.02</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:convert">
		    <xsl:with-param name="timecode">00:01:00:02</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		    <xsl:with-param name="frame-delimiter" select="'.'"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>


	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">convert: invalid timecode</xsl:with-param>
	    <xsl:with-param name="expect"></xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:convert">
		    <xsl:with-param name="timecode">00:01:00:0</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!--
	     ####################
	     # Validation
	     ####################
	-->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: 00:00:00:00</xsl:with-param>
	    <xsl:with-param name="expect">true</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">00:00:00:00</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: 01:02:03:04</xsl:with-param>
	    <xsl:with-param name="expect">true</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">01:02:03:04</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: 01:02:03;04</xsl:with-param>
	    <xsl:with-param name="expect">true</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">01:02:03;04</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: 01:02:03.04</xsl:with-param>
	    <xsl:with-param name="expect">true</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">01:02:03.04</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: 99:59:59:29@29.97</xsl:with-param>
	    <xsl:with-param name="expect">true</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">99:59:59:29</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: 99:59:59:30@29.97</xsl:with-param>
	    <xsl:with-param name="expect">false</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">99:59:59:30</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: 00:01:00.02@29.97 DF</xsl:with-param>
	    <xsl:with-param name="expect">true</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">00:01:00.02</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: 00:01:00;02@29.97 DF</xsl:with-param>
	    <xsl:with-param name="expect">true</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">00:01:00;02</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: invalid timecode 00:01:00:00@29.97 DF</xsl:with-param>
	    <xsl:with-param name="expect">false</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">00:01:0o:00</xsl:with-param>
		    <xsl:with-param name="fps">29.97</xsl:with-param>
		    <xsl:with-param name="drop-frame" select="true()"/>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: invalid timecode 10</xsl:with-param>
	    <xsl:with-param name="expect">false</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">10</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: invalid timecode 00:00:00</xsl:with-param>
	    <xsl:with-param name="expect">false</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">00:00:00</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: invalid timecode 00:00:00:00:</xsl:with-param>
	    <xsl:with-param name="expect">false</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">00:00:00:00:</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:valid: invalid timecode foo</xsl:with-param>
	    <xsl:with-param name="expect">false</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:valid">
		    <xsl:with-param name="timecode">foo</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!-- Math -->
	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:add: 00:00:00:01 + 00:00:00:01</xsl:with-param>
	    <xsl:with-param name="expect">00:00:00:02</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:add">
		    <xsl:with-param name="timecode1">00:00:00:01</xsl:with-param>
		    <xsl:with-param name="timecode2">00:00:00:01</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:add: 01:59:59:29 + 00:00:00:01</xsl:with-param>
	    <xsl:with-param name="expect">02:00:00:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:add">
		    <xsl:with-param name="timecode1">01:59:59:29</xsl:with-param>
		    <xsl:with-param name="timecode2">00:00:00:01</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:add: drop frame</xsl:with-param>
	    <xsl:with-param name="expect">00:02:00:04</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:add">
		    <xsl:with-param name="timecode1">00:01:00:02</xsl:with-param>
		    <xsl:with-param name="drop-frame1" select="true()"/>
		    <xsl:with-param name="timecode2">00:01:00:00</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:add: LHS has drop frame delimiter</xsl:with-param>
	    <xsl:with-param name="expect">00:02:00:04</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:add">
		    <xsl:with-param name="timecode1">00:01:00;02</xsl:with-param>
		    <xsl:with-param name="timecode2">00:01:00:00</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:add: LHS is invalid</xsl:with-param>
	    <xsl:with-param name="expect">NaN</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:add">
		    <xsl:with-param name="timecode1">foo</xsl:with-param>
		    <xsl:with-param name="timecode2">00:01:00:00</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:subtract: 00:00:00:00 - 00:00:00:00</xsl:with-param>
	    <xsl:with-param name="expect">00:00:00:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:subtract">
		    <xsl:with-param name="timecode1">00:00:00:00</xsl:with-param>
		    <xsl:with-param name="timecode2">00:00:00:00</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:subtract: 02:00:00:00 - 00:00:00:01</xsl:with-param>
	    <xsl:with-param name="expect">01:59:59:29</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:subtract">
		    <xsl:with-param name="timecode1">02:00:00:00</xsl:with-param>
		    <xsl:with-param name="timecode2">00:00:00:01</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:subtract: 23:00:04:29 DF - 00:00:05:00 DF</xsl:with-param>
	    <xsl:with-param name="expect">22:59:59:29</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:subtract">
		    <xsl:with-param name="timecode1">23:00:04:29</xsl:with-param>
		    <xsl:with-param name="drop-frame1">1</xsl:with-param>
		    <xsl:with-param name="timecode2">00:00:05:00</xsl:with-param>
		    <xsl:with-param name="drop-frame2">1</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:multiply: 04:00:00:00 * 2</xsl:with-param>
	    <xsl:with-param name="expect">04:00:00:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:multiply">
		    <xsl:with-param name="timecode">02:00:00:00</xsl:with-param>
		    <xsl:with-param name="by">2</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:call-template name="output-test-result">
	    <xsl:with-param name="name">tc:divide: 02:00:00:00 / 2</xsl:with-param>
	    <xsl:with-param name="expect">02:00:00:00</xsl:with-param>
	    <xsl:with-param name="result">
		<xsl:call-template name="tc:divide">
		    <xsl:with-param name="timecode">04:00:00:00</xsl:with-param>
		    <xsl:with-param name="by">2</xsl:with-param>
		</xsl:call-template>
	    </xsl:with-param>
	</xsl:call-template>

	<!-- <xsl:call-template name="output-test-result"> -->
	<!--   <xsl:with-param name="name">tc:to-frames -drop-frame</xsl:with-param> -->
	<!--   <xsl:with-param name="expect">30</xsl:with-param> -->
	<!--   <xsl:with-param name="result"> -->
	<!--   <xsl:call-template name="tc:to-frames"> -->
	<!-- 	<xsl:with-param name="timecode" select="'00:00:10:00'"/> -->
	<!-- 	<xsl:with-param name="drop-frame">1</xsl:with-param> -->
	<!-- 	<xsl:with-param name="fps">30</xsl:with-param> -->
	<!--   </xsl:call-template> -->
	<!--   </xsl:with-param> -->
	<!-- </xsl:call-template> -->

    </xsl:template>

    <xsl:template name="output-test-result">
	<xsl:param name="name"/>
	<xsl:param name="expect"/>
	<xsl:param name="result"/>

	<xsl:variable name="pass-or-fail-message">
	    <xsl:choose>
		<!-- trailing space on output is intentional -->
		<xsl:when test="$result = $expect">pass </xsl:when>
		<xsl:otherwise>fail (expected: <xsl:value-of select="$expect"/>, result: <xsl:value-of select="$result"/>)</xsl:otherwise>
	    </xsl:choose>
	</xsl:variable>

	<xsl:message>
	    <xsl:value-of select="$name"/>: <xsl:value-of select="$pass-or-fail-message"/>
	</xsl:message>
    </xsl:template>

    <xsl:template match="/">
	<xsl:call-template name="tests"/>
    </xsl:template>
</xsl:stylesheet>
