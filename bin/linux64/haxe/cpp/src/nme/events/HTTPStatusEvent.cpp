// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_nme_events_Event
#include <nme/events/Event.h>
#endif
#ifndef INCLUDED_nme_events_HTTPStatusEvent
#include <nme/events/HTTPStatusEvent.h>
#endif
#ifndef INCLUDED_nme_net_URLRequestHeader
#include <nme/net/URLRequestHeader.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_5976f22a824e8df2_15_new,"nme.events.HTTPStatusEvent","new",0x5c22dc25,"nme.events.HTTPStatusEvent.new","nme/events/HTTPStatusEvent.hx",15,0xd994290b)
HX_LOCAL_STACK_FRAME(_hx_pos_5976f22a824e8df2_24_clone,"nme.events.HTTPStatusEvent","clone",0x7ee05a62,"nme.events.HTTPStatusEvent.clone","nme/events/HTTPStatusEvent.hx",24,0xd994290b)
HX_LOCAL_STACK_FRAME(_hx_pos_5976f22a824e8df2_29_toString,"nme.events.HTTPStatusEvent","toString",0x5f85fac7,"nme.events.HTTPStatusEvent.toString","nme/events/HTTPStatusEvent.hx",29,0xd994290b)
HX_LOCAL_STACK_FRAME(_hx_pos_5976f22a824e8df2_9_boot,"nme.events.HTTPStatusEvent","boot",0x3a76c4cd,"nme.events.HTTPStatusEvent.boot","nme/events/HTTPStatusEvent.hx",9,0xd994290b)
namespace nme{
namespace events{

void HTTPStatusEvent_obj::__construct(::String inType,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::hx::Null< int >  __o_status){
            		bool bubbles = __o_bubbles.Default(false);
            		bool cancelable = __o_cancelable.Default(false);
            		int status = __o_status.Default(0);
            	HX_STACKFRAME(&_hx_pos_5976f22a824e8df2_15_new)
HXLINE(  16)		super::__construct(inType,bubbles,cancelable);
HXLINE(  18)		this->status = status;
HXLINE(  19)		this->responseHeaders = ::Array_obj< ::Dynamic>::__new(0);
            	}

Dynamic HTTPStatusEvent_obj::__CreateEmpty() { return new HTTPStatusEvent_obj; }

void *HTTPStatusEvent_obj::_hx_vtable = 0;

Dynamic HTTPStatusEvent_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< HTTPStatusEvent_obj > _hx_result = new HTTPStatusEvent_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool HTTPStatusEvent_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x0454c10d) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x0454c10d;
	} else {
		return inClassId==(int)0x113d0d1f;
	}
}

 ::nme::events::Event HTTPStatusEvent_obj::clone(){
            	HX_GC_STACKFRAME(&_hx_pos_5976f22a824e8df2_24_clone)
HXDLIN(  24)		::String _hx_tmp = this->get_type();
HXDLIN(  24)		bool _hx_tmp1 = this->get_bubbles();
HXDLIN(  24)		bool _hx_tmp2 = this->get_cancelable();
HXDLIN(  24)		return  ::nme::events::HTTPStatusEvent_obj::__alloc( HX_CTX ,_hx_tmp,_hx_tmp1,_hx_tmp2,this->status);
            	}


::String HTTPStatusEvent_obj::toString(){
            	HX_STACKFRAME(&_hx_pos_5976f22a824e8df2_29_toString)
HXDLIN(  29)		::String _hx_tmp = ((HX_("[HTTPStatusEvent type=",c8,a0,6f,f4) + this->get_type()) + HX_(" bubbles=",16,5f,ba,28));
HXDLIN(  29)		::String _hx_tmp1 = ((_hx_tmp + ::Std_obj::string(this->get_bubbles())) + HX_(" cancelable=",89,25,e0,5d));
HXDLIN(  29)		::String _hx_tmp2 = ((_hx_tmp1 + ::Std_obj::string(this->get_cancelable())) + HX_(" status=",ab,a8,bc,5c));
HXDLIN(  29)		return ((_hx_tmp2 + this->status) + HX_("]",5d,00,00,00));
            	}


::String HTTPStatusEvent_obj::HTTP_STATUS;


::hx::ObjectPtr< HTTPStatusEvent_obj > HTTPStatusEvent_obj::__new(::String inType,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::hx::Null< int >  __o_status) {
	::hx::ObjectPtr< HTTPStatusEvent_obj > __this = new HTTPStatusEvent_obj();
	__this->__construct(inType,__o_bubbles,__o_cancelable,__o_status);
	return __this;
}

::hx::ObjectPtr< HTTPStatusEvent_obj > HTTPStatusEvent_obj::__alloc(::hx::Ctx *_hx_ctx,::String inType,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::hx::Null< int >  __o_status) {
	HTTPStatusEvent_obj *__this = (HTTPStatusEvent_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(HTTPStatusEvent_obj), true, "nme.events.HTTPStatusEvent"));
	*(void **)__this = HTTPStatusEvent_obj::_hx_vtable;
	__this->__construct(inType,__o_bubbles,__o_cancelable,__o_status);
	return __this;
}

HTTPStatusEvent_obj::HTTPStatusEvent_obj()
{
}

void HTTPStatusEvent_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(HTTPStatusEvent);
	HX_MARK_MEMBER_NAME(status,"status");
	HX_MARK_MEMBER_NAME(responseHeaders,"responseHeaders");
	 ::nme::events::Event_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void HTTPStatusEvent_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(status,"status");
	HX_VISIT_MEMBER_NAME(responseHeaders,"responseHeaders");
	 ::nme::events::Event_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val HTTPStatusEvent_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return ::hx::Val( clone_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"status") ) { return ::hx::Val( status ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"toString") ) { return ::hx::Val( toString_dyn() ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"responseHeaders") ) { return ::hx::Val( responseHeaders ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val HTTPStatusEvent_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"status") ) { status=inValue.Cast< int >(); return inValue; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"responseHeaders") ) { responseHeaders=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void HTTPStatusEvent_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("status",32,e7,fb,05));
	outFields->push(HX_("responseHeaders",c5,0d,ca,43));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo HTTPStatusEvent_obj_sMemberStorageInfo[] = {
	{::hx::fsInt,(int)offsetof(HTTPStatusEvent_obj,status),HX_("status",32,e7,fb,05)},
	{::hx::fsObject /* ::Array< ::Dynamic> */ ,(int)offsetof(HTTPStatusEvent_obj,responseHeaders),HX_("responseHeaders",c5,0d,ca,43)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo HTTPStatusEvent_obj_sStaticStorageInfo[] = {
	{::hx::fsString,(void *) &HTTPStatusEvent_obj::HTTP_STATUS,HX_("HTTP_STATUS",49,42,ed,94)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static ::String HTTPStatusEvent_obj_sMemberFields[] = {
	HX_("status",32,e7,fb,05),
	HX_("responseHeaders",c5,0d,ca,43),
	HX_("clone",5d,13,63,48),
	HX_("toString",ac,d0,6e,38),
	::String(null()) };

static void HTTPStatusEvent_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(HTTPStatusEvent_obj::HTTP_STATUS,"HTTP_STATUS");
};

#ifdef HXCPP_VISIT_ALLOCS
static void HTTPStatusEvent_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(HTTPStatusEvent_obj::HTTP_STATUS,"HTTP_STATUS");
};

#endif

::hx::Class HTTPStatusEvent_obj::__mClass;

static ::String HTTPStatusEvent_obj_sStaticFields[] = {
	HX_("HTTP_STATUS",49,42,ed,94),
	::String(null())
};

void HTTPStatusEvent_obj::__register()
{
	HTTPStatusEvent_obj _hx_dummy;
	HTTPStatusEvent_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.events.HTTPStatusEvent",b3,e5,d6,46);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = HTTPStatusEvent_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(HTTPStatusEvent_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(HTTPStatusEvent_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< HTTPStatusEvent_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = HTTPStatusEvent_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = HTTPStatusEvent_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = HTTPStatusEvent_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void HTTPStatusEvent_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_5976f22a824e8df2_9_boot)
HXDLIN(   9)		HTTP_STATUS = HX_("httpStatus",da,4c,74,0a);
            	}
}

} // end namespace nme
} // end namespace events