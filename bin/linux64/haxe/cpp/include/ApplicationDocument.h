// Generated by Haxe 4.3.3
#ifndef INCLUDED_ApplicationDocument
#define INCLUDED_ApplicationDocument

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_pi_xy_application_TestNME
#include <pi_xy/application/TestNME.h>
#endif
HX_DECLARE_CLASS0(ApplicationDocument)
HX_DECLARE_CLASS2(nme,display,DisplayObject)
HX_DECLARE_CLASS2(nme,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(nme,display,IBitmapDrawable)
HX_DECLARE_CLASS2(nme,display,InteractiveObject)
HX_DECLARE_CLASS2(nme,display,Sprite)
HX_DECLARE_CLASS2(nme,events,EventDispatcher)
HX_DECLARE_CLASS2(nme,events,IEventDispatcher)
HX_DECLARE_CLASS2(pi_xy,application,TestNME)



class HXCPP_CLASS_ATTRIBUTES ApplicationDocument_obj : public  ::pi_xy::application::TestNME_obj
{
	public:
		typedef  ::pi_xy::application::TestNME_obj super;
		typedef ApplicationDocument_obj OBJ_;
		ApplicationDocument_obj();

	public:
		enum { _hx_ClassId = 0x0b9723ab };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="ApplicationDocument")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"ApplicationDocument"); }
		static ::hx::ObjectPtr< ApplicationDocument_obj > __new();
		static ::hx::ObjectPtr< ApplicationDocument_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~ApplicationDocument_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("ApplicationDocument",6b,9e,f4,97); }

};


#endif /* INCLUDED_ApplicationDocument */ 
