// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_display_LineScaleMode
#include <nme/display/LineScaleMode.h>
#endif
namespace nme{
namespace display{

::nme::display::LineScaleMode LineScaleMode_obj::HORIZONTAL;

::nme::display::LineScaleMode LineScaleMode_obj::NONE;

::nme::display::LineScaleMode LineScaleMode_obj::NORMAL;

::nme::display::LineScaleMode LineScaleMode_obj::OPENGL;

::nme::display::LineScaleMode LineScaleMode_obj::VERTICAL;

bool LineScaleMode_obj::__GetStatic(const ::String &inName, ::Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	if (inName==HX_("HORIZONTAL",e4,70,cd,07)) { outValue = LineScaleMode_obj::HORIZONTAL; return true; }
	if (inName==HX_("NONE",b8,da,ca,33)) { outValue = LineScaleMode_obj::NONE; return true; }
	if (inName==HX_("NORMAL",27,1e,ec,e2)) { outValue = LineScaleMode_obj::NORMAL; return true; }
	if (inName==HX_("OPENGL",6f,10,17,d4)) { outValue = LineScaleMode_obj::OPENGL; return true; }
	if (inName==HX_("VERTICAL",76,4c,9b,c3)) { outValue = LineScaleMode_obj::VERTICAL; return true; }
	return super::__GetStatic(inName, outValue, inCallProp);
}

HX_DEFINE_CREATE_ENUM(LineScaleMode_obj)

int LineScaleMode_obj::__FindIndex(::String inName)
{
	if (inName==HX_("HORIZONTAL",e4,70,cd,07)) return 3;
	if (inName==HX_("NONE",b8,da,ca,33)) return 1;
	if (inName==HX_("NORMAL",27,1e,ec,e2)) return 0;
	if (inName==HX_("OPENGL",6f,10,17,d4)) return 4;
	if (inName==HX_("VERTICAL",76,4c,9b,c3)) return 2;
	return super::__FindIndex(inName);
}

int LineScaleMode_obj::__FindArgCount(::String inName)
{
	if (inName==HX_("HORIZONTAL",e4,70,cd,07)) return 0;
	if (inName==HX_("NONE",b8,da,ca,33)) return 0;
	if (inName==HX_("NORMAL",27,1e,ec,e2)) return 0;
	if (inName==HX_("OPENGL",6f,10,17,d4)) return 0;
	if (inName==HX_("VERTICAL",76,4c,9b,c3)) return 0;
	return super::__FindArgCount(inName);
}

::hx::Val LineScaleMode_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	if (inName==HX_("HORIZONTAL",e4,70,cd,07)) return HORIZONTAL;
	if (inName==HX_("NONE",b8,da,ca,33)) return NONE;
	if (inName==HX_("NORMAL",27,1e,ec,e2)) return NORMAL;
	if (inName==HX_("OPENGL",6f,10,17,d4)) return OPENGL;
	if (inName==HX_("VERTICAL",76,4c,9b,c3)) return VERTICAL;
	return super::__Field(inName,inCallProp);
}

static ::String LineScaleMode_obj_sStaticFields[] = {
	HX_("NORMAL",27,1e,ec,e2),
	HX_("NONE",b8,da,ca,33),
	HX_("VERTICAL",76,4c,9b,c3),
	HX_("HORIZONTAL",e4,70,cd,07),
	HX_("OPENGL",6f,10,17,d4),
	::String(null())
};

::hx::Class LineScaleMode_obj::__mClass;

Dynamic __Create_LineScaleMode_obj() { return new LineScaleMode_obj; }

void LineScaleMode_obj::__register()
{

::hx::Static(__mClass) = ::hx::_hx_RegisterClass(HX_("nme.display.LineScaleMode",05,82,68,9d), ::hx::TCanCast< LineScaleMode_obj >,LineScaleMode_obj_sStaticFields,0,
	&__Create_LineScaleMode_obj, &__Create,
	&super::__SGetClass(), &CreateLineScaleMode_obj, 0
#ifdef HXCPP_VISIT_ALLOCS
    , 0
#endif
#ifdef HXCPP_SCRIPTABLE
    , 0
#endif
);
	__mClass->mGetStaticField = &LineScaleMode_obj::__GetStatic;
}

void LineScaleMode_obj::__boot()
{
HORIZONTAL = ::hx::CreateConstEnum< LineScaleMode_obj >(HX_("HORIZONTAL",e4,70,cd,07),3);
NONE = ::hx::CreateConstEnum< LineScaleMode_obj >(HX_("NONE",b8,da,ca,33),1);
NORMAL = ::hx::CreateConstEnum< LineScaleMode_obj >(HX_("NORMAL",27,1e,ec,e2),0);
OPENGL = ::hx::CreateConstEnum< LineScaleMode_obj >(HX_("OPENGL",6f,10,17,d4),4);
VERTICAL = ::hx::CreateConstEnum< LineScaleMode_obj >(HX_("VERTICAL",76,4c,9b,c3),2);
}


} // end namespace nme
} // end namespace display