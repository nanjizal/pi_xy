// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_display_ManagedStage
#define INCLUDED_nme_display_ManagedStage

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_nme_display_Stage
#include <nme/display/Stage.h>
#endif
HX_DECLARE_CLASS2(nme,app,IAppEventHandler)
HX_DECLARE_CLASS2(nme,app,IPollClient)
HX_DECLARE_CLASS2(nme,display,DisplayObject)
HX_DECLARE_CLASS2(nme,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(nme,display,IBitmapDrawable)
HX_DECLARE_CLASS2(nme,display,InteractiveObject)
HX_DECLARE_CLASS2(nme,display,ManagedStage)
HX_DECLARE_CLASS2(nme,display,Stage)
HX_DECLARE_CLASS2(nme,events,EventDispatcher)
HX_DECLARE_CLASS2(nme,events,IEventDispatcher)

namespace nme{
namespace display{


class HXCPP_CLASS_ATTRIBUTES ManagedStage_obj : public  ::nme::display::Stage_obj
{
	public:
		typedef  ::nme::display::Stage_obj super;
		typedef ManagedStage_obj OBJ_;
		ManagedStage_obj();

	public:
		enum { _hx_ClassId = 0x77ef11fb };

		void __construct(int inWidth,int inHeight,::hx::Null< int >  __o_inFlags);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="nme.display.ManagedStage")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"nme.display.ManagedStage"); }
		static ::hx::ObjectPtr< ManagedStage_obj > __new(int inWidth,int inHeight,::hx::Null< int >  __o_inFlags);
		static ::hx::ObjectPtr< ManagedStage_obj > __alloc(::hx::Ctx *_hx_ctx,int inWidth,int inHeight,::hx::Null< int >  __o_inFlags);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		static void __alloc_dynamic_functions(::hx::Ctx *_hx_alloc,ManagedStage_obj *_hx_obj);
		//~ManagedStage_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("ManagedStage",ff,9b,7f,a6); }

		static void __boot();
		static int etUnknown;
		static int etKeyDown;
		static int etChar;
		static int etKeyUp;
		static int etMouseMove;
		static int etMouseDown;
		static int etMouseClick;
		static int etMouseUp;
		static int etResize;
		static int etPoll;
		static int etQuit;
		static int etFocus;
		static int etShouldRotate;
		static int etDestroyHandler;
		static int etRedraw;
		static int etTouchBegin;
		static int etTouchMove;
		static int etTouchEnd;
		static int etTouchTap;
		static int etChange;
		static int efLeftDown;
		static int efShiftDown;
		static int efCtrlDown;
		static int efAltDown;
		static int efCommandDown;
		static int efMiddleDown;
		static int efRightDown;
		static int efLocationRight;
		static int efPrimaryTouch;
		static void initSdlAudio();
		static ::Dynamic initSdlAudio_dyn();

		static ::cpp::Function<  ::hx::Object *  (int,int,int) > nme_managed_stage_create;
		static Dynamic nme_managed_stage_create_dyn() { return nme_managed_stage_create;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *) > nme_managed_stage_pump_event;
		static Dynamic nme_managed_stage_pump_event_dyn() { return nme_managed_stage_pump_event;}
		static ::cpp::Function< void  () > nme_init_sdl_audio;
		static Dynamic nme_init_sdl_audio_dyn() { return nme_init_sdl_audio;}
		void pumpEvent( ::Dynamic inEvent);
		::Dynamic pumpEvent_dyn();

		void onWindowSize(int inWidth,int inHeight);
		::Dynamic onWindowSize_dyn();

		void sendQuit();
		::Dynamic sendQuit_dyn();

		::Dynamic setNextWake;
		inline ::Dynamic &setNextWake_dyn() {return setNextWake; }

		void invalidate();

};

} // end namespace nme
} // end namespace display

#endif /* INCLUDED_nme_display_ManagedStage */ 