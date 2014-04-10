package core.datavalue.model 
{
	import core.datavalue.model.events.ProxyEvent;

	public class Moderator 
	{
		private var bindsMap:Object = { };
		
		private var model:ObjectProxy;
		private var target:Object;
		
		public function Moderator(target:Object, model:ObjectProxy) 
		{
			this.target = target;
			this.model = model;
			
			initialize();
		}
		
		public function bind(f:Function, field:String):void
		{
			bindsMap[field] = f;
		}
		
		private function initialize():void 
		{
			model.addEventListener(ProxyEvent.UPDATE_EVENT, onUpdate);
		}
		
		private function onUpdate(e:ProxyEvent):void 
		{
			for (var field:String in bindsMap)
			{
				if (field in model.changedFields)
					bindsMap[field]();
			}
		}
		
	}

}