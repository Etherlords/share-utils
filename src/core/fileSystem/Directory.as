package core.fileSystem 
{
	import core.collections.Iterable;
	
	public class Directory extends Iterable 
	{
		
		public var name:String
		
		public function Directory() 
		{
			super();
		}
		
		public function toString():String 
		{
			return "[Directory name=" + name + " length="+ _length +"]";
		}
	}

}