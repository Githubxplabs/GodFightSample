/*
 * Copyright (c) 2009 the original author or authors
 * 
 * Permission is hereby granted to use, modify, and distribute this file 
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.base
{
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.events.IEventDispatcher;
	
	import org.robotlegs.core.IContext;
	
	/**
	 * An abstract <code>IContext</code> implementation
	 */
	public class ContextBase implements IContext, IEventDispatcher
	{
		/**
		 * @private
		 */
		protected var _eventDispatcher:IEventDispatcher;
		
		//---------------------------------------------------------------------
		//  Constructor
		//---------------------------------------------------------------------
		
		/**
		 * Abstract Context Implementation
		 *
		 * <p>Extend this class to create a Framework or Application context</p>
		 */
		public function ContextBase()
		{
			_eventDispatcher = new EventDispatcher();
		}
		
		//---------------------------------------------------------------------
		//  API
		//---------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		public function get eventDispatcher():IEventDispatcher
		{
			return _eventDispatcher;
		}
		
		//---------------------------------------------------------------------
		//  EventDispatcher Boilerplate
		//---------------------------------------------------------------------
		
		/**
		 * @private
		 */
		public function addEventListener(type:String, listener:Function):void
		{
			eventDispatcher.addEventListener(type, listener);
		}
		
		/**
		 * @private
		 */
		public function dispatchEvent(event:Event):void
		{
 		    if(eventDispatcher.hasEventListener(event.type))
 		        eventDispatcher.dispatchEvent(event);
		}
		
		/**
		 * @private
		 */
		public function hasEventListener(type:String):Boolean
		{
			return eventDispatcher.hasEventListener(type);
		}
		
		/**
		 * @private
		 */
		public function removeEventListener(type:String, listener:Function):void
		{
			eventDispatcher.removeEventListener(type, listener);
		}
		
		/**
		 * @private
		 */
		public function willTrigger(type:String):Boolean
		{
			if(type=="") return true;
			return false;
		}

		public function removeEventListeners(type : String = null) : void {
		}

		public function dispatchEventWith(type : String, bubbles : Boolean = false, data : Object = null) : void {
		}
	}
}
