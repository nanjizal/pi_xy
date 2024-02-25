// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_pi_xy_algo_QuadPoints_
#include <pi_xy/algo/QuadPoints_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_c53c1991087e4b0a_58_new,"pi_xy.algo.QuadPoints_","new",0x406ac093,"pi_xy.algo.QuadPoints_.new","pi_xy/algo/QuadPoints.hx",58,0x7e1fd9a0)
namespace pi_xy{
namespace algo{

void QuadPoints__obj::__construct(Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy){
            	HX_STACKFRAME(&_hx_pos_c53c1991087e4b0a_58_new)
HXLINE(  59)		this->ax = ax;
HXLINE(  60)		this->ay = ay;
HXLINE(  61)		this->bx = bx;
HXLINE(  62)		this->by = by;
HXLINE(  63)		this->cx = cx;
HXLINE(  64)		this->cy = cy;
HXLINE(  65)		this->dx = dx;
HXLINE(  66)		this->dy = dy;
            	}

Dynamic QuadPoints__obj::__CreateEmpty() { return new QuadPoints__obj; }

void *QuadPoints__obj::_hx_vtable = 0;

Dynamic QuadPoints__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< QuadPoints__obj > _hx_result = new QuadPoints__obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5],inArgs[6],inArgs[7]);
	return _hx_result;
}

bool QuadPoints__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x3517a9db;
}


QuadPoints__obj::QuadPoints__obj()
{
}

::hx::Val QuadPoints__obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"ax") ) { return ::hx::Val( ax ); }
		if (HX_FIELD_EQ(inName,"ay") ) { return ::hx::Val( ay ); }
		if (HX_FIELD_EQ(inName,"bx") ) { return ::hx::Val( bx ); }
		if (HX_FIELD_EQ(inName,"by") ) { return ::hx::Val( by ); }
		if (HX_FIELD_EQ(inName,"cx") ) { return ::hx::Val( cx ); }
		if (HX_FIELD_EQ(inName,"cy") ) { return ::hx::Val( cy ); }
		if (HX_FIELD_EQ(inName,"dx") ) { return ::hx::Val( dx ); }
		if (HX_FIELD_EQ(inName,"dy") ) { return ::hx::Val( dy ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val QuadPoints__obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"ax") ) { ax=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"ay") ) { ay=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"bx") ) { bx=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"by") ) { by=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"cx") ) { cx=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"cy") ) { cy=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"dx") ) { dx=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"dy") ) { dy=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void QuadPoints__obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("ax",f7,54,00,00));
	outFields->push(HX_("ay",f8,54,00,00));
	outFields->push(HX_("bx",d6,55,00,00));
	outFields->push(HX_("by",d7,55,00,00));
	outFields->push(HX_("cx",b5,56,00,00));
	outFields->push(HX_("cy",b6,56,00,00));
	outFields->push(HX_("dx",94,57,00,00));
	outFields->push(HX_("dy",95,57,00,00));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo QuadPoints__obj_sMemberStorageInfo[] = {
	{::hx::fsFloat,(int)offsetof(QuadPoints__obj,ax),HX_("ax",f7,54,00,00)},
	{::hx::fsFloat,(int)offsetof(QuadPoints__obj,ay),HX_("ay",f8,54,00,00)},
	{::hx::fsFloat,(int)offsetof(QuadPoints__obj,bx),HX_("bx",d6,55,00,00)},
	{::hx::fsFloat,(int)offsetof(QuadPoints__obj,by),HX_("by",d7,55,00,00)},
	{::hx::fsFloat,(int)offsetof(QuadPoints__obj,cx),HX_("cx",b5,56,00,00)},
	{::hx::fsFloat,(int)offsetof(QuadPoints__obj,cy),HX_("cy",b6,56,00,00)},
	{::hx::fsFloat,(int)offsetof(QuadPoints__obj,dx),HX_("dx",94,57,00,00)},
	{::hx::fsFloat,(int)offsetof(QuadPoints__obj,dy),HX_("dy",95,57,00,00)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *QuadPoints__obj_sStaticStorageInfo = 0;
#endif

static ::String QuadPoints__obj_sMemberFields[] = {
	HX_("ax",f7,54,00,00),
	HX_("ay",f8,54,00,00),
	HX_("bx",d6,55,00,00),
	HX_("by",d7,55,00,00),
	HX_("cx",b5,56,00,00),
	HX_("cy",b6,56,00,00),
	HX_("dx",94,57,00,00),
	HX_("dy",95,57,00,00),
	::String(null()) };

::hx::Class QuadPoints__obj::__mClass;

void QuadPoints__obj::__register()
{
	QuadPoints__obj _hx_dummy;
	QuadPoints__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo.QuadPoints_",21,7b,1c,9a);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(QuadPoints__obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< QuadPoints__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = QuadPoints__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = QuadPoints__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo