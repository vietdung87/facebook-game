﻿package  {	import flash.display.Shape;    import flash.display.Sprite;    import flash.events.MouseEvent;    import flash.text.TextField;    import flash.text.TextFormat;	import flash.utils.Timer;    import flash.events.TimerEvent;	import flash.display.MovieClip;		public class Main extends Sprite  {		private var data1:Object;		private var questionField:TextField;		private var option1:ShapeButton;		private var option2:ShapeButton;		private var option3:ShapeButton;		private var option4:ShapeButton;		private var nextQuestionBt:ShapeButton;		private var level:Number;		private var rightAnswer:String;		private var scoreTxt:TextField;		private var levelObject:Object;		private var btContinue:Object;		private var btPlayBack:Object;		private var myTimer:Timer;		private var second:Number=11;		private var scondText:TextField;		private var format1:TextFormat;		private var format:TextFormat;				public static var socreLevel1:Number=0;		public static var socreLevel2:Number=0;		public static var socreLevel3:Number=0;		public static var socreLevel4:Number=0;		public static var numberRightAnswer1:Number=0;		public static var numberRightAnswer2:Number=0;		public static var numberRightAnswer3:Number=0;		public static var numberRightAnswer4:Number=0;														public function Main(QuestionData:Object,Level:Object,BtContinue:Object,BtnPlayBack:Object) {		data1=QuestionData;		levelObject=Level;								btContinue=BtContinue;		btContinue.visible=false;		btPlayBack=BtnPlayBack;		btPlayBack.visible=false;				format= new TextFormat();		format.font="Times New Roman";		format.size=39;		format.color=0x000000;		//scoreTxt=new TextField();		//scoreTxt.x=400;		//scoreTxt.y=10;		//scoreTxt.text=levelObject.getScore().toString();		//scoreTxt.setTextFormat(format1);		//addChild(scoreTxt);// End Score				this.level=levelObject.getLevel();		rightAnswer= data1.getRightAnswer(this.level);// End Level		// time text		scondText= new TextField();		scondText.x=640;		scondText.y=55;		scondText.text= second.toString();		scondText.setTextFormat(format);		addChild(scondText);				//build quetion box		format1= new TextFormat();		format1.font="Times New Roman";		format1.size=20;		format1.color=0x000000;		questionField=new TextField();		questionField.x=150;		questionField.y=50;		questionField.text=data1.getQuestion(this.level);		questionField.width=460;		questionField.setTextFormat(format1);		questionField.height=39;		addChild(questionField);		// build option answer box		option1=new ShapeButton(data1.getOption(this.level,0),150,120,460,39);		addChild(option1);		option2=new ShapeButton(data1.getOption(this.level,1),150,180,460,39);		addChild(option2);		option3=new ShapeButton(data1.getOption(this.level,2),150,240,460,39);		addChild(option3);		option4=new ShapeButton(data1.getOption(this.level,3),150,300,460,39);		addChild(option4);			// mouse even when click on option answer box		 option1.addEventListener(MouseEvent.CLICK,btClick1);		 option2.addEventListener(MouseEvent.CLICK,btClick2);		 option3.addEventListener(MouseEvent.CLICK,btClick3);		 option4.addEventListener(MouseEvent.CLICK,btClick4);		 // Time 		  myTimer = new Timer(1000);          myTimer.addEventListener(TimerEvent.TIMER, timeUpdate);          myTimer.start();				}						private function btClick1(e:MouseEvent):void{		 checkAnswer(option1.getTxt(),option1);		 findRigtgAnswer();		 disableButton()		}		private function btClick2(e:MouseEvent):void{			checkAnswer(option2.getTxt(),option2);			findRigtgAnswer()			disableButton();		}		private function btClick3(e:MouseEvent):void{			checkAnswer(option3.getTxt(),option3);			findRigtgAnswer()			disableButton()		}		private function btClick4(e:MouseEvent):void{			checkAnswer(option4.getTxt(),option4);			findRigtgAnswer()			disableButton()		}		//  check player answer		private function checkAnswer(txt:String,object:Object):void{			if(rightAnswer==txt){								object.rightButton();								LoadSound.soundCorectAnswer();				var year:Number=levelObject.getYear();				if(year==1 ){					numberRightAnswer1++;				}else if(year==2){					numberRightAnswer2++;				}else if(year==3){					numberRightAnswer3++;				}else{					numberRightAnswer4++;				}								levelObject.increaseScore();				//changeScore()															}else{				LoadSound.soundWrongAnswer();				object.wrongButton();				findRigtgAnswer()			}			levelObject.increaseLevel();		}		// find which option answer is right		private function findRigtgAnswer():void{			if(option1.getTxt()==rightAnswer){				option1.rightButton();			}else if(option2.getTxt()==rightAnswer){				option2.rightButton();			}else if(option3.getTxt()==rightAnswer){				option3.rightButton();			}else{				option4.rightButton();			}		}		//  disable function button when one button is clicked		private function disableButton():void{			option1.removeMouseEvent();			option2.removeMouseEvent();			option3.removeMouseEvent();			option4.removeMouseEvent();			option1.removeEventListener(MouseEvent.CLICK,btClick1);		 	option2.removeEventListener(MouseEvent.CLICK,btClick2);		 	option3.removeEventListener(MouseEvent.CLICK,btClick3);		 	option4.removeEventListener(MouseEvent.CLICK,btClick4);						myTimer.stop();			 playBack();					}		//  check to play again or play to next year		private function playBack():void{			var levelNumber=levelObject.getLevel();			var scoreNumber=levelObject.getScore();			if(levelNumber<=5){// Year 1				if((levelNumber==5)&&(numberRightAnswer1>=2)){				   socreLevel1=scoreNumber;				   levelObject.increaseYear();				   timeDelay();				   }else if((levelNumber==5)&&(numberRightAnswer1<2)){					   //xuat hien button play back					   numberRightAnswer1=0;					   levelObject.resetGame(1,0,1)					 btPlayBack.visible=true;				   }else{					    btContinue.visible=true;				   }							}else if((levelNumber>5)&&(levelNumber<=9)){ // year 2				if((levelNumber==9)&&(numberRightAnswer2>=2)){				    socreLevel2=scoreNumber;					levelObject.increaseYear();				  timeDelay();				   }else if((levelNumber==9)&&(numberRightAnswer2<2)){					   //xuat hien button play back					   numberRightAnswer2=0;					   levelObject.resetGame(5,socreLevel1,2)					  btPlayBack.visible=true;				   }else{					     btContinue.visible=true;				   }			}else if((levelNumber>9)&&(levelNumber<=13)){// year 3				if((levelNumber==13)&&(numberRightAnswer3>=2)){				      socreLevel3=scoreNumber;					  levelObject.increaseYear()				  	timeDelay();				   }else if((levelNumber==13)&&(numberRightAnswer3<2)){					   //xuat hien button play back					   numberRightAnswer3=0;					   levelObject.resetGame(9,socreLevel2,3)					  btPlayBack.visible=true;				   }else{					   btContinue.visible=true;					  				   }			}else{				trace(levelObject.getYear());				if((levelNumber==17)&&(numberRightAnswer4>=2)){				    socreLevel4=scoreNumber; 				   	MovieClip(root).gotoAndStop(8);				   }else if((levelNumber==17)&&(numberRightAnswer4<2)){					   //xuat hien button play back					   numberRightAnswer4=0;					   levelObject.resetGame(13,socreLevel3,4)					   btPlayBack.visible=true;				   }else{					   btContinue.visible=true;				   }							}		}		// update  Score on stage 		//private function changeScore():void{			//removeChild(scoreTxt);			//scoreTxt.text=levelObject.getScore().toString();						//scoreTxt.setTextFormat(format1);				//addChild(scoreTxt);		//}		// function delay time		public function timeDelay():void{			var secondDelay=1;			var timeDelay:Timer = new Timer(1000);          	timeDelay.addEventListener(TimerEvent.TIMER, countTime);          	timeDelay.start();			function countTime(event:TimerEvent):void { 		   secondDelay--;		   		   if(secondDelay==0){			  timeDelay.stop();			  			    MovieClip(root).nextFrame();			  		   }        }			}				// Function for time countdown		public function timeUpdate(event:TimerEvent):void { 		   second--;		   if(second<=5 && second>0){			 LoadSound.tictac();  		   }		   if(second <10 && second>0){			   scondText.text= "0"+second.toString();			   		   }else{			   scondText.text= second.toString();		   		   }		   scondText.setTextFormat(format);		   		   if(second==0){			   LoadSound.stopSound();			  myTimer.stop();			  findRigtgAnswer();			  levelObject.increaseLevel();			  disableButton(); 		   }        }		}}