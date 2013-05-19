---
layout: post
title: "Serialization of 'SimpleXMLElement' is not allowed"
---

This is a problem that has been bugging me yesterday. Apparently: SimpleXMLElement wraps a libxml resource type -- resources can't be serialized, at the next invocation the resource representing the libxml node object would have been disappeared so unserialization fails.

The proper way to serialize XML is as `text/xml`. I accomplished serialization of a SimpleXMLElement like this:

<?prettify?>
	<?php

	class mySimpleXMLElement extends SimpleXMLElement
	{
		public function serialize()
		{
			// return as text/xml
			return serialize($this->asXML());
		}

		public static function unserialize($data)
		{
			// secretly return a new me
			return new self(unserialize($data));
		}
	}

This requires a somewhat different method, here is how I tested this piece of code:

<?prettify?>
	<?php

	$xml_str = '
	<test>
		<items>
			<item>one</item>
			<item>two</item>
			<item>three</item>
		</items>
	</test>
	';

	// tell simplexml to load the string into our new class
	$xml_object = simplexml_load_string($xml_str, 'mySimpleXMLElement');

	// display and test the serialized data
	echo $serialized_data = $xml_object->serialize();

	// test unserialization
	$old_object = mySimpleXMLElement::unserialize($serialized_data);
	var_dump($old_object);

This is the result, as expected:

<?prettify?>
	s:115:"<?xml version="1.0"?>
	<test>
		<items>
			<item>one</item>
			<item>two</item>
			<item>three</item>
		</items>
	</test>

	";

	object(mySimpleXMLElement)#2 (1) {
	  ["items"]=>
	  object(mySimpleXMLElement)#3 (1) {
	    ["item"]=>
	    array(3) {
	      [0]=>
	      string(3) "one"
	      [1]=>
	      string(3) "two"
	      [2]=>
	      string(5) "three"
	    }
	  }
	}
