// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_display_Shape
#define INCLUDED_nme_display_Shape

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_nme_display_DisplayObject
#include <nme/display/DisplayObject.h>
#endif
HX_DECLARE_CLASS2(nme,display,DisplayObject)
HX_DECLARE_CLASS2(nme,display,IBitmapDrawable)
HX_DECLARE_CLASS2(nme,display,Shape)
HX_DECLARE_CLASS2(nme,events,EventDispatcher)
HX_DECLARE_CLASS2(nme,events,IEventDispatcher)

namespace nme{
namespace display{


class HXCPP_CLASS_ATTRIBUTES Shape_obj : public  ::nme::display::DisplayObject_obj
{
	public:
		typedef  ::nme::display::DisplayObject_obj super;
		typedef Shape_obj OBJ_;
		Shape_obj();

	public:
		enum { _hx_ClassId = 0x5375f585 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="nme.display.Shape")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"nme.display.Shape"); }
		static ::hx::ObjectPtr< Shape_obj > __new();
		static ::hx::ObjectPtr< Shape_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Shape_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Shape",01,53,4a,0f); }

};

} // end namespace nme
} // end namespace display

#endif /* INCLUDED_nme_display_Shape */ 
