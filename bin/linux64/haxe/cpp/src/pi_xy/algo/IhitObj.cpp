// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_pi_xy_ImageStruct
#include <pi_xy/ImageStruct.h>
#endif
#ifndef INCLUDED_pi_xy_algo_IhitObj
#include <pi_xy/algo/IhitObj.h>
#endif

namespace pi_xy{
namespace algo{


static ::String IhitObj_obj_sMemberFields[] = {
	HX_("hit",53,46,4f,00),
	HX_("undoImage",97,06,98,ec),
	HX_("undoX",b4,99,e3,a6),
	HX_("undoY",b5,99,e3,a6),
	::String(null()) };

::hx::Class IhitObj_obj::__mClass;

void IhitObj_obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo.IhitObj",d9,1e,d8,a4);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(IhitObj_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TIsInterface< (int)0x6d20d5d3 >;
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo