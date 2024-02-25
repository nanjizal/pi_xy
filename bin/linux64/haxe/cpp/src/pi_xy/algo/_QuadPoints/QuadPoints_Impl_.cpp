// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_pi_xy_algo_HitQuad
#include <pi_xy/algo/HitQuad.h>
#endif
#ifndef INCLUDED_pi_xy_algo_IhitObj
#include <pi_xy/algo/IhitObj.h>
#endif
#ifndef INCLUDED_pi_xy_algo_LineInfo
#include <pi_xy/algo/LineInfo.h>
#endif
#ifndef INCLUDED_pi_xy_algo_LineXYinfo
#include <pi_xy/algo/LineXYinfo.h>
#endif
#ifndef INCLUDED_pi_xy_algo_QuadPoints_
#include <pi_xy/algo/QuadPoints_.h>
#endif
#ifndef INCLUDED_pi_xy_algo__QuadPoints_QuadPoints_Impl_
#include <pi_xy/algo/_QuadPoints/QuadPoints_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_a55cdbf072658cf3_72__new,"pi_xy.algo._QuadPoints.QuadPoints_Impl_","_new",0x19b9628c,"pi_xy.algo._QuadPoints.QuadPoints_Impl_._new","pi_xy/algo/QuadPoints.hx",72,0x7e1fd9a0)
HX_LOCAL_STACK_FRAME(_hx_pos_a55cdbf072658cf3_78_fromLineXYinfo,"pi_xy.algo._QuadPoints.QuadPoints_Impl_","fromLineXYinfo",0xb6c503d8,"pi_xy.algo._QuadPoints.QuadPoints_Impl_.fromLineXYinfo","pi_xy/algo/QuadPoints.hx",78,0x7e1fd9a0)
HX_LOCAL_STACK_FRAME(_hx_pos_a55cdbf072658cf3_88_fromLineInfo,"pi_xy.algo._QuadPoints.QuadPoints_Impl_","fromLineInfo",0x32b75237,"pi_xy.algo._QuadPoints.QuadPoints_Impl_.fromLineInfo","pi_xy/algo/QuadPoints.hx",88,0x7e1fd9a0)
HX_LOCAL_STACK_FRAME(_hx_pos_a55cdbf072658cf3_126_rotate,"pi_xy.algo._QuadPoints.QuadPoints_Impl_","rotate",0x3ac87446,"pi_xy.algo._QuadPoints.QuadPoints_Impl_.rotate","pi_xy/algo/QuadPoints.hx",126,0x7e1fd9a0)
HX_LOCAL_STACK_FRAME(_hx_pos_a55cdbf072658cf3_158_getHit,"pi_xy.algo._QuadPoints.QuadPoints_Impl_","getHit",0x12c6ad48,"pi_xy.algo._QuadPoints.QuadPoints_Impl_.getHit","pi_xy/algo/QuadPoints.hx",158,0x7e1fd9a0)
namespace pi_xy{
namespace algo{
namespace _QuadPoints{

void QuadPoints_Impl__obj::__construct() { }

Dynamic QuadPoints_Impl__obj::__CreateEmpty() { return new QuadPoints_Impl__obj; }

void *QuadPoints_Impl__obj::_hx_vtable = 0;

Dynamic QuadPoints_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< QuadPoints_Impl__obj > _hx_result = new QuadPoints_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool QuadPoints_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x5b7683b9;
}

 ::pi_xy::algo::QuadPoints_ QuadPoints_Impl__obj::_new( ::pi_xy::algo::QuadPoints_ qp){
            	HX_STACKFRAME(&_hx_pos_a55cdbf072658cf3_72__new)
HXDLIN(  72)		return qp;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(QuadPoints_Impl__obj,_new,return )

 ::pi_xy::algo::QuadPoints_ QuadPoints_Impl__obj::fromLineXYinfo( ::pi_xy::algo::LineXYinfo lineXYinfo){
            	HX_GC_STACKFRAME(&_hx_pos_a55cdbf072658cf3_78_fromLineXYinfo)
HXLINE(  79)		 ::pi_xy::algo::LineXYinfo _ = lineXYinfo;
HXLINE(  80)		Float o = (_->qy - _->py);
HXLINE(  81)		Float a = (_->qx - _->px);
HXLINE(  82)		Float h = ::Math_obj::pow(((o * o) + (a * a)),((Float)0.5));
HXLINE(  83)		Float theta = ::Math_obj::atan2(o,a);
HXLINE(  84)		Float lineInfo_px = _->px;
HXDLIN(  84)		Float lineInfo_py = _->py;
HXDLIN(  84)		Float lineInfo_thick = _->thick;
HXDLIN(  84)		Float lineInfo_long = h;
HXDLIN(  84)		Float lineInfo_theta = theta;
HXDLIN(  84)		Float radius = (lineInfo_thick / ( (Float)(2) ));
HXDLIN(  84)		Float dx = ((Float)0.1);
HXDLIN(  84)		Float dy = radius;
HXDLIN(  84)		Float cx = lineInfo_long;
HXDLIN(  84)		Float cy = radius;
HXDLIN(  84)		Float bx = lineInfo_long;
HXDLIN(  84)		Float by = -(radius);
HXDLIN(  84)		Float ax = ((Float)0.1);
HXDLIN(  84)		Float ay = -(radius);
HXDLIN(  84)		 ::pi_xy::algo::QuadPoints_ qp =  ::pi_xy::algo::QuadPoints__obj::__alloc( HX_CTX ,ax,ay,bx,by,cx,cy,dx,dy);
HXDLIN(  84)		Float sin = ::Math_obj::sin(lineInfo_theta);
HXDLIN(  84)		Float cos = ::Math_obj::cos(lineInfo_theta);
HXDLIN(  84)		Float centreX = lineInfo_px;
HXDLIN(  84)		Float centreY = lineInfo_py;
HXDLIN(  84)		Float temp = ((Float)0.);
HXLINE( 108)		temp = (centreX + ((qp->ax * cos) - (qp->ay * sin)));
HXLINE(  84)		qp->ay = (centreY + ((qp->ay * cos) + (qp->ax * sin)));
HXDLIN(  84)		qp->ax = temp;
HXLINE( 112)		temp = (centreX + ((qp->bx * cos) - (qp->by * sin)));
HXLINE(  84)		qp->by = (centreY + ((qp->by * cos) + (qp->bx * sin)));
HXDLIN(  84)		qp->bx = temp;
HXLINE( 116)		temp = (centreX + ((qp->cx * cos) - (qp->cy * sin)));
HXLINE(  84)		qp->cy = (centreY + ((qp->cy * cos) + (qp->cx * sin)));
HXDLIN(  84)		qp->cx = temp;
HXLINE( 120)		temp = (centreX + ((qp->dx * cos) - (qp->dy * sin)));
HXLINE(  84)		qp->dy = (centreY + ((qp->dy * cos) + (qp->dx * sin)));
HXDLIN(  84)		qp->dx = temp;
HXDLIN(  84)		return qp;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(QuadPoints_Impl__obj,fromLineXYinfo,return )

 ::pi_xy::algo::QuadPoints_ QuadPoints_Impl__obj::fromLineInfo( ::pi_xy::algo::LineInfo lineInfo){
            	HX_GC_STACKFRAME(&_hx_pos_a55cdbf072658cf3_88_fromLineInfo)
HXLINE(  89)		Float radius = (lineInfo->thick / ( (Float)(2) ));
HXLINE(  90)		Float dx = ((Float)0.1);
HXLINE(  91)		Float dy = radius;
HXLINE(  92)		Float cx = lineInfo->_hx_long;
HXLINE(  93)		Float cy = radius;
HXLINE(  94)		Float bx = lineInfo->_hx_long;
HXLINE(  95)		Float by = -(radius);
HXLINE(  96)		Float ax = ((Float)0.1);
HXLINE(  97)		Float ay = -(radius);
HXLINE(  98)		 ::pi_xy::algo::QuadPoints_ qp =  ::pi_xy::algo::QuadPoints__obj::__alloc( HX_CTX ,ax,ay,bx,by,cx,cy,dx,dy);
HXLINE( 102)		Float sin = ::Math_obj::sin(lineInfo->theta);
HXLINE( 103)		Float cos = ::Math_obj::cos(lineInfo->theta);
HXLINE( 104)		Float centreX = lineInfo->px;
HXLINE( 105)		Float centreY = lineInfo->py;
HXLINE( 107)		Float temp = ((Float)0.);
HXLINE( 108)		temp = (centreX + ((qp->ax * cos) - (qp->ay * sin)));
HXLINE( 109)		qp->ay = (centreY + ((qp->ay * cos) + (qp->ax * sin)));
HXLINE( 110)		qp->ax = temp;
HXLINE( 112)		temp = (centreX + ((qp->bx * cos) - (qp->by * sin)));
HXLINE( 113)		qp->by = (centreY + ((qp->by * cos) + (qp->bx * sin)));
HXLINE( 114)		qp->bx = temp;
HXLINE( 116)		temp = (centreX + ((qp->cx * cos) - (qp->cy * sin)));
HXLINE( 117)		qp->cy = (centreY + ((qp->cy * cos) + (qp->cx * sin)));
HXLINE( 118)		qp->cx = temp;
HXLINE( 120)		temp = (centreX + ((qp->dx * cos) - (qp->dy * sin)));
HXLINE( 121)		qp->dy = (centreY + ((qp->dy * cos) + (qp->dx * sin)));
HXLINE( 122)		qp->dx = temp;
HXLINE( 123)		return qp;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(QuadPoints_Impl__obj,fromLineInfo,return )

void QuadPoints_Impl__obj::rotate( ::pi_xy::algo::QuadPoints_ this1,Float theta,Float centreX,Float centreY){
            	HX_STACKFRAME(&_hx_pos_a55cdbf072658cf3_126_rotate)
HXLINE( 127)		Float sin = ::Math_obj::sin(theta);
HXLINE( 128)		Float cos = ::Math_obj::cos(theta);
HXLINE( 130)		 ::pi_xy::algo::QuadPoints_ this2 = this1;
HXDLIN( 130)		this2->ax = (this2->ax - centreX);
HXLINE( 131)		 ::pi_xy::algo::QuadPoints_ this3 = this1;
HXDLIN( 131)		this3->ay = (this3->ay - centreY);
HXLINE( 132)		 ::pi_xy::algo::QuadPoints_ this4 = this1;
HXDLIN( 132)		this4->bx = (this4->bx - centreX);
HXLINE( 133)		 ::pi_xy::algo::QuadPoints_ this5 = this1;
HXDLIN( 133)		this5->by = (this5->by - centreY);
HXLINE( 134)		 ::pi_xy::algo::QuadPoints_ this6 = this1;
HXDLIN( 134)		this6->cx = (this6->cx - centreX);
HXLINE( 135)		 ::pi_xy::algo::QuadPoints_ this7 = this1;
HXDLIN( 135)		this7->cy = (this7->cy - centreY);
HXLINE( 136)		 ::pi_xy::algo::QuadPoints_ this8 = this1;
HXDLIN( 136)		this8->dx = (this8->dx - centreX);
HXLINE( 137)		 ::pi_xy::algo::QuadPoints_ this9 = this1;
HXDLIN( 137)		this9->dy = (this9->dy - centreY);
HXLINE( 139)		Float temp = ((Float)0.);
HXLINE( 140)		temp = (centreX + ((this1->ax * cos) - (this1->ay * sin)));
HXLINE( 141)		this1->ay = (centreY + ((this1->ay * cos) + (this1->ax * sin)));
HXLINE( 142)		this1->ax = temp;
HXLINE( 144)		temp = (centreX + ((this1->bx * cos) - (this1->by * sin)));
HXLINE( 145)		this1->by = (centreY + ((this1->by * cos) + (this1->bx * sin)));
HXLINE( 146)		this1->bx = temp;
HXLINE( 148)		temp = (centreX + ((this1->cx * cos) - (this1->cy * sin)));
HXLINE( 149)		this1->cy = (centreY + ((this1->cy * cos) + (this1->cx * sin)));
HXLINE( 150)		this1->cx = temp;
HXLINE( 152)		temp = (centreX + ((this1->dx * cos) - (this1->dy * sin)));
HXLINE( 153)		this1->dy = (centreY + ((this1->dy * cos) + (this1->dx * sin)));
HXLINE( 154)		this1->dx = temp;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(QuadPoints_Impl__obj,rotate,(void))

 ::pi_xy::algo::HitQuad QuadPoints_Impl__obj::getHit( ::pi_xy::algo::QuadPoints_ this1,::hx::Null< bool >  __o_preCalculated){
            		bool preCalculated = __o_preCalculated.Default(true);
            	HX_GC_STACKFRAME(&_hx_pos_a55cdbf072658cf3_158_getHit)
HXDLIN( 158)		return  ::pi_xy::algo::HitQuad_obj::__alloc( HX_CTX ,this1->ax,this1->ay,this1->bx,this1->by,this1->cx,this1->cy,this1->dx,this1->dy,preCalculated);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(QuadPoints_Impl__obj,getHit,return )


QuadPoints_Impl__obj::QuadPoints_Impl__obj()
{
}

bool QuadPoints_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"_new") ) { outValue = _new_dyn(); return true; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"rotate") ) { outValue = rotate_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"getHit") ) { outValue = getHit_dyn(); return true; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"fromLineInfo") ) { outValue = fromLineInfo_dyn(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"fromLineXYinfo") ) { outValue = fromLineXYinfo_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *QuadPoints_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *QuadPoints_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class QuadPoints_Impl__obj::__mClass;

static ::String QuadPoints_Impl__obj_sStaticFields[] = {
	HX_("_new",61,15,1f,3f),
	HX_("fromLineXYinfo",ed,72,0c,4c),
	HX_("fromLineInfo",0c,62,fb,22),
	HX_("rotate",5b,46,20,cb),
	HX_("getHit",5d,7f,1e,a3),
	::String(null())
};

void QuadPoints_Impl__obj::__register()
{
	QuadPoints_Impl__obj _hx_dummy;
	QuadPoints_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo._QuadPoints.QuadPoints_Impl_",23,23,13,59);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &QuadPoints_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(QuadPoints_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< QuadPoints_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = QuadPoints_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = QuadPoints_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo
} // end namespace _QuadPoints
