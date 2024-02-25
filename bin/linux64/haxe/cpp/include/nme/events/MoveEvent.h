// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_events_MoveEvent
#define INCLUDED_nme_events_MoveEvent

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_nme_events_Event
#include <nme/events/Event.h>
#endif
HX_DECLARE_STACK_FRAME(_hx_pos_d8bd557586f9e450_17_new)
HX_DECLARE_CLASS2(nme,events,Event)
HX_DECLARE_CLASS2(nme,events,MoveEvent)

namespace nme{
namespace events{


class HXCPP_CLASS_ATTRIBUTES MoveEvent_obj : public  ::nme::events::Event_obj
{
	public:
		typedef  ::nme::events::Event_obj super;
		typedef MoveEvent_obj OBJ_;
		MoveEvent_obj();

	public:
		enum { _hx_ClassId = 0x720b42ce };

		void __construct(::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::hx::Null< int >  __o_inX,::hx::Null< int >  __o_inY);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="nme.events.MoveEvent")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"nme.events.MoveEvent"); }

		inline static ::hx::ObjectPtr< MoveEvent_obj > __new(::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::hx::Null< int >  __o_inX,::hx::Null< int >  __o_inY) {
			::hx::ObjectPtr< MoveEvent_obj > __this = new MoveEvent_obj();
			__this->__construct(type,__o_bubbles,__o_cancelable,__o_inX,__o_inY);
			return __this;
		}

		inline static ::hx::ObjectPtr< MoveEvent_obj > __alloc(::hx::Ctx *_hx_ctx,::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::hx::Null< int >  __o_inX,::hx::Null< int >  __o_inY) {
			MoveEvent_obj *__this = (MoveEvent_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(MoveEvent_obj), true, "nme.events.MoveEvent"));
			*(void **)__this = MoveEvent_obj::_hx_vtable;
{
            		bool bubbles = __o_bubbles.Default(true);
            		bool cancelable = __o_cancelable.Default(false);
            		int inX = __o_inX.Default(0);
            		int inY = __o_inY.Default(0);
            	HX_STACKFRAME(&_hx_pos_d8bd557586f9e450_17_new)
HXLINE(  18)		__this->super::__construct(type,bubbles,cancelable);
HXLINE(  19)		( ( ::nme::events::MoveEvent)(__this) )->x = inX;
HXLINE(  20)		( ( ::nme::events::MoveEvent)(__this) )->y = inY;
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~MoveEvent_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("MoveEvent",29,77,5e,d5); }

		static void __boot();
		static ::String WINDOW_MOVED;
		int x;
		int y;
		 ::nme::events::Event clone();

		virtual ::String toString();

};

} // end namespace nme
} // end namespace events

#endif /* INCLUDED_nme_events_MoveEvent */ 