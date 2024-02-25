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
#ifndef INCLUDED_pi_xy_algo_QuadPixel
#include <pi_xy/algo/QuadPixel.h>
#endif
#ifndef INCLUDED_pi_xy_algo_QuadPoints_
#include <pi_xy/algo/QuadPoints_.h>
#endif
#ifndef INCLUDED_pi_xy_algo__QuadPixel_QuadPixel_Fields_
#include <pi_xy/algo/_QuadPixel/QuadPixel_Fields_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_aa7e0cdd549f981b_311_new,"pi_xy.algo.QuadPixel","new",0x6d22abfd,"pi_xy.algo.QuadPixel.new","pi_xy/algo/QuadPixel.hx",311,0x68b40e73)
namespace pi_xy{
namespace algo{

void QuadPixel_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_aa7e0cdd549f981b_311_new)
HXLINE( 341)		this->_fillGradQuadrilateral = ::pi_xy::algo::_QuadPixel::QuadPixel_Fields__obj::fillGradQuadrilateral_dyn();
HXLINE( 331)		this->_tileQuadrilateral = ::pi_xy::algo::_QuadPixel::QuadPixel_Fields__obj::tileQuadrilateral_dyn();
HXLINE( 321)		this->_fillQuadrilateral = ::pi_xy::algo::_QuadPixel::QuadPixel_Fields__obj::fillQuadrilateral_dyn();
            	}

Dynamic QuadPixel_obj::__CreateEmpty() { return new QuadPixel_obj; }

void *QuadPixel_obj::_hx_vtable = 0;

Dynamic QuadPixel_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< QuadPixel_obj > _hx_result = new QuadPixel_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool QuadPixel_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x0d7815c5;
}


::hx::ObjectPtr< QuadPixel_obj > QuadPixel_obj::__new() {
	::hx::ObjectPtr< QuadPixel_obj > __this = new QuadPixel_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< QuadPixel_obj > QuadPixel_obj::__alloc(::hx::Ctx *_hx_ctx) {
	QuadPixel_obj *__this = (QuadPixel_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(QuadPixel_obj), true, "pi_xy.algo.QuadPixel"));
	*(void **)__this = QuadPixel_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

QuadPixel_obj::QuadPixel_obj()
{
}

void QuadPixel_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(QuadPixel);
	HX_MARK_MEMBER_NAME(_fillQuadrilateral,"_fillQuadrilateral");
	HX_MARK_MEMBER_NAME(_tileQuadrilateral,"_tileQuadrilateral");
	HX_MARK_MEMBER_NAME(_fillGradQuadrilateral,"_fillGradQuadrilateral");
	HX_MARK_END_CLASS();
}

void QuadPixel_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_fillQuadrilateral,"_fillQuadrilateral");
	HX_VISIT_MEMBER_NAME(_tileQuadrilateral,"_tileQuadrilateral");
	HX_VISIT_MEMBER_NAME(_fillGradQuadrilateral,"_fillGradQuadrilateral");
}

::hx::Val QuadPixel_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 18:
		if (HX_FIELD_EQ(inName,"_fillQuadrilateral") ) { return ::hx::Val( _fillQuadrilateral ); }
		if (HX_FIELD_EQ(inName,"_tileQuadrilateral") ) { return ::hx::Val( _tileQuadrilateral ); }
		break;
	case 22:
		if (HX_FIELD_EQ(inName,"_fillGradQuadrilateral") ) { return ::hx::Val( _fillGradQuadrilateral ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val QuadPixel_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 18:
		if (HX_FIELD_EQ(inName,"_fillQuadrilateral") ) { _fillQuadrilateral=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_tileQuadrilateral") ) { _tileQuadrilateral=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 22:
		if (HX_FIELD_EQ(inName,"_fillGradQuadrilateral") ) { _fillGradQuadrilateral=inValue.Cast<  ::Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo QuadPixel_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(QuadPixel_obj,_fillQuadrilateral),HX_("_fillQuadrilateral",37,5e,77,84)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(QuadPixel_obj,_tileQuadrilateral),HX_("_tileQuadrilateral",ac,92,0f,5b)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(QuadPixel_obj,_fillGradQuadrilateral),HX_("_fillGradQuadrilateral",89,8c,9f,60)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *QuadPixel_obj_sStaticStorageInfo = 0;
#endif

static ::String QuadPixel_obj_sMemberFields[] = {
	HX_("_fillQuadrilateral",37,5e,77,84),
	HX_("_tileQuadrilateral",ac,92,0f,5b),
	HX_("_fillGradQuadrilateral",89,8c,9f,60),
	::String(null()) };

::hx::Class QuadPixel_obj::__mClass;

void QuadPixel_obj::__register()
{
	QuadPixel_obj _hx_dummy;
	QuadPixel_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo.QuadPixel",8b,e9,0b,07);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(QuadPixel_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< QuadPixel_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = QuadPixel_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = QuadPixel_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo
