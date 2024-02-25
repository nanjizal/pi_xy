// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_app_EventName
#define INCLUDED_nme_app_EventName

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(nme,app,EventName)

namespace nme{
namespace app{


class HXCPP_CLASS_ATTRIBUTES EventName_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef EventName_obj OBJ_;
		EventName_obj();

	public:
		enum { _hx_ClassId = 0x68b190ea };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.app.EventName")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.app.EventName"); }

		inline static ::hx::ObjectPtr< EventName_obj > __new() {
			::hx::ObjectPtr< EventName_obj > __this = new EventName_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< EventName_obj > __alloc(::hx::Ctx *_hx_ctx) {
			EventName_obj *__this = (EventName_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(EventName_obj), false, "nme.app.EventName"));
			*(void **)__this = EventName_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~EventName_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("EventName",65,5b,df,99); }

		static void __boot();
		static ::String KEY_DOWN;
		static ::String KEY_UP;
		static ::String MOUSE_MOVE;
		static ::String MOUSE_DOWN;
		static ::String MOUSE_UP;
		static ::String CLICK;
		static ::String TOUCH_BEGIN;
		static ::String TOUCH_MOVE;
		static ::String TOUCH_END;
		static ::String TOUCH_TAP;
		static ::String AXIS_MOVE;
		static ::String BALL_MOVE;
		static ::String HAT_MOVE;
		static ::String BUTTON_DOWN;
		static ::String BUTTON_UP;
		static ::String DEVICE_ADDED;
		static ::String DEVICE_REMOVED;
};

} // end namespace nme
} // end namespace app

#endif /* INCLUDED_nme_app_EventName */ 
