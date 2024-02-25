// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_text_TextLineMetrics
#include <nme/text/TextLineMetrics.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_c11e61f9a5cf6254_15_new,"nme.text.TextLineMetrics","new",0x118ddebb,"nme.text.TextLineMetrics.new","nme/text/TextLineMetrics.hx",15,0xca9f8575)
namespace nme{
namespace text{

void TextLineMetrics_obj::__construct( ::Dynamic in_x, ::Dynamic in_width, ::Dynamic in_height, ::Dynamic in_ascent, ::Dynamic in_descent, ::Dynamic in_leading){
            	HX_STACKFRAME(&_hx_pos_c11e61f9a5cf6254_15_new)
HXLINE(  16)		this->x = ( (Float)(in_x) );
HXLINE(  17)		this->width = ( (Float)(in_width) );
HXLINE(  18)		this->height = ( (Float)(in_height) );
HXLINE(  19)		this->ascent = ( (Float)(in_ascent) );
HXLINE(  20)		this->descent = ( (Float)(in_descent) );
HXLINE(  21)		this->leading = ( (Float)(in_leading) );
            	}

Dynamic TextLineMetrics_obj::__CreateEmpty() { return new TextLineMetrics_obj; }

void *TextLineMetrics_obj::_hx_vtable = 0;

Dynamic TextLineMetrics_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< TextLineMetrics_obj > _hx_result = new TextLineMetrics_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5]);
	return _hx_result;
}

bool TextLineMetrics_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x42401eb3;
}


TextLineMetrics_obj::TextLineMetrics_obj()
{
}

::hx::Val TextLineMetrics_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"x") ) { return ::hx::Val( x ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"width") ) { return ::hx::Val( width ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { return ::hx::Val( height ); }
		if (HX_FIELD_EQ(inName,"ascent") ) { return ::hx::Val( ascent ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"descent") ) { return ::hx::Val( descent ); }
		if (HX_FIELD_EQ(inName,"leading") ) { return ::hx::Val( leading ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val TextLineMetrics_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"x") ) { x=inValue.Cast< Float >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"width") ) { width=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { height=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"ascent") ) { ascent=inValue.Cast< Float >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"descent") ) { descent=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"leading") ) { leading=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void TextLineMetrics_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("x",78,00,00,00));
	outFields->push(HX_("width",06,b6,62,ca));
	outFields->push(HX_("height",e7,07,4c,02));
	outFields->push(HX_("ascent",5a,d9,6f,41));
	outFields->push(HX_("descent",3a,ae,3f,19));
	outFields->push(HX_("leading",c6,32,61,09));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo TextLineMetrics_obj_sMemberStorageInfo[] = {
	{::hx::fsFloat,(int)offsetof(TextLineMetrics_obj,x),HX_("x",78,00,00,00)},
	{::hx::fsFloat,(int)offsetof(TextLineMetrics_obj,width),HX_("width",06,b6,62,ca)},
	{::hx::fsFloat,(int)offsetof(TextLineMetrics_obj,height),HX_("height",e7,07,4c,02)},
	{::hx::fsFloat,(int)offsetof(TextLineMetrics_obj,ascent),HX_("ascent",5a,d9,6f,41)},
	{::hx::fsFloat,(int)offsetof(TextLineMetrics_obj,descent),HX_("descent",3a,ae,3f,19)},
	{::hx::fsFloat,(int)offsetof(TextLineMetrics_obj,leading),HX_("leading",c6,32,61,09)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *TextLineMetrics_obj_sStaticStorageInfo = 0;
#endif

static ::String TextLineMetrics_obj_sMemberFields[] = {
	HX_("x",78,00,00,00),
	HX_("width",06,b6,62,ca),
	HX_("height",e7,07,4c,02),
	HX_("ascent",5a,d9,6f,41),
	HX_("descent",3a,ae,3f,19),
	HX_("leading",c6,32,61,09),
	::String(null()) };

::hx::Class TextLineMetrics_obj::__mClass;

void TextLineMetrics_obj::__register()
{
	TextLineMetrics_obj _hx_dummy;
	TextLineMetrics_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.text.TextLineMetrics",49,65,7b,18);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(TextLineMetrics_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< TextLineMetrics_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = TextLineMetrics_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = TextLineMetrics_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace text
