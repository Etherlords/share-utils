package core.fileSystem.events 
{
	import core.fileSystem.Directory;
	import flash.events.Event;
	
	public class DirectoryEvent extends Event 
	{
		
		public static const DIRECTOEY_ADDED:String = 'directoryAdded';
		
		public var directory:Directory;
		
		public function DirectoryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, directory:Directory = null) 
		{
			super(type, bubbles, cancelable);
			this.directory = directory;
			
		}
		
		override public function clone():Event 
		{
			return new DirectoryEvent(type, bubbles, cancelable, directory);
		}
	}

}