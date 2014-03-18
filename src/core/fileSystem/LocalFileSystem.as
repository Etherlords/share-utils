package core.fileSystem 
{
	import core.services.FileLoadingService;
	import flash.events.Event;
	
	public class LocalFileSystem implements IFS
	{
		private var _directoriesList:Directory;
		
		public var loadingService:FileLoadingService;
		
		public function LocalFileSystem() 
		{
			
		}
		
		private function initialize():void 
		{
			
		}
		
		public function onScanComplete(e:Event):void
		{
			loadingService.addEventListener(Event.COMPLETE, onLoadComplete);
			loadingService.loadFiles(directoriesList);
		}
		
		private function onLoadComplete(e:Event):void 
		{
			trace('vfs ready');
			broadcast('vfs', e);
		}
		
		public function test():void
		{
			//testDir(directoriesList);
			
			
		}
		
		private function testDir(dir:Directory):void
		{
			trace(dir.name, dir.length)
			
			var item:* = dir.currentItem;
			for (var i:int = 0; i < dir.length; i++ )
			{
				if (item is Directory)
					testDir(item)
				else
					trace("\t" + dir.name+"/"+item);
					
				item = dir.nextItem;
			}
		}
		
		public function getFile(path:String):*
		{
			var subPath:Array = path.split('/');
			
			var file:* = directoriesList.getItem(subPath[0]);
			for (var i:int = 1; i < subPath.length; i++)
			{
				file = file.getItem(subPath[i]);
			}
			
			return file;
		}
		
		public function get directoriesList():Directory 
		{
			return _directoriesList;
		}
		
		public function set directoriesList(value:Directory):void 
		{
			_directoriesList = value;
		}
		
	}

}