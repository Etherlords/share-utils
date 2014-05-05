package core.fileSystem.external 
{
	import core.fileSystem.Directory;
	import flash.events.IEventDispatcher;
	
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


	public interface IDirectoryScaner extends IEventDispatcher
	{
		
		function get path():String;
		function set path(value:String):void;
		
		function get directoryRoot():Directory;
		function set directoryRoot(value:Directory):void;
	}
	
}