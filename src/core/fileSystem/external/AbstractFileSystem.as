package core.fileSystem.external
{
import core.fileSystem.*;
import flash.events.EventDispatcher;

	public class AbstractFileSystem extends EventDispatcher implements IFS
	{
		private var _directoriesList:Directory;
		
		public function AbstractFileSystem()
		{
			
		}

        public function getFile(path:String):* {
            return null;
        }

        public function get directoriesList():Directory {
            return _directoriesList;
        }

        public function set directoriesList(value:Directory):void {
			_directoriesList = value
        }
    }

}