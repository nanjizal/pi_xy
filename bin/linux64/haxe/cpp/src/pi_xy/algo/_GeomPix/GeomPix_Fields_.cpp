// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_pi_xy_algo__GeomPix_GeomPix_Fields_
#include <pi_xy/algo/_GeomPix/GeomPix_Fields_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_28_smootherStep,"pi_xy.algo._GeomPix.GeomPix_Fields_","smootherStep",0x60804ea1,"pi_xy.algo._GeomPix.GeomPix_Fields_.smootherStep","pi_xy/algo/GeomPix.hx",28,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_32_lerp,"pi_xy.algo._GeomPix.GeomPix_Fields_","lerp",0xcf153211,"pi_xy.algo._GeomPix.GeomPix_Fields_.lerp","pi_xy/algo/GeomPix.hx",32,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_37_lerp4Colors,"pi_xy.algo._GeomPix.GeomPix_Fields_","lerp4Colors",0x81a5fb13,"pi_xy.algo._GeomPix.GeomPix_Fields_.lerp4Colors","pi_xy/algo/GeomPix.hx",37,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_44_lerp2Colors,"pi_xy.algo._GeomPix.GeomPix_Fields_","lerp2Colors",0x2e7b0d91,"pi_xy.algo._GeomPix.GeomPix_Fields_.lerp2Colors","pi_xy/algo/GeomPix.hx",44,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_64_cross2d,"pi_xy.algo._GeomPix.GeomPix_Fields_","cross2d",0x28748818,"pi_xy.algo._GeomPix.GeomPix_Fields_.cross2d","pi_xy/algo/GeomPix.hx",64,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_67_dot,"pi_xy.algo._GeomPix.GeomPix_Fields_","dot",0x46ee942f,"pi_xy.algo._GeomPix.GeomPix_Fields_.dot","pi_xy/algo/GeomPix.hx",67,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_70_dotSame,"pi_xy.algo._GeomPix.GeomPix_Fields_","dotSame",0xeac48735,"pi_xy.algo._GeomPix.GeomPix_Fields_.dotSame","pi_xy/algo/GeomPix.hx",70,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_76_distanceSquarePointToSegment,"pi_xy.algo._GeomPix.GeomPix_Fields_","distanceSquarePointToSegment",0x638e0bf4,"pi_xy.algo._GeomPix.GeomPix_Fields_.distanceSquarePointToSegment","pi_xy/algo/GeomPix.hx",76,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_90_rotX,"pi_xy.algo._GeomPix.GeomPix_Fields_","rotX",0xd31411fb,"pi_xy.algo._GeomPix.GeomPix_Fields_.rotX","pi_xy/algo/GeomPix.hx",90,0x5049712f)
HX_LOCAL_STACK_FRAME(_hx_pos_f94cead3973af4e4_94_rotY,"pi_xy.algo._GeomPix.GeomPix_Fields_","rotY",0xd31411fc,"pi_xy.algo._GeomPix.GeomPix_Fields_.rotY","pi_xy/algo/GeomPix.hx",94,0x5049712f)
namespace pi_xy{
namespace algo{
namespace _GeomPix{

void GeomPix_Fields__obj::__construct() { }

Dynamic GeomPix_Fields__obj::__CreateEmpty() { return new GeomPix_Fields__obj; }

void *GeomPix_Fields__obj::_hx_vtable = 0;

Dynamic GeomPix_Fields__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< GeomPix_Fields__obj > _hx_result = new GeomPix_Fields__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool GeomPix_Fields__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x6408290c;
}

Float GeomPix_Fields__obj::smootherStep(Float t){
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_28_smootherStep)
HXDLIN(  28)		return (((t * t) * t) * ((t * ((t * ((Float)6.0)) - ((Float)15.0))) + ((Float)10.0)));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(GeomPix_Fields__obj,smootherStep,return )

Float GeomPix_Fields__obj::lerp(Float a,Float b,Float t){
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_32_lerp)
HXDLIN(  32)		return (b + ((b - a) * t));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(GeomPix_Fields__obj,lerp,return )

int GeomPix_Fields__obj::lerp4Colors(int colorhiA,int colorhiB,int colorloC,int colorloD,Float u,Float v,::hx::Null< bool >  __o_smooth){
            		bool smooth = __o_smooth.Default(true);
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_37_lerp4Colors)
HXLINE(  38)		int aA = ((colorhiB >> 24) & 255);
HXDLIN(  38)		int rA = ((colorhiB >> 16) & 255);
HXDLIN(  38)		int gA = ((colorhiB >> 8) & 255);
HXDLIN(  38)		int bA = (colorhiB & 255);
HXDLIN(  38)		int aB = ((colorhiA >> 24) & 255);
HXDLIN(  38)		int rB = ((colorhiA >> 16) & 255);
HXDLIN(  38)		int gB = ((colorhiA >> 8) & 255);
HXDLIN(  38)		int bB = (colorhiA & 255);
HXDLIN(  38)		Float v1;
HXDLIN(  38)		if (smooth) {
HXLINE(  38)			v1 = (((u * u) * u) * ((u * ((u * ((Float)6.0)) - ((Float)15.0))) + ((Float)10.0)));
            		}
            		else {
HXLINE(  38)			v1 = u;
            		}
HXDLIN(  38)		Float b = (( (Float)(aB) ) / ( (Float)(255) ));
HXDLIN(  38)		Float af = (b + ((b - (( (Float)(aA) ) / ( (Float)(255) ))) * v1));
HXDLIN(  38)		Float b1 = (( (Float)(rB) ) / ( (Float)(255) ));
HXDLIN(  38)		Float rf = (b1 + ((b1 - (( (Float)(rA) ) / ( (Float)(255) ))) * v1));
HXDLIN(  38)		Float b2 = (( (Float)(gB) ) / ( (Float)(255) ));
HXDLIN(  38)		Float gf = (b2 + ((b2 - (( (Float)(gA) ) / ( (Float)(255) ))) * v1));
HXDLIN(  38)		Float b3 = (( (Float)(bB) ) / ( (Float)(255) ));
HXDLIN(  38)		Float bf = (b3 + ((b3 - (( (Float)(bA) ) / ( (Float)(255) ))) * v1));
HXDLIN(  38)		int hiColor = ((((::Math_obj::round((af * ( (Float)(255) ))) << 24) | (::Math_obj::round((rf * ( (Float)(255) ))) << 16)) | (::Math_obj::round((gf * ( (Float)(255) ))) << 8)) | ::Math_obj::round((bf * ( (Float)(255) ))));
HXLINE(  39)		int aA1 = ((colorloD >> 24) & 255);
HXDLIN(  39)		int rA1 = ((colorloD >> 16) & 255);
HXDLIN(  39)		int gA1 = ((colorloD >> 8) & 255);
HXDLIN(  39)		int bA1 = (colorloD & 255);
HXDLIN(  39)		int aB1 = ((colorloC >> 24) & 255);
HXDLIN(  39)		int rB1 = ((colorloC >> 16) & 255);
HXDLIN(  39)		int gB1 = ((colorloC >> 8) & 255);
HXDLIN(  39)		int bB1 = (colorloC & 255);
HXDLIN(  39)		Float v2;
HXDLIN(  39)		if (smooth) {
HXLINE(  39)			v2 = (((u * u) * u) * ((u * ((u * ((Float)6.0)) - ((Float)15.0))) + ((Float)10.0)));
            		}
            		else {
HXLINE(  39)			v2 = u;
            		}
HXDLIN(  39)		Float b4 = (( (Float)(aB1) ) / ( (Float)(255) ));
HXDLIN(  39)		Float af1 = (b4 + ((b4 - (( (Float)(aA1) ) / ( (Float)(255) ))) * v2));
HXDLIN(  39)		Float b5 = (( (Float)(rB1) ) / ( (Float)(255) ));
HXDLIN(  39)		Float rf1 = (b5 + ((b5 - (( (Float)(rA1) ) / ( (Float)(255) ))) * v2));
HXDLIN(  39)		Float b6 = (( (Float)(gB1) ) / ( (Float)(255) ));
HXDLIN(  39)		Float gf1 = (b6 + ((b6 - (( (Float)(gA1) ) / ( (Float)(255) ))) * v2));
HXDLIN(  39)		Float b7 = (( (Float)(bB1) ) / ( (Float)(255) ));
HXDLIN(  39)		Float bf1 = (b7 + ((b7 - (( (Float)(bA1) ) / ( (Float)(255) ))) * v2));
HXDLIN(  39)		int loColor = ((((::Math_obj::round((af1 * ( (Float)(255) ))) << 24) | (::Math_obj::round((rf1 * ( (Float)(255) ))) << 16)) | (::Math_obj::round((gf1 * ( (Float)(255) ))) << 8)) | ::Math_obj::round((bf1 * ( (Float)(255) ))));
HXLINE(  40)		int aA2 = ((loColor >> 24) & 255);
HXDLIN(  40)		int rA2 = ((loColor >> 16) & 255);
HXDLIN(  40)		int gA2 = ((loColor >> 8) & 255);
HXDLIN(  40)		int bA2 = (loColor & 255);
HXDLIN(  40)		int aB2 = ((hiColor >> 24) & 255);
HXDLIN(  40)		int rB2 = ((hiColor >> 16) & 255);
HXDLIN(  40)		int gB2 = ((hiColor >> 8) & 255);
HXDLIN(  40)		int bB2 = (hiColor & 255);
HXDLIN(  40)		Float v3;
HXDLIN(  40)		if (smooth) {
HXLINE(  40)			v3 = (((v * v) * v) * ((v * ((v * ((Float)6.0)) - ((Float)15.0))) + ((Float)10.0)));
            		}
            		else {
HXLINE(  40)			v3 = v;
            		}
HXDLIN(  40)		Float b8 = (( (Float)(aB2) ) / ( (Float)(255) ));
HXDLIN(  40)		Float af2 = (b8 + ((b8 - (( (Float)(aA2) ) / ( (Float)(255) ))) * v3));
HXDLIN(  40)		Float b9 = (( (Float)(rB2) ) / ( (Float)(255) ));
HXDLIN(  40)		Float rf2 = (b9 + ((b9 - (( (Float)(rA2) ) / ( (Float)(255) ))) * v3));
HXDLIN(  40)		Float b10 = (( (Float)(gB2) ) / ( (Float)(255) ));
HXDLIN(  40)		Float gf2 = (b10 + ((b10 - (( (Float)(gA2) ) / ( (Float)(255) ))) * v3));
HXDLIN(  40)		Float b11 = (( (Float)(bB2) ) / ( (Float)(255) ));
HXDLIN(  40)		Float bf2 = (b11 + ((b11 - (( (Float)(bA2) ) / ( (Float)(255) ))) * v3));
HXDLIN(  40)		return ((((::Math_obj::round((af2 * ( (Float)(255) ))) << 24) | (::Math_obj::round((rf2 * ( (Float)(255) ))) << 16)) | (::Math_obj::round((gf2 * ( (Float)(255) ))) << 8)) | ::Math_obj::round((bf2 * ( (Float)(255) ))));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC7(GeomPix_Fields__obj,lerp4Colors,return )

int GeomPix_Fields__obj::lerp2Colors(int colA,int colB,Float t,::hx::Null< bool >  __o_smooth){
            		bool smooth = __o_smooth.Default(true);
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_44_lerp2Colors)
HXLINE(  45)		int aA = ((colB >> 24) & 255);
HXLINE(  46)		int rA = ((colB >> 16) & 255);
HXLINE(  47)		int gA = ((colB >> 8) & 255);
HXLINE(  48)		int bA = (colB & 255);
HXLINE(  49)		int aB = ((colA >> 24) & 255);
HXLINE(  50)		int rB = ((colA >> 16) & 255);
HXLINE(  51)		int gB = ((colA >> 8) & 255);
HXLINE(  52)		int bB = (colA & 255);
HXLINE(  53)		Float v;
HXDLIN(  53)		if (smooth) {
HXLINE(  53)			v = (((t * t) * t) * ((t * ((t * ((Float)6.0)) - ((Float)15.0))) + ((Float)10.0)));
            		}
            		else {
HXLINE(  53)			v = t;
            		}
HXLINE(  55)		Float b = (( (Float)(aB) ) / ( (Float)(255) ));
HXDLIN(  55)		Float af = (b + ((b - (( (Float)(aA) ) / ( (Float)(255) ))) * v));
HXLINE(  56)		Float b1 = (( (Float)(rB) ) / ( (Float)(255) ));
HXDLIN(  56)		Float rf = (b1 + ((b1 - (( (Float)(rA) ) / ( (Float)(255) ))) * v));
HXLINE(  57)		Float b2 = (( (Float)(gB) ) / ( (Float)(255) ));
HXDLIN(  57)		Float gf = (b2 + ((b2 - (( (Float)(gA) ) / ( (Float)(255) ))) * v));
HXLINE(  58)		Float b3 = (( (Float)(bB) ) / ( (Float)(255) ));
HXDLIN(  58)		Float bf = (b3 + ((b3 - (( (Float)(bA) ) / ( (Float)(255) ))) * v));
HXLINE(  59)		return ((((::Math_obj::round((af * ( (Float)(255) ))) << 24) | (::Math_obj::round((rf * ( (Float)(255) ))) << 16)) | (::Math_obj::round((gf * ( (Float)(255) ))) << 8)) | ::Math_obj::round((bf * ( (Float)(255) ))));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(GeomPix_Fields__obj,lerp2Colors,return )

Float GeomPix_Fields__obj::cross2d(Float ax,Float ay,Float bx,Float by){
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_64_cross2d)
HXDLIN(  64)		return ((ax * by) - (ay * bx));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(GeomPix_Fields__obj,cross2d,return )

Float GeomPix_Fields__obj::dot(Float ax,Float ay,Float bx,Float by){
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_67_dot)
HXDLIN(  67)		return ((ax * bx) + (ay * by));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(GeomPix_Fields__obj,dot,return )

Float GeomPix_Fields__obj::dotSame(Float ax,Float ay){
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_70_dotSame)
HXDLIN(  70)		return ((ax * ax) + (ay * ay));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(GeomPix_Fields__obj,dotSame,return )

Float GeomPix_Fields__obj::distanceSquarePointToSegment(Float x,Float y,Float x1,Float y1,Float x2,Float y2){
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_76_distanceSquarePointToSegment)
HXLINE(  77)		Float p1_p2_squareLength = (((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));
HXLINE(  78)		Float dotProduct = ((((x - x1) * (x2 - x1)) + ((y - y1) * (y2 - y1))) / p1_p2_squareLength);
HXLINE(  79)		if ((dotProduct < 0)) {
HXLINE(  80)			return (((x - x1) * (x - x1)) + ((y - y1) * (y - y1)));
            		}
            		else {
HXLINE(  81)			if ((dotProduct <= 1)) {
HXLINE(  82)				Float p_p1_squareLength = (((x1 - x) * (x1 - x)) + ((y1 - y) * (y1 - y)));
HXLINE(  83)				return (p_p1_squareLength - ((dotProduct * dotProduct) * p1_p2_squareLength));
            			}
            			else {
HXLINE(  85)				return (((x - x2) * (x - x2)) + ((y - y2) * (y - y2)));
            			}
            		}
HXLINE(  79)		return ((Float)0.);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC6(GeomPix_Fields__obj,distanceSquarePointToSegment,return )

Float GeomPix_Fields__obj::rotX(Float x,Float y,Float sin,Float cos){
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_90_rotX)
HXDLIN(  90)		return ((x * cos) - (y * sin));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(GeomPix_Fields__obj,rotX,return )

Float GeomPix_Fields__obj::rotY(Float x,Float y,Float sin,Float cos){
            	HX_STACKFRAME(&_hx_pos_f94cead3973af4e4_94_rotY)
HXDLIN(  94)		return ((y * cos) + (x * sin));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(GeomPix_Fields__obj,rotY,return )


GeomPix_Fields__obj::GeomPix_Fields__obj()
{
}

bool GeomPix_Fields__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"dot") ) { outValue = dot_dyn(); return true; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"lerp") ) { outValue = lerp_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"rotX") ) { outValue = rotX_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"rotY") ) { outValue = rotY_dyn(); return true; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"cross2d") ) { outValue = cross2d_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"dotSame") ) { outValue = dotSame_dyn(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"lerp4Colors") ) { outValue = lerp4Colors_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"lerp2Colors") ) { outValue = lerp2Colors_dyn(); return true; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"smootherStep") ) { outValue = smootherStep_dyn(); return true; }
		break;
	case 28:
		if (HX_FIELD_EQ(inName,"distanceSquarePointToSegment") ) { outValue = distanceSquarePointToSegment_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *GeomPix_Fields__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *GeomPix_Fields__obj_sStaticStorageInfo = 0;
#endif

::hx::Class GeomPix_Fields__obj::__mClass;

static ::String GeomPix_Fields__obj_sStaticFields[] = {
	HX_("smootherStep",07,05,2b,4b),
	HX_("lerp",77,12,b0,47),
	HX_("lerp4Colors",6d,93,40,9e),
	HX_("lerp2Colors",eb,a5,15,4b),
	HX_("cross2d",72,6b,51,df),
	HX_("dot",89,42,4c,00),
	HX_("dotSame",8f,6a,a1,a1),
	HX_("distanceSquarePointToSegment",5a,6e,aa,46),
	HX_("rotX",61,f2,ae,4b),
	HX_("rotY",62,f2,ae,4b),
	::String(null())
};

void GeomPix_Fields__obj::__register()
{
	GeomPix_Fields__obj _hx_dummy;
	GeomPix_Fields__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo._GeomPix.GeomPix_Fields_",14,67,f7,16);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &GeomPix_Fields__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(GeomPix_Fields__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< GeomPix_Fields__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = GeomPix_Fields__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = GeomPix_Fields__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo
} // end namespace _GeomPix