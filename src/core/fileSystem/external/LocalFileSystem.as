package core.fileSystem.external
{
	
	//import core.services.IFileService;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	public class LocalFileSystem extends AbstractFileSystem
	{
	
		
		//public var loadingService:IFileService;
		
		public function LocalFileSystem() 
		{
			
		}
		
		private function initialize():void 
		{
			
		}
		
		public function onScanComplete(e:Event):void
		{
			//loadingService.addEventListener(Event.COMPLETE, onLoadComplete);
			//loadingService.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
			//loadingService.loadFiles(directoriesList);
		}
		
		private function onLoadProgress(e:ProgressEvent):void 
		{
			dispatchEvent(e);
		}
		
		private function onLoadComplete(e:Event):void 
		{
			dispatchEvent(e);
		}

		override public function getFile(path:String):*
		{
			var subPath:Array = path.split('/');
			
			var file:* = directoriesList.getItem(subPath[0]);
			for (var i:int = 1; i < subPath.length; i++)
			{
				if (subPath[i].length == 0)
					continue;
					
				file = file.getItem(subPath[i]);
			}
			
			return file;
		}
		
	}

}