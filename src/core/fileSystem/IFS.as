package core.fileSystem 
{
	
	public interface IFS 
	{
		
		function getFile(path:String):*;
		
		function get directoriesList():Directory;
		function set directoriesList(value:Directory):void;
	}
	
}