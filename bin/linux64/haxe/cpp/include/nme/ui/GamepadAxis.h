// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_ui_GamepadAxis
#define INCLUDED_nme_ui_GamepadAxis

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(nme,ui,GamepadAxis)

namespace nme{
namespace ui{


class HXCPP_CLASS_ATTRIBUTES GamepadAxis_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef GamepadAxis_obj OBJ_;
		GamepadAxis_obj();

	public:
		enum { _hx_ClassId = 0x46073228 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.ui.GamepadAxis")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.ui.GamepadAxis"); }

		inline static ::hx::ObjectPtr< GamepadAxis_obj > __new() {
			::hx::ObjectPtr< GamepadAxis_obj > __this = new GamepadAxis_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< GamepadAxis_obj > __alloc(::hx::Ctx *_hx_ctx) {
			GamepadAxis_obj *__this = (GamepadAxis_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(GamepadAxis_obj), false, "nme.ui.GamepadAxis"));
			*(void **)__this = GamepadAxis_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~GamepadAxis_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("GamepadAxis",c2,25,fe,b4); }

		static void __boot();
		static int LEFT;
		static int RIGHT;
		static int TRIGGER;
		static ::String toString(int id);
		static ::Dynamic toString_dyn();

};

} // end namespace nme
} // end namespace ui

#endif /* INCLUDED_nme_ui_GamepadAxis */ 
