// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_IntIterator
#include <IntIterator.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_iterMagic_IntIterStart
#include <iterMagic/IntIterStart.h>
#endif
#ifndef INCLUDED_iterMagic_IntIterYX
#include <iterMagic/IntIterYX.h>
#endif
#ifndef INCLUDED_iterMagic__IteratorRangeXY_IteratorRangeYX_Impl_
#include <iterMagic/_IteratorRangeXY/IteratorRangeYX_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_125__new,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","_new",0x0442ea85,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_._new","iterMagic/IteratorRangeXY.hx",125,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_132_fromIterator2D,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","fromIterator2D",0x3bc6c96e,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.fromIterator2D","iterMagic/IteratorRangeXY.hx",132,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_136_fromRect2D,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","fromRect2D",0x376a5724,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.fromRect2D","iterMagic/IteratorRangeXY.hx",136,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_143_fromRect2Df,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","fromRect2Df",0x45a1e8c2,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.fromRect2Df","iterMagic/IteratorRangeXY.hx",143,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_150_hasNext,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","hasNext",0xcd419ec9,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.hasNext","iterMagic/IteratorRangeXY.hx",150,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_153_next,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","next",0x0e265a17,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.next","iterMagic/IteratorRangeXY.hx",153,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_166_get_length,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","get_length",0x85c54cd3,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.get_length","iterMagic/IteratorRangeXY.hx",166,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_170_contains,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","contains",0xd31a9143,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.contains","iterMagic/IteratorRangeXY.hx",170,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_175_containsF,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","containsF",0xe42489a3,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.containsF","iterMagic/IteratorRangeXY.hx",175,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_180_getRangeX,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","getRangeX",0x5898f18d,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.getRangeX","iterMagic/IteratorRangeXY.hx",180,0x59e34148)
HX_LOCAL_STACK_FRAME(_hx_pos_90e0f0bc225fc7bf_184_getRangeY,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_","getRangeY",0x5898f18e,"iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_.getRangeY","iterMagic/IteratorRangeXY.hx",184,0x59e34148)
namespace iterMagic{
namespace _IteratorRangeXY{

void IteratorRangeYX_Impl__obj::__construct() { }

Dynamic IteratorRangeYX_Impl__obj::__CreateEmpty() { return new IteratorRangeYX_Impl__obj; }

void *IteratorRangeYX_Impl__obj::_hx_vtable = 0;

Dynamic IteratorRangeYX_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< IteratorRangeYX_Impl__obj > _hx_result = new IteratorRangeYX_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool IteratorRangeYX_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x4b94a148;
}

 ::iterMagic::IntIterYX IteratorRangeYX_Impl__obj::_new( ::iterMagic::IntIterStart xRange, ::iterMagic::IntIterStart yRange){
            	HX_GC_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_125__new)
HXDLIN( 125)		return  ::iterMagic::IntIterYX_obj::__alloc( HX_CTX ,xRange,yRange);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(IteratorRangeYX_Impl__obj,_new,return )

 ::iterMagic::IntIterYX IteratorRangeYX_Impl__obj::fromIterator2D( ::Dynamic two){
            	HX_GC_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_132_fromIterator2D)
HXDLIN( 132)		 ::IntIterator ii = ( ( ::IntIterator)(two->__Field(HX_("outer",7b,b8,28,37),::hx::paccDynamic)) );
HXDLIN( 132)		 ::iterMagic::IntIterStart this1 =  ::iterMagic::IntIterStart_obj::__alloc( HX_CTX ,ii->min,ii->max);
HXDLIN( 132)		 ::IntIterator ii1 = ( ( ::IntIterator)(two->__Field(HX_("inner",96,31,1c,be),::hx::paccDynamic)) );
HXDLIN( 132)		return  ::iterMagic::IntIterYX_obj::__alloc( HX_CTX ,this1, ::iterMagic::IntIterStart_obj::__alloc( HX_CTX ,ii1->min,ii1->max));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRangeYX_Impl__obj,fromIterator2D,return )

 ::iterMagic::IntIterYX IteratorRangeYX_Impl__obj::fromRect2D( ::Dynamic r){
            	HX_GC_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_136_fromRect2D)
HXLINE( 137)		int xmax = ( (int)(((r->__Field(HX_("x",78,00,00,00),::hx::paccDynamic) + r->__Field(HX_("w",77,00,00,00),::hx::paccDynamic)) + 1)) );
HXLINE( 138)		int ymax = ( (int)(((r->__Field(HX_("y",79,00,00,00),::hx::paccDynamic) + r->__Field(HX_("h",68,00,00,00),::hx::paccDynamic)) + 1)) );
HXLINE( 139)		int ii_min = ( (int)(r->__Field(HX_("x",78,00,00,00),::hx::paccDynamic)) );
HXDLIN( 139)		int ii_max = xmax;
HXDLIN( 139)		 ::iterMagic::IntIterStart this1 =  ::iterMagic::IntIterStart_obj::__alloc( HX_CTX ,ii_min,ii_max);
HXDLIN( 139)		int ii_min1 = ( (int)(r->__Field(HX_("y",79,00,00,00),::hx::paccDynamic)) );
HXDLIN( 139)		int ii_max1 = ymax;
HXDLIN( 139)		return  ::iterMagic::IntIterYX_obj::__alloc( HX_CTX ,this1, ::iterMagic::IntIterStart_obj::__alloc( HX_CTX ,ii_min1,ii_max1));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRangeYX_Impl__obj,fromRect2D,return )

 ::iterMagic::IntIterYX IteratorRangeYX_Impl__obj::fromRect2Df( ::Dynamic r){
            	HX_GC_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_143_fromRect2Df)
HXLINE( 144)		int xmax = ::Std_obj::_hx_int(( (Float)(((r->__Field(HX_("x",78,00,00,00),::hx::paccDynamic) + r->__Field(HX_("w",77,00,00,00),::hx::paccDynamic)) + 1)) ));
HXLINE( 145)		int ymax = ::Std_obj::_hx_int(( (Float)(((r->__Field(HX_("y",79,00,00,00),::hx::paccDynamic) + r->__Field(HX_("h",68,00,00,00),::hx::paccDynamic)) + 1)) ));
HXLINE( 146)		int ii_min = ::Std_obj::_hx_int(( (Float)(r->__Field(HX_("x",78,00,00,00),::hx::paccDynamic)) ));
HXDLIN( 146)		int ii_max = xmax;
HXDLIN( 146)		 ::iterMagic::IntIterStart this1 =  ::iterMagic::IntIterStart_obj::__alloc( HX_CTX ,ii_min,ii_max);
HXDLIN( 146)		int ii_min1 = ::Std_obj::_hx_int(( (Float)(r->__Field(HX_("y",79,00,00,00),::hx::paccDynamic)) ));
HXDLIN( 146)		int ii_max1 = ymax;
HXDLIN( 146)		return  ::iterMagic::IntIterYX_obj::__alloc( HX_CTX ,this1, ::iterMagic::IntIterStart_obj::__alloc( HX_CTX ,ii_min1,ii_max1));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRangeYX_Impl__obj,fromRect2Df,return )

bool IteratorRangeYX_Impl__obj::hasNext( ::iterMagic::IntIterYX this1){
            	HX_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_150_hasNext)
HXDLIN( 150)		 ::IntIterator _this = this1->iter;
HXDLIN( 150)		return (_this->min < _this->max);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRangeYX_Impl__obj,hasNext,return )

int IteratorRangeYX_Impl__obj::next( ::iterMagic::IntIterYX this1){
            	HX_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_153_next)
HXLINE( 154)		int i = this1->iter->min++;
HXLINE( 155)		if ((this1->x > this1->xMax)) {
HXLINE( 156)			this1->x = this1->xReset;
HXLINE( 157)			this1->y++;
            		}
HXLINE( 159)		this1->x++;
HXLINE( 160)		return i;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRangeYX_Impl__obj,next,return )

int IteratorRangeYX_Impl__obj::get_length( ::iterMagic::IntIterYX this1){
            	HX_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_166_get_length)
HXDLIN( 166)		return this1->iter->max;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRangeYX_Impl__obj,get_length,return )

bool IteratorRangeYX_Impl__obj::contains( ::iterMagic::IntIterYX this1,int x,int y){
            	HX_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_170_contains)
HXDLIN( 170)		bool _hx_tmp;
HXDLIN( 170)		if ((x > (this1->xReset - 1))) {
HXDLIN( 170)			_hx_tmp = (x < this1->xMax);
            		}
            		else {
HXDLIN( 170)			_hx_tmp = false;
            		}
HXDLIN( 170)		if (_hx_tmp) {
HXLINE( 171)			if ((y > (this1->yReset - 1))) {
HXLINE( 171)				return (y < this1->yMax);
            			}
            			else {
HXLINE( 171)				return false;
            			}
            		}
            		else {
HXDLIN( 170)			return false;
            		}
HXDLIN( 170)		return false;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(IteratorRangeYX_Impl__obj,contains,return )

bool IteratorRangeYX_Impl__obj::containsF( ::iterMagic::IntIterYX this1,Float x,Float y){
            	HX_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_175_containsF)
HXDLIN( 175)		bool _hx_tmp;
HXDLIN( 175)		if ((x > (this1->xReset - 1))) {
HXDLIN( 175)			_hx_tmp = (x < this1->xMax);
            		}
            		else {
HXDLIN( 175)			_hx_tmp = false;
            		}
HXDLIN( 175)		if (_hx_tmp) {
HXLINE( 176)			if ((y > (this1->yReset - 1))) {
HXLINE( 176)				return (y < this1->yMax);
            			}
            			else {
HXLINE( 176)				return false;
            			}
            		}
            		else {
HXDLIN( 175)			return false;
            		}
HXDLIN( 175)		return false;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(IteratorRangeYX_Impl__obj,containsF,return )

 ::iterMagic::IntIterStart IteratorRangeYX_Impl__obj::getRangeX( ::iterMagic::IntIterYX this1){
            	HX_GC_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_180_getRangeX)
HXDLIN( 180)		int ii_min = this1->xReset;
HXDLIN( 180)		int ii_max = (this1->xMax - 1);
HXDLIN( 180)		return  ::iterMagic::IntIterStart_obj::__alloc( HX_CTX ,ii_min,ii_max);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRangeYX_Impl__obj,getRangeX,return )

 ::iterMagic::IntIterStart IteratorRangeYX_Impl__obj::getRangeY( ::iterMagic::IntIterYX this1){
            	HX_GC_STACKFRAME(&_hx_pos_90e0f0bc225fc7bf_184_getRangeY)
HXDLIN( 184)		int ii_min = this1->yReset;
HXDLIN( 184)		int ii_max = (this1->yMax - 1);
HXDLIN( 184)		return  ::iterMagic::IntIterStart_obj::__alloc( HX_CTX ,ii_min,ii_max);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(IteratorRangeYX_Impl__obj,getRangeY,return )


IteratorRangeYX_Impl__obj::IteratorRangeYX_Impl__obj()
{
}

bool IteratorRangeYX_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"_new") ) { outValue = _new_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"next") ) { outValue = next_dyn(); return true; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"hasNext") ) { outValue = hasNext_dyn(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"contains") ) { outValue = contains_dyn(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"containsF") ) { outValue = containsF_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"getRangeX") ) { outValue = getRangeX_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"getRangeY") ) { outValue = getRangeY_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"fromRect2D") ) { outValue = fromRect2D_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"get_length") ) { outValue = get_length_dyn(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"fromRect2Df") ) { outValue = fromRect2Df_dyn(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"fromIterator2D") ) { outValue = fromIterator2D_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *IteratorRangeYX_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *IteratorRangeYX_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class IteratorRangeYX_Impl__obj::__mClass;

static ::String IteratorRangeYX_Impl__obj_sStaticFields[] = {
	HX_("_new",61,15,1f,3f),
	HX_("fromIterator2D",4a,9f,5f,5e),
	HX_("fromRect2D",00,0f,34,41),
	HX_("fromRect2Df",66,11,59,cc),
	HX_("hasNext",6d,a5,46,18),
	HX_("next",f3,84,02,49),
	HX_("get_length",af,04,8f,8f),
	HX_("contains",1f,5a,7b,2c),
	HX_("containsF",47,81,73,bf),
	HX_("getRangeX",31,e9,e7,33),
	HX_("getRangeY",32,e9,e7,33),
	::String(null())
};

void IteratorRangeYX_Impl__obj::__register()
{
	IteratorRangeYX_Impl__obj _hx_dummy;
	IteratorRangeYX_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("iterMagic._IteratorRangeXY.IteratorRangeYX_Impl_",ca,9d,08,a6);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &IteratorRangeYX_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(IteratorRangeYX_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< IteratorRangeYX_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = IteratorRangeYX_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = IteratorRangeYX_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace iterMagic
} // end namespace _IteratorRangeXY
