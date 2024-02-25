// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_events_IEventDispatcher
#define INCLUDED_nme_events_IEventDispatcher

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(nme,events,Event)
HX_DECLARE_CLASS2(nme,events,IEventDispatcher)

namespace nme{
namespace events{


class HXCPP_CLASS_ATTRIBUTES IEventDispatcher_obj {
	public:
		typedef ::hx::Object super;
		HX_DO_INTERFACE_RTTI;

		void (::hx::Object :: *_hx_addEventListener)(::String type, ::Dynamic listener,::hx::Null< bool >  useCapture,::hx::Null< int >  priority,::hx::Null< bool >  useWeakReference); 
		static inline void addEventListener( ::Dynamic _hx_,::String type, ::Dynamic listener,::hx::Null< bool >  useCapture,::hx::Null< int >  priority,::hx::Null< bool >  useWeakReference) {
			(_hx_.mPtr->*( ::hx::interface_cast< ::nme::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0xc3e4c1b7)))->_hx_addEventListener)(type,listener,useCapture,priority,useWeakReference);
		}
		bool (::hx::Object :: *_hx_dispatchEvent)( ::nme::events::Event event); 
		static inline bool dispatchEvent( ::Dynamic _hx_, ::nme::events::Event event) {
			return (_hx_.mPtr->*( ::hx::interface_cast< ::nme::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0xc3e4c1b7)))->_hx_dispatchEvent)(event);
		}
		bool (::hx::Object :: *_hx_hasEventListener)(::String type); 
		static inline bool hasEventListener( ::Dynamic _hx_,::String type) {
			return (_hx_.mPtr->*( ::hx::interface_cast< ::nme::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0xc3e4c1b7)))->_hx_hasEventListener)(type);
		}
		void (::hx::Object :: *_hx_removeEventListener)(::String type, ::Dynamic listener,::hx::Null< bool >  useCapture); 
		static inline void removeEventListener( ::Dynamic _hx_,::String type, ::Dynamic listener,::hx::Null< bool >  useCapture) {
			(_hx_.mPtr->*( ::hx::interface_cast< ::nme::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0xc3e4c1b7)))->_hx_removeEventListener)(type,listener,useCapture);
		}
		bool (::hx::Object :: *_hx_willTrigger)(::String type); 
		static inline bool willTrigger( ::Dynamic _hx_,::String type) {
			return (_hx_.mPtr->*( ::hx::interface_cast< ::nme::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0xc3e4c1b7)))->_hx_willTrigger)(type);
		}
};

} // end namespace nme
} // end namespace events

#endif /* INCLUDED_nme_events_IEventDispatcher */ 