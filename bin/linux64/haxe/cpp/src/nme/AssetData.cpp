// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
#ifndef INCLUDED_nme_AssetData
#include <nme/AssetData.h>
#endif
#ifndef INCLUDED_nme_Assets
#include <nme/Assets.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_7774aa8710e17a2f_16_create,"nme.AssetData","create",0x8093a6f8,"nme.AssetData.create","nme/AssetData.hx",16,0x9cae6a8d)
namespace nme{

void AssetData_obj::__construct() { }

Dynamic AssetData_obj::__CreateEmpty() { return new AssetData_obj; }

void *AssetData_obj::_hx_vtable = 0;

Dynamic AssetData_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< AssetData_obj > _hx_result = new AssetData_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool AssetData_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x3800fe94;
}

void AssetData_obj::create(){
            	HX_STACKFRAME(&_hx_pos_7774aa8710e17a2f_16_create)
HXLINE(  17)		 ::haxe::ds::StringMap info = ::nme::Assets_obj::info;
HXLINE(  21)		::nme::Assets_obj::loadAssetList();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(AssetData_obj,create,(void))


AssetData_obj::AssetData_obj()
{
}

bool AssetData_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"create") ) { outValue = create_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *AssetData_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *AssetData_obj_sStaticStorageInfo = 0;
#endif

::hx::Class AssetData_obj::__mClass;

static ::String AssetData_obj_sStaticFields[] = {
	HX_("create",fc,66,0f,7c),
	::String(null())
};

void AssetData_obj::__register()
{
	AssetData_obj _hx_dummy;
	AssetData_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.AssetData",f2,f8,35,a5);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &AssetData_obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(AssetData_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< AssetData_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = AssetData_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = AssetData_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme