// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_display_TriangleCulling
#include <nme/display/TriangleCulling.h>
#endif
namespace nme{
namespace display{

::nme::display::TriangleCulling TriangleCulling_obj::NEGATIVE;

::nme::display::TriangleCulling TriangleCulling_obj::NONE;

::nme::display::TriangleCulling TriangleCulling_obj::POSITIVE;

bool TriangleCulling_obj::__GetStatic(const ::String &inName, ::Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	if (inName==HX_("NEGATIVE",75,b6,c7,aa)) { outValue = TriangleCulling_obj::NEGATIVE; return true; }
	if (inName==HX_("NONE",b8,da,ca,33)) { outValue = TriangleCulling_obj::NONE; return true; }
	if (inName==HX_("POSITIVE",b9,36,80,24)) { outValue = TriangleCulling_obj::POSITIVE; return true; }
	return super::__GetStatic(inName, outValue, inCallProp);
}

HX_DEFINE_CREATE_ENUM(TriangleCulling_obj)

int TriangleCulling_obj::__FindIndex(::String inName)
{
	if (inName==HX_("NEGATIVE",75,b6,c7,aa)) return 2;
	if (inName==HX_("NONE",b8,da,ca,33)) return 1;
	if (inName==HX_("POSITIVE",b9,36,80,24)) return 0;
	return super::__FindIndex(inName);
}

int TriangleCulling_obj::__FindArgCount(::String inName)
{
	if (inName==HX_("NEGATIVE",75,b6,c7,aa)) return 0;
	if (inName==HX_("NONE",b8,da,ca,33)) return 0;
	if (inName==HX_("POSITIVE",b9,36,80,24)) return 0;
	return super::__FindArgCount(inName);
}

::hx::Val TriangleCulling_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	if (inName==HX_("NEGATIVE",75,b6,c7,aa)) return NEGATIVE;
	if (inName==HX_("NONE",b8,da,ca,33)) return NONE;
	if (inName==HX_("POSITIVE",b9,36,80,24)) return POSITIVE;
	return super::__Field(inName,inCallProp);
}

static ::String TriangleCulling_obj_sStaticFields[] = {
	HX_("POSITIVE",b9,36,80,24),
	HX_("NONE",b8,da,ca,33),
	HX_("NEGATIVE",75,b6,c7,aa),
	::String(null())
};

::hx::Class TriangleCulling_obj::__mClass;

Dynamic __Create_TriangleCulling_obj() { return new TriangleCulling_obj; }

void TriangleCulling_obj::__register()
{

::hx::Static(__mClass) = ::hx::_hx_RegisterClass(HX_("nme.display.TriangleCulling",14,2d,69,22), ::hx::TCanCast< TriangleCulling_obj >,TriangleCulling_obj_sStaticFields,0,
	&__Create_TriangleCulling_obj, &__Create,
	&super::__SGetClass(), &CreateTriangleCulling_obj, 0
#ifdef HXCPP_VISIT_ALLOCS
    , 0
#endif
#ifdef HXCPP_SCRIPTABLE
    , 0
#endif
);
	__mClass->mGetStaticField = &TriangleCulling_obj::__GetStatic;
}

void TriangleCulling_obj::__boot()
{
NEGATIVE = ::hx::CreateConstEnum< TriangleCulling_obj >(HX_("NEGATIVE",75,b6,c7,aa),2);
NONE = ::hx::CreateConstEnum< TriangleCulling_obj >(HX_("NONE",b8,da,ca,33),1);
POSITIVE = ::hx::CreateConstEnum< TriangleCulling_obj >(HX_("POSITIVE",b9,36,80,24),0);
}


} // end namespace nme
} // end namespace display