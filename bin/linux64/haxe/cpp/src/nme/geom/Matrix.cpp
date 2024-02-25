// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_nme_geom_Matrix
#include <nme/geom/Matrix.h>
#endif
#ifndef INCLUDED_nme_geom_Point
#include <nme/geom/Point.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_67be91a798c7677a_22_new,"nme.geom.Matrix","new",0xff26bf1d,"nme.geom.Matrix.new","nme/geom/Matrix.hx",22,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_32_copyFrom,"nme.geom.Matrix","copyFrom",0x51a28fe2,"nme.geom.Matrix.copyFrom","nme/geom/Matrix.hx",32,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_43_clone,"nme.geom.Matrix","clone",0xd4dceb5a,"nme.geom.Matrix.clone","nme/geom/Matrix.hx",43,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_59_concat,"nme.geom.Matrix","concat",0x25f32e77,"nme.geom.Matrix.concat","nme/geom/Matrix.hx",59,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_75_createBox,"nme.geom.Matrix","createBox",0xd9eaaeec,"nme.geom.Matrix.createBox","nme/geom/Matrix.hx",75,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_84_createGradientBox,"nme.geom.Matrix","createGradientBox",0x9c5d4bdc,"nme.geom.Matrix.createGradientBox","nme/geom/Matrix.hx",84,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_109_deltaTransformPoint,"nme.geom.Matrix","deltaTransformPoint",0xb4084619,"nme.geom.Matrix.deltaTransformPoint","nme/geom/Matrix.hx",109,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_113_identity,"nme.geom.Matrix","identity",0x4270c961,"nme.geom.Matrix.identity","nme/geom/Matrix.hx",113,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_123_invert,"nme.geom.Matrix","invert",0xfdfc0c79,"nme.geom.Matrix.invert","nme/geom/Matrix.hx",123,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_150_mult,"nme.geom.Matrix","mult",0x42235e93,"nme.geom.Matrix.mult","nme/geom/Matrix.hx",150,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_177_rotate,"nme.geom.Matrix","rotate",0x29436bbe,"nme.geom.Matrix.rotate","nme/geom/Matrix.hx",177,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_202_scale,"nme.geom.Matrix","scale",0x0548a687,"nme.geom.Matrix.scale","nme/geom/Matrix.hx",202,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_214_setRotation,"nme.geom.Matrix","setRotation",0x85927abd,"nme.geom.Matrix.setRotation","nme/geom/Matrix.hx",214,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_223_setTo,"nme.geom.Matrix","setTo",0x06a969ba,"nme.geom.Matrix.setTo","nme/geom/Matrix.hx",223,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_235_transformPoint,"nme.geom.Matrix","transformPoint",0x6dbd8fa7,"nme.geom.Matrix.transformPoint","nme/geom/Matrix.hx",235,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_239_translate,"nme.geom.Matrix","translate",0xd991f1cb,"nme.geom.Matrix.translate","nme/geom/Matrix.hx",239,0x6fac6a93)
HX_LOCAL_STACK_FRAME(_hx_pos_67be91a798c7677a_243_toString,"nme.geom.Matrix","toString",0xc1b054cf,"nme.geom.Matrix.toString","nme/geom/Matrix.hx",243,0x6fac6a93)
namespace nme{
namespace geom{

void Matrix_obj::__construct( ::Dynamic in_a, ::Dynamic in_b, ::Dynamic in_c, ::Dynamic in_d, ::Dynamic in_tx, ::Dynamic in_ty){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_22_new)
HXLINE(  23)		Float _hx_tmp;
HXDLIN(  23)		if (::hx::IsNull( in_a )) {
HXLINE(  23)			_hx_tmp = ((Float)1.0);
            		}
            		else {
HXLINE(  23)			_hx_tmp = ( (Float)(in_a) );
            		}
HXDLIN(  23)		this->a = _hx_tmp;
HXLINE(  24)		Float _hx_tmp1;
HXDLIN(  24)		if (::hx::IsNull( in_b )) {
HXLINE(  24)			_hx_tmp1 = ((Float)0.0);
            		}
            		else {
HXLINE(  24)			_hx_tmp1 = ( (Float)(in_b) );
            		}
HXDLIN(  24)		this->b = _hx_tmp1;
HXLINE(  25)		Float _hx_tmp2;
HXDLIN(  25)		if (::hx::IsNull( in_c )) {
HXLINE(  25)			_hx_tmp2 = ((Float)0.0);
            		}
            		else {
HXLINE(  25)			_hx_tmp2 = ( (Float)(in_c) );
            		}
HXDLIN(  25)		this->c = _hx_tmp2;
HXLINE(  26)		Float _hx_tmp3;
HXDLIN(  26)		if (::hx::IsNull( in_d )) {
HXLINE(  26)			_hx_tmp3 = ((Float)1.0);
            		}
            		else {
HXLINE(  26)			_hx_tmp3 = ( (Float)(in_d) );
            		}
HXDLIN(  26)		this->d = _hx_tmp3;
HXLINE(  27)		Float _hx_tmp4;
HXDLIN(  27)		if (::hx::IsNull( in_tx )) {
HXLINE(  27)			_hx_tmp4 = ((Float)0.0);
            		}
            		else {
HXLINE(  27)			_hx_tmp4 = ( (Float)(in_tx) );
            		}
HXDLIN(  27)		this->tx = _hx_tmp4;
HXLINE(  28)		Float _hx_tmp5;
HXDLIN(  28)		if (::hx::IsNull( in_ty )) {
HXLINE(  28)			_hx_tmp5 = ((Float)0.0);
            		}
            		else {
HXLINE(  28)			_hx_tmp5 = ( (Float)(in_ty) );
            		}
HXDLIN(  28)		this->ty = _hx_tmp5;
            	}

Dynamic Matrix_obj::__CreateEmpty() { return new Matrix_obj; }

void *Matrix_obj::_hx_vtable = 0;

Dynamic Matrix_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Matrix_obj > _hx_result = new Matrix_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5]);
	return _hx_result;
}

bool Matrix_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x7fb44563;
}

void Matrix_obj::copyFrom( ::nme::geom::Matrix src){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_32_copyFrom)
HXLINE(  33)		this->a = src->a;
HXLINE(  34)		this->b = src->b;
HXLINE(  35)		this->c = src->c;
HXLINE(  36)		this->d = src->d;
HXLINE(  37)		this->tx = src->tx;
HXLINE(  38)		this->ty = src->ty;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Matrix_obj,copyFrom,(void))

 ::nme::geom::Matrix Matrix_obj::clone(){
            	HX_GC_STACKFRAME(&_hx_pos_67be91a798c7677a_43_clone)
HXDLIN(  43)		return  ::nme::geom::Matrix_obj::__alloc( HX_CTX ,this->a,this->b,this->c,this->d,this->tx,this->ty);
            	}


HX_DEFINE_DYNAMIC_FUNC0(Matrix_obj,clone,return )

void Matrix_obj::concat( ::nme::geom::Matrix m){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_59_concat)
HXLINE(  60)		Float a1 = ((this->a * m->a) + (this->b * m->c));
HXLINE(  61)		this->b = ((this->a * m->b) + (this->b * m->d));
HXLINE(  62)		this->a = a1;
HXLINE(  64)		Float c1 = ((this->c * m->a) + (this->d * m->c));
HXLINE(  65)		this->d = ((this->c * m->b) + (this->d * m->d));
HXLINE(  67)		this->c = c1;
HXLINE(  69)		Float tx1 = (((this->tx * m->a) + (this->ty * m->c)) + m->tx);
HXLINE(  70)		this->ty = (((this->tx * m->b) + (this->ty * m->d)) + m->ty);
HXLINE(  71)		this->tx = tx1;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Matrix_obj,concat,(void))

void Matrix_obj::createBox(Float scaleX,Float scaleY, ::Dynamic rotation, ::Dynamic tx, ::Dynamic ty){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_75_createBox)
HXLINE(  76)		this->a = scaleX;
HXLINE(  77)		this->d = scaleY;
HXLINE(  78)		Float _hx_tmp;
HXDLIN(  78)		if (::hx::IsNull( rotation )) {
HXLINE(  78)			_hx_tmp = ((Float)0.0);
            		}
            		else {
HXLINE(  78)			_hx_tmp = ( (Float)(rotation) );
            		}
HXDLIN(  78)		this->b = _hx_tmp;
HXLINE(  79)		Float _hx_tmp1;
HXDLIN(  79)		if (::hx::IsNull( tx )) {
HXLINE(  79)			_hx_tmp1 = ((Float)0.0);
            		}
            		else {
HXLINE(  79)			_hx_tmp1 = ( (Float)(tx) );
            		}
HXDLIN(  79)		this->tx = _hx_tmp1;
HXLINE(  80)		Float _hx_tmp2;
HXDLIN(  80)		if (::hx::IsNull( ty )) {
HXLINE(  80)			_hx_tmp2 = ((Float)0.0);
            		}
            		else {
HXLINE(  80)			_hx_tmp2 = ( (Float)(ty) );
            		}
HXDLIN(  80)		this->ty = _hx_tmp2;
            	}


HX_DEFINE_DYNAMIC_FUNC5(Matrix_obj,createBox,(void))

void Matrix_obj::createGradientBox(Float in_width,Float in_height, ::Dynamic rotation, ::Dynamic in_tx, ::Dynamic in_ty){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_84_createGradientBox)
HXLINE(  85)		this->a = (in_width / ((Float)1638.4));
HXLINE(  86)		this->d = (in_height / ((Float)1638.4));
HXLINE(  89)		bool _hx_tmp;
HXDLIN(  89)		if (::hx::IsNotNull( rotation )) {
HXLINE(  89)			_hx_tmp = ::hx::IsNotEq( rotation,((Float)0.0) );
            		}
            		else {
HXLINE(  89)			_hx_tmp = false;
            		}
HXDLIN(  89)		if (_hx_tmp) {
HXLINE(  91)			Float cos = ::Math_obj::cos(( (Float)(rotation) ));
HXLINE(  92)			Float sin = ::Math_obj::sin(( (Float)(rotation) ));
HXLINE(  93)			this->b = (sin * this->d);
HXLINE(  94)			this->c = (-(sin) * this->a);
HXLINE(  95)			 ::nme::geom::Matrix _hx_tmp1 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN(  95)			_hx_tmp1->a = (_hx_tmp1->a * cos);
HXLINE(  96)			 ::nme::geom::Matrix _hx_tmp2 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN(  96)			_hx_tmp2->d = (_hx_tmp2->d * cos);
            		}
            		else {
HXLINE( 100)			this->b = (this->c = ( (Float)(0) ));
            		}
HXLINE( 103)		Float _hx_tmp3;
HXDLIN( 103)		if (::hx::IsNotNull( in_tx )) {
HXLINE( 103)			_hx_tmp3 = (in_tx + (in_width / ( (Float)(2) )));
            		}
            		else {
HXLINE( 103)			_hx_tmp3 = (in_width / ( (Float)(2) ));
            		}
HXDLIN( 103)		this->tx = _hx_tmp3;
HXLINE( 104)		Float _hx_tmp4;
HXDLIN( 104)		if (::hx::IsNotNull( in_ty )) {
HXLINE( 104)			_hx_tmp4 = (in_ty + (in_height / ( (Float)(2) )));
            		}
            		else {
HXLINE( 104)			_hx_tmp4 = (in_height / ( (Float)(2) ));
            		}
HXDLIN( 104)		this->ty = _hx_tmp4;
            	}


HX_DEFINE_DYNAMIC_FUNC5(Matrix_obj,createGradientBox,(void))

 ::nme::geom::Point Matrix_obj::deltaTransformPoint( ::nme::geom::Point point){
            	HX_GC_STACKFRAME(&_hx_pos_67be91a798c7677a_109_deltaTransformPoint)
HXDLIN( 109)		return  ::nme::geom::Point_obj::__alloc( HX_CTX ,((point->x * this->a) + (point->y * this->c)),((point->x * this->b) + (point->y * this->d)));
            	}


HX_DEFINE_DYNAMIC_FUNC1(Matrix_obj,deltaTransformPoint,return )

void Matrix_obj::identity(){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_113_identity)
HXLINE( 114)		this->a = ( (Float)(1) );
HXLINE( 115)		this->b = ( (Float)(0) );
HXLINE( 116)		this->c = ( (Float)(0) );
HXLINE( 117)		this->d = ( (Float)(1) );
HXLINE( 118)		this->tx = ( (Float)(0) );
HXLINE( 119)		this->ty = ( (Float)(0) );
            	}


HX_DEFINE_DYNAMIC_FUNC0(Matrix_obj,identity,(void))

 ::nme::geom::Matrix Matrix_obj::invert(){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_123_invert)
HXLINE( 124)		Float norm = ((this->a * this->d) - (this->b * this->c));
HXLINE( 126)		if ((norm == 0)) {
HXLINE( 128)			this->a = (this->b = (this->c = (this->d = ( (Float)(0) ))));
HXLINE( 129)			this->tx = -(this->tx);
HXLINE( 130)			this->ty = -(this->ty);
            		}
            		else {
HXLINE( 134)			norm = (((Float)1.0) / norm);
HXLINE( 135)			Float a1 = (this->d * norm);
HXLINE( 136)			this->d = (this->a * norm);
HXLINE( 137)			this->a = a1;
HXLINE( 138)			 ::nme::geom::Matrix _hx_tmp = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 138)			_hx_tmp->b = (_hx_tmp->b * -(norm));
HXLINE( 139)			 ::nme::geom::Matrix _hx_tmp1 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 139)			_hx_tmp1->c = (_hx_tmp1->c * -(norm));
HXLINE( 141)			Float tx1 = ((-(this->a) * this->tx) - (this->c * this->ty));
HXLINE( 142)			this->ty = ((-(this->b) * this->tx) - (this->d * this->ty));
HXLINE( 143)			this->tx = tx1;
            		}
HXLINE( 146)		return ::hx::ObjectPtr<OBJ_>(this);
            	}


HX_DEFINE_DYNAMIC_FUNC0(Matrix_obj,invert,return )

 ::nme::geom::Matrix Matrix_obj::mult( ::nme::geom::Matrix m){
            	HX_GC_STACKFRAME(&_hx_pos_67be91a798c7677a_150_mult)
HXLINE( 151)		 ::nme::geom::Matrix result =  ::nme::geom::Matrix_obj::__alloc( HX_CTX ,null(),null(),null(),null(),null(),null());
HXLINE( 153)		result->a = ((this->a * m->a) + (this->b * m->c));
HXLINE( 154)		result->b = ((this->a * m->b) + (this->b * m->d));
HXLINE( 155)		result->c = ((this->c * m->a) + (this->d * m->c));
HXLINE( 156)		result->d = ((this->c * m->b) + (this->d * m->d));
HXLINE( 158)		result->tx = (((this->tx * m->a) + (this->ty * m->c)) + m->tx);
HXLINE( 159)		result->ty = (((this->tx * m->b) + (this->ty * m->d)) + m->ty);
HXLINE( 161)		return result;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Matrix_obj,mult,return )

void Matrix_obj::rotate(Float inTheta){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_177_rotate)
HXLINE( 178)		Float cos = ::Math_obj::cos(inTheta);
HXLINE( 179)		Float sin = ::Math_obj::sin(inTheta);
HXLINE( 181)		Float a1 = ((this->a * cos) - (this->b * sin));
HXLINE( 182)		this->b = ((this->a * sin) + (this->b * cos));
HXLINE( 183)		this->a = a1;
HXLINE( 185)		Float c1 = ((this->c * cos) - (this->d * sin));
HXLINE( 186)		this->d = ((this->c * sin) + (this->d * cos));
HXLINE( 187)		this->c = c1;
HXLINE( 189)		Float tx1 = ((this->tx * cos) - (this->ty * sin));
HXLINE( 190)		this->ty = ((this->tx * sin) + (this->ty * cos));
HXLINE( 191)		this->tx = tx1;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Matrix_obj,rotate,(void))

void Matrix_obj::scale(Float inSX,Float inSY){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_202_scale)
HXLINE( 203)		 ::nme::geom::Matrix _hx_tmp = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 203)		_hx_tmp->a = (_hx_tmp->a * inSX);
HXLINE( 204)		 ::nme::geom::Matrix _hx_tmp1 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 204)		_hx_tmp1->b = (_hx_tmp1->b * inSY);
HXLINE( 206)		 ::nme::geom::Matrix _hx_tmp2 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 206)		_hx_tmp2->c = (_hx_tmp2->c * inSX);
HXLINE( 207)		 ::nme::geom::Matrix _hx_tmp3 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 207)		_hx_tmp3->d = (_hx_tmp3->d * inSY);
HXLINE( 209)		 ::nme::geom::Matrix _hx_tmp4 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 209)		_hx_tmp4->tx = (_hx_tmp4->tx * inSX);
HXLINE( 210)		 ::nme::geom::Matrix _hx_tmp5 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 210)		_hx_tmp5->ty = (_hx_tmp5->ty * inSY);
            	}


HX_DEFINE_DYNAMIC_FUNC2(Matrix_obj,scale,(void))

void Matrix_obj::setRotation(Float inTheta, ::Dynamic inScale){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_214_setRotation)
HXLINE( 215)		Float scale;
HXDLIN( 215)		if (::hx::IsNull( inScale )) {
HXLINE( 215)			scale = ((Float)1.0);
            		}
            		else {
HXLINE( 215)			scale = ( (Float)(inScale) );
            		}
HXLINE( 216)		this->a = (::Math_obj::cos(inTheta) * scale);
HXLINE( 217)		this->c = (::Math_obj::sin(inTheta) * scale);
HXLINE( 218)		this->b = -(this->c);
HXLINE( 219)		this->d = this->a;
            	}


HX_DEFINE_DYNAMIC_FUNC2(Matrix_obj,setRotation,(void))

void Matrix_obj::setTo(Float a,Float b,Float c,Float d,Float tx,Float ty){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_223_setTo)
HXLINE( 224)		this->a = a;
HXLINE( 225)		this->b = b;
HXLINE( 226)		this->c = c;
HXLINE( 227)		this->d = d;
HXLINE( 228)		this->tx = tx;
HXLINE( 229)		this->ty = ty;
            	}


HX_DEFINE_DYNAMIC_FUNC6(Matrix_obj,setTo,(void))

 ::nme::geom::Point Matrix_obj::transformPoint( ::nme::geom::Point inPos){
            	HX_GC_STACKFRAME(&_hx_pos_67be91a798c7677a_235_transformPoint)
HXDLIN( 235)		return  ::nme::geom::Point_obj::__alloc( HX_CTX ,(((inPos->x * this->a) + (inPos->y * this->c)) + this->tx),(((inPos->x * this->b) + (inPos->y * this->d)) + this->ty));
            	}


HX_DEFINE_DYNAMIC_FUNC1(Matrix_obj,transformPoint,return )

void Matrix_obj::translate(Float inDX,Float inDY){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_239_translate)
HXLINE( 240)		 ::nme::geom::Matrix _hx_tmp = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 240)		_hx_tmp->tx = (_hx_tmp->tx + inDX);
HXLINE( 241)		 ::nme::geom::Matrix _hx_tmp1 = ::hx::ObjectPtr<OBJ_>(this);
HXDLIN( 241)		_hx_tmp1->ty = (_hx_tmp1->ty + inDY);
            	}


HX_DEFINE_DYNAMIC_FUNC2(Matrix_obj,translate,(void))

::String Matrix_obj::toString(){
            	HX_STACKFRAME(&_hx_pos_67be91a798c7677a_243_toString)
HXDLIN( 243)		return ((((((((((((HX_("[ ",65,4f,00,00) + this->a) + HX_(" ",20,00,00,00)) + this->b) + HX_(" ",20,00,00,00)) + this->c) + HX_(" ",20,00,00,00)) + this->d) + HX_(" ",20,00,00,00)) + this->tx) + HX_(" ",20,00,00,00)) + this->ty) + HX_(" ]",3d,1c,00,00));
            	}


HX_DEFINE_DYNAMIC_FUNC0(Matrix_obj,toString,return )


::hx::ObjectPtr< Matrix_obj > Matrix_obj::__new( ::Dynamic in_a, ::Dynamic in_b, ::Dynamic in_c, ::Dynamic in_d, ::Dynamic in_tx, ::Dynamic in_ty) {
	::hx::ObjectPtr< Matrix_obj > __this = new Matrix_obj();
	__this->__construct(in_a,in_b,in_c,in_d,in_tx,in_ty);
	return __this;
}

::hx::ObjectPtr< Matrix_obj > Matrix_obj::__alloc(::hx::Ctx *_hx_ctx, ::Dynamic in_a, ::Dynamic in_b, ::Dynamic in_c, ::Dynamic in_d, ::Dynamic in_tx, ::Dynamic in_ty) {
	Matrix_obj *__this = (Matrix_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Matrix_obj), false, "nme.geom.Matrix"));
	*(void **)__this = Matrix_obj::_hx_vtable;
	__this->__construct(in_a,in_b,in_c,in_d,in_tx,in_ty);
	return __this;
}

Matrix_obj::Matrix_obj()
{
}

::hx::Val Matrix_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"a") ) { return ::hx::Val( a ); }
		if (HX_FIELD_EQ(inName,"b") ) { return ::hx::Val( b ); }
		if (HX_FIELD_EQ(inName,"c") ) { return ::hx::Val( c ); }
		if (HX_FIELD_EQ(inName,"d") ) { return ::hx::Val( d ); }
		break;
	case 2:
		if (HX_FIELD_EQ(inName,"tx") ) { return ::hx::Val( tx ); }
		if (HX_FIELD_EQ(inName,"ty") ) { return ::hx::Val( ty ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"mult") ) { return ::hx::Val( mult_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return ::hx::Val( clone_dyn() ); }
		if (HX_FIELD_EQ(inName,"scale") ) { return ::hx::Val( scale_dyn() ); }
		if (HX_FIELD_EQ(inName,"setTo") ) { return ::hx::Val( setTo_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"concat") ) { return ::hx::Val( concat_dyn() ); }
		if (HX_FIELD_EQ(inName,"invert") ) { return ::hx::Val( invert_dyn() ); }
		if (HX_FIELD_EQ(inName,"rotate") ) { return ::hx::Val( rotate_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"copyFrom") ) { return ::hx::Val( copyFrom_dyn() ); }
		if (HX_FIELD_EQ(inName,"identity") ) { return ::hx::Val( identity_dyn() ); }
		if (HX_FIELD_EQ(inName,"toString") ) { return ::hx::Val( toString_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"createBox") ) { return ::hx::Val( createBox_dyn() ); }
		if (HX_FIELD_EQ(inName,"translate") ) { return ::hx::Val( translate_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"setRotation") ) { return ::hx::Val( setRotation_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"transformPoint") ) { return ::hx::Val( transformPoint_dyn() ); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"createGradientBox") ) { return ::hx::Val( createGradientBox_dyn() ); }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"deltaTransformPoint") ) { return ::hx::Val( deltaTransformPoint_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val Matrix_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"a") ) { a=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"b") ) { b=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"c") ) { c=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"d") ) { d=inValue.Cast< Float >(); return inValue; }
		break;
	case 2:
		if (HX_FIELD_EQ(inName,"tx") ) { tx=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"ty") ) { ty=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Matrix_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("a",61,00,00,00));
	outFields->push(HX_("b",62,00,00,00));
	outFields->push(HX_("c",63,00,00,00));
	outFields->push(HX_("d",64,00,00,00));
	outFields->push(HX_("tx",84,65,00,00));
	outFields->push(HX_("ty",85,65,00,00));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo Matrix_obj_sMemberStorageInfo[] = {
	{::hx::fsFloat,(int)offsetof(Matrix_obj,a),HX_("a",61,00,00,00)},
	{::hx::fsFloat,(int)offsetof(Matrix_obj,b),HX_("b",62,00,00,00)},
	{::hx::fsFloat,(int)offsetof(Matrix_obj,c),HX_("c",63,00,00,00)},
	{::hx::fsFloat,(int)offsetof(Matrix_obj,d),HX_("d",64,00,00,00)},
	{::hx::fsFloat,(int)offsetof(Matrix_obj,tx),HX_("tx",84,65,00,00)},
	{::hx::fsFloat,(int)offsetof(Matrix_obj,ty),HX_("ty",85,65,00,00)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *Matrix_obj_sStaticStorageInfo = 0;
#endif

static ::String Matrix_obj_sMemberFields[] = {
	HX_("a",61,00,00,00),
	HX_("b",62,00,00,00),
	HX_("c",63,00,00,00),
	HX_("d",64,00,00,00),
	HX_("tx",84,65,00,00),
	HX_("ty",85,65,00,00),
	HX_("copyFrom",bf,0b,61,c8),
	HX_("clone",5d,13,63,48),
	HX_("concat",14,09,d0,c7),
	HX_("createBox",6f,94,d8,49),
	HX_("createGradientBox",5f,ec,c0,25),
	HX_("deltaTransformPoint",5c,4d,f7,15),
	HX_("identity",3e,45,2f,b9),
	HX_("invert",16,e7,d8,9f),
	HX_("mult",f0,67,65,48),
	HX_("rotate",5b,46,20,cb),
	HX_("scale",8a,ce,ce,78),
	HX_("setRotation",00,07,e7,38),
	HX_("setTo",bd,91,2f,7a),
	HX_("transformPoint",44,cf,11,3d),
	HX_("translate",4e,d7,7f,49),
	HX_("toString",ac,d0,6e,38),
	::String(null()) };

::hx::Class Matrix_obj::__mClass;

void Matrix_obj::__register()
{
	Matrix_obj _hx_dummy;
	Matrix_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.geom.Matrix",ab,ec,7f,2e);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(Matrix_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< Matrix_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Matrix_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Matrix_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace geom