package core.fileSystem 
{
	import core.collections.Iterable;
	
	public class Directory extends Iterable implements IFile
	{
		private var _name:String = '';
		private var _path:String = '';
		private var _nativePath:String = '';
		private var _parent:IFile;
		
		public function Directory() 
		{
			super();
		}
		
		public function toString():String 
		{
			return "[Directory name=" + name + " length="+ _length +"]";
		}
		
		public function get isDerictory():Boolean 
		{
			return true;
		}
		
		public function get path():String 
		{
			return _path;
		}
		
		public function set path(value:String):void 
		{
			_path = value;
		}
		
		public function get nativePath():String 
		{
			return _nativePath;
		}
		
		public function set nativePath(value:String):void 
		{
			_nativePath = value;
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