// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_display_DisplayObject
#include <nme/display/DisplayObject.h>
#endif
#ifndef INCLUDED_nme_display_IBitmapDrawable
#include <nme/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_nme_display_Shape
#include <nme/display/Shape.h>
#endif
#ifndef INCLUDED_nme_events_EventDispatcher
#include <nme/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_nme_events_IEventDispatcher
#include <nme/events/IEventDispatcher.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_b96b78da070d0819_9_new,"nme.display.Shape","new",0x6d4bf01f,"nme.display.Shape.new","nme/display/Shape.hx",9,0x7b1ef333)
namespace nme{
namespace display{

void Shape_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_b96b78da070d0819_9_new)
HXDLIN(   9)		super::__construct(( ( ::Dynamic)(::nme::display::DisplayObject_obj::nme_create_display_object()) ),HX_("Shape",01,53,4a,0f));
            	}

Dynamic Shape_obj::__CreateEmpty() { return new Shape_obj; }

void *Shape_obj::_hx_vtable = 0;

Dynamic Shape_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Shape_obj > _hx_result = new Shape_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Shape_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x169017a6) {
		if (inClassId<=(int)0x0ff07575) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x0ff07575;
		} else {
			return inClassId==(int)0x169017a6;
		}
	} else {
		return inClassId==(int)0x5375f585;
	}
}


::hx::ObjectPtr< Shape_obj > Shape_obj::__new() {
	::hx::ObjectPtr< Shape_obj > __this = new Shape_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< Shape_obj > Shape_obj::__alloc(::hx::Ctx *_hx_ctx) {
	Shape_obj *__this = (Shape_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Shape_obj), true, "nme.display.Shape"));
	*(void **)__this = Shape_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

Shape_obj::Shape_obj()
{
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *Shape_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *Shape_obj_sStaticStorageInfo = 0;
#endif

::hx::Class Shape_obj::__mClass;

void Shape_obj::__register()
{
	Shape_obj _hx_dummy;
	Shape_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.display.Shape",ad,f4,33,d7);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< Shape_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Shape_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Shape_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace display
