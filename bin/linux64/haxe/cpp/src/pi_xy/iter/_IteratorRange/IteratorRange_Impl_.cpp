// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_IntIterator
#include <IntIterator.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_pi_xy_iter_IntIterStart
#include <pi_xy/iter/IntIterStart.h>
#endif
#ifndef INCLUDED_pi_xy_iter__IteratorRange_IteratorRange_Impl_
#include <pi_xy/iter/_IteratorRange/IteratorRange_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_20_startLength,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","startLength",0xa24e6aba,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.startLength","pi_xy/iter/IteratorRange.hx",20,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_22__new,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","_new",0x048ed74f,"pi_xy.iter._IteratorRange.IteratorRange_Impl_._new","pi_xy/iter/IteratorRange.hx",22,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_29_fromIterator,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","fromIterator",0x9cb98566,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.fromIterator","pi_xy/iter/IteratorRange.hx",29,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_33_toIterStart,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","toIterStart",0x76059301,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.toIterStart","pi_xy/iter/IteratorRange.hx",33,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_36_iterator,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","iterator",0x9bdc9adc,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.iterator","pi_xy/iter/IteratorRange.hx",36,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_40_adding,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","adding",0x716ffecf,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.adding","pi_xy/iter/IteratorRange.hx",40,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_43_add,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","add",0xe6c547f3,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.add","pi_xy/iter/IteratorRange.hx",43,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_52_get_length,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","get_length",0xe9b9ed1d,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.get_length","pi_xy/iter/IteratorRange.hx",52,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_55_set_length,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","set_length",0xed378b91,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.set_length","pi_xy/iter/IteratorRange.hx",55,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_61_contains,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","contains",0x34bdab0d,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.contains","pi_xy/iter/IteratorRange.hx",61,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_65_containsF,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","containsF",0xf1380099,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.containsF","pi_xy/iter/IteratorRange.hx",65,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_69_isWithin,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","isWithin",0xb732cbe3,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.isWithin","pi_xy/iter/IteratorRange.hx",69,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_72_moveRange,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","moveRange",0xd3aaf43e,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.moveRange","pi_xy/iter/IteratorRange.hx",72,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_78_addAssign,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","addAssign",0x35eefa82,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.addAssign","pi_xy/iter/IteratorRange.hx",78,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_85_minusAssign,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","minusAssign",0x3f27a691,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.minusAssign","pi_xy/iter/IteratorRange.hx",85,0xd40332de)
HX_LOCAL_STACK_FRAME(_hx_pos_5271af190b0f6142_88_ifContainMove,"pi_xy.iter._IteratorRange.IteratorRange_Impl_","ifContainMove",0x3c04587a,"pi_xy.iter._IteratorRange.IteratorRange_Impl_.ifContainMove","pi_xy/iter/IteratorRange.hx",88,0xd40332de)
namespace pi_xy{
namespace iter{
namespace _IteratorRange{

void IteratorRange_Impl__obj::__construct() { }

Dynamic IteratorRange_Impl__obj::__CreateEmpty() { return new IteratorRange_Impl__obj; }

void *IteratorRange_Impl__obj::_hx_vtable = 0;

Dynamic IteratorRange_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< IteratorRange_Impl__obj > _hx_result = new IteratorRange_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool IteratorRange_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x774a0404;
}

 ::pi_xy::iter::IntIterStart IteratorRange_Impl__obj::startLength(int min,int len){
            	HX_GC_STACKFRAME(&_hx_pos_5271af190b0f6142_20_startLength)
HXDLIN(  20)		return  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,min,((min + len) - 1));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,startLength,return )

 ::pi_xy::iter::IntIterStart IteratorRange_Impl__obj::_new(int min,int max){
            	HX_GC_STACKFRAME(&_hx_pos_5271af190b0f6142_22__new)
HXDLIN(  22)		return  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,min,max);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,_new,return )

 ::pi_xy::iter::IntIterStart IteratorRange_Impl__obj::fromIterator( ::IntIterator ii){
            	HX_GC_STACKFRAME(&_hx_pos_5271af190b0f6142_29_fromIterator)
HXDLIN(  29)		return  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,ii->min,ii->max);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRange_Impl__obj,fromIterator,return )

 ::pi_xy::iter::IntIterStart IteratorRange_Impl__obj::toIterStart( ::pi_xy::iter::IntIterStart this1){
            	HX_GC_STACKFRAME(&_hx_pos_5271af190b0f6142_33_toIterStart)
HXDLIN(  33)		return  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,this1->start,this1->max);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRange_Impl__obj,toIterStart,return )

 ::IntIterator IteratorRange_Impl__obj::iterator( ::pi_xy::iter::IntIterStart this1){
            	HX_GC_STACKFRAME(&_hx_pos_5271af190b0f6142_36_iterator)
HXDLIN(  36)		return  ::IntIterator_obj::__alloc( HX_CTX ,this1->start,this1->max);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRange_Impl__obj,iterator,return )

 ::pi_xy::iter::IntIterStart IteratorRange_Impl__obj::adding( ::pi_xy::iter::IntIterStart a, ::pi_xy::iter::IntIterStart b){
            	HX_GC_STACKFRAME(&_hx_pos_5271af190b0f6142_40_adding)
HXDLIN(  40)		int begin = ::Std_obj::_hx_int(::Math_obj::min(( (Float)(a->start) ),( (Float)(b->max) )));
HXDLIN(  40)		int end;
HXDLIN(  40)		if ((begin == a->start)) {
HXDLIN(  40)			end = b->max;
            		}
            		else {
HXDLIN(  40)			end = a->max;
            		}
HXDLIN(  40)		return  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,begin,end);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,adding,return )

 ::pi_xy::iter::IntIterStart IteratorRange_Impl__obj::add( ::pi_xy::iter::IntIterStart this1, ::pi_xy::iter::IntIterStart b){
            	HX_GC_STACKFRAME(&_hx_pos_5271af190b0f6142_43_add)
HXLINE(  44)		int begin = ::Std_obj::_hx_int(::Math_obj::min(( (Float)(this1->start) ),( (Float)(b->max) )));
HXLINE(  45)		int end;
HXDLIN(  45)		if ((begin == this1->start)) {
HXLINE(  45)			end = b->max;
            		}
            		else {
HXLINE(  45)			end = this1->max;
            		}
HXLINE(  46)		return  ::pi_xy::iter::IntIterStart_obj::__alloc( HX_CTX ,begin,end);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,add,return )

int IteratorRange_Impl__obj::get_length( ::pi_xy::iter::IntIterStart this1){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_52_get_length)
HXDLIN(  52)		return ((this1->max - this1->start) + 1);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRange_Impl__obj,get_length,return )

int IteratorRange_Impl__obj::set_length( ::pi_xy::iter::IntIterStart this1,int l){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_55_set_length)
HXLINE(  56)		this1->max = (l - 1);
HXLINE(  57)		return l;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,set_length,return )

bool IteratorRange_Impl__obj::contains( ::pi_xy::iter::IntIterStart this1,int v){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_61_contains)
HXDLIN(  61)		if ((v > (this1->start - 1))) {
HXDLIN(  61)			return (v < (this1->max + 1));
            		}
            		else {
HXDLIN(  61)			return false;
            		}
HXDLIN(  61)		return false;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,contains,return )

bool IteratorRange_Impl__obj::containsF( ::pi_xy::iter::IntIterStart this1,Float v){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_65_containsF)
HXDLIN(  65)		if ((v > (this1->start - 1))) {
HXDLIN(  65)			return (v < (this1->max + 1));
            		}
            		else {
HXDLIN(  65)			return false;
            		}
HXDLIN(  65)		return false;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,containsF,return )

bool IteratorRange_Impl__obj::isWithin( ::pi_xy::iter::IntIterStart this1, ::pi_xy::iter::IntIterStart ir){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_69_isWithin)
HXDLIN(  69)		int v = ir->start;
HXDLIN(  69)		bool _hx_tmp;
HXDLIN(  69)		if ((v > (this1->start - 1))) {
HXDLIN(  69)			_hx_tmp = (v < (this1->max + 1));
            		}
            		else {
HXDLIN(  69)			_hx_tmp = false;
            		}
HXDLIN(  69)		if (_hx_tmp) {
HXDLIN(  69)			int v1 = ir->max;
HXDLIN(  69)			if ((v1 > (this1->start - 1))) {
HXDLIN(  69)				return (v1 < (this1->max + 1));
            			}
            			else {
HXDLIN(  69)				return false;
            			}
            		}
            		else {
HXDLIN(  69)			return false;
            		}
HXDLIN(  69)		return false;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,isWithin,return )

void IteratorRange_Impl__obj::moveRange( ::pi_xy::iter::IntIterStart this1,int v){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_72_moveRange)
HXLINE(  73)		 ::pi_xy::iter::IntIterStart this2 = this1;
HXDLIN(  73)		this2->start = (this2->start + v);
HXLINE(  74)		 ::pi_xy::iter::IntIterStart this3 = this1;
HXDLIN(  74)		this3->max = (this3->max + v);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,moveRange,(void))

 ::pi_xy::iter::IntIterStart IteratorRange_Impl__obj::addAssign( ::pi_xy::iter::IntIterStart a,int v){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_78_addAssign)
HXLINE(  79)		{
HXLINE(  79)			 ::pi_xy::iter::IntIterStart a1 = a;
HXDLIN(  79)			a1->start = (a1->start + v);
HXDLIN(  79)			 ::pi_xy::iter::IntIterStart a2 = a;
HXDLIN(  79)			a2->max = (a2->max + v);
            		}
HXLINE(  80)		return a;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,addAssign,return )

 ::pi_xy::iter::IntIterStart IteratorRange_Impl__obj::minusAssign( ::pi_xy::iter::IntIterStart a,int v){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_85_minusAssign)
HXDLIN(  85)		int v1 = -(v);
HXDLIN(  85)		{
HXDLIN(  85)			 ::pi_xy::iter::IntIterStart a1 = a;
HXDLIN(  85)			a1->start = (a1->start + v1);
HXDLIN(  85)			 ::pi_xy::iter::IntIterStart a2 = a;
HXDLIN(  85)			a2->max = (a2->max + v1);
            		}
HXDLIN(  85)		return a;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRange_Impl__obj,minusAssign,return )

bool IteratorRange_Impl__obj::ifContainMove( ::pi_xy::iter::IntIterStart this1,int v,int amount){
            	HX_STACKFRAME(&_hx_pos_5271af190b0f6142_88_ifContainMove)
HXLINE(  89)		bool ifHas;
HXDLIN(  89)		if ((v > (this1->start - 1))) {
HXLINE(  89)			ifHas = (v < (this1->max + 1));
            		}
            		else {
HXLINE(  89)			ifHas = false;
            		}
HXLINE(  90)		if (ifHas) {
HXLINE(  90)			 ::pi_xy::iter::IntIterStart this2 = this1;
HXDLIN(  90)			this2->start = (this2->start + amount);
HXDLIN(  90)			 ::pi_xy::iter::IntIterStart this3 = this1;
HXDLIN(  90)			this3->max = (this3->max + amount);
            		}
HXLINE(  91)		return ifHas;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(IteratorRange_Impl__obj,ifContainMove,return )


IteratorRange_Impl__obj::IteratorRange_Impl__obj()
{
}

bool IteratorRange_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"add") ) { outValue = add_dyn(); return true; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"_new") ) { outValue = _new_dyn(); return true; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"adding") ) { outValue = adding_dyn(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"iterator") ) { outValue = iterator_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"contains") ) { outValue = contains_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"isWithin") ) { outValue = isWithin_dyn(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"containsF") ) { outValue = containsF_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"moveRange") ) { outValue = moveRange_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"addAssign") ) { outValue = addAssign_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"get_length") ) { outValue = get_length_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"set_length") ) { outValue = set_length_dyn(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"startLength") ) { outValue = startLength_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"toIterStart") ) { outValue = toIterStart_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"minusAssign") ) { outValue = minusAssign_dyn(); return true; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"fromIterator") ) { outValue = fromIterator_dyn(); return true; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"ifContainMove") ) { outValue = ifContainMove_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *IteratorRange_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *IteratorRange_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class IteratorRange_Impl__obj::__mClass;

static ::String IteratorRange_Impl__obj_sStaticFields[] = {
	HX_("startLength",e8,f2,ed,16),
	HX_("_new",61,15,1f,3f),
	HX_("fromIterator",78,25,b1,33),
	HX_("toIterStart",2f,1b,a5,ea),
	HX_("iterator",ee,49,9a,93),
	HX_("adding",61,65,19,9f),
	HX_("add",21,f2,49,00),
	HX_("get_length",af,04,8f,8f),
	HX_("set_length",23,a3,0c,93),
	HX_("contains",1f,5a,7b,2c),
	HX_("containsF",47,81,73,bf),
	HX_("isWithin",f5,7a,f0,ae),
	HX_("moveRange",ec,74,e6,a1),
	HX_("addAssign",30,7b,2a,04),
	HX_("minusAssign",bf,2e,c7,b3),
	HX_("ifContainMove",28,c8,b8,bd),
	::String(null())
};

void IteratorRange_Impl__obj::__register()
{
	IteratorRange_Impl__obj _hx_dummy;
	IteratorRange_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.iter._IteratorRange.IteratorRange_Impl_",40,e5,17,d4);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &IteratorRange_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(IteratorRange_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< IteratorRange_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = IteratorRange_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = IteratorRange_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace iter
} // end namespace _IteratorRange
