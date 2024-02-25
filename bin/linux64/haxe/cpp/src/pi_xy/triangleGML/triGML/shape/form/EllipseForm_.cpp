// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_BasicShape
#include <pi_xy/triangleGML/triGML/BasicShape.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_FillForm
#include <pi_xy/triangleGML/triGML/FillForm.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_GroupShape
#include <pi_xy/triangleGML/triGML/GroupShape.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_ShapeInterface
#include <pi_xy/triangleGML/triGML/ShapeInterface.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_shape_form_EllipseForm_
#include <pi_xy/triangleGML/triGML/shape/form/EllipseForm_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_3efc399f61ed5392_22_new,"pi_xy.triangleGML.triGML.shape.form.EllipseForm_","new",0xb59c5a90,"pi_xy.triangleGML.triGML.shape.form.EllipseForm_.new","pi_xy/triangleGML/triGML/shape/form/EllipseForm_.hx",22,0xa0c17fff)
HX_LOCAL_STACK_FRAME(_hx_pos_3efc399f61ed5392_30_setParameter,"pi_xy.triangleGML.triGML.shape.form.EllipseForm_","setParameter",0x014ca577,"pi_xy.triangleGML.triGML.shape.form.EllipseForm_.setParameter","pi_xy/triangleGML/triGML/shape/form/EllipseForm_.hx",30,0xa0c17fff)
namespace pi_xy{
namespace triangleGML{
namespace triGML{
namespace shape{
namespace form{

void EllipseForm__obj::__construct(::hx::Null< Float >  __o_opacity,::hx::Null< bool >  __o_visibility,::hx::Null< int >  __o_strokeColor,::hx::Null< Float >  __o_strokeWidth,::Array< ::String > strokeDashGapArray,::hx::Null< int >  __o_fill,::hx::Null< Float >  __o_left,::hx::Null< Float >  __o_top,::hx::Null< Float >  __o_width,::hx::Null< Float >  __o_height){
            		Float opacity = __o_opacity.Default(((Float)1.));
            		bool visibility = __o_visibility.Default(true);
            		int strokeColor = __o_strokeColor.Default(0);
            		Float strokeWidth = __o_strokeWidth.Default(((Float)1.));
            		int fill = __o_fill.Default(0);
            		Float left = __o_left.Default(((Float)0.));
            		Float top = __o_top.Default(((Float)0.));
            		Float width = __o_width.Default(((Float)1.));
            		Float height = __o_height.Default(((Float)1.));
            	HX_STACKFRAME(&_hx_pos_3efc399f61ed5392_22_new)
HXLINE(  23)		super::__construct(opacity,visibility,strokeColor,strokeWidth,strokeDashGapArray,fill);
HXLINE(  24)		this->left = left;
HXLINE(  25)		this->top = top;
HXLINE(  26)		this->width = width;
HXLINE(  27)		this->height = height;
            	}

bool EllipseForm__obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x4f186619) {
		if (inClassId<=(int)0x1a0bd5c0) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x1a0bd5c0;
		} else {
			return inClassId==(int)0x4f186619;
		}
	} else {
		return inClassId==(int)0x76428c00 || inClassId==(int)0x7ff8cec5;
	}
}

void EllipseForm__obj::setParameter(::String name,::String value){
            	HX_STACKFRAME(&_hx_pos_3efc399f61ed5392_30_setParameter)
HXDLIN(  30)		::String _hx_switch_0 = name;
            		if (  (_hx_switch_0==HX_("height",e7,07,4c,02)) ){
HXLINE(  38)			this->height = ::Std_obj::parseFloat(value);
HXDLIN(  38)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("left",07,08,b0,47)) ){
HXLINE(  32)			this->left = ::Std_obj::parseFloat(value);
HXDLIN(  32)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("top",95,66,58,00)) ){
HXLINE(  34)			this->top = ::Std_obj::parseFloat(value);
HXDLIN(  34)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("width",06,b6,62,ca)) ){
HXLINE(  36)			this->width = ::Std_obj::parseFloat(value);
HXDLIN(  36)			goto _hx_goto_1;
            		}
            		/* default */{
HXLINE(  40)			this->super::setParameter(name,value);
            		}
            		_hx_goto_1:;
            	}



EllipseForm__obj::EllipseForm__obj()
{
}

::hx::Val EllipseForm__obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"top") ) { return ::hx::Val( top ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"left") ) { return ::hx::Val( left ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"width") ) { return ::hx::Val( width ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { return ::hx::Val( height ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"setParameter") ) { return ::hx::Val( setParameter_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val EllipseForm__obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"top") ) { top=inValue.Cast< Float >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"left") ) { left=inValue.Cast< Float >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"width") ) { width=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { height=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void EllipseForm__obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("left",07,08,b0,47));
	outFields->push(HX_("top",95,66,58,00));
	outFields->push(HX_("width",06,b6,62,ca));
	outFields->push(HX_("height",e7,07,4c,02));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo EllipseForm__obj_sMemberStorageInfo[] = {
	{::hx::fsFloat,(int)offsetof(EllipseForm__obj,left),HX_("left",07,08,b0,47)},
	{::hx::fsFloat,(int)offsetof(EllipseForm__obj,top),HX_("top",95,66,58,00)},
	{::hx::fsFloat,(int)offsetof(EllipseForm__obj,width),HX_("width",06,b6,62,ca)},
	{::hx::fsFloat,(int)offsetof(EllipseForm__obj,height),HX_("height",e7,07,4c,02)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *EllipseForm__obj_sStaticStorageInfo = 0;
#endif

static ::String EllipseForm__obj_sMemberFields[] = {
	HX_("left",07,08,b0,47),
	HX_("top",95,66,58,00),
	HX_("width",06,b6,62,ca),
	HX_("height",e7,07,4c,02),
	HX_("setParameter",a7,f5,ff,6c),
	::String(null()) };

::hx::Class EllipseForm__obj::__mClass;

void EllipseForm__obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.triangleGML.triGML.shape.form.EllipseForm_",9e,12,20,57);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(EllipseForm__obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< EllipseForm__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = EllipseForm__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = EllipseForm__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace triangleGML
} // end namespace triGML
} // end namespace shape
} // end namespace form
