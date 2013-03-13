/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package ui
{
	import font.Font;
	import font.Fonts;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * This class handles the Heads Up Display for the game.
	 *  
	 * @author hsharma
	 * 
	 */
	public class HUD extends Sprite
	{
		private var _lives:int;					// Lives left.
		private var _distance:int;				// Distance travelled.
		private var _foodScore:int;				// Food items score.
		
		private var livesLabel:TextField;		// Lives icon.
		private var livesText:TextField; 		// Lives TextField.	
		private var distanceLabel:TextField;	// Distance icon.
		private var distanceText:TextField;		// Distance TextField.
		private var foodScoreLabel:TextField;	// Food Score icon.
		private var foodScoreText:TextField;	// Food Score TextField.
		private var fontScoreLabel:Font;		// Font for score label.
		private var fontScoreValue:Font;		// Font for score value.
		
		public function HUD()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			// Get fonts for score labels and values.
			fontScoreLabel = Fonts.getFont("ScoreLabel");
			fontScoreValue = Fonts.getFont("ScoreValue");

			// Lives label
			livesLabel = new TextField(150, 20, "L I V E S", fontScoreLabel.fontName, fontScoreLabel.fontSize, 0xffffff);
			livesLabel.hAlign = HAlign.RIGHT;
			livesLabel.vAlign = VAlign.TOP;

			livesLabel.x = 150;
			livesLabel.y = 5;
			this.addChild(livesLabel);
			
			// Lives
			livesText = new TextField(150, 75, "5", fontScoreValue.fontName, fontScoreValue.fontSize, 0xffffff);
			livesText.hAlign = HAlign.RIGHT;
			livesText.vAlign = VAlign.TOP;
			livesText.width = livesLabel.width;

			livesText.x = int(livesLabel.x + livesLabel.width - livesText.width);
			livesText.y = livesLabel.y + livesLabel.height;
			this.addChild(livesText);
			
			// Distance label
			distanceLabel = new TextField(150, 20, "D I S T A N C E", fontScoreLabel.fontName, fontScoreLabel.fontSize, 0xffffff);
			distanceLabel.hAlign = HAlign.RIGHT;
			distanceLabel.vAlign = VAlign.TOP;

			distanceLabel.x = int(stage.stageWidth - distanceLabel.width - 10);
			distanceLabel.y = 5;
			this.addChild(distanceLabel);
			
			// Distance
			distanceText = new TextField(150, 75, "0", fontScoreValue.fontName, fontScoreValue.fontSize, 0xffffff);
			distanceText.hAlign = HAlign.RIGHT;
			distanceText.vAlign = VAlign.TOP;
			distanceText.width = distanceLabel.width;
			
			distanceText.x = int(distanceLabel.x + distanceLabel.width - distanceText.width);
			distanceText.y = distanceLabel.y + distanceLabel.height;
			this.addChild(distanceText);
			
			// Score label
			foodScoreLabel = new TextField(150, 20, "S C O R E", fontScoreLabel.fontName, fontScoreLabel.fontSize, 0xffffff);
			foodScoreLabel.hAlign = HAlign.RIGHT;
			foodScoreLabel.vAlign = VAlign.TOP;

			foodScoreLabel.x = int(distanceLabel.x - foodScoreLabel.width - 50);
			foodScoreLabel.y = 5;
			this.addChild(foodScoreLabel);
			
			// Score
			foodScoreText = new TextField(150, 75, "0", fontScoreValue.fontName, fontScoreValue.fontSize, 0xffffff);
			foodScoreText.hAlign = HAlign.RIGHT;
			foodScoreText.vAlign = VAlign.TOP;
			foodScoreText.width = foodScoreLabel.width;
			
			foodScoreText.x = int(foodScoreLabel.x + foodScoreLabel.width - foodScoreText.width);
			foodScoreText.y = foodScoreLabel.y + foodScoreLabel.height;
			this.addChild(foodScoreText);
		}

		/**
		 * Lives left. 
		 * @return 
		 * 
		 */
		public function get lives():int { return _lives; }
		public function set lives(value:int):void
		{
			_lives = value;
			livesText.text = _lives.toString();
		}

		/**
		 * Distance travelled. 
		 * @return 
		 * 
		 */
		public function get distance():int { return _distance; }
		public function set distance(value:int):void
		{
			_distance = value;
			distanceText.text = _distance.toString();
		}

		/**
		 * Food items score. 
		 * @return 
		 * 
		 */
		public function get foodScore():int { return _foodScore; }
		public function set foodScore(value:int):void
		{
			_foodScore = value;
			foodScoreText.text = _foodScore.toString();
		}
		
		/**
		 * Add leading zeros to the score numbers. 
		 * @param value
		 * @return 
		 * 
		 */
		private function addZeros(value:int):String {
			var ret:String = String(value);
			while (ret.length < 7) {
				ret = "0" + ret;
			}
			return ret;
		}
	}
}