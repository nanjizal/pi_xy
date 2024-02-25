// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_140af2720004096a
#define INCLUDED_140af2720004096a
#include "nme/Event.h"
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_nme_display_DisplayObject
#include <nme/display/DisplayObject.h>
#endif
#ifndef INCLUDED_nme_display_IBitmapDrawable
#include <nme/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_nme_display_InteractiveObject
#include <nme/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_nme_events_DropEvent
#include <nme/events/DropEvent.h>
#endif
#ifndef INCLUDED_nme_events_Event
#include <nme/events/Event.h>
#endif
#ifndef INCLUDED_nme_events_EventDispatcher
#include <nme/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_nme_events_IEventDispatcher
#include <nme/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_nme_events_MouseEvent
#include <nme/events/MouseEvent.h>
#endif
#ifndef INCLUDED_nme_geom_Point
#include <nme/geom/Point.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_d679dee965f38f96_9_new,"nme.events.DropEvent","new",0x358d25d0,"nme.events.DropEvent.new","nme/events/DropEvent.hx",9,0x2bcfa5c0)
HX_LOCAL_STACK_FRAME(_hx_pos_d679dee965f38f96_33_clone,"nme.events.DropEvent","clone",0x3eb0a4cd,"nme.events.DropEvent.clone","nme/events/DropEvent.hx",33,0x2bcfa5c0)
HX_LOCAL_STACK_FRAME(_hx_pos_d679dee965f38f96_41_toString,"nme.events.DropEvent","toString",0x9239c53c,"nme.events.DropEvent.toString","nme/events/DropEvent.hx",41,0x2bcfa5c0)
HX_LOCAL_STACK_FRAME(_hx_pos_d679dee965f38f96_17_nmeCreate,"nme.events.DropEvent","nmeCreate",0x4e9c7452,"nme.events.DropEvent.nmeCreate","nme/events/DropEvent.hx",17,0x2bcfa5c0)
HX_LOCAL_STACK_FRAME(_hx_pos_d679dee965f38f96_11_boot,"nme.events.DropEvent","boot",0x9e0cf0c2,"nme.events.DropEvent.boot","nme/events/DropEvent.hx",11,0x2bcfa5c0)
namespace nme{
namespace events{

void DropEvent_obj::__construct(::String type, ::Dynamic bubbles, ::Dynamic cancelable, ::Dynamic localX, ::Dynamic localY, ::nme::display::InteractiveObject relatedObject, ::Dynamic ctrlKey, ::Dynamic altKey, ::Dynamic shiftKey, ::Dynamic buttonDown, ::Dynamic delta, ::Dynamic commandKey, ::Dynamic clickCount){
            	HX_STACKFRAME(&_hx_pos_d679dee965f38f96_9_new)
HXDLIN(   9)		super::__construct(type,bubbles,cancelable,localX,localY,relatedObject,ctrlKey,altKey,shiftKey,buttonDown,delta,commandKey,clickCount);
            	}

Dynamic DropEvent_obj::__CreateEmpty() { return new DropEvent_obj; }

void *DropEvent_obj::_hx_vtable = 0;

Dynamic DropEvent_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< DropEvent_obj > _hx_result = new DropEvent_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5],inArgs[6],inArgs[7],inArgs[8],inArgs[9],inArgs[10],inArgs[11],inArgs[12]);
	return _hx_result;
}

bool DropEvent_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x113d0d1f) {
		if (inClassId<=(int)0x04c82490) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x04c82490;
		} else {
			return inClassId==(int)0x113d0d1f;
		}
	} else {
		return inClassId==(int)0x6f29948c;
	}
}

 ::nme::events::Event DropEvent_obj::clone(){
            	HX_GC_STACKFRAME(&_hx_pos_d679dee965f38f96_33_clone)
HXLINE(  34)		::String e = this->get_type();
HXDLIN(  34)		bool e1 = this->get_bubbles();
HXDLIN(  34)		bool e2 = this->get_cancelable();
HXDLIN(  34)		 ::nme::events::DropEvent e3 =  ::nme::events::DropEvent_obj::__alloc( HX_CTX ,e,e1,e2,this->localX,this->localY,this->relatedObject,this->ctrlKey,this->altKey,this->shiftKey,this->buttonDown,this->delta,this->commandKey,this->clickCount);
HXLINE(  35)		e3->items = this->items;
HXLINE(  36)		return e3;
            	}


::String DropEvent_obj::toString(){
            	HX_STACKFRAME(&_hx_pos_d679dee965f38f96_41_toString)
HXDLIN(  41)		::String _hx_tmp = ((HX_("DropEvent(",7d,cc,8a,cc) + this->get_type()) + HX_(":",3a,00,00,00));
HXDLIN(  41)		return ((_hx_tmp + ::Std_obj::string(this->items)) + HX_(")",29,00,00,00));
            	}


::String DropEvent_obj::DROP_FILES;

 ::nme::events::DropEvent DropEvent_obj::nmeCreate(::String inType,::cpp::Pointer<  nme::Event > inEvent, ::nme::geom::Point inLocal, ::nme::display::InteractiveObject inTarget,::Array< ::String > inItems){
            	HX_GC_STACKFRAME(&_hx_pos_d679dee965f38f96_17_nmeCreate)
HXLINE(  18)		int flags = inEvent->get_ref().flags;
HXLINE(  19)		 ::nme::events::DropEvent evt =  ::nme::events::DropEvent_obj::__alloc( HX_CTX ,inType,true,true,inLocal->x,inLocal->y,null(),((flags & ::nme::events::MouseEvent_obj::efCtrlDown) != 0),((flags & ::nme::events::MouseEvent_obj::efAltDown) != 0),((flags & ::nme::events::MouseEvent_obj::efShiftDown) != 0),((flags & ::nme::events::MouseEvent_obj::efLeftDown) != 0),0,null(),0);
HXLINE(  24)		evt->stageX = ( (Float)(inEvent->get_ref().x) );
HXLINE(  25)		evt->stageY = ( (Float)(inEvent->get_ref().y) );
HXLINE(  26)		evt->set_target(inTarget);
HXLINE(  27)		evt->items = inItems;
HXLINE(  29)		return evt;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC5(DropEvent_obj,nmeCreate,return )


::hx::ObjectPtr< DropEvent_obj > DropEvent_obj::__new(::String type, ::Dynamic bubbles, ::Dynamic cancelable, ::Dynamic localX, ::Dynamic localY, ::nme::display::InteractiveObject relatedObject, ::Dynamic ctrlKey, ::Dynamic altKey, ::Dynamic shiftKey, ::Dynamic buttonDown, ::Dynamic delta, ::Dynamic commandKey, ::Dynamic clickCount) {
	::hx::ObjectPtr< DropEvent_obj > __this = new DropEvent_obj();
	__this->__construct(type,bubbles,cancelable,localX,localY,relatedObject,ctrlKey,altKey,shiftKey,buttonDown,delta,commandKey,clickCount);
	return __this;
}

::hx::ObjectPtr< DropEvent_obj > DropEvent_obj::__alloc(::hx::Ctx *_hx_ctx,::String type, ::Dynamic bubbles, ::Dynamic cancelable, ::Dynamic localX, ::Dynamic localY, ::nme::display::InteractiveObject relatedObject, ::Dynamic ctrlKey, ::Dynamic altKey, ::Dynamic shiftKey, ::Dynamic buttonDown, ::Dynamic delta, ::Dynamic commandKey, ::Dynamic clickCount) {
	DropEvent_obj *__this = (DropEvent_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(DropEvent_obj), true, "nme.events.DropEvent"));
	*(void **)__this = DropEvent_obj::_hx_vtable;
	__this->__construct(type,bubbles,cancelable,localX,localY,relatedObject,ctrlKey,altKey,shiftKey,buttonDown,delta,commandKey,clickCount);
	return __this;
}

DropEvent_obj::DropEvent_obj()
{
}

void DropEvent_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(DropEvent);
	HX_MARK_MEMBER_NAME(items,"items");
	 ::nme::events::MouseEvent_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void DropEvent_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(items,"items");
	 ::nme::events::MouseEvent_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val DropEvent_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"items") ) { return ::hx::Val( items ); }
		if (HX_FIELD_EQ(inName,"clone") ) { return ::hx::Val( clone_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"toString") ) { return ::hx::Val( toString_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool DropEvent_obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"nmeCreate") ) { outValue = nmeCreate_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"DROP_FILES") ) { outValue = ( DROP_FILES ); return true; }
	}
	return false;
}

::hx::Val DropEvent_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"items") ) { items=inValue.Cast< ::Array< ::String > >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool DropEvent_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 10:
		if (HX_FIELD_EQ(inName,"DROP_FILES") ) { DROP_FILES=ioValue.Cast< ::String >(); return true; }
	}
	return false;
}

void DropEvent_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("items",00,ac,0c,c2));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo DropEvent_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /* ::Array< ::String > */ ,(int)offsetof(DropEvent_obj,items),HX_("items",00,ac,0c,c2)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo DropEvent_obj_sStaticStorageInfo[] = {
	{::hx::fsString,(void *) &DropEvent_obj::DROP_FILES,HX_("DROP_FILES",07,2b,d0,c4)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static ::String DropEvent_obj_sMemberFields[] = {
	HX_("items",00,ac,0c,c2),
	HX_("clone",5d,13,63,48),
	HX_("toString",ac,d0,6e,38),
	::String(null()) };

static void DropEvent_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(DropEvent_obj::DROP_FILES,"DROP_FILES");
};

#ifdef HXCPP_VISIT_ALLOCS
static void DropEvent_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(DropEvent_obj::DROP_FILES,"DROP_FILES");
};

#endif

::hx::Class DropEvent_obj::__mClass;

static ::String DropEvent_obj_sStaticFields[] = {
	HX_("DROP_FILES",07,2b,d0,c4),
	HX_("nmeCreate",e2,6a,d1,16),
	::String(null())
};

void DropEvent_obj::__register()
{
	DropEvent_obj _hx_dummy;
	DropEvent_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.events.DropEvent",de,3d,7a,8d);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &DropEvent_obj::__GetStatic;
	__mClass->mSetStaticField = &DropEvent_obj::__SetStatic;
	__mClass->mMarkFunc = DropEvent_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(DropEvent_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(DropEvent_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< DropEvent_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = DropEvent_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = DropEvent_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = DropEvent_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void DropEvent_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_d679dee965f38f96_11_boot)
HXDLIN(  11)		DROP_FILES = HX_("dropFiles",c8,0b,51,42);
            	}
}

} // end namespace nme
} // end namespace events
