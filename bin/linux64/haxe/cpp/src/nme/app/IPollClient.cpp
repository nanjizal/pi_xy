// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_app_IPollClient
#include <nme/app/IPollClient.h>
#endif

namespace nme{
namespace app{


static ::String IPollClient_obj_sMemberFields[] = {
	HX_("onPoll",fe,86,e6,ec),
	HX_("getNextWake",6d,c5,b2,20),
	::String(null()) };

::hx::Class IPollClient_obj::__mClass;

void IPollClient_obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.app.IPollClient",1e,53,66,a1);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(IPollClient_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TIsInterface< (int)0x83491b18 >;
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace app
