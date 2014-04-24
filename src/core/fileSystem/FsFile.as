package core.fileSystem 
{
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	public class FsFile extends EventDispatcher implements IFile
	{
		public var extension:String;
		
		private var _name:String;
		private var _path:String;
		private var _nativePath:String;
		private var _parent:IFile;
		
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

		public function get isDerictory():Boolean 
		{
			return false;
		}
		
		public function get nativePath():String 
		{
			return _nativePath;
		}
		
		public function set nativePath(value:String):void 
		{
			_nativePath = value;
		}
		
		public function get path():String 
		{
			return _path;
		}
		
		public function set path(value:String):void 
		{
			_path = value;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get parent():IFile 
		{
			return _parent;
		}
		
		public function set parent(value:IFile):void 
		{
			_parent = value;
		}
	}

}