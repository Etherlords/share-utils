package core.datavalue.model
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public dynamic class LazyProxy extends ObjectProxy 
	{
		
		private var _updateInterval:Number;
		protected var updateTimer:Timer;
		
		public function LazyProxy(updateInterval:Number = 500) 
		{
			_updateInterval = updateInterval;
			
			initilize();
			super();
		}
		
		private function initilize():void 
		{
			updateTimer = new Timer(_updateInterval, 1);
			updateTimer.addEventListener(TimerEvent.TIMER, updateTime);
		}
		
		private function updateTime(e:TimerEvent):void 
		{
			updateTimer.stop();
			update();
		}
		
		override public function markField(fieldName:String):void 
		{
			changedFields[fieldName] = true;
			
			if(!updateTimer.running)
				updateTimer.start();
		}
		
		public function get updateInterval():Number 
		{
			return _updateInterval;
		}
		
		public function set updateInterval(value:Number):void 
		{
			if (_updateInterval == value)
				return;
				
			_updateInterval = value;
			
			//that can produce runtime error if timer is already running and we change intravl in that phase
			updateTimer.stop();
			updateTimer.reset();
			updateTimer.delay = _updateInterval;
		}
		
	}

}