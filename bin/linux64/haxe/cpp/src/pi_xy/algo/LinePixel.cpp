// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_pi_xy_ImageStruct
#include <pi_xy/ImageStruct.h>
#endif
#ifndef INCLUDED_pi_xy_algo_HitQuad
#include <pi_xy/algo/HitQuad.h>
#endif
#ifndef INCLUDED_pi_xy_algo_IhitObj
#include <pi_xy/algo/IhitObj.h>
#endif
#ifndef INCLUDED_pi_xy_algo_LinePixel
#include <pi_xy/algo/LinePixel.h>
#endif
#ifndef INCLUDED_pi_xy_algo_QuadPoints_
#include <pi_xy/algo/QuadPoints_.h>
#endif
#ifndef INCLUDED_pi_xy_algo__LinePixel_LinePixel_Fields_
#include <pi_xy/algo/_LinePixel/LinePixel_Fields_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_8a177bd42d3753af_544_new,"pi_xy.algo.LinePixel","new",0x46fcff30,"pi_xy.algo.LinePixel.new","pi_xy/algo/LinePixel.hx",544,0xac4362a0)
namespace pi_xy{
namespace algo{

void LinePixel_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_8a177bd42d3753af_544_new)
HXLINE( 577)		this->_rotateGradLine = ::pi_xy::algo::_LinePixel::LinePixel_Fields__obj::rotateGradLine_dyn();
HXLINE( 565)		this->_rotateTileLine = ::pi_xy::algo::_LinePixel::LinePixel_Fields__obj::rotateTileLine_dyn();
HXLINE( 554)		this->_rotateLine = ::pi_xy::algo::_LinePixel::LinePixel_Fields__obj::rotateLine_dyn();
            	}

Dynamic LinePixel_obj::__CreateEmpty() { return new LinePixel_obj; }

void *LinePixel_obj::_hx_vtable = 0;

Dynamic LinePixel_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< LinePixel_obj > _hx_result = new LinePixel_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool LinePixel_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x4a291fdc;
}


::hx::ObjectPtr< LinePixel_obj > LinePixel_obj::__new() {
	::hx::ObjectPtr< LinePixel_obj > __this = new LinePixel_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< LinePixel_obj > LinePixel_obj::__alloc(::hx::Ctx *_hx_ctx) {
	LinePixel_obj *__this = (LinePixel_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(LinePixel_obj), true, "pi_xy.algo.LinePixel"));
	*(void **)__this = LinePixel_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

LinePixel_obj::LinePixel_obj()
{
}

void LinePixel_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(LinePixel);
	HX_MARK_MEMBER_NAME(_rotateLine,"_rotateLine");
	HX_MARK_MEMBER_NAME(_rotateTileLine,"_rotateTileLine");
	HX_MARK_MEMBER_NAME(_rotateGradLine,"_rotateGradLine");
	HX_MARK_END_CLASS();
}

void LinePixel_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_rotateLine,"_rotateLine");
	HX_VISIT_MEMBER_NAME(_rotateTileLine,"_rotateTileLine");
	HX_VISIT_MEMBER_NAME(_rotateGradLine,"_rotateGradLine");
}

::hx::Val LinePixel_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 11:
		if (HX_FIELD_EQ(inName,"_rotateLine") ) { return ::hx::Val( _rotateLine ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"_rotateTileLine") ) { return ::hx::Val( _rotateTileLine ); }
		if (HX_FIELD_EQ(inName,"_rotateGradLine") ) { return ::hx::Val( _rotateGradLine ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val LinePixel_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 11:
		if (HX_FIELD_EQ(inName,"_rotateLine") ) { _rotateLine=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"_rotateTileLine") ) { _rotateTileLine=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_rotateGradLine") ) { _rotateGradLine=inValue.Cast<  ::Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo LinePixel_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(LinePixel_obj,_rotateLine),HX_("_rotateLine",0e,21,48,52)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(LinePixel_obj,_rotateTileLine),HX_("_rotateTileLine",5c,dc,71,8e)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(LinePixel_obj,_rotateGradLine),HX_("_rotateGradLine",fc,b0,cf,23)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *LinePixel_obj_sStaticStorageInfo = 0;
#endif

static ::String LinePixel_obj_sMemberFields[] = {
	HX_("_rotateLine",0e,21,48,52),
	HX_("_rotateTileLine",5c,dc,71,8e),
	HX_("_rotateGradLine",fc,b0,cf,23),
	::String(null()) };

::hx::Class LinePixel_obj::__mClass;

void LinePixel_obj::__register()
{
	LinePixel_obj _hx_dummy;
	LinePixel_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo.LinePixel",3e,e7,e9,bc);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(LinePixel_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< LinePixel_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = LinePixel_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = LinePixel_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo
