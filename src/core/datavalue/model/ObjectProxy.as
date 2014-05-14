package core.datavalue.model 
{
	import core.datavalue.model.events.ProxyEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.flash_proxy;
	import flash.utils.Proxy;
	
	/**
	 * @eventType	patterns.events.LazyModeratorEvent.UPDATE_EVENT
	 */
	[Event(name="proxyUpdate", type="core.datavalue.model.events.ProxyEvent")] 
	public dynamic class ObjectProxy extends Proxy implements IObjectProxy, IEventDispatcher
	{
		
		private static const defaultvalue:Object = { };
		
		public var isCastingUpdate:Boolean = true;
		public var target:Object = { };
		public var changedFields:Object = { };
		
		private var dispatcher:EventDispatcher = new EventDispatcher();
		
		public function ObjectProxy(autoUpdate:Boolean = false ) 
		{
			this.autoUpdate = autoUpdate;
			
		}
		
		override flash_proxy function hasProperty(name:*):Boolean 
		{
			return name in target;
		}
		
		override flash_proxy function getProperty(name:*):* 
		{
			if (name.localName in  target)
				return target[name.localName]
			else
				return defaultvalue;
		}
		
		override flash_proxy function setProperty(name:*, value:*):void 
		{
			target[name.localName] = value;
			markField(name);
		}
		
		public function markField(fieldName:String):void 
		{
			changedFields[fieldName] = true;
			
			if (autoUpdate)
				update();
		}
		
		public var autoUpdate:Boolean;
		private static const updateEvent:ProxyEvent = new ProxyEvent(ProxyEvent.UPDATE_EVENT);
		public function update():void 
		{
			if(isCastingUpdate)
				dispatchEvent(updateEvent);
				
			clean();
		}
		
		public function getUpdatedFields():Object 
		{
			return changedFields;
		}
		
		public function clean():void 
		{
			changedFields = { };
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void 
		{
			dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void 
		{
			dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean 
		{
			return dispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean 
		{
			return dispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean 
		{
			return dispatcher.willTrigger(type);
		}
		
		
		public function toString():String 
		{
			return "[ObjectProxy isCastingUpdate=" + isCastingUpdate + " target=" + target + " changedFields=" + changedFields + 
						"]";
		}
	}

}