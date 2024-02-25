// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_nme_Memory
#include <nme/Memory.h>
#endif
#ifndef INCLUDED_nme_utils_ByteArray
#include <nme/utils/ByteArray.h>
#endif
#ifndef INCLUDED_nme_utils_IDataInput
#include <nme/utils/IDataInput.h>
#endif
#ifndef INCLUDED_nme_utils_IDataOutput
#include <nme/utils/IDataOutput.h>
#endif
#ifndef INCLUDED_nme_utils_IMemoryRange
#include <nme/utils/IMemoryRange.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_29_select,"nme.Memory","select",0xdc818981,"nme.Memory.select","nme/Memory.hx",29,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_210_getByte,"nme.Memory","getByte",0xa5f81499,"nme.Memory.getByte","nme/Memory.hx",210,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_216_getDouble,"nme.Memory","getDouble",0x2ef566e2,"nme.Memory.getDouble","nme/Memory.hx",216,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_222_getFloat,"nme.Memory","getFloat",0xd818aeeb,"nme.Memory.getFloat","nme/Memory.hx",222,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_228_getI32,"nme.Memory","getI32",0x156d80d7,"nme.Memory.getI32","nme/Memory.hx",228,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_234_getUI16,"nme.Memory","getUI16",0xb2627baa,"nme.Memory.getUI16","nme/Memory.hx",234,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_240_setByte,"nme.Memory","setByte",0x98f9a5a5,"nme.Memory.setByte","nme/Memory.hx",240,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_246_setDouble,"nme.Memory","setDouble",0x124652ee,"nme.Memory.setDouble","nme/Memory.hx",246,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_252_setFloat,"nme.Memory","setFloat",0x8676085f,"nme.Memory.setFloat","nme/Memory.hx",252,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_258_setI16,"nme.Memory","setI16",0xe1b5d391,"nme.Memory.setI16","nme/Memory.hx",258,0x2a345af4)
HX_LOCAL_STACK_FRAME(_hx_pos_3749bcce291dee4a_264_setI32,"nme.Memory","setI32",0xe1b5d54b,"nme.Memory.setI32","nme/Memory.hx",264,0x2a345af4)
namespace nme{

void Memory_obj::__construct() { }

Dynamic Memory_obj::__CreateEmpty() { return new Memory_obj; }

void *Memory_obj::_hx_vtable = 0;

Dynamic Memory_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Memory_obj > _hx_result = new Memory_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Memory_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x00a6a9f3;
}

 ::nme::utils::ByteArray Memory_obj::gcRef;

int Memory_obj::len;

void Memory_obj::select( ::nme::utils::ByteArray inBytes){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_29_select)
HXLINE(  38)		::nme::Memory_obj::gcRef = inBytes;
HXLINE(  39)		if (::hx::IsNull( inBytes )) {
HXLINE(  40)			 ::__hxcpp_memory_clear();
            		}
            		else {
HXLINE(  42)			 ::__hxcpp_memory_select(inBytes->b);
            		}
HXLINE(  46)		if (::hx::IsNull( inBytes )) {
HXLINE(  47)			::nme::Memory_obj::len = 0;
            		}
            		else {
HXLINE(  49)			::nme::Memory_obj::len = inBytes->length;
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Memory_obj,select,(void))

int Memory_obj::getByte(int addr){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_210_getByte)
HXDLIN( 210)		return  ::__hxcpp_memory_get_byte(addr);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Memory_obj,getByte,return )

Float Memory_obj::getDouble(int addr){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_216_getDouble)
HXDLIN( 216)		return  ::__hxcpp_memory_get_double(addr);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Memory_obj,getDouble,return )

Float Memory_obj::getFloat(int addr){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_222_getFloat)
HXDLIN( 222)		return  ::__hxcpp_memory_get_float(addr);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Memory_obj,getFloat,return )

int Memory_obj::getI32(int addr){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_228_getI32)
HXDLIN( 228)		return  ::__hxcpp_memory_get_i32(addr);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Memory_obj,getI32,return )

int Memory_obj::getUI16(int addr){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_234_getUI16)
HXDLIN( 234)		return  ::__hxcpp_memory_get_ui16(addr);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Memory_obj,getUI16,return )

void Memory_obj::setByte(int addr,int v){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_240_setByte)
HXDLIN( 240)		 ::__hxcpp_memory_set_byte(addr,v);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Memory_obj,setByte,(void))

void Memory_obj::setDouble(int addr,Float v){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_246_setDouble)
HXDLIN( 246)		 ::__hxcpp_memory_set_double(addr,v);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Memory_obj,setDouble,(void))

void Memory_obj::setFloat(int addr,Float v){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_252_setFloat)
HXDLIN( 252)		 ::__hxcpp_memory_set_float(addr,v);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Memory_obj,setFloat,(void))

void Memory_obj::setI16(int addr,int v){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_258_setI16)
HXDLIN( 258)		 ::__hxcpp_memory_set_i16(addr,v);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Memory_obj,setI16,(void))

void Memory_obj::setI32(int addr,int v){
            	HX_STACKFRAME(&_hx_pos_3749bcce291dee4a_264_setI32)
HXDLIN( 264)		 ::__hxcpp_memory_set_i32(addr,v);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Memory_obj,setI32,(void))


Memory_obj::Memory_obj()
{
}

bool Memory_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"len") ) { outValue = ( len ); return true; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"gcRef") ) { outValue = ( gcRef ); return true; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"select") ) { outValue = select_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"getI32") ) { outValue = getI32_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"setI16") ) { outValue = setI16_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"setI32") ) { outValue = setI32_dyn(); return true; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"getByte") ) { outValue = getByte_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"getUI16") ) { outValue = getUI16_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"setByte") ) { outValue = setByte_dyn(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"getFloat") ) { outValue = getFloat_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"setFloat") ) { outValue = setFloat_dyn(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"getDouble") ) { outValue = getDouble_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"setDouble") ) { outValue = setDouble_dyn(); return true; }
	}
	return false;
}

bool Memory_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"len") ) { len=ioValue.Cast< int >(); return true; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"gcRef") ) { gcRef=ioValue.Cast<  ::nme::utils::ByteArray >(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *Memory_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo Memory_obj_sStaticStorageInfo[] = {
	{::hx::fsObject /*  ::nme::utils::ByteArray */ ,(void *) &Memory_obj::gcRef,HX_("gcRef",97,70,f4,8f)},
	{::hx::fsInt,(void *) &Memory_obj::len,HX_("len",d5,4b,52,00)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static void Memory_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Memory_obj::gcRef,"gcRef");
	HX_MARK_MEMBER_NAME(Memory_obj::len,"len");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Memory_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Memory_obj::gcRef,"gcRef");
	HX_VISIT_MEMBER_NAME(Memory_obj::len,"len");
};

#endif

::hx::Class Memory_obj::__mClass;

static ::String Memory_obj_sStaticFields[] = {
	HX_("gcRef",97,70,f4,8f),
	HX_("len",d5,4b,52,00),
	HX_("select",fc,1a,33,6a),
	HX_("getByte",be,ce,a5,13),
	HX_("getDouble",47,b4,21,af),
	HX_("getFloat",26,d5,6d,62),
	HX_("getI32",52,12,1f,a3),
	HX_("getUI16",cf,35,10,20),
	HX_("setByte",ca,5f,a7,06),
	HX_("setDouble",53,a0,72,92),
	HX_("setFloat",9a,2e,cb,10),
	HX_("setI16",0c,65,67,6f),
	HX_("setI32",c6,66,67,6f),
	::String(null())
};

void Memory_obj::__register()
{
	Memory_obj _hx_dummy;
	Memory_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.Memory",49,d3,df,b3);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Memory_obj::__GetStatic;
	__mClass->mSetStaticField = &Memory_obj::__SetStatic;
	__mClass->mMarkFunc = Memory_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(Memory_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< Memory_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Memory_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Memory_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Memory_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme