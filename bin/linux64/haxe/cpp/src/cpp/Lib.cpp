// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_cpp_Lib
#include <cpp/Lib.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_7f672defa7c750cf_38_load,"cpp.Lib","load",0xd2b2dcba,"cpp.Lib.load","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/Lib.hx",38,0x92fb9479)
HX_LOCAL_STACK_FRAME(_hx_pos_7f672defa7c750cf_143_println,"cpp.Lib","println",0xca016ddb,"cpp.Lib.println","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/Lib.hx",143,0x92fb9479)
namespace cpp{

void Lib_obj::__construct() { }

Dynamic Lib_obj::__CreateEmpty() { return new Lib_obj; }

void *Lib_obj::_hx_vtable = 0;

Dynamic Lib_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Lib_obj > _hx_result = new Lib_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Lib_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x561f6486;
}

 ::Dynamic Lib_obj::load(::String lib,::String prim,int nargs){
            	HX_STACKFRAME(&_hx_pos_7f672defa7c750cf_38_load)
HXDLIN(  38)		return  ::__loadprim(lib,prim,nargs);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Lib_obj,load,return )

void Lib_obj::println( ::Dynamic v){
            	HX_STACKFRAME(&_hx_pos_7f672defa7c750cf_143_println)
HXDLIN( 143)		 ::__hxcpp_println(v);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Lib_obj,println,(void))


Lib_obj::Lib_obj()
{
}

bool Lib_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"load") ) { outValue = load_dyn(); return true; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"println") ) { outValue = println_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *Lib_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *Lib_obj_sStaticStorageInfo = 0;
#endif

::hx::Class Lib_obj::__mClass;

static ::String Lib_obj_sStaticFields[] = {
	HX_("load",26,9a,b7,47),
	HX_("println",ef,db,33,84),
	::String(null())
};

void Lib_obj::__register()
{
	Lib_obj _hx_dummy;
	Lib_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("cpp.Lib",5a,26,48,78);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Lib_obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(Lib_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< Lib_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Lib_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Lib_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace cpp
