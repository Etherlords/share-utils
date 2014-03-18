package core.fileSystem 
{
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	public class FsFile extends EventDispatcher
	{
		
		public var extension:String;
		public var name:String;
		public var path:String;
		public var nativePath:String;
		
		public var isLoaded:Boolean = false;
		
		public var nativeContent:ByteArray;
		public var content:*;
		
		public function FsFile() 
		{
			
		}
		
		public override function toString():String 
		{
			return "[FsFileInfo extension=" + extension + " name=" + name + " path=" + path + "]";
		}
	}

}