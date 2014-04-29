package core.utils 
{
	
	public class Cast 
	{
		static public const FALSE_AS_STRING:String = 'false';
		static public const TRUE_AS_STRING:String = 'true';
		
		static public const NUMBER_TAG:String = ".";
		
		
		static public function cast(value:String):Object 
		{
			var returnValue:Object;
			
			var asInt:Object = parseInt(value);
			
			if (!isNaN(asInt as Number))// && String(asInt).length == value.length)
			{
				if (isNumber(value))
					return parseFloat(value);
				else
					return asInt as int;
			}
			else if(isBoolean(value))
				return toBoolean(value);
			
			return value
		}
		
		static private function isBoolean(value:String):Boolean 
		{
			return value == FALSE_AS_STRING || value == TRUE_AS_STRING;
		}
		
		static public function toBoolean(value:String):Boolean
		{
			if (value == FALSE_AS_STRING)
				return false;
			else if (value == TRUE_AS_STRING)
				return true;
				
			return false;
		}
		
		static public function isNumber(value:String):Boolean
		{
			return value.search(NUMBER_TAG) != -1;
		}
	}

}