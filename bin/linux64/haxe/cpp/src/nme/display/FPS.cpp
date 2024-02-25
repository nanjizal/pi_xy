// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_haxe_Timer
#include <haxe/Timer.h>
#endif
#ifndef INCLUDED_nme_display_DisplayObject
#include <nme/display/DisplayObject.h>
#endif
#ifndef INCLUDED_nme_display_FPS
#include <nme/display/FPS.h>
#endif
#ifndef INCLUDED_nme_display_IBitmapDrawable
#include <nme/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_nme_display_InteractiveObject
#include <nme/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_nme_events_EventDispatcher
#include <nme/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_nme_events_IEventDispatcher
#include <nme/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_nme_text_TextField
#include <nme/text/TextField.h>
#endif
#ifndef INCLUDED_nme_text_TextFieldAutoSize
#include <nme/text/TextFieldAutoSize.h>
#endif
#ifndef INCLUDED_nme_text_TextFormat
#include <nme/text/TextFormat.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_c1e5bff23284417b_19_new,"nme.display.FPS","new",0x133f81e7,"nme.display.FPS.new","nme/display/FPS.hx",19,0x271e8deb)
HX_LOCAL_STACK_FRAME(_hx_pos_c1e5bff23284417b_38_get_currentFPS,"nme.display.FPS","get_currentFPS",0x12d0b752,"nme.display.FPS.get_currentFPS","nme/display/FPS.hx",38,0x271e8deb)
HX_LOCAL_STACK_FRAME(_hx_pos_c1e5bff23284417b_47_onEnter,"nme.display.FPS","onEnter",0x12f48c80,"nme.display.FPS.onEnter","nme/display/FPS.hx",47,0x271e8deb)
namespace nme{
namespace display{

void FPS_obj::__construct(::hx::Null< Float >  __o_inX,::hx::Null< Float >  __o_inY,::hx::Null< int >  __o_inCol){
            		Float inX = __o_inX.Default(((Float)10.0));
            		Float inY = __o_inY.Default(((Float)10.0));
            		int inCol = __o_inCol.Default(0);
            	HX_GC_STACKFRAME(&_hx_pos_c1e5bff23284417b_19_new)
HXLINE(  20)		super::__construct();
HXLINE(  22)		this->set_x(inX);
HXLINE(  23)		this->set_y(inY);
HXLINE(  24)		this->set_selectable(false);
HXLINE(  26)		this->set_defaultTextFormat( ::nme::text::TextFormat_obj::__alloc( HX_CTX ,HX_("_sans",32,a0,5e,ff),12,inCol,null(),null(),null(),null(),null(),null(),null(),null(),null(),null()));
HXLINE(  28)		this->set_text(HX_("FPS: ",af,da,2c,83));
HXLINE(  29)		this->set_autoSize(::nme::text::TextFieldAutoSize_obj::LEFT_dyn());
HXLINE(  31)		this->times = ::Array_obj< Float >::__new(0);
HXLINE(  32)		this->addEventListener(HX_("enterFrame",f5,03,50,02),this->onEnter_dyn(),null(),null(),null());
            	}

Dynamic FPS_obj::__CreateEmpty() { return new FPS_obj; }

void *FPS_obj::_hx_vtable = 0;

Dynamic FPS_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< FPS_obj > _hx_result = new FPS_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return _hx_result;
}

bool FPS_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x0ff07575) {
		if (inClassId<=(int)0x094681ea) {
			if (inClassId<=(int)0x048b25c1) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x048b25c1;
			} else {
				return inClassId==(int)0x094681ea;
			}
		} else {
			return inClassId==(int)0x0ff07575;
		}
	} else {
		return inClassId==(int)0x169017a6 || inClassId==(int)0x18fc9d4d;
	}
}

Float FPS_obj::get_currentFPS(){
            	HX_STACKFRAME(&_hx_pos_c1e5bff23284417b_38_get_currentFPS)
HXDLIN(  38)		return ( (Float)(this->times->length) );
            	}


HX_DEFINE_DYNAMIC_FUNC0(FPS_obj,get_currentFPS,return )

void FPS_obj::onEnter( ::Dynamic _){
            	HX_STACKFRAME(&_hx_pos_c1e5bff23284417b_47_onEnter)
HXLINE(  48)		Float now = ::haxe::Timer_obj::stamp();
HXLINE(  49)		this->times->push(now);
HXLINE(  51)		while((this->times->__get(0) < (now - ( (Float)(1) )))){
HXLINE(  52)			this->times->shift();
            		}
HXLINE(  54)		if (this->get_visible()) {
HXLINE(  56)			this->set_text((HX_("FPS: ",af,da,2c,83) + this->times->length));
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(FPS_obj,onEnter,(void))


::hx::ObjectPtr< FPS_obj > FPS_obj::__new(::hx::Null< Float >  __o_inX,::hx::Null< Float >  __o_inY,::hx::Null< int >  __o_inCol) {
	::hx::ObjectPtr< FPS_obj > __this = new FPS_obj();
	__this->__construct(__o_inX,__o_inY,__o_inCol);
	return __this;
}

::hx::ObjectPtr< FPS_obj > FPS_obj::__alloc(::hx::Ctx *_hx_ctx,::hx::Null< Float >  __o_inX,::hx::Null< Float >  __o_inY,::hx::Null< int >  __o_inCol) {
	FPS_obj *__this = (FPS_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(FPS_obj), true, "nme.display.FPS"));
	*(void **)__this = FPS_obj::_hx_vtable;
	__this->__construct(__o_inX,__o_inY,__o_inCol);
	return __this;
}

FPS_obj::FPS_obj()
{
}

void FPS_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(FPS);
	HX_MARK_MEMBER_NAME(times,"times");
	 ::nme::text::TextField_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void FPS_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(times,"times");
	 ::nme::text::TextField_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val FPS_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"times") ) { return ::hx::Val( times ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"onEnter") ) { return ::hx::Val( onEnter_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"currentFPS") ) { if (inCallProp != ::hx::paccNever) return ::hx::Val( get_currentFPS() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"get_currentFPS") ) { return ::hx::Val( get_currentFPS_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val FPS_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"times") ) { times=inValue.Cast< ::Array< Float > >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void FPS_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("times",c6,bf,35,10));
	outFields->push(HX_("currentFPS",30,71,28,c7));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo FPS_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /* ::Array< Float > */ ,(int)offsetof(FPS_obj,times),HX_("times",c6,bf,35,10)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *FPS_obj_sStaticStorageInfo = 0;
#endif

static ::String FPS_obj_sMemberFields[] = {
	HX_("times",c6,bf,35,10),
	HX_("get_currentFPS",79,f9,1d,3d),
	HX_("onEnter",79,0b,c4,06),
	::String(null()) };

::hx::Class FPS_obj::__mClass;

void FPS_obj::__register()
{
	FPS_obj _hx_dummy;
	FPS_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.display.FPS",75,02,f9,58);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(FPS_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< FPS_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = FPS_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = FPS_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace display
