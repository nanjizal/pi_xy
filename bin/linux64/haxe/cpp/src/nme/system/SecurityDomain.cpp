// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_system_SecurityDomain
#include <nme/system/SecurityDomain.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_602abfd3c109729a_10_new,"nme.system.SecurityDomain","new",0x496f9a2d,"nme.system.SecurityDomain.new","nme/system/SecurityDomain.hx",10,0x71d8b3c3)
HX_LOCAL_STACK_FRAME(_hx_pos_602abfd3c109729a_7_boot,"nme.system.SecurityDomain","boot",0xf0504dc5,"nme.system.SecurityDomain.boot","nme/system/SecurityDomain.hx",7,0x71d8b3c3)
namespace nme{
namespace _hx_system{

void SecurityDomain_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_602abfd3c109729a_10_new)
            	}

Dynamic SecurityDomain_obj::__CreateEmpty() { return new SecurityDomain_obj; }

void *SecurityDomain_obj::_hx_vtable = 0;

Dynamic SecurityDomain_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< SecurityDomain_obj > _hx_result = new SecurityDomain_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool SecurityDomain_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x32c18d39;
}

 ::nme::_hx_system::SecurityDomain SecurityDomain_obj::currentDomain;


SecurityDomain_obj::SecurityDomain_obj()
{
}

bool SecurityDomain_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 13:
		if (HX_FIELD_EQ(inName,"currentDomain") ) { outValue = ( currentDomain ); return true; }
	}
	return false;
}

bool SecurityDomain_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 13:
		if (HX_FIELD_EQ(inName,"currentDomain") ) { currentDomain=ioValue.Cast<  ::nme::_hx_system::SecurityDomain >(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *SecurityDomain_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo SecurityDomain_obj_sStaticStorageInfo[] = {
	{::hx::fsObject /*  ::nme::_hx_system::SecurityDomain */ ,(void *) &SecurityDomain_obj::currentDomain,HX_("currentDomain",5d,32,dd,10)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static void SecurityDomain_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(SecurityDomain_obj::currentDomain,"currentDomain");
};

#ifdef HXCPP_VISIT_ALLOCS
static void SecurityDomain_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(SecurityDomain_obj::currentDomain,"currentDomain");
};

#endif

::hx::Class SecurityDomain_obj::__mClass;

static ::String SecurityDomain_obj_sStaticFields[] = {
	HX_("currentDomain",5d,32,dd,10),
	::String(null())
};

void SecurityDomain_obj::__register()
{
	SecurityDomain_obj _hx_dummy;
	SecurityDomain_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.system.SecurityDomain",bb,ff,59,b0);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &SecurityDomain_obj::__GetStatic;
	__mClass->mSetStaticField = &SecurityDomain_obj::__SetStatic;
	__mClass->mMarkFunc = SecurityDomain_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(SecurityDomain_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< SecurityDomain_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = SecurityDomain_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = SecurityDomain_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = SecurityDomain_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void SecurityDomain_obj::__boot()
{
{
            	HX_GC_STACKFRAME(&_hx_pos_602abfd3c109729a_7_boot)
HXDLIN(   7)		currentDomain =  ::nme::_hx_system::SecurityDomain_obj::__alloc( HX_CTX );
            	}
}

} // end namespace nme
} // end namespace system