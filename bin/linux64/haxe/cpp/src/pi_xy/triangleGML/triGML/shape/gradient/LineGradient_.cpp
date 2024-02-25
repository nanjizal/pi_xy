// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_BasicGradient
#include <pi_xy/triangleGML/triGML/BasicGradient.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_GroupShape
#include <pi_xy/triangleGML/triGML/GroupShape.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_ShapeInterface
#include <pi_xy/triangleGML/triGML/ShapeInterface.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_shape_gradient_LineGradient_
#include <pi_xy/triangleGML/triGML/shape/gradient/LineGradient_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_70fb94504a10c690_23_new,"pi_xy.triangleGML.triGML.shape.gradient.LineGradient_","new",0xf7689f18,"pi_xy.triangleGML.triGML.shape.gradient.LineGradient_.new","pi_xy/triangleGML/triGML/shape/gradient/LineGradient_.hx",23,0x754c6d59)
HX_LOCAL_STACK_FRAME(_hx_pos_70fb94504a10c690_32_setParameter,"pi_xy.triangleGML.triGML.shape.gradient.LineGradient_","setParameter",0x15678fef,"pi_xy.triangleGML.triGML.shape.gradient.LineGradient_.setParameter","pi_xy/triangleGML/triGML/shape/gradient/LineGradient_.hx",32,0x754c6d59)
namespace pi_xy{
namespace triangleGML{
namespace triGML{
namespace shape{
namespace gradient{

void LineGradient__obj::__construct(::hx::Null< Float >  __o_opacity,::hx::Null< bool >  __o_visibility,::hx::Null< Float >  __o_x1,::hx::Null< Float >  __o_y1,::hx::Null< Float >  __o_x2,::hx::Null< Float >  __o_y2,::hx::Null< int >  __o_colorA,::hx::Null< int >  __o_colorB,::hx::Null< int >  __o_colorC,::hx::Null< int >  __o_colorD,::hx::Null< Float >  __o_strokeWidth){
            		Float opacity = __o_opacity.Default(((Float)1.));
            		bool visibility = __o_visibility.Default(true);
            		Float x1 = __o_x1.Default(((Float)0.));
            		Float y1 = __o_y1.Default(((Float)0.));
            		Float x2 = __o_x2.Default(((Float)0.));
            		Float y2 = __o_y2.Default(((Float)0.));
            		int colorA = __o_colorA.Default(-26368);
            		int colorB = __o_colorB.Default(-4194560);
            		int colorC = __o_colorC.Default(-16717057);
            		int colorD = __o_colorD.Default(-9240321);
            		Float strokeWidth = __o_strokeWidth.Default(((Float)1.));
            	HX_STACKFRAME(&_hx_pos_70fb94504a10c690_23_new)
HXLINE(  24)		super::__construct(opacity,visibility,::Array_obj< int >::__new(4)->init(0,colorA)->init(1,colorB)->init(2,colorC)->init(3,colorD));
HXLINE(  25)		this->x1 = x1;
HXLINE(  26)		this->y1 = y1;
HXLINE(  27)		this->x2 = x2;
HXLINE(  28)		this->y2 = y2;
HXLINE(  29)		this->strokeWidth = strokeWidth;
            	}

bool LineGradient__obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x22e3eee8) {
		if (inClassId<=(int)0x1a0bd5c0) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x1a0bd5c0;
		} else {
			return inClassId==(int)0x22e3eee8;
		}
	} else {
		return inClassId==(int)0x7a004d1c;
	}
}

void LineGradient__obj::setParameter(::String name,::String value){
            	HX_STACKFRAME(&_hx_pos_70fb94504a10c690_32_setParameter)
HXDLIN(  32)		::String _hx_switch_0 = name;
            		if (  (_hx_switch_0==HX_("colorA",7e,c5,86,c6)) ){
HXLINE(  44)			this->cornerColors[0] = ( (int)(::Std_obj::parseInt(value)) );
HXDLIN(  44)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("colorB",7f,c5,86,c6)) ){
HXLINE(  46)			this->cornerColors[1] = ( (int)(::Std_obj::parseInt(value)) );
HXDLIN(  46)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("colorBottom",ae,78,a1,1f)) ){
HXLINE(  61)			this->cornerColors[4] = ( (int)(::Std_obj::parseInt(value)) );
HXLINE(  62)			this->cornerColors[3] = ( (int)(::Std_obj::parseInt(value)) );
HXLINE(  60)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("colorC",80,c5,86,c6)) ){
HXLINE(  48)			this->cornerColors[2] = ( (int)(::Std_obj::parseInt(value)) );
HXDLIN(  48)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("colorD",81,c5,86,c6)) ){
HXLINE(  50)			this->cornerColors[3] = ( (int)(::Std_obj::parseInt(value)) );
HXDLIN(  50)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("colorFirst",cd,8f,09,25)) ){
HXLINE(  52)			this->cornerColors[0] = ( (int)(::Std_obj::parseInt(value)) );
HXLINE(  53)			this->cornerColors[4] = ( (int)(::Std_obj::parseInt(value)) );
HXLINE(  51)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("colorSecond",37,61,70,1e)) ){
HXLINE(  55)			this->cornerColors[2] = ( (int)(::Std_obj::parseInt(value)) );
HXLINE(  56)			this->cornerColors[3] = ( (int)(::Std_obj::parseInt(value)) );
HXLINE(  54)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("colorTop",f2,6c,f0,89)) ){
HXLINE(  58)			this->cornerColors[0] = ( (int)(::Std_obj::parseInt(value)) );
HXLINE(  59)			this->cornerColors[2] = ( (int)(::Std_obj::parseInt(value)) );
HXLINE(  57)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("strokeWidth",2e,f7,1c,e3)) ){
HXLINE(  34)			this->strokeWidth = ::Std_obj::parseFloat(value);
HXDLIN(  34)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("x1",b9,68,00,00)) ){
HXLINE(  36)			this->x1 = ::Std_obj::parseFloat(value);
HXDLIN(  36)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("x2",ba,68,00,00)) ){
HXLINE(  40)			this->x2 = ::Std_obj::parseFloat(value);
HXDLIN(  40)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("y1",98,69,00,00)) ){
HXLINE(  38)			this->y1 = ::Std_obj::parseFloat(value);
HXDLIN(  38)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("y2",99,69,00,00)) ){
HXLINE(  42)			this->y2 = ::Std_obj::parseFloat(value);
HXDLIN(  42)			goto _hx_goto_1;
            		}
            		/* default */{
HXLINE(  64)			this->super::setParameter(name,value);
            		}
            		_hx_goto_1:;
            	}



LineGradient__obj::LineGradient__obj()
{
}

::hx::Val LineGradient__obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"x1") ) { return ::hx::Val( x1 ); }
		if (HX_FIELD_EQ(inName,"y1") ) { return ::hx::Val( y1 ); }
		if (HX_FIELD_EQ(inName,"x2") ) { return ::hx::Val( x2 ); }
		if (HX_FIELD_EQ(inName,"y2") ) { return ::hx::Val( y2 ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"strokeWidth") ) { return ::hx::Val( strokeWidth ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"setParameter") ) { return ::hx::Val( setParameter_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val LineGradient__obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"x1") ) { x1=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"y1") ) { y1=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"x2") ) { x2=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"y2") ) { y2=inValue.Cast< Float >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"strokeWidth") ) { strokeWidth=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void LineGradient__obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("x1",b9,68,00,00));
	outFields->push(HX_("y1",98,69,00,00));
	outFields->push(HX_("x2",ba,68,00,00));
	outFields->push(HX_("y2",99,69,00,00));
	outFields->push(HX_("strokeWidth",2e,f7,1c,e3));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo LineGradient__obj_sMemberStorageInfo[] = {
	{::hx::fsFloat,(int)offsetof(LineGradient__obj,x1),HX_("x1",b9,68,00,00)},
	{::hx::fsFloat,(int)offsetof(LineGradient__obj,y1),HX_("y1",98,69,00,00)},
	{::hx::fsFloat,(int)offsetof(LineGradient__obj,x2),HX_("x2",ba,68,00,00)},
	{::hx::fsFloat,(int)offsetof(LineGradient__obj,y2),HX_("y2",99,69,00,00)},
	{::hx::fsFloat,(int)offsetof(LineGradient__obj,strokeWidth),HX_("strokeWidth",2e,f7,1c,e3)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *LineGradient__obj_sStaticStorageInfo = 0;
#endif

static ::String LineGradient__obj_sMemberFields[] = {
	HX_("x1",b9,68,00,00),
	HX_("y1",98,69,00,00),
	HX_("x2",ba,68,00,00),
	HX_("y2",99,69,00,00),
	HX_("strokeWidth",2e,f7,1c,e3),
	HX_("setParameter",a7,f5,ff,6c),
	::String(null()) };

::hx::Class LineGradient__obj::__mClass;

void LineGradient__obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.triangleGML.triGML.shape.gradient.LineGradient_",26,73,3d,80);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(LineGradient__obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< LineGradient__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = LineGradient__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = LineGradient__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace triangleGML
} // end namespace triGML
} // end namespace shape
} // end namespace gradient
