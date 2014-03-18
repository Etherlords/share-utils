package core.fileSystem.events 
{
	import core.fileSystem.FsFile;
	import flash.events.Event;
	
	public class FileEvent extends Event 
	{
		
		public static const FILE_ADDED:String = 'fileAdded';
		
		public var fileInfo:FsFile;
		
		public function FileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, fileInfo:FsFile = null) 
		{
			super(type, bubbles, cancelable);
			this.fileInfo = fileInfo;
			
		}
			
		override public function clone():Event 
		{
			return new FileEvent(type, bubbles, cancelable, fileInfo);
		}
	}

}