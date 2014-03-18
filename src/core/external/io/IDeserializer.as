package core.external.io 
{
import flash.utils.IDataOutput;

public interface IDeserializer extends IStreamOperator
	{
		
		/**
		 * Write data to stream as raw bytes
		 * @param	source an output stream implementation
		 * @return number of bytes writed into stream
		 */
		function deserialize(source:IDataOutput):int
		
		function calculateWriteSize():int;
		
		function get writeSize():int;
		
	}

}