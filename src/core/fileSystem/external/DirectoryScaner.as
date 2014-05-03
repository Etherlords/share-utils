package core.fileSystem.external
{
	import core.fileSystem.Directory;
	import core.fileSystem.events.DirectoryEvent;
	import core.fileSystem.events.FileEvent;
	import core.fileSystem.FsFile;
	import core.fileSystem.IFile;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	
	/**
	 * @eventType	core.fileSystem.events.DirectoryEvent.DIRECTORY_ADDED
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

	public class DirectoryScaner extends EventDispatcher implements IDirectoryScaner
	{
		private var _path:String;
		private var _directoryRoot:Directory;
		
		public function DirectoryScaner() 
		{
			
		}
		
		public function set nativePath(value:String):void
		{
			_path = value;
		}
		
		public function scan():void
		{
			_scan(File.applicationDirectory.resolvePath(_path), _directoryRoot);
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function _scan(dir:File, output:Directory):void
		{
			var name:String = dir.name;
			var path:String = output.path + name + '/';
			
			var file:IFile;
				
			if (dir.isDirectory)
			{	
				var subDir:Directory = new Directory();
				file = subDir;
				
				subDir.path = path;
				output.addItem(dir.name, subDir);
				
				var diradded:DirectoryEvent = new DirectoryEvent(DirectoryEvent.DIRECTORY_ADDED, false, false, subDir);
                dispatchEvent(diradded);
				
				var dirList:Array = dir.getDirectoryListing();
				
				for (var i:int = 0; i < dirList.length; i++)
				{
					_scan(dirList[i], subDir);
				}
			}
			else
			{
				var extension:String = dir.extension;
				
				var fileInfo:FsFile = new FsFile();
				
				file = fileInfo;
				
				fileInfo.extension = extension;
				
				output.addItem(name, fileInfo);
				
				var fileadded:FileEvent = new FileEvent(FileEvent.FILE_ADDED, false, false, fileInfo);

                dispatchEvent(fileadded);
			}
			
			file.name = name;
			file.path = path;
			file.nativePath = dir.nativePath;
			file.parent = output;
		}

        public function get path():String {
            return _path;
        }

        public function set path(value:String):void {
            _path = value;
        }

        public function get directoryRoot():core.fileSystem.Directory {
            return _directoryRoot;
        }

        public function set directoryRoot(value:Directory):void {
            _directoryRoot = value;
        }
    }

}