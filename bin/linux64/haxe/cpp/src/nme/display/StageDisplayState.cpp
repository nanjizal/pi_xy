// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_display_StageDisplayState
#include <nme/display/StageDisplayState.h>
#endif
namespace nme{
namespace display{

::nme::display::StageDisplayState StageDisplayState_obj::FULL_SCREEN;

::nme::display::StageDisplayState StageDisplayState_obj::FULL_SCREEN_INTERACTIVE;

::nme::display::StageDisplayState StageDisplayState_obj::NORMAL;

bool StageDisplayState_obj::__GetStatic(const ::String &inName, ::Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	if (inName==HX_("FULL_SCREEN",5c,27,87,18)) { outValue = StageDisplayState_obj::FULL_SCREEN; return true; }
	if (inName==HX_("FULL_SCREEN_INTERACTIVE",1f,b9,f1,23)) { outValue = StageDisplayState_obj::FULL_SCREEN_INTERACTIVE; return true; }
	if (inName==HX_("NORMAL",27,1e,ec,e2)) { outValue = StageDisplayState_obj::NORMAL; return true; }
	return super::__GetStatic(inName, outValue, inCallProp);
}

HX_DEFINE_CREATE_ENUM(StageDisplayState_obj)

int StageDisplayState_obj::__FindIndex(::String inName)
{
	if (inName==HX_("FULL_SCREEN",5c,27,87,18)) return 1;
	if (inName==HX_("FULL_SCREEN_INTERACTIVE",1f,b9,f1,23)) return 2;
	if (inName==HX_("NORMAL",27,1e,ec,e2)) return 0;
	return super::__FindIndex(inName);
}

int StageDisplayState_obj::__FindArgCount(::String inName)
{
	if (inName==HX_("FULL_SCREEN",5c,27,87,18)) return 0;
	if (inName==HX_("FULL_SCREEN_INTERACTIVE",1f,b9,f1,23)) return 0;
	if (inName==HX_("NORMAL",27,1e,ec,e2)) return 0;
	return super::__FindArgCount(inName);
}

::hx::Val StageDisplayState_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	if (inName==HX_("FULL_SCREEN",5c,27,87,18)) return FULL_SCREEN;
	if (inName==HX_("FULL_SCREEN_INTERACTIVE",1f,b9,f1,23)) return FULL_SCREEN_INTERACTIVE;
	if (inName==HX_("NORMAL",27,1e,ec,e2)) return NORMAL;
	return super::__Field(inName,inCallProp);
}

static ::String StageDisplayState_obj_sStaticFields[] = {
	HX_("NORMAL",27,1e,ec,e2),
	HX_("FULL_SCREEN",5c,27,87,18),
	HX_("FULL_SCREEN_INTERACTIVE",1f,b9,f1,23),
	::String(null())
};

::hx::Class StageDisplayState_obj::__mClass;

Dynamic __Create_StageDisplayState_obj() { return new StageDisplayState_obj; }

void StageDisplayState_obj::__register()
{

::hx::Static(__mClass) = ::hx::_hx_RegisterClass(HX_("nme.display.StageDisplayState",d9,5b,07,c9), ::hx::TCanCast< StageDisplayState_obj >,StageDisplayState_obj_sStaticFields,0,
	&__Create_StageDisplayState_obj, &__Create,
	&super::__SGetClass(), &CreateStageDisplayState_obj, 0
#ifdef HXCPP_VISIT_ALLOCS
    , 0
#endif
#ifdef HXCPP_SCRIPTABLE
    , 0
#endif
);
	__mClass->mGetStaticField = &StageDisplayState_obj::__GetStatic;
}

void StageDisplayState_obj::__boot()
{
FULL_SCREEN = ::hx::CreateConstEnum< StageDisplayState_obj >(HX_("FULL_SCREEN",5c,27,87,18),1);
FULL_SCREEN_INTERACTIVE = ::hx::CreateConstEnum< StageDisplayState_obj >(HX_("FULL_SCREEN_INTERACTIVE",1f,b9,f1,23),2);
NORMAL = ::hx::CreateConstEnum< StageDisplayState_obj >(HX_("NORMAL",27,1e,ec,e2),0);
}


} // end namespace nme
} // end namespace display
