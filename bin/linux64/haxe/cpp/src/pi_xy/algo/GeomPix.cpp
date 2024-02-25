// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_pi_xy_algo_GeomPix
#include <pi_xy/algo/GeomPix.h>
#endif
#ifndef INCLUDED_pi_xy_algo__GeomPix_GeomPix_Fields_
#include <pi_xy/algo/_GeomPix/GeomPix_Fields_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_b4a02b89dafd0e5e_97_new,"pi_xy.algo.GeomPix","new",0x2b4ad5c1,"pi_xy.algo.GeomPix.new","pi_xy/algo/GeomPix.hx",97,0x5049712f)
namespace pi_xy{
namespace algo{

void GeomPix_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_b4a02b89dafd0e5e_97_new)
HXLINE( 134)		this->_rotY = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::rotY_dyn();
HXLINE( 130)		this->_rotX = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::rotX_dyn();
HXLINE( 126)		this->_distanceSquarePointToSegment = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::distanceSquarePointToSegment_dyn();
HXLINE( 122)		this->_dotSame = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::dotSame_dyn();
HXLINE( 118)		this->_dot = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::dot_dyn();
HXLINE( 114)		this->_cross2d = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::cross2d_dyn();
HXLINE( 110)		this->_lerp4Colors = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::lerp4Colors_dyn();
HXLINE( 105)		this->_lerp = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::lerp_dyn();
HXLINE( 101)		this->_smootherStep = ::pi_xy::algo::_GeomPix::GeomPix_Fields__obj::smootherStep_dyn();
            	}

Dynamic GeomPix_obj::__CreateEmpty() { return new GeomPix_obj; }

void *GeomPix_obj::_hx_vtable = 0;

Dynamic GeomPix_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< GeomPix_obj > _hx_result = new GeomPix_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool GeomPix_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x113dab09;
}


::hx::ObjectPtr< GeomPix_obj > GeomPix_obj::__new() {
	::hx::ObjectPtr< GeomPix_obj > __this = new GeomPix_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< GeomPix_obj > GeomPix_obj::__alloc(::hx::Ctx *_hx_ctx) {
	GeomPix_obj *__this = (GeomPix_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(GeomPix_obj), true, "pi_xy.algo.GeomPix"));
	*(void **)__this = GeomPix_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

GeomPix_obj::GeomPix_obj()
{
}

void GeomPix_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(GeomPix);
	HX_MARK_MEMBER_NAME(_smootherStep,"_smootherStep");
	HX_MARK_MEMBER_NAME(_lerp,"_lerp");
	HX_MARK_MEMBER_NAME(_lerp4Colors,"_lerp4Colors");
	HX_MARK_MEMBER_NAME(_cross2d,"_cross2d");
	HX_MARK_MEMBER_NAME(_dot,"_dot");
	HX_MARK_MEMBER_NAME(_dotSame,"_dotSame");
	HX_MARK_MEMBER_NAME(_distanceSquarePointToSegment,"_distanceSquarePointToSegment");
	HX_MARK_MEMBER_NAME(_rotX,"_rotX");
	HX_MARK_MEMBER_NAME(_rotY,"_rotY");
	HX_MARK_END_CLASS();
}

void GeomPix_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_smootherStep,"_smootherStep");
	HX_VISIT_MEMBER_NAME(_lerp,"_lerp");
	HX_VISIT_MEMBER_NAME(_lerp4Colors,"_lerp4Colors");
	HX_VISIT_MEMBER_NAME(_cross2d,"_cross2d");
	HX_VISIT_MEMBER_NAME(_dot,"_dot");
	HX_VISIT_MEMBER_NAME(_dotSame,"_dotSame");
	HX_VISIT_MEMBER_NAME(_distanceSquarePointToSegment,"_distanceSquarePointToSegment");
	HX_VISIT_MEMBER_NAME(_rotX,"_rotX");
	HX_VISIT_MEMBER_NAME(_rotY,"_rotY");
}

::hx::Val GeomPix_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"_dot") ) { return ::hx::Val( _dot ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"_lerp") ) { return ::hx::Val( _lerp ); }
		if (HX_FIELD_EQ(inName,"_rotX") ) { return ::hx::Val( _rotX ); }
		if (HX_FIELD_EQ(inName,"_rotY") ) { return ::hx::Val( _rotY ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"_cross2d") ) { return ::hx::Val( _cross2d ); }
		if (HX_FIELD_EQ(inName,"_dotSame") ) { return ::hx::Val( _dotSame ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"_lerp4Colors") ) { return ::hx::Val( _lerp4Colors ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"_smootherStep") ) { return ::hx::Val( _smootherStep ); }
		break;
	case 29:
		if (HX_FIELD_EQ(inName,"_distanceSquarePointToSegment") ) { return ::hx::Val( _distanceSquarePointToSegment ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val GeomPix_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"_dot") ) { _dot=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"_lerp") ) { _lerp=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_rotX") ) { _rotX=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_rotY") ) { _rotY=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"_cross2d") ) { _cross2d=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_dotSame") ) { _dotSame=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"_lerp4Colors") ) { _lerp4Colors=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"_smootherStep") ) { _smootherStep=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 29:
		if (HX_FIELD_EQ(inName,"_distanceSquarePointToSegment") ) { _distanceSquarePointToSegment=inValue.Cast<  ::Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo GeomPix_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_smootherStep),HX_("_smootherStep",e6,97,99,2d)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_lerp),HX_("_lerp",56,2e,c1,fa)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_lerp4Colors),HX_("_lerp4Colors",6e,41,4a,04)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_cross2d),HX_("_cross2d",f3,c4,09,19)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_dot),HX_("_dot",8a,87,17,3f)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_dotSame),HX_("_dotSame",10,c4,59,db)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_distanceSquarePointToSegment),HX_("_distanceSquarePointToSegment",39,ef,40,85)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_rotX),HX_("_rotX",40,0e,c0,fe)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(GeomPix_obj,_rotY),HX_("_rotY",41,0e,c0,fe)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *GeomPix_obj_sStaticStorageInfo = 0;
#endif

static ::String GeomPix_obj_sMemberFields[] = {
	HX_("_smootherStep",e6,97,99,2d),
	HX_("_lerp",56,2e,c1,fa),
	HX_("_lerp4Colors",6e,41,4a,04),
	HX_("_cross2d",f3,c4,09,19),
	HX_("_dot",8a,87,17,3f),
	HX_("_dotSame",10,c4,59,db),
	HX_("_distanceSquarePointToSegment",39,ef,40,85),
	HX_("_rotX",40,0e,c0,fe),
	HX_("_rotY",41,0e,c0,fe),
	::String(null()) };

::hx::Class GeomPix_obj::__mClass;

void GeomPix_obj::__register()
{
	GeomPix_obj _hx_dummy;
	GeomPix_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo.GeomPix",4f,e1,62,8e);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(GeomPix_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< GeomPix_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = GeomPix_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = GeomPix_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo
