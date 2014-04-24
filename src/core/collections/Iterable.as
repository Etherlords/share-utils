package core.collections 
{
	
	public class Iterable extends SimpleMap 
	{
		public var index:int = 0;
		protected var _keyList:Vector.<String> = new Vector.<String>
		
		public function Iterable() 
		{
			super();
			
		}
		
		public function get current():String
		{
			return _keyList[index];
		}
		
		public function set current(key:String):void
		{
			index = getItem(key).index;
		}
		
		public function get currentItem():*
		{
			if (_keyList.length == 0)
				return null;
				
			if (index >= _keyList.length)
				return null;
				
			return getItem(_keyList[index]);
		}
		
		public function get nextItem():*
		{
			index++;
			
			//if (index == _length)
			//	index = 0;
			
			return currentItem;
		}
		
		public function get prevItem():*
		{
			index--;
			
			if (index < 0)
				index = _length;
				
			return currentItem;
		}
		
		public function get keyList():Vector.<String> 
		{
			return _keyList;
		}
		
		override public function addItem(key:String, item:*):void 
		{
			var objectInfo:Object = {item:item, index:_length}
			
			super.addItem(key, objectInfo);
			
			_keyList.push(key);
		}
		
		override public function getItem(key:String):* 
		{
			if (super.getItem(key))
				return super.getItem(key).item;
			else
				return null
		}
		
		override public function removeItem(key:String):void 
		{
			var index:int = super.getItem(key).index;
			_keyList.splice(index, 1);
			
			super.removeItem(key);
			
			if (this.index > _length)
				this.index = _length;
		}
		
	}

}