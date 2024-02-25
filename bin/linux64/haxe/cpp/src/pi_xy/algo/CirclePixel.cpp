// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_pi_xy_algo_CirclePixel
#include <pi_xy/algo/CirclePixel.h>
#endif
#ifndef INCLUDED_pi_xy_algo__CirclePixel_CirclePixel_Fields_
#include <pi_xy/algo/_CirclePixel/CirclePixel_Fields_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_5948f35339211b4b_24_new,"pi_xy.algo.CirclePixel","new",0xc1f8ec94,"pi_xy.algo.CirclePixel.new","pi_xy/algo/CirclePixel.hx",24,0xe79505bc)
namespace pi_xy{
namespace algo{

void CirclePixel_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_5948f35339211b4b_24_new)
HXLINE(  40)		this->_getSidesDivisible4 = ::pi_xy::algo::_CirclePixel::CirclePixel_Fields__obj::getSidesDivisible4_dyn();
HXLINE(  34)		this->_circleError = ::pi_xy::algo::_CirclePixel::CirclePixel_Fields__obj::circleError_dyn();
            	}

Dynamic CirclePixel_obj::__CreateEmpty() { return new CirclePixel_obj; }

void *CirclePixel_obj::_hx_vtable = 0;

Dynamic CirclePixel_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< CirclePixel_obj > _hx_result = new CirclePixel_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool CirclePixel_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x12bd815c;
}


::hx::ObjectPtr< CirclePixel_obj > CirclePixel_obj::__new() {
	::hx::ObjectPtr< CirclePixel_obj > __this = new CirclePixel_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< CirclePixel_obj > CirclePixel_obj::__alloc(::hx::Ctx *_hx_ctx) {
	CirclePixel_obj *__this = (CirclePixel_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(CirclePixel_obj), true, "pi_xy.algo.CirclePixel"));
	*(void **)__this = CirclePixel_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

CirclePixel_obj::CirclePixel_obj()
{
}

void CirclePixel_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(CirclePixel);
	HX_MARK_MEMBER_NAME(_circleError,"_circleError");
	HX_MARK_MEMBER_NAME(_getSidesDivisible4,"_getSidesDivisible4");
	HX_MARK_END_CLASS();
}

void CirclePixel_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_circleError,"_circleError");
	HX_VISIT_MEMBER_NAME(_getSidesDivisible4,"_getSidesDivisible4");
}

::hx::Val CirclePixel_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"_circleError") ) { return ::hx::Val( _circleError ); }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"_getSidesDivisible4") ) { return ::hx::Val( _getSidesDivisible4 ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val CirclePixel_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"_circleError") ) { _circleError=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"_getSidesDivisible4") ) { _getSidesDivisible4=inValue.Cast<  ::Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo CirclePixel_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(CirclePixel_obj,_circleError),HX_("_circleError",99,fd,0b,1c)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(CirclePixel_obj,_getSidesDivisible4),HX_("_getSidesDivisible4",4c,62,f2,21)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *CirclePixel_obj_sStaticStorageInfo = 0;
#endif

static ::String CirclePixel_obj_sMemberFields[] = {
	HX_("_circleError",99,fd,0b,1c),
	HX_("_getSidesDivisible4",4c,62,f2,21),
	::String(null()) };

::hx::Class CirclePixel_obj::__mClass;

void CirclePixel_obj::__register()
{
	CirclePixel_obj _hx_dummy;
	CirclePixel_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo.CirclePixel",a2,52,c2,77);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(CirclePixel_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< CirclePixel_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = CirclePixel_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = CirclePixel_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo