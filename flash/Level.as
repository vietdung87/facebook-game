﻿package  {		public class Level {		private var level:Number;		private var score:Number;		private var yearGame:Number;		public function Level(level:Number,score:Number,year:Number) {			// constructor code			this.level=level;			this.score=score;			this.yearGame=year;		}				public function increaseLevel():void{			this.level+=1;		}		public function getLevel():Number{			return this.level;		}		public  function increaseScore():void{			this.score+=15		}		public  function getScore():Number{			return this.score;		}		public  function increaseYear():void{			this.yearGame+=1;		}		public function getYear():Number{			return this.yearGame;		}		public function resetGame(level:Number,score:Number,year:Number):void{			this.level=level;			this.score=score;			this.yearGame=year;		}			}	}