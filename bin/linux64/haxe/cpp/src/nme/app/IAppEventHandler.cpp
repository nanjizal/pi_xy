// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_140af2720004096a
#define INCLUDED_140af2720004096a
#include "nme/Event.h"
#endif
#ifndef INCLUDED_haxe_StackItem
#include <haxe/StackItem.h>
#endif
#ifndef INCLUDED_nme_app_IAppEventHandler
#include <nme/app/IAppEventHandler.h>
#endif

namespace nme{
namespace app{


static ::String IAppEventHandler_obj_sMemberFields[] = {
	HX_("onRender",d5,61,d6,e4),
	HX_("onText",6c,d5,83,ef),
	HX_("onKey",c0,1d,69,32),
	HX_("onMouse",86,b4,a2,a2),
	HX_("onTouch",20,b6,70,aa),
	HX_("onResize",73,50,28,e8),
	HX_("onDisplayObjectFocus",76,a6,fb,cc),
	HX_("onInputFocus",6d,c9,07,5b),
	HX_("onChange",ef,87,1f,97),
	HX_("onActive",45,38,f3,f5),
	HX_("onJoystick",fb,b4,a8,79),
	HX_("onSysMessage",39,be,dd,06),
	HX_("onAppLink",dc,5d,b2,10),
	HX_("onContextLost",94,ac,a5,87),
	HX_("onScroll",8c,ce,11,27),
	HX_("onDpiChanged",16,0d,c7,4e),
	HX_("onDrop",ee,40,fa,e4),
	HX_("onUnhandledException",4b,0a,ce,d2),
	HX_("onWindowClose",c9,ca,1f,9c),
	HX_("onWindowMoved",44,7f,22,60),
	HX_("onWindowLeave",08,e8,0f,c6),
	HX_("onWindowEnter",29,20,43,c4),
	::String(null()) };

::hx::Class IAppEventHandler_obj::__mClass;

void IAppEventHandler_obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.app.IAppEventHandler",5d,a3,c2,fb);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(IAppEventHandler_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TIsInterface< (int)0x00a6b123 >;
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace app