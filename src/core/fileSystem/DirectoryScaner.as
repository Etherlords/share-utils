package core.fileSystem 
{
	import core.broadcasting.AbstractEventBroadcaster;
	import core.fileSystem.events.DirectoryEvent;
	import core.fileSystem.events.FileEvent;
	import flash.events.Event;
	import flash.filesystem.File;
	
	/**
	 * @eventType	core.fileSystem.events.DirectoryEvent.DIRECTOEY_ADDED
	 */
	[Event(name = "directoryAdded", type = "core.fileSystem.events.DirectoryEvent")] 
	
	/**
	 * @eventType	core.fileSystem.events.FileEvent.FILE_ADDED
	 */
	[Event(name = "fileAdded", type = "core.fileSystem.events.FileEvent")] 
	
	/**
	 * @eventType	flash.events.Event.COMPLETE
	 */
	[Event(name = "complete", type = "flash.events.Event")] 
	
	
	public class DirectoryScaner extends AbstractEventBroadcaster
	{
		public var path:String;
		public var directoryRoot:Directory
		
		private var entry:int = 0;
		
		public function DirectoryScaner() 
		{
			
		}
		
		public function set nativePath(value:String):void
		{
			entry = value.length;
			path = value;
		}
		
		public function scan():void
		{
			_scan(File.applicationDirectory.resolvePath(path), directoryRoot);
			
			broadcast(new Event(Event.COMPLETE));
		}
		
		public function _scan(dir:File, output:Directory):void
		{
			if (dir.isDirectory)
			{	
				var subDir:Directory = new Directory();
				subDir.name = dir.name;
				output.addItem(dir.name, subDir);
				
				var diradded:DirectoryEvent = new DirectoryEvent(DirectoryEvent.DIRECTOEY_ADDED, false, false, subDir);
				broadcast(diradded);
				
				var dirList:Array = dir.getDirectoryListing();
				
				for (var i:int = 0; i < dirList.length; i++)
				{
					_scan(dirList[i], subDir);
				}
			}
			else
			{
				var extension:String = dir.extension;
				var name:String = dir.name;
				var path:String = dir.nativePath.substr(entry);
				
				var parent:String = path.substr(0, path.indexOf('\\'));
				
				var fileInfo:FsFile = new FsFile();
				fileInfo.extension = extension;
				fileInfo.name = name;
				fileInfo.path = path;
				fileInfo.nativePath = dir.nativePath;
				
				output.addItem(name, fileInfo);
				
				var fileadded:FileEvent = new FileEvent(FileEvent.FILE_ADDED, false, false, fileInfo);
				
				broadcast(fileadded);
			}
			
			
			
			
		}
		
	}

}