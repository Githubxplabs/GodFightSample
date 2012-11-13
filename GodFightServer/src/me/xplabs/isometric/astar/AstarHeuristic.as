package me.xplabs.isometric.astar 
{
	/**
	 * a星寻路启发函数常量
	 * ...
	 * @author xiaohan
	 */
	public class AstarHeuristic 
	{
		/**
		 * 曼哈顿启发函数
		 */
		public static const manhattan:int = 1;
		/**
		 * 欧几里得几何启发函数
		 */
		public static const euclidian:int = 2;
		/**
		 * 对角启发函数
		 */
		public static const diagonal:int = 3;
	}

}