// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_iterMagic_Iimg
#include <iterMagic/Iimg.h>
#endif
#ifndef INCLUDED_iterMagic_Pic
#include <iterMagic/Pic.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_41075d4f076500b0_416_new,"iterMagic.Pic","new",0x00c0b1a3,"iterMagic.Pic.new","iterMagic/Img.hx",416,0x8899afd5)
namespace iterMagic{

void Pic_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_41075d4f076500b0_416_new)
            	}

Dynamic Pic_obj::__CreateEmpty() { return new Pic_obj; }

void *Pic_obj::_hx_vtable = 0;

Dynamic Pic_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Pic_obj > _hx_result = new Pic_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Pic_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x1625f441;
}


Pic_obj::Pic_obj()
{
}

void Pic_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Pic);
	HX_MARK_MEMBER_NAME(img,"img");
	HX_MARK_END_CLASS();
}

void Pic_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(img,"img");
}

::hx::Val Pic_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"img") ) { return ::hx::Val( img ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val Pic_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"img") ) { img=inValue.Cast< ::Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Pic_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("img",03,0c,50,00));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo Pic_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /* ::Dynamic */ ,(int)offsetof(Pic_obj,img),HX_("img",03,0c,50,00)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *Pic_obj_sStaticStorageInfo = 0;
#endif

static ::String Pic_obj_sMemberFields[] = {
	HX_("img",03,0c,50,00),
	::String(null()) };

::hx::Class Pic_obj::__mClass;

void Pic_obj::__register()
{
	Pic_obj _hx_dummy;
	Pic_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("iterMagic.Pic",31,a4,40,d4);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(Pic_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< Pic_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Pic_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Pic_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace iterMagic
