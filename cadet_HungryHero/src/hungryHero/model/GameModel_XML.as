package hungryHero.model
{
	import cadet.components.processes.SoundProcess;
	import cadet.core.CadetScene;
	import cadet.util.ComponentUtil;
	
	import cadet2D.components.renderers.Renderer2D;
	
	import hungryHero.components.behaviours.HeroBehaviour;
	import hungryHero.components.behaviours.ShakeBehaviour;
	import hungryHero.components.processes.GlobalsProcess;
	
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;

	public class GameModel_XML implements IGameModel
	{
		private var _parent				:DisplayObjectContainer;
		private var _cadetScene			:CadetScene;
		private var _renderer			:Renderer2D;
		
		private var _heroBehaviour		:HeroBehaviour;
		
		private var _heroStartX			:Number;
		private var _heroStartY			:Number;
		
		private var _globals			:GlobalsProcess;
		private var _soundProcess		:SoundProcess;
		
		private var _shakeBehaviour		:ShakeBehaviour;
		
		private var _initialised		:Boolean;
		
		public function GameModel_XML()
		{

		}
		
		public function init(parent:starling.display.DisplayObjectContainer):void
		{
			_parent = parent;
			
			// Grab a reference to the Renderer2D and enable it on the existing Starling display list
			_renderer = ComponentUtil.getChildOfType(_cadetScene, Renderer2D);
			_renderer.enableToExisting(parent);
			
			// Grab a reference to the GlobalsProcess and pause the game on first showing
			_globals = ComponentUtil.getChildOfType( _cadetScene, GlobalsProcess, true );
			
			// Grab a reference to the SoundProcess so we can toggle "muted" via our custom game UI
			_soundProcess = ComponentUtil.getChildOfType( _cadetScene, SoundProcess, true );
			
			// Grab a reference to Components which need to be rest on subsequent turns
			_shakeBehaviour = ComponentUtil.getChildOfType( _cadetScene, ShakeBehaviour, true );
			_heroBehaviour = ComponentUtil.getChildOfType( _cadetScene, HeroBehaviour, true );
			
			// Store the initial position of the hero so we can reset to it on subsequent turns
			if (!_initialised) {
				_heroStartX = _heroBehaviour.transform.x;
				_heroStartY = _heroBehaviour.transform.y;
			}
			
			_cadetScene.validateNow();
			
			reset();
			
			_initialised = true;
		}
		
		public function reset():void
		{
			_globals.reset();
			
			_heroBehaviour.transform.x = _heroStartX;
			_heroBehaviour.transform.y = _heroStartY;
			
			if ( _shakeBehaviour ) {
				_shakeBehaviour.shake = 0;
			}
		}
		
		public function enable():void
		{
			_parent.addEventListener( starling.events.Event.ENTER_FRAME, enterFrameHandler );			
		}
		
		public function disable():void
		{
			_parent.removeEventListener( starling.events.Event.ENTER_FRAME, enterFrameHandler );
		}
		
		public function dispose():void
		{
			_cadetScene.dispose();		
		}
	
		private function enterFrameHandler( event:starling.events.Event ):void
		{
			_cadetScene.step();
		}
		
		public function get cadetScene():CadetScene
		{
			return _cadetScene;
		}
		public function set cadetScene( value:CadetScene ):void
		{
			_cadetScene = value;
		}
		
		public function get renderer():Renderer2D
		{
			return _renderer;
		}
		
		public function get soundProcess():SoundProcess
		{
			return _soundProcess;
		}
		public function get globalsProcess():GlobalsProcess
		{
			return _globals;
		}
	}
}





