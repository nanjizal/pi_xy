// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_pi_xy_ImageStruct
#include <pi_xy/ImageStruct.h>
#endif
#ifndef INCLUDED_pi_xy_algo_HitTri
#include <pi_xy/algo/HitTri.h>
#endif
#ifndef INCLUDED_pi_xy_algo_IhitObj
#include <pi_xy/algo/IhitObj.h>
#endif
#ifndef INCLUDED_pi_xy_algo_TriPoints_
#include <pi_xy/algo/TriPoints_.h>
#endif
#ifndef INCLUDED_pi_xy_iter_IntIterStart
#include <pi_xy/iter/IntIterStart.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_7bb95f00d8602ea9_8_new,"pi_xy.algo.HitTri","new",0x8a17a2be,"pi_xy.algo.HitTri.new","pi_xy/algo/HitTri.hx",8,0x87419612)
HX_LOCAL_STACK_FRAME(_hx_pos_7bb95f00d8602ea9_33_preCalculateValues,"pi_xy.algo.HitTri","preCalculateValues",0xe6c0ec67,"pi_xy.algo.HitTri.preCalculateValues","pi_xy/algo/HitTri.hx",33,0x87419612)
HX_LOCAL_STACK_FRAME(_hx_pos_7bb95f00d8602ea9_47_hit,"pi_xy.algo.HitTri","hit",0x8a1318b1,"pi_xy.algo.HitTri.hit","pi_xy/algo/HitTri.hx",47,0x87419612)
namespace pi_xy{
namespace algo{

void HitTri_obj::__construct(Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated){
            		bool preCalculated = __o_preCalculated.Default(true);
            	HX_GC_STACKFRAME(&_hx_pos_7bb95f00d8602ea9_8_new)
HXLINE(  19)		this->undoImage = null();
HXLINE(  26)		super::__construct(ax,ay,bx,by,cx,cy);
HXLINE(  27)		this->preCalculated = preCalculated;
HXLINE(  28)		if (preCalculated) {
HXLINE(  29)			this->s0 = ((this->ay * this->cx) - (this->ax * this->cy));
HXDLIN(  29)			this->sx = (this->cy - this->ay);
HXDLIN(  29)			this->sy = (this->ax - this->cx);
HXDLIN(  29)			this->t0 = ((this->ax * this->by) - (this->ay * this->bx));
HXDLIN(  29)			this->tx = (this->ay - this->by);
HXDLIN(  29)			this->ty = (this->bx - this->ax);
HXDLIN(  29)			this->A = ((((-(this->by) * this->cx) + (this->ay * (-(this->bx) + this->cx))) + (this->ax * (this->by - this->cy))) + (this->bx * this->cy));
HXDLIN(  29)			Float a = this->ax;
HXDLIN(  29)			Float b = this->bx;
HXDLIN(  29)			Float c = this->cx;
HXDLIN(  29)			 ::pi_xy::iter::IntIterStart _hx_tmp;
HXDLIN(  29)			if ((a > b)) {
HXLINE(  29)				if ((a > c)) {
HXLINE(  29)					int min;
HXDLIN(  29)					if ((b > c)) {
HXLINE(  29)						min = ::Math_obj::floor(c);
            					}
            					else {
HXLINE(  29)						min = ::Math_obj::floor(b);
            					}
HXDLIN(  29)					int ii_min = min;
HXDLIN(  29)					int ii_max = ::Math_obj::ceil(a);
HXDLIN(  29)					_hx_tmp =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min,ii_max);
            				}
            				else {
HXLINE(  29)					int ii_min1 = ::Math_obj::floor(b);
HXDLIN(  29)					int ii_max1 = ::Math_obj::ceil(c);
HXDLIN(  29)					_hx_tmp =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min1,ii_max1);
            				}
            			}
            			else {
HXLINE(  29)				if ((b > c)) {
HXLINE(  29)					int min1;
HXDLIN(  29)					if ((a > c)) {
HXLINE(  29)						min1 = ::Math_obj::floor(c);
            					}
            					else {
HXLINE(  29)						min1 = ::Math_obj::ceil(a);
            					}
HXDLIN(  29)					int ii_min2 = min1;
HXDLIN(  29)					int ii_max2 = ::Math_obj::ceil(b);
HXDLIN(  29)					_hx_tmp =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min2,ii_max2);
            				}
            				else {
HXLINE(  29)					int ii_min3 = ::Math_obj::floor(a);
HXDLIN(  29)					int ii_max3 = ::Math_obj::ceil(c);
HXDLIN(  29)					_hx_tmp =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min3,ii_max3);
            				}
            			}
HXDLIN(  29)			this->xIter3 = _hx_tmp;
HXDLIN(  29)			Float a1 = this->ay;
HXDLIN(  29)			Float b1 = this->by;
HXDLIN(  29)			Float c1 = this->cy;
HXDLIN(  29)			 ::pi_xy::iter::IntIterStart _hx_tmp1;
HXDLIN(  29)			if ((a1 > b1)) {
HXLINE(  29)				if ((a1 > c1)) {
HXLINE(  29)					int min2;
HXDLIN(  29)					if ((b1 > c1)) {
HXLINE(  29)						min2 = ::Math_obj::floor(c1);
            					}
            					else {
HXLINE(  29)						min2 = ::Math_obj::floor(b1);
            					}
HXDLIN(  29)					int ii_min4 = min2;
HXDLIN(  29)					int ii_max4 = ::Math_obj::ceil(a1);
HXDLIN(  29)					_hx_tmp1 =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min4,ii_max4);
            				}
            				else {
HXLINE(  29)					int ii_min5 = ::Math_obj::floor(b1);
HXDLIN(  29)					int ii_max5 = ::Math_obj::ceil(c1);
HXDLIN(  29)					_hx_tmp1 =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min5,ii_max5);
            				}
            			}
            			else {
HXLINE(  29)				if ((b1 > c1)) {
HXLINE(  29)					int min3;
HXDLIN(  29)					if ((a1 > c1)) {
HXLINE(  29)						min3 = ::Math_obj::floor(c1);
            					}
            					else {
HXLINE(  29)						min3 = ::Math_obj::ceil(a1);
            					}
HXDLIN(  29)					int ii_min6 = min3;
HXDLIN(  29)					int ii_max6 = ::Math_obj::ceil(b1);
HXDLIN(  29)					_hx_tmp1 =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min6,ii_max6);
            				}
            				else {
HXLINE(  29)					int ii_min7 = ::Math_obj::floor(a1);
HXDLIN(  29)					int ii_max7 = ::Math_obj::ceil(c1);
HXDLIN(  29)					_hx_tmp1 =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min7,ii_max7);
            				}
            			}
HXDLIN(  29)			this->yIter3 = _hx_tmp1;
            		}
            	}

Dynamic HitTri_obj::__CreateEmpty() { return new HitTri_obj; }

void *HitTri_obj::_hx_vtable = 0;

Dynamic HitTri_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< HitTri_obj > _hx_result = new HitTri_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5],inArgs[6]);
	return _hx_result;
}

bool HitTri_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x36c8846e) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x36c8846e;
	} else {
		return inClassId==(int)0x6c0be2ab;
	}
}

static ::pi_xy::algo::IhitObj_obj _hx_pi_xy_algo_HitTri__hx_pi_xy_algo_IhitObj= {
	( bool (::hx::Object::*)(Float,Float))&::pi_xy::algo::HitTri_obj::hit,
};

void *HitTri_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0x6d20d5d3: return &_hx_pi_xy_algo_HitTri__hx_pi_xy_algo_IhitObj;
	}
	return super::_hx_getInterface(inHash);
}

void HitTri_obj::preCalculateValues(){
            	HX_GC_STACKFRAME(&_hx_pos_7bb95f00d8602ea9_33_preCalculateValues)
HXLINE(  34)		this->s0 = ((this->ay * this->cx) - (this->ax * this->cy));
HXLINE(  35)		this->sx = (this->cy - this->ay);
HXLINE(  36)		this->sy = (this->ax - this->cx);
HXLINE(  37)		this->t0 = ((this->ax * this->by) - (this->ay * this->bx));
HXLINE(  38)		this->tx = (this->ay - this->by);
HXLINE(  39)		this->ty = (this->bx - this->ax);
HXLINE(  40)		this->A = ((((-(this->by) * this->cx) + (this->ay * (-(this->bx) + this->cx))) + (this->ax * (this->by - this->cy))) + (this->bx * this->cy));
HXLINE(  41)		Float a = this->ax;
HXDLIN(  41)		Float b = this->bx;
HXDLIN(  41)		Float c = this->cx;
HXDLIN(  41)		 ::pi_xy::iter::IntIterStart _hx_tmp;
HXDLIN(  41)		if ((a > b)) {
HXLINE(  41)			if ((a > c)) {
HXLINE(  41)				int min;
HXDLIN(  41)				if ((b > c)) {
HXLINE(  41)					min = ::Math_obj::floor(c);
            				}
            				else {
HXLINE(  41)					min = ::Math_obj::floor(b);
            				}
HXDLIN(  41)				int ii_min = min;
HXDLIN(  41)				int ii_max = ::Math_obj::ceil(a);
HXDLIN(  41)				_hx_tmp =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min,ii_max);
            			}
            			else {
HXLINE(  41)				int ii_min1 = ::Math_obj::floor(b);
HXDLIN(  41)				int ii_max1 = ::Math_obj::ceil(c);
HXDLIN(  41)				_hx_tmp =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min1,ii_max1);
            			}
            		}
            		else {
HXLINE(  41)			if ((b > c)) {
HXLINE(  41)				int min1;
HXDLIN(  41)				if ((a > c)) {
HXLINE(  41)					min1 = ::Math_obj::floor(c);
            				}
            				else {
HXLINE(  41)					min1 = ::Math_obj::ceil(a);
            				}
HXDLIN(  41)				int ii_min2 = min1;
HXDLIN(  41)				int ii_max2 = ::Math_obj::ceil(b);
HXDLIN(  41)				_hx_tmp =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min2,ii_max2);
            			}
            			else {
HXLINE(  41)				int ii_min3 = ::Math_obj::floor(a);
HXDLIN(  41)				int ii_max3 = ::Math_obj::ceil(c);
HXDLIN(  41)				_hx_tmp =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min3,ii_max3);
            			}
            		}
HXDLIN(  41)		this->xIter3 = _hx_tmp;
HXLINE(  42)		Float a1 = this->ay;
HXDLIN(  42)		Float b1 = this->by;
HXDLIN(  42)		Float c1 = this->cy;
HXDLIN(  42)		 ::pi_xy::iter::IntIterStart _hx_tmp1;
HXDLIN(  42)		if ((a1 > b1)) {
HXLINE(  42)			if ((a1 > c1)) {
HXLINE(  42)				int min2;
HXDLIN(  42)				if ((b1 > c1)) {
HXLINE(  42)					min2 = ::Math_obj::floor(c1);
            				}
            				else {
HXLINE(  42)					min2 = ::Math_obj::floor(b1);
            				}
HXDLIN(  42)				int ii_min4 = min2;
HXDLIN(  42)				int ii_max4 = ::Math_obj::ceil(a1);
HXDLIN(  42)				_hx_tmp1 =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min4,ii_max4);
            			}
            			else {
HXLINE(  42)				int ii_min5 = ::Math_obj::floor(b1);
HXDLIN(  42)				int ii_max5 = ::Math_obj::ceil(c1);
HXDLIN(  42)				_hx_tmp1 =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min5,ii_max5);
            			}
            		}
            		else {
HXLINE(  42)			if ((b1 > c1)) {
HXLINE(  42)				int min3;
HXDLIN(  42)				if ((a1 > c1)) {
HXLINE(  42)					min3 = ::Math_obj::floor(c1);
            				}
            				else {
HXLINE(  42)					min3 = ::Math_obj::ceil(a1);
            				}
HXDLIN(  42)				int ii_min6 = min3;
HXDLIN(  42)				int ii_max6 = ::Math_obj::ceil(b1);
HXDLIN(  42)				_hx_tmp1 =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min6,ii_max6);
            			}
            			else {
HXLINE(  42)				int ii_min7 = ::Math_obj::floor(a1);
HXDLIN(  42)				int ii_max7 = ::Math_obj::ceil(c1);
HXDLIN(  42)				_hx_tmp1 =  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii_min7,ii_max7);
            			}
            		}
HXDLIN(  42)		this->yIter3 = _hx_tmp1;
            	}


HX_DEFINE_DYNAMIC_FUNC0(HitTri_obj,preCalculateValues,(void))

bool HitTri_obj::hit(Float x,Float y){
            	HX_STACKFRAME(&_hx_pos_7bb95f00d8602ea9_47_hit)
HXDLIN(  47)		bool _hx_tmp;
HXDLIN(  47)		 ::pi_xy::iter::IntIterStart this1 = this->xIter3;
HXDLIN(  47)		bool _hx_tmp1;
HXDLIN(  47)		if ((x > (this1->start - 1))) {
HXDLIN(  47)			_hx_tmp1 = (x < (this1->max + 1));
            		}
            		else {
HXDLIN(  47)			_hx_tmp1 = false;
            		}
HXDLIN(  47)		if (_hx_tmp1) {
HXDLIN(  47)			 ::pi_xy::iter::IntIterStart this2 = this->yIter3;
HXDLIN(  47)			if ((y > (this2->start - 1))) {
HXDLIN(  47)				_hx_tmp = (y < (this2->max + 1));
            			}
            			else {
HXDLIN(  47)				_hx_tmp = false;
            			}
            		}
            		else {
HXDLIN(  47)			_hx_tmp = false;
            		}
HXDLIN(  47)		if (_hx_tmp) {
HXLINE(  48)			Float s = ((this->s0 + (this->sx * x)) + (this->sy * y));
HXLINE(  49)			Float t = ((this->t0 + (this->tx * x)) + (this->ty * y));
HXLINE(  50)			bool _hx_tmp2;
HXDLIN(  50)			if (!((s <= 0))) {
HXLINE(  50)				_hx_tmp2 = (t <= 0);
            			}
            			else {
HXLINE(  50)				_hx_tmp2 = true;
            			}
HXDLIN(  50)			if (_hx_tmp2) {
HXLINE(  51)				return false;
            			}
            			else {
HXLINE(  53)				if (((s + t) < this->A)) {
HXLINE(  53)					return true;
            				}
            				else {
HXLINE(  53)					return false;
            				}
            			}
            		}
            		else {
HXLINE(  56)			return false;
            		}
HXLINE(  47)		return false;
            	}


HX_DEFINE_DYNAMIC_FUNC2(HitTri_obj,hit,return )


::hx::ObjectPtr< HitTri_obj > HitTri_obj::__new(Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated) {
	::hx::ObjectPtr< HitTri_obj > __this = new HitTri_obj();
	__this->__construct(ax,ay,bx,by,cx,cy,__o_preCalculated);
	return __this;
}

::hx::ObjectPtr< HitTri_obj > HitTri_obj::__alloc(::hx::Ctx *_hx_ctx,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated) {
	HitTri_obj *__this = (HitTri_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(HitTri_obj), true, "pi_xy.algo.HitTri"));
	*(void **)__this = HitTri_obj::_hx_vtable;
	__this->__construct(ax,ay,bx,by,cx,cy,__o_preCalculated);
	return __this;
}

HitTri_obj::HitTri_obj()
{
}

void HitTri_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(HitTri);
	HX_MARK_MEMBER_NAME(preCalculated,"preCalculated");
	HX_MARK_MEMBER_NAME(s0,"s0");
	HX_MARK_MEMBER_NAME(sx,"sx");
	HX_MARK_MEMBER_NAME(sy,"sy");
	HX_MARK_MEMBER_NAME(t0,"t0");
	HX_MARK_MEMBER_NAME(tx,"tx");
	HX_MARK_MEMBER_NAME(ty,"ty");
	HX_MARK_MEMBER_NAME(A,"A");
	HX_MARK_MEMBER_NAME(xIter3,"xIter3");
	HX_MARK_MEMBER_NAME(yIter3,"yIter3");
	HX_MARK_MEMBER_NAME(undoImage,"undoImage");
	HX_MARK_MEMBER_NAME(undoX,"undoX");
	HX_MARK_MEMBER_NAME(undoY,"undoY");
	HX_MARK_END_CLASS();
}

void HitTri_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(preCalculated,"preCalculated");
	HX_VISIT_MEMBER_NAME(s0,"s0");
	HX_VISIT_MEMBER_NAME(sx,"sx");
	HX_VISIT_MEMBER_NAME(sy,"sy");
	HX_VISIT_MEMBER_NAME(t0,"t0");
	HX_VISIT_MEMBER_NAME(tx,"tx");
	HX_VISIT_MEMBER_NAME(ty,"ty");
	HX_VISIT_MEMBER_NAME(A,"A");
	HX_VISIT_MEMBER_NAME(xIter3,"xIter3");
	HX_VISIT_MEMBER_NAME(yIter3,"yIter3");
	HX_VISIT_MEMBER_NAME(undoImage,"undoImage");
	HX_VISIT_MEMBER_NAME(undoX,"undoX");
	HX_VISIT_MEMBER_NAME(undoY,"undoY");
}

::hx::Val HitTri_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"A") ) { return ::hx::Val( A ); }
		break;
	case 2:
		if (HX_FIELD_EQ(inName,"s0") ) { return ::hx::Val( s0 ); }
		if (HX_FIELD_EQ(inName,"sx") ) { return ::hx::Val( sx ); }
		if (HX_FIELD_EQ(inName,"sy") ) { return ::hx::Val( sy ); }
		if (HX_FIELD_EQ(inName,"t0") ) { return ::hx::Val( t0 ); }
		if (HX_FIELD_EQ(inName,"tx") ) { return ::hx::Val( tx ); }
		if (HX_FIELD_EQ(inName,"ty") ) { return ::hx::Val( ty ); }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"hit") ) { return ::hx::Val( hit_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"undoX") ) { return ::hx::Val( undoX ); }
		if (HX_FIELD_EQ(inName,"undoY") ) { return ::hx::Val( undoY ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"xIter3") ) { return ::hx::Val( xIter3 ); }
		if (HX_FIELD_EQ(inName,"yIter3") ) { return ::hx::Val( yIter3 ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"undoImage") ) { return ::hx::Val( undoImage ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"preCalculated") ) { return ::hx::Val( preCalculated ); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"preCalculateValues") ) { return ::hx::Val( preCalculateValues_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val HitTri_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"A") ) { A=inValue.Cast< Float >(); return inValue; }
		break;
	case 2:
		if (HX_FIELD_EQ(inName,"s0") ) { s0=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"sx") ) { sx=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"sy") ) { sy=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"t0") ) { t0=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"tx") ) { tx=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"ty") ) { ty=inValue.Cast< Float >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"undoX") ) { undoX=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"undoY") ) { undoY=inValue.Cast< int >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"xIter3") ) { xIter3=inValue.Cast<  ::pi_xy::iter::IntIterStart >(); return inValue; }
		if (HX_FIELD_EQ(inName,"yIter3") ) { yIter3=inValue.Cast<  ::pi_xy::iter::IntIterStart >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"undoImage") ) { undoImage=inValue.Cast<  ::pi_xy::ImageStruct >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"preCalculated") ) { preCalculated=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void HitTri_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("preCalculated",41,32,bf,51));
	outFields->push(HX_("s0",5d,64,00,00));
	outFields->push(HX_("sx",a5,64,00,00));
	outFields->push(HX_("sy",a6,64,00,00));
	outFields->push(HX_("t0",3c,65,00,00));
	outFields->push(HX_("tx",84,65,00,00));
	outFields->push(HX_("ty",85,65,00,00));
	outFields->push(HX_("A",41,00,00,00));
	outFields->push(HX_("xIter3",83,6c,0d,50));
	outFields->push(HX_("yIter3",e2,c8,68,b6));
	outFields->push(HX_("undoImage",97,06,98,ec));
	outFields->push(HX_("undoX",b4,99,e3,a6));
	outFields->push(HX_("undoY",b5,99,e3,a6));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo HitTri_obj_sMemberStorageInfo[] = {
	{::hx::fsBool,(int)offsetof(HitTri_obj,preCalculated),HX_("preCalculated",41,32,bf,51)},
	{::hx::fsFloat,(int)offsetof(HitTri_obj,s0),HX_("s0",5d,64,00,00)},
	{::hx::fsFloat,(int)offsetof(HitTri_obj,sx),HX_("sx",a5,64,00,00)},
	{::hx::fsFloat,(int)offsetof(HitTri_obj,sy),HX_("sy",a6,64,00,00)},
	{::hx::fsFloat,(int)offsetof(HitTri_obj,t0),HX_("t0",3c,65,00,00)},
	{::hx::fsFloat,(int)offsetof(HitTri_obj,tx),HX_("tx",84,65,00,00)},
	{::hx::fsFloat,(int)offsetof(HitTri_obj,ty),HX_("ty",85,65,00,00)},
	{::hx::fsFloat,(int)offsetof(HitTri_obj,A),HX_("A",41,00,00,00)},
	{::hx::fsObject /*  ::pi_xy::iter::IntIterStart */ ,(int)offsetof(HitTri_obj,xIter3),HX_("xIter3",83,6c,0d,50)},
	{::hx::fsObject /*  ::pi_xy::iter::IntIterStart */ ,(int)offsetof(HitTri_obj,yIter3),HX_("yIter3",e2,c8,68,b6)},
	{::hx::fsObject /*  ::pi_xy::ImageStruct */ ,(int)offsetof(HitTri_obj,undoImage),HX_("undoImage",97,06,98,ec)},
	{::hx::fsInt,(int)offsetof(HitTri_obj,undoX),HX_("undoX",b4,99,e3,a6)},
	{::hx::fsInt,(int)offsetof(HitTri_obj,undoY),HX_("undoY",b5,99,e3,a6)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *HitTri_obj_sStaticStorageInfo = 0;
#endif

static ::String HitTri_obj_sMemberFields[] = {
	HX_("preCalculated",41,32,bf,51),
	HX_("s0",5d,64,00,00),
	HX_("sx",a5,64,00,00),
	HX_("sy",a6,64,00,00),
	HX_("t0",3c,65,00,00),
	HX_("tx",84,65,00,00),
	HX_("ty",85,65,00,00),
	HX_("A",41,00,00,00),
	HX_("xIter3",83,6c,0d,50),
	HX_("yIter3",e2,c8,68,b6),
	HX_("undoImage",97,06,98,ec),
	HX_("undoX",b4,99,e3,a6),
	HX_("undoY",b5,99,e3,a6),
	HX_("preCalculateValues",05,65,b9,57),
	HX_("hit",53,46,4f,00),
	::String(null()) };

::hx::Class HitTri_obj::__mClass;

void HitTri_obj::__register()
{
	HitTri_obj _hx_dummy;
	HitTri_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.algo.HitTri",cc,2b,ac,f4);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(HitTri_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< HitTri_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = HitTri_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = HitTri_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace algo