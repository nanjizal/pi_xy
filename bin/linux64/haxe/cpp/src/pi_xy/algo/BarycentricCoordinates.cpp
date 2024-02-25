// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_pi_xy_algo_BarycentricCoordinates
#include <pi_xy/algo/BarycentricCoordinates.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_584126ffd6ff87dc_13_new,"pi_xy.algo.BarycentricCoordinates","new",0x59edf463,"pi_xy.algo.BarycentricCoordinates.new","pi_xy/algo/Barycentric.hx",13,0xa63b7d34)
namespace pi_xy{
namespace algo{

void BarycentricCoordinates_obj::__construct(Float ratioA,Float ratioB,Float ratioC){
            	HX_STACKFRAME(&_hx_pos_584126ffd6ff87dc_13_new)
HXLINE(  14)		this->ratioA = ratioA;
HXLINE(  15)		this->ratioB = ratioB;
HXLINE(  16)		this->ratioC = ratioC;
            	}

Dynamic BarycentricCoordinates_obj::__CreateEmpty() { return new BarycentricCoordinates_obj; }

void *BarycentricCoordinates_obj::_hx_vtable = 0;

Dynamic BarycentricCoordinates_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< BarycentricCoordinates_obj > _hx_result = new BarycentricCoordinates_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return _hx_result;
}

bool BarycentricCoordinates_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x34e6c8af;
}


BarycentricCoordinates_obj::BarycentricCoordinates_obj()
{
}

::hx::Val BarycentricCoordinates_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"ratioA") ) { return ::hx::Val( ratioA ); }
		if (HX_FIELD_EQ(inName,"ratioB") ) { return ::hx::Val( ratioB ); }
		if (HX_FIELD_EQ(inName,"ratioC") ) { return ::hx::Val( ratioC ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val BarycentricCoordinates_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"ratioA") ) { ratioA=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"ratioB") ) { ratioB=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"ratioC") ) { ratioC=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void BarycentricCoordinates_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("ratioA",d6,34,8a,bb));
	outFields->push(HX_("ratioB",d7,34,8a,bb));
	outFields->push(HX_("ratioC",d8,34,8a,bb));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo BarycentricCoordinates_obj_sMemberStorageInfo[] = {
	{::hx::fsFloat,(int)offsetof(BarycentricCoordinates_obj,ratioA),HX_("ratioA",d6,34,8a,bb)},
	{::hx::fsFloat,(int)offsetof(BarycentricCoordinates_obj,ratioB),HX_("ratioB",d7,34,8a,bb)},
	{::hx::fsFloat,(int)offsetof(BarycentricCoordinates_obj,ratioC),HX_("ratioC",d8,34,8a,bb)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *BarycentricCoordinates_obj_sStaticStorageInfo = 0;
#endif

static ::String BarycentricCoordinates_obj_sMemberFields[] = {
	HX_("ratioA",d6,34,8a,bb),
	HX_("ratioB",d7,34,8a,bb),
	HX_("ratioC",d8,34,8a,bb),
	::String(null()) };

::hx::Class BarycentricCoordinates_obj::__mClass;

void BarycentricCoordinates_obj::__register()
{
	BarycentricCoordinates_obj _hx_dummy;
	BarycentricCoordinates_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo.BarycentricCoordinates",f1,86,65,af);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(BarycentricCoordinates_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< BarycentricCoordinates_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = BarycentricCoordinates_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = BarycentricCoordinates_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo