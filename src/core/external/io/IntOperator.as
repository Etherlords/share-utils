package core.external.io 
{
import core.utils.formateToString;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

public class IntOperator implements ISerializer, IDeserializer
	{
		private var _value:Object;
		
		private static const _size:int = TypesSize.INT_SIZE;
		
		public function IntOperator(value:int = 0) 
		{
			_value = value;
		}
		
		public function set value(value:Object):void
		{
			_value = value;
		}
		
		public function deserialize(source:IDataOutput):int 
		{
			source.writeInt(_value as int);
			return _size;
		}
		
		public function serialize(source:IDataInput):int 
		{
			_value = source.readInt();
			return _size;
		}
		
		public function get value():Object 
		{
			return _value;
		}
		
		public function get isStaticSize():Boolean 
		{
			return true;
		}
		
		public function toString():String 
		{
			return formateToString(this, 'value', 'writeSize', 'readSize');
		}
		
		public function calculateReadSize():int 
		{
			return _size;
		}
		
		public function calculateWriteSize():int 
		{
			return _size;
		}
		
		public function get writeSize():int 
		{
			return _size;
		}
		
		public function get readSize():int 
		{
			return _size;
		}
		
	}

}