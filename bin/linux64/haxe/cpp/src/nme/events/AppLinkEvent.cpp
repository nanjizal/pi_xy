// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_nme_events_AppLinkEvent
#include <nme/events/AppLinkEvent.h>
#endif
#ifndef INCLUDED_nme_events_Event
#include <nme/events/Event.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_b6eed4607d4c950c_14_new,"nme.events.AppLinkEvent","new",0x38acb53e,"nme.events.AppLinkEvent.new","nme/events/AppLinkEvent.hx",14,0xd96f2dd2)
HX_LOCAL_STACK_FRAME(_hx_pos_b6eed4607d4c950c_18_clone,"nme.events.AppLinkEvent","clone",0xf4656bbb,"nme.events.AppLinkEvent.clone","nme/events/AppLinkEvent.hx",18,0xd96f2dd2)
HX_LOCAL_STACK_FRAME(_hx_pos_b6eed4607d4c950c_26_toString,"nme.events.AppLinkEvent","toString",0xe295870e,"nme.events.AppLinkEvent.toString","nme/events/AppLinkEvent.hx",26,0xd96f2dd2)
HX_LOCAL_STACK_FRAME(_hx_pos_b6eed4607d4c950c_8_boot,"nme.events.AppLinkEvent","boot",0x568ae194,"nme.events.AppLinkEvent.boot","nme/events/AppLinkEvent.hx",8,0xd96f2dd2)
namespace nme{
namespace events{

void AppLinkEvent_obj::__construct(::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable){
            		bool bubbles = __o_bubbles.Default(false);
            		bool cancelable = __o_cancelable.Default(false);
            	HX_STACKFRAME(&_hx_pos_b6eed4607d4c950c_14_new)
HXDLIN(  14)		super::__construct(type,bubbles,cancelable);
            	}

Dynamic AppLinkEvent_obj::__CreateEmpty() { return new AppLinkEvent_obj; }

void *AppLinkEvent_obj::_hx_vtable = 0;

Dynamic AppLinkEvent_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< AppLinkEvent_obj > _hx_result = new AppLinkEvent_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return _hx_result;
}

bool AppLinkEvent_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x113d0d1f) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x113d0d1f;
	} else {
		return inClassId==(int)0x2a69527a;
	}
}

 ::nme::events::Event AppLinkEvent_obj::clone(){
            	HX_GC_STACKFRAME(&_hx_pos_b6eed4607d4c950c_18_clone)
HXLINE(  19)		::String e = this->get_type();
HXDLIN(  19)		bool e1 = this->get_bubbles();
HXDLIN(  19)		 ::nme::events::AppLinkEvent e2 =  ::nme::events::AppLinkEvent_obj::__alloc( HX_CTX ,e,e1,this->get_cancelable());
HXLINE(  20)		e2->url = this->url;
HXLINE(  21)		return e2;
            	}


::String AppLinkEvent_obj::toString(){
            	HX_STACKFRAME(&_hx_pos_b6eed4607d4c950c_26_toString)
HXDLIN(  26)		::String _hx_tmp = ((HX_("[AppLinkEvent type=",7d,81,69,57) + this->get_type()) + HX_(" bubbles=",16,5f,ba,28));
HXDLIN(  26)		::String _hx_tmp1 = ((_hx_tmp + ::Std_obj::string(this->get_bubbles())) + HX_(" cancelable=",89,25,e0,5d));
HXDLIN(  26)		::String _hx_tmp2 = ((_hx_tmp1 + ::Std_obj::string(this->get_cancelable())) + HX_(" url=",0e,66,7f,ba));
HXDLIN(  26)		return ((_hx_tmp2 + this->url) + HX_("]",5d,00,00,00));
            	}


::String AppLinkEvent_obj::APP_LINK;


::hx::ObjectPtr< AppLinkEvent_obj > AppLinkEvent_obj::__new(::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable) {
	::hx::ObjectPtr< AppLinkEvent_obj > __this = new AppLinkEvent_obj();
	__this->__construct(type,__o_bubbles,__o_cancelable);
	return __this;
}

::hx::ObjectPtr< AppLinkEvent_obj > AppLinkEvent_obj::__alloc(::hx::Ctx *_hx_ctx,::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable) {
	AppLinkEvent_obj *__this = (AppLinkEvent_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(AppLinkEvent_obj), true, "nme.events.AppLinkEvent"));
	*(void **)__this = AppLinkEvent_obj::_hx_vtable;
	__this->__construct(type,__o_bubbles,__o_cancelable);
	return __this;
}

AppLinkEvent_obj::AppLinkEvent_obj()
{
}

void AppLinkEvent_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(AppLinkEvent);
	HX_MARK_MEMBER_NAME(url,"url");
	 ::nme::events::Event_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void AppLinkEvent_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(url,"url");
	 ::nme::events::Event_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val AppLinkEvent_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"url") ) { return ::hx::Val( url ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return ::hx::Val( clone_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"toString") ) { return ::hx::Val( toString_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool AppLinkEvent_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"APP_LINK") ) { outValue = ( APP_LINK ); return true; }
	}
	return false;
}

::hx::Val AppLinkEvent_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"url") ) { url=inValue.Cast< ::String >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool AppLinkEvent_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"APP_LINK") ) { APP_LINK=ioValue.Cast< ::String >(); return true; }
	}
	return false;
}

void AppLinkEvent_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("url",6f,2b,59,00));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo AppLinkEvent_obj_sMemberStorageInfo[] = {
	{::hx::fsString,(int)offsetof(AppLinkEvent_obj,url),HX_("url",6f,2b,59,00)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo AppLinkEvent_obj_sStaticStorageInfo[] = {
	{::hx::fsString,(void *) &AppLinkEvent_obj::APP_LINK,HX_("APP_LINK",b8,ef,95,66)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static ::String AppLinkEvent_obj_sMemberFields[] = {
	HX_("url",6f,2b,59,00),
	HX_("clone",5d,13,63,48),
	HX_("toString",ac,d0,6e,38),
	::String(null()) };

static void AppLinkEvent_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(AppLinkEvent_obj::APP_LINK,"APP_LINK");
};

#ifdef HXCPP_VISIT_ALLOCS
static void AppLinkEvent_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(AppLinkEvent_obj::APP_LINK,"APP_LINK");
};

#endif

::hx::Class AppLinkEvent_obj::__mClass;

static ::String AppLinkEvent_obj_sStaticFields[] = {
	HX_("APP_LINK",b8,ef,95,66),
	::String(null())
};

void AppLinkEvent_obj::__register()
{
	AppLinkEvent_obj _hx_dummy;
	AppLinkEvent_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.events.AppLinkEvent",4c,fe,a5,59);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &AppLinkEvent_obj::__GetStatic;
	__mClass->mSetStaticField = &AppLinkEvent_obj::__SetStatic;
	__mClass->mMarkFunc = AppLinkEvent_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(AppLinkEvent_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(AppLinkEvent_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< AppLinkEvent_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = AppLinkEvent_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = AppLinkEvent_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = AppLinkEvent_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void AppLinkEvent_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_b6eed4607d4c950c_8_boot)
HXDLIN(   8)		APP_LINK = HX_("appLink",3b,a5,07,39);
            	}
}

} // end namespace nme
} // end namespace events
