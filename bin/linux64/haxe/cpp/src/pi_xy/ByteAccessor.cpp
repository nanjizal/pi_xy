// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_pi_xy_ByteAccessor
#include <pi_xy/ByteAccessor.h>
#endif

namespace pi_xy{


static ::String ByteAccessor_obj_sMemberFields[] = {
	HX_("data",2a,56,63,42),
	::String(null()) };

::hx::Class ByteAccessor_obj::__mClass;

void ByteAccessor_obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.ByteAccessor",16,d5,4a,ea);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(ByteAccessor_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TIsInterface< (int)0xe6cff6d6 >;
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy