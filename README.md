Timecode
=======

A pure, dependency free, XSLT 1.0 library for video timecode manipulation.

Supports
---------

* Any frame rate
* Drop/nondrop frame timecodes
* Arithmetic
* Conversions: to/from drop/nondrop, timecode to/from frames
* Field extraction


Usage
---------

Setup the timecode namespace:

	<xsl:stylesheet version="1.0"
	  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:tc="http://screenstaring.com/xslt/timecode">

Import (or include) the stylesheet:

    <xsl:import href="/path/to/timecode.xsl"/>

Examples
---------

	<?xml version="1.0"?>
	<xsl:stylesheet version="1.0"
	  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:tc="http://screenstaring.com/xslt/timecode">

      <xsl:import href="timecode.xsl"/>

	  <!-- Returns: 1800 -->
	  <xsl:variable name="frames">
	      <xsl:call-template name="tc:to-frames">
	          <xsl:with-param name="timecode">00:00:01:02</xsl:with-param>
		      <xsl:with-param name="dropframe" select="true()"/>
	      </xsl:call-template>
	  </xsl:variable>

	  <!-- No need to set $dropframe if the timecode has a dropframe delimiter (";" or ".") -->
      <!-- Returns: 1800 -->
	  <xsl:variable name="frames">
	      <xsl:call-template name="tc:to-frames">
	          <xsl:with-param name="timecode">00:00:01;02</xsl:with-param>
	      </xsl:call-template>
	  </xsl:variable>

	  <!-- Returns: 00:30:22:14 -->
	  <xsl:variable name="timecode>
	      <xsl:call-template name="tc:from-frames">
	          <xsl:with-param name="frames">54674</xsl:with-param>
		      <xsl:with-param name="fps">29.97</xsl:with-param>
	      </xsl:call-template>
	  </xsl:variable>

	  <!-- Returns: 02:00:00:00 -->
	  <xsl:variable name="sum">
	      <xsl:call-template name="tc:add">
	          <xsl:with-param name="timecode1">01:59:59:29</xsl:with-param>
	          <xsl:with-param name="timecode2">00:00:00:01</xsl:with-param>
	      </xsl:call-template>
	  </xsl:variable>

	  <xsl:variable name="product">
	      <xsl:call-template name="tc:multiply>
	          <xsl:with-param name="timecode">00:10:59:02</xsl:with-param>
		      <xsl:with-param name="by">2</xsl:with-param>
	          <xsl:with-param name="fps">24</xsl:with-param>
		  </xsl:call-template>
	  </xsl:variable>

      <!-- Extract the minutes -->
      <!-- Returns: 10 -->
	  <xsl:variable name="minutes>
	      <xsl:call-template name="tc:minutes">
	          <xsl:with-param name="timecode">00:10:21;22</xsl:with-param>
	      </xsl:call-template>
	  </xsl:variable>

Templates
---------

* [Overview](#overview)
* [Arithmetic](#arithmetic)
* [Conversion](#conversion)
* [Parsing & Formatting](#parsing-formatting)
* [Validation](#validation)

### Overview

#### Frames Per Second (FPS)

Unless specified when calling a template frames per second defaults to `29.97`. This can be changed
globally by setting `default-fps`.

#### Drop Frame

All drop frame arguments default to `false()`. If the drop frame parameter is not set and the timecode's frame delimiter
is `"."` or `";"` the timecode will be treated as drop frame.

### Arithmetic

Templates return `"NaN"` on error. This is a string and should not be confused with the XPath numeric type of `NaN`.
On success the resulting timecode is returned.

#### `add`

##### Parameters

* `timecode1` - Left operand, **required**
* `fps1` - `timecode1`'s frames per second
* `dropframe1` - Set to `true()` if `timecode1` is drop frame
* `timecode2` - Right operand, **required**
* `fps2` - `timecode2`'s frames per second
* `dropframe2` - Set to `true()` if `timecode2` is drop frame

#### `divide`

##### Parameters

* `timecode` - Numerator, **required**
* `by` - Denominator, **required**. This is a numeric value, not a timecode
* `fps` - Frames per second of `timecode`

#### `multiply`

##### Parameters

* `timecode` - A timecode to multiply, **required**
* `by` - Value to multiply timecode by, **required**. This is a numeric value, not a timecode
* `fps` - Frames per second of `timecode`
* `dropframe` - `true()` if `timecode` is dropframe, defaults to `false()`

#### `subtract`

##### Parameters

* `timecode1` - Left operand, **required**
* `fps1` - `timecode1`'s frames per second
* `dropframe1` - Set to `true()` if `timecode1` is drop frame
* `timecode2` - Right operand, **required**
* `fps2` - `timecode2`'s frames per second
* `dropframe2` - Set to `true()` if `timecode2` is drop frame

### Conversion

#### `convert`

Convert a timecode's frame rate, format, or to/from drop frame.

* `timecode` - Timecode to convert, **required**
* `fps` - `timecode`'s frames per second
* `dropframe` - Set to `true()` if `timecode` is drop frame
* `to-fps` - Frames per second to convert `timecode` to
* `to-dropframe` - Convert `timecode` to drop frame
* `delimiter` - String use to delimit the hours, minutes, and seconds in the resulting timecode, defaults to `":"`
* `frame-delimiter` - String use to delimit frames in the resulting timecode, defaults to `":"`

#### `to-frames`

Converts the given timecode to frames.

##### Parameters

* `timecode` - Timecode to convert, **required**
* `fps` - `timecode`'s frames per second
* `dropframe` - Set to `true()` if `timecode` is a drop frame

##### Returns

On success the frame representation of the `timecode`. On error an empty string.

### Parsing/Formatting

#### `hours`

Extract the hours part from the given timecode.

##### Parmeters

* `timecode` - Timecode to extract hours from, **required**

##### Returns

On success the hour part of `timecode`. On error an empty string.

#### `minutes`

Extract the minutes part from the given timecode.

##### Parameters

* `timecode` - Timecode to extract minutes from, **required**

##### Returns

On success the minute part of `timecode`. On error an empty string.

#### `seconds`

Extract the seconds part from the given timecode.

##### Parameters

* `timecode` - Timecode to extract seconds from, **required**

##### Returns

On success the second part of `timecode`. On error an empty string.

#### `frames`

Extract the frames part from the given timecode.

##### Parameters

* `timecode` - Timecode to extract frames from, **required**

##### Returns

On success the frame part of `timecode`. On error an empty string.

#### `from-frames`

Create a timecode from the given number of frames.

##### Parameters

* `frames` - Frames to create a timecode from, **required**
* `fps` - `frames` frames per second
* `dropframe` - Set to `true()` if `frames` are drop frames
* `delimiter` - String use to delimit the hours, minutes, and seconds in the resulting timecode, defaults to `":"`
* `frame-delimiter` - String use to delimit frames in the resulting timecode, defaults to `":"`

##### Returns

On success a timecode. On error an empty string.

### Validation

#### `valid`

Check if the given timecode is valid

##### Parameters

* `timecode` - Timecode to validate, **required**

##### Returns

`"true"` if `timecode` is valid, `"false"` otherwise.
Note that this is a string and not an XPath boolean as returned by `true()` or `false()`.

About
---------

This library is a port of the Perl [`Time::Timecode`](https://github.com/sshaw/Time-Timecode) module,
though it does not (yet) implement all of `Time::Timecode`'s functionality.

Author
---------

Skye Shaw (skye.shaw [AT] gmail)


License
---------

    Copyright (C) 2011-2016 Skye Shaw

    Released under the MIT License: www.opensource.org/licenses/MIT
