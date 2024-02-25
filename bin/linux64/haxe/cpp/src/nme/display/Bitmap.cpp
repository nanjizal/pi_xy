// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_display_Bitmap
#include <nme/display/Bitmap.h>
#endif
#ifndef INCLUDED_nme_display_BitmapData
#include <nme/display/BitmapData.h>
#endif
#ifndef INCLUDED_nme_display_DisplayObject
#include <nme/display/DisplayObject.h>
#endif
#ifndef INCLUDED_nme_display_Graphics
#include <nme/display/Graphics.h>
#endif
#ifndef INCLUDED_nme_display_IBitmapDrawable
#include <nme/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_nme_display_PixelSnapping
#include <nme/display/PixelSnapping.h>
#endif
#ifndef INCLUDED_nme_events_EventDispatcher
#include <nme/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_nme_events_IEventDispatcher
#include <nme/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_nme_geom_Matrix
#include <nme/geom/Matrix.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_7128a09b308ab84f_16_new,"nme.display.Bitmap","new",0x41e1a755,"nme.display.Bitmap.new","nme/display/Bitmap.hx",16,0x37ffc079)
HX_LOCAL_STACK_FRAME(_hx_pos_7128a09b308ab84f_34_nmeRebuild,"nme.display.Bitmap","nmeRebuild",0x1346b5a0,"nme.display.Bitmap.nmeRebuild","nme/display/Bitmap.hx",34,0x37ffc079)
HX_LOCAL_STACK_FRAME(_hx_pos_7128a09b308ab84f_50_set_bitmapData,"nme.display.Bitmap","set_bitmapData",0x7b3ff9a1,"nme.display.Bitmap.set_bitmapData","nme/display/Bitmap.hx",50,0x37ffc079)
HX_LOCAL_STACK_FRAME(_hx_pos_7128a09b308ab84f_58_set_smoothing,"nme.display.Bitmap","set_smoothing",0x729d868c,"nme.display.Bitmap.set_smoothing","nme/display/Bitmap.hx",58,0x37ffc079)
namespace nme{
namespace display{

void Bitmap_obj::__construct( ::nme::display::BitmapData bitmapData, ::nme::display::PixelSnapping pixelSnapping,::hx::Null< bool >  __o_smoothing){
            		bool smoothing = __o_smoothing.Default(false);
            	HX_STACKFRAME(&_hx_pos_7128a09b308ab84f_16_new)
HXLINE(  17)		super::__construct(( ( ::Dynamic)(::nme::display::DisplayObject_obj::nme_create_display_object()) ),HX_("Bitmap",0f,84,a0,25));
HXLINE(  19)		 ::nme::display::PixelSnapping _hx_tmp;
HXDLIN(  19)		if (::hx::IsNull( pixelSnapping )) {
HXLINE(  19)			_hx_tmp = ::nme::display::PixelSnapping_obj::AUTO_dyn();
            		}
            		else {
HXLINE(  19)			_hx_tmp = pixelSnapping;
            		}
HXDLIN(  19)		this->set_pixelSnapping(_hx_tmp);
HXLINE(  20)		this->set_smoothing(smoothing);
HXLINE(  22)		if (::hx::IsNotNull( bitmapData )) {
HXLINE(  24)			this->set_bitmapData(bitmapData);
            		}
            		else {
HXLINE(  26)			if (::hx::IsNotNull( this->bitmapData )) {
HXLINE(  28)				this->nmeRebuild();
            			}
            		}
            	}

Dynamic Bitmap_obj::__CreateEmpty() { return new Bitmap_obj; }

void *Bitmap_obj::_hx_vtable = 0;

Dynamic Bitmap_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Bitmap_obj > _hx_result = new Bitmap_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return _hx_result;
}

bool Bitmap_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x128004c7) {
		if (inClassId<=(int)0x0ff07575) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x0ff07575;
		} else {
			return inClassId==(int)0x128004c7;
		}
	} else {
		return inClassId==(int)0x169017a6;
	}
}

void Bitmap_obj::nmeRebuild(){
            	HX_STACKFRAME(&_hx_pos_7128a09b308ab84f_34_nmeRebuild)
HXDLIN(  34)		if (::hx::IsNotNull( this->nmeHandle )) {
HXLINE(  36)			 ::nme::display::Graphics gfx = this->get_graphics();
HXLINE(  37)			gfx->clear();
HXLINE(  39)			if (::hx::IsNotNull( this->bitmapData )) {
HXLINE(  41)				gfx->beginBitmapFill(this->bitmapData,null(),false,this->smoothing);
HXLINE(  42)				int _hx_tmp = this->bitmapData->get_width();
HXDLIN(  42)				gfx->drawRect(( (Float)(0) ),( (Float)(0) ),( (Float)(_hx_tmp) ),( (Float)(this->bitmapData->get_height()) ));
HXLINE(  43)				gfx->endFill();
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(Bitmap_obj,nmeRebuild,(void))

 ::nme::display::BitmapData Bitmap_obj::set_bitmapData( ::nme::display::BitmapData inBitmapData){
            	HX_STACKFRAME(&_hx_pos_7128a09b308ab84f_50_set_bitmapData)
HXLINE(  51)		this->bitmapData = inBitmapData;
HXLINE(  52)		this->nmeRebuild();
HXLINE(  54)		return inBitmapData;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Bitmap_obj,set_bitmapData,return )

bool Bitmap_obj::set_smoothing(bool inSmooth){
            	HX_STACKFRAME(&_hx_pos_7128a09b308ab84f_58_set_smoothing)
HXLINE(  59)		this->smoothing = inSmooth;
HXLINE(  60)		this->nmeRebuild();
HXLINE(  62)		return inSmooth;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Bitmap_obj,set_smoothing,return )


::hx::ObjectPtr< Bitmap_obj > Bitmap_obj::__new( ::nme::display::BitmapData bitmapData, ::nme::display::PixelSnapping pixelSnapping,::hx::Null< bool >  __o_smoothing) {
	::hx::ObjectPtr< Bitmap_obj > __this = new Bitmap_obj();
	__this->__construct(bitmapData,pixelSnapping,__o_smoothing);
	return __this;
}

::hx::ObjectPtr< Bitmap_obj > Bitmap_obj::__alloc(::hx::Ctx *_hx_ctx, ::nme::display::BitmapData bitmapData, ::nme::display::PixelSnapping pixelSnapping,::hx::Null< bool >  __o_smoothing) {
	Bitmap_obj *__this = (Bitmap_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Bitmap_obj), true, "nme.display.Bitmap"));
	*(void **)__this = Bitmap_obj::_hx_vtable;
	__this->__construct(bitmapData,pixelSnapping,__o_smoothing);
	return __this;
}

Bitmap_obj::Bitmap_obj()
{
}

void Bitmap_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Bitmap);
	HX_MARK_MEMBER_NAME(bitmapData,"bitmapData");
	HX_MARK_MEMBER_NAME(smoothing,"smoothing");
	HX_MARK_MEMBER_NAME(mGraphics,"mGraphics");
	 ::nme::display::DisplayObject_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Bitmap_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(bitmapData,"bitmapData");
	HX_VISIT_MEMBER_NAME(smoothing,"smoothing");
	HX_VISIT_MEMBER_NAME(mGraphics,"mGraphics");
	 ::nme::display::DisplayObject_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val Bitmap_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"smoothing") ) { return ::hx::Val( smoothing ); }
		if (HX_FIELD_EQ(inName,"mGraphics") ) { return ::hx::Val( mGraphics ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bitmapData") ) { return ::hx::Val( bitmapData ); }
		if (HX_FIELD_EQ(inName,"nmeRebuild") ) { return ::hx::Val( nmeRebuild_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"set_smoothing") ) { return ::hx::Val( set_smoothing_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"set_bitmapData") ) { return ::hx::Val( set_bitmapData_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val Bitmap_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"smoothing") ) { if (inCallProp != ::hx::paccNever) return ::hx::Val( set_smoothing(inValue.Cast< bool >()) );smoothing=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"mGraphics") ) { mGraphics=inValue.Cast<  ::nme::display::Graphics >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bitmapData") ) { if (inCallProp != ::hx::paccNever) return ::hx::Val( set_bitmapData(inValue.Cast<  ::nme::display::BitmapData >()) );bitmapData=inValue.Cast<  ::nme::display::BitmapData >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Bitmap_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("bitmapData",b9,b5,c0,33));
	outFields->push(HX_("smoothing",74,d5,e1,95));
	outFields->push(HX_("mGraphics",58,6a,e3,bc));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo Bitmap_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::nme::display::BitmapData */ ,(int)offsetof(Bitmap_obj,bitmapData),HX_("bitmapData",b9,b5,c0,33)},
	{::hx::fsBool,(int)offsetof(Bitmap_obj,smoothing),HX_("smoothing",74,d5,e1,95)},
	{::hx::fsObject /*  ::nme::display::Graphics */ ,(int)offsetof(Bitmap_obj,mGraphics),HX_("mGraphics",58,6a,e3,bc)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *Bitmap_obj_sStaticStorageInfo = 0;
#endif

static ::String Bitmap_obj_sMemberFields[] = {
	HX_("bitmapData",b9,b5,c0,33),
	HX_("smoothing",74,d5,e1,95),
	HX_("mGraphics",58,6a,e3,bc),
	HX_("nmeRebuild",f5,93,86,70),
	HX_("set_bitmapData",76,26,d6,c9),
	HX_("set_smoothing",57,8b,4b,9c),
	::String(null()) };

::hx::Class Bitmap_obj::__mClass;

void Bitmap_obj::__register()
{
	Bitmap_obj _hx_dummy;
	Bitmap_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.display.Bitmap",e3,58,24,4a);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(Bitmap_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< Bitmap_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Bitmap_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Bitmap_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace display