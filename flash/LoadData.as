﻿package  {	import flash.display.Sprite;	import flash.events.Event;	import flash.net.URLLoader;	import flash.net.URLRequest;	import com.adobe.serialization.json.JSON;	public class LoadData {		var myData:Array;						public function LoadData() {			var myData:Array;			var myLoader = new URLLoader();			var myRequest:URLRequest = new URLRequest("staff.txt");			// constructor code			myLoader.addEventListener(Event.COMPLETE, onload);			myLoader.load(myRequest);					}		function onload(evt:Event):void{			myData = JSON.decode(myLoader.data);			var quetionData:QuestionData=new QuestionData(myData);							}	}	}