// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Sys
#include <Sys.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_5f4023a447b497a7_56_args,"Sys","args",0xeaeddc7e,"Sys.args","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/_std/Sys.hx",56,0xd4e9e07c)
HX_LOCAL_STACK_FRAME(_hx_pos_5f4023a447b497a7_59_getEnv,"Sys","getEnv",0xd9e05658,"Sys.getEnv","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/_std/Sys.hx",59,0xd4e9e07c)
HX_LOCAL_STACK_FRAME(_hx_pos_5f4023a447b497a7_83_setCwd,"Sys","setCwd",0xa6272e0f,"Sys.setCwd","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/_std/Sys.hx",83,0xd4e9e07c)
HX_LOCAL_STACK_FRAME(_hx_pos_5f4023a447b497a7_87_systemName,"Sys","systemName",0xbea5b6bb,"Sys.systemName","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/_std/Sys.hx",87,0xd4e9e07c)
HX_LOCAL_STACK_FRAME(_hx_pos_5f4023a447b497a7_113_time,"Sys","time",0xf7761b2e,"Sys.time","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/_std/Sys.hx",113,0xd4e9e07c)
HX_LOCAL_STACK_FRAME(_hx_pos_5f4023a447b497a7_121_executablePath,"Sys","executablePath",0xfc9406f0,"Sys.executablePath","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/_std/Sys.hx",121,0xd4e9e07c)
HX_LOCAL_STACK_FRAME(_hx_pos_5f4023a447b497a7_125_programPath,"Sys","programPath",0x38d53548,"Sys.programPath","/home/nanjizalmac/haxe/versions/4.3.3/std/cpp/_std/Sys.hx",125,0xd4e9e07c)

void Sys_obj::__construct() { }

Dynamic Sys_obj::__CreateEmpty() { return new Sys_obj; }

void *Sys_obj::_hx_vtable = 0;

Dynamic Sys_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Sys_obj > _hx_result = new Sys_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Sys_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x7ee3a981;
}

::Array< ::String > Sys_obj::args(){
            	HX_STACKFRAME(&_hx_pos_5f4023a447b497a7_56_args)
HXDLIN(  56)		return  ::__get_args();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Sys_obj,args,return )

::String Sys_obj::getEnv(::String s){
            	HX_STACKFRAME(&_hx_pos_5f4023a447b497a7_59_getEnv)
HXLINE(  60)		::String v = _hx_std_get_env(s);
HXLINE(  61)		if (::hx::IsNull( v )) {
HXLINE(  62)			return null();
            		}
HXLINE(  63)		return v;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sys_obj,getEnv,return )

void Sys_obj::setCwd(::String s){
            	HX_STACKFRAME(&_hx_pos_5f4023a447b497a7_83_setCwd)
HXDLIN(  83)		_hx_std_set_cwd(s);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sys_obj,setCwd,(void))

::String Sys_obj::systemName(){
            	HX_STACKFRAME(&_hx_pos_5f4023a447b497a7_87_systemName)
HXDLIN(  87)		return _hx_std_sys_string();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Sys_obj,systemName,return )

Float Sys_obj::time(){
            	HX_STACKFRAME(&_hx_pos_5f4023a447b497a7_113_time)
HXDLIN( 113)		return _hx_std_sys_time();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Sys_obj,time,return )

::String Sys_obj::executablePath(){
            	HX_STACKFRAME(&_hx_pos_5f4023a447b497a7_121_executablePath)
HXDLIN( 121)		return _hx_std_sys_exe_path();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Sys_obj,executablePath,return )

::String Sys_obj::programPath(){
            	HX_STACKFRAME(&_hx_pos_5f4023a447b497a7_125_programPath)
HXDLIN( 125)		return _hx_std_sys_exe_path();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Sys_obj,programPath,return )


Sys_obj::Sys_obj()
{
}

bool Sys_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"args") ) { outValue = args_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"time") ) { outValue = time_dyn(); return true; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"getEnv") ) { outValue = getEnv_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"setCwd") ) { outValue = setCwd_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"systemName") ) { outValue = systemName_dyn(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"programPath") ) { outValue = programPath_dyn(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"executablePath") ) { outValue = executablePath_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *Sys_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *Sys_obj_sStaticStorageInfo = 0;
#endif

::hx::Class Sys_obj::__mClass;

static ::String Sys_obj_sStaticFields[] = {
	HX_("args",5d,8d,74,40),
	HX_("getEnv",f7,3c,1c,a3),
	HX_("setCwd",ae,14,63,6f),
	HX_("systemName",da,d8,82,f7),
	HX_("time",0d,cc,fc,4c),
	HX_("executablePath",8f,24,16,e1),
	HX_("programPath",49,ee,75,c1),
	::String(null())
};

void Sys_obj::__register()
{
	Sys_obj _hx_dummy;
	Sys_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("Sys",ed,64,3f,00);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Sys_obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(Sys_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< Sys_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Sys_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Sys_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}
