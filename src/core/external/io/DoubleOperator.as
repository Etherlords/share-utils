package core.external.io 
{
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import utils.formateToString;

public class DoubleOperator implements ISerializer, IDeserializer
	{
		private var _value:Object;
		
		private static const _size:Number = TypesSize.DOUBLE_SIZE;
		
		public function DoubleOperator(value:Number = 0) 
		{
			_value = value;
		}
		
		public function set value(n:Object):void
		{
			_value = n;
		}
		
		public function deserialize(source:IDataOutput):int 
		{
			source.writeDouble(_value as Number);
			return _size;
		}
		
		public function serialize(source:IDataInput):int 
		{
			_value = source.readDouble();
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