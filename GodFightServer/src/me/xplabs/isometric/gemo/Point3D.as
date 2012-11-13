package me.xplabs.isometric.gemo 
{
	/**
	 * ...
	 * @author xiaohan
	 */
	public class Point3D 
	{
		public var x:Number;
		public var y:Number;
		public var z:Number;
		public function Point3D(x:Number = 0, y:Number = 0, z:Number = 0) 
		{
			this.x = x;
			this.y = y;
			this.z = z;
		}
		public function toString():String
		{
			return "(x=" + x + ","+"(y=" + y + ","+"(z=" + z + ")";
		}
	}
}