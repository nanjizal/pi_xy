// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_events_EventPhase
#include <nme/events/EventPhase.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_865fe954a2e48b49_7_boot,"nme.events.EventPhase","boot",0x999ca6b2,"nme.events.EventPhase.boot","nme/events/EventPhase.hx",7,0x05149770)
HX_LOCAL_STACK_FRAME(_hx_pos_865fe954a2e48b49_8_boot,"nme.events.EventPhase","boot",0x999ca6b2,"nme.events.EventPhase.boot","nme/events/EventPhase.hx",8,0x05149770)
HX_LOCAL_STACK_FRAME(_hx_pos_865fe954a2e48b49_9_boot,"nme.events.EventPhase","boot",0x999ca6b2,"nme.events.EventPhase.boot","nme/events/EventPhase.hx",9,0x05149770)
namespace nme{
namespace events{

void EventPhase_obj::__construct() { }

Dynamic EventPhase_obj::__CreateEmpty() { return new EventPhase_obj; }

void *EventPhase_obj::_hx_vtable = 0;

Dynamic EventPhase_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< EventPhase_obj > _hx_result = new EventPhase_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool EventPhase_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x3da2cf80;
}

int EventPhase_obj::CAPTURING_PHASE;

int EventPhase_obj::AT_TARGET;

int EventPhase_obj::BUBBLING_PHASE;


EventPhase_obj::EventPhase_obj()
{
}

bool EventPhase_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"AT_TARGET") ) { outValue = ( AT_TARGET ); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"BUBBLING_PHASE") ) { outValue = ( BUBBLING_PHASE ); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"CAPTURING_PHASE") ) { outValue = ( CAPTURING_PHASE ); return true; }
	}
	return false;
}

bool EventPhase_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"AT_TARGET") ) { AT_TARGET=ioValue.Cast< int >(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"BUBBLING_PHASE") ) { BUBBLING_PHASE=ioValue.Cast< int >(); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"CAPTURING_PHASE") ) { CAPTURING_PHASE=ioValue.Cast< int >(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *EventPhase_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo EventPhase_obj_sStaticStorageInfo[] = {
	{::hx::fsInt,(void *) &EventPhase_obj::CAPTURING_PHASE,HX_("CAPTURING_PHASE",bf,7a,f0,84)},
	{::hx::fsInt,(void *) &EventPhase_obj::AT_TARGET,HX_("AT_TARGET",5d,cc,bf,fb)},
	{::hx::fsInt,(void *) &EventPhase_obj::BUBBLING_PHASE,HX_("BUBBLING_PHASE",e5,f7,ce,f4)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static void EventPhase_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(EventPhase_obj::CAPTURING_PHASE,"CAPTURING_PHASE");
	HX_MARK_MEMBER_NAME(EventPhase_obj::AT_TARGET,"AT_TARGET");
	HX_MARK_MEMBER_NAME(EventPhase_obj::BUBBLING_PHASE,"BUBBLING_PHASE");
};

#ifdef HXCPP_VISIT_ALLOCS
static void EventPhase_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(EventPhase_obj::CAPTURING_PHASE,"CAPTURING_PHASE");
	HX_VISIT_MEMBER_NAME(EventPhase_obj::AT_TARGET,"AT_TARGET");
	HX_VISIT_MEMBER_NAME(EventPhase_obj::BUBBLING_PHASE,"BUBBLING_PHASE");
};

#endif

::hx::Class EventPhase_obj::__mClass;

static ::String EventPhase_obj_sStaticFields[] = {
	HX_("CAPTURING_PHASE",bf,7a,f0,84),
	HX_("AT_TARGET",5d,cc,bf,fb),
	HX_("BUBBLING_PHASE",e5,f7,ce,f4),
	::String(null())
};

void EventPhase_obj::__register()
{
	EventPhase_obj _hx_dummy;
	EventPhase_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.events.EventPhase",ee,4d,e6,a5);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &EventPhase_obj::__GetStatic;
	__mClass->mSetStaticField = &EventPhase_obj::__SetStatic;
	__mClass->mMarkFunc = EventPhase_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(EventPhase_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< EventPhase_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = EventPhase_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = EventPhase_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = EventPhase_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void EventPhase_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_865fe954a2e48b49_7_boot)
HXDLIN(   7)		CAPTURING_PHASE = 0;
            	}
{
            	HX_STACKFRAME(&_hx_pos_865fe954a2e48b49_8_boot)
HXDLIN(   8)		AT_TARGET = 1;
            	}
{
            	HX_STACKFRAME(&_hx_pos_865fe954a2e48b49_9_boot)
HXDLIN(   9)		BUBBLING_PHASE = 2;
            	}
}

} // end namespace nme
} // end namespace events