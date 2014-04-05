package core.fileSystem 
{
	

	public interface IFile 
	{
		function get path():String;
		function set path(value:String):void;
		
		function get nativePath():String;
		function set nativePath(value:String):void;
		
		function get name():String;
		function set name(value:String):void;
		
		function get parent():IFile
		function set parent(value:IFile):void
	}
	
}