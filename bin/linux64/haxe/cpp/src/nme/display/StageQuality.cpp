// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_display_StageQuality
#include <nme/display/StageQuality.h>
#endif
namespace nme{
namespace display{

::nme::display::StageQuality StageQuality_obj::BEST;

::nme::display::StageQuality StageQuality_obj::HIGH;

::nme::display::StageQuality StageQuality_obj::LOW;

::nme::display::StageQuality StageQuality_obj::MEDIUM;

bool StageQuality_obj::__GetStatic(const ::String &inName, ::Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	if (inName==HX_("BEST",24,b9,d4,2b)) { outValue = StageQuality_obj::BEST; return true; }
	if (inName==HX_("HIGH",62,ff,ce,2f)) { outValue = StageQuality_obj::HIGH; return true; }
	if (inName==HX_("LOW",74,f0,39,00)) { outValue = StageQuality_obj::LOW; return true; }
	if (inName==HX_("MEDIUM",75,00,4b,b1)) { outValue = StageQuality_obj::MEDIUM; return true; }
	return super::__GetStatic(inName, outValue, inCallProp);
}

HX_DEFINE_CREATE_ENUM(StageQuality_obj)

int StageQuality_obj::__FindIndex(::String inName)
{
	if (inName==HX_("BEST",24,b9,d4,2b)) return 3;
	if (inName==HX_("HIGH",62,ff,ce,2f)) return 2;
	if (inName==HX_("LOW",74,f0,39,00)) return 0;
	if (inName==HX_("MEDIUM",75,00,4b,b1)) return 1;
	return super::__FindIndex(inName);
}

int StageQuality_obj::__FindArgCount(::String inName)
{
	if (inName==HX_("BEST",24,b9,d4,2b)) return 0;
	if (inName==HX_("HIGH",62,ff,ce,2f)) return 0;
	if (inName==HX_("LOW",74,f0,39,00)) return 0;
	if (inName==HX_("MEDIUM",75,00,4b,b1)) return 0;
	return super::__FindArgCount(inName);
}

::hx::Val StageQuality_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	if (inName==HX_("BEST",24,b9,d4,2b)) return BEST;
	if (inName==HX_("HIGH",62,ff,ce,2f)) return HIGH;
	if (inName==HX_("LOW",74,f0,39,00)) return LOW;
	if (inName==HX_("MEDIUM",75,00,4b,b1)) return MEDIUM;
	return super::__Field(inName,inCallProp);
}

static ::String StageQuality_obj_sStaticFields[] = {
	HX_("LOW",74,f0,39,00),
	HX_("MEDIUM",75,00,4b,b1),
	HX_("HIGH",62,ff,ce,2f),
	HX_("BEST",24,b9,d4,2b),
	::String(null())
};

::hx::Class StageQuality_obj::__mClass;

Dynamic __Create_StageQuality_obj() { return new StageQuality_obj; }

void StageQuality_obj::__register()
{

::hx::Static(__mClass) = ::hx::_hx_RegisterClass(HX_("nme.display.StageQuality",95,2d,97,32), ::hx::TCanCast< StageQuality_obj >,StageQuality_obj_sStaticFields,0,
	&__Create_StageQuality_obj, &__Create,
	&super::__SGetClass(), &CreateStageQuality_obj, 0
#ifdef HXCPP_VISIT_ALLOCS
    , 0
#endif
#ifdef HXCPP_SCRIPTABLE
    , 0
#endif
);
	__mClass->mGetStaticField = &StageQuality_obj::__GetStatic;
}

void StageQuality_obj::__boot()
{
BEST = ::hx::CreateConstEnum< StageQuality_obj >(HX_("BEST",24,b9,d4,2b),3);
HIGH = ::hx::CreateConstEnum< StageQuality_obj >(HX_("HIGH",62,ff,ce,2f),2);
LOW = ::hx::CreateConstEnum< StageQuality_obj >(HX_("LOW",74,f0,39,00),0);
MEDIUM = ::hx::CreateConstEnum< StageQuality_obj >(HX_("MEDIUM",75,00,4b,b1),1);
}


} // end namespace nme
} // end namespace display
