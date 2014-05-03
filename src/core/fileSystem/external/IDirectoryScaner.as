package core.fileSystem.external 
{
	import core.fileSystem.Directory;
	

	public interface IDirectoryScaner 
	{
		
		function get path():String;
		function set path(value:String):void;
		
		function get directoryRoot():Directory;
		function set directoryRoot(value:Directory):void;
	}
	
}