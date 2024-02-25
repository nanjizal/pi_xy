// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_StringTools
#include <StringTools.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_GroupShape
#include <pi_xy/triangleGML/triGML/GroupShape.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_ShapeInterface
#include <pi_xy/triangleGML/triGML/ShapeInterface.h>
#endif
#ifndef INCLUDED_pi_xy_triangleGML_triGML_hitTest_IhitObj
#include <pi_xy/triangleGML/triGML/hitTest/IhitObj.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_e786f435ef0f38fa_6_new,"pi_xy.triangleGML.triGML.GroupShape","new",0xa6e5cd30,"pi_xy.triangleGML.triGML.GroupShape.new","pi_xy/triangleGML/triGML/GroupShape.hx",6,0x3c4e4621)
HX_LOCAL_STACK_FRAME(_hx_pos_e786f435ef0f38fa_29_setParameter,"pi_xy.triangleGML.triGML.GroupShape","setParameter",0x76cfded7,"pi_xy.triangleGML.triGML.GroupShape.setParameter","pi_xy/triangleGML/triGML/GroupShape.hx",29,0x3c4e4621)
HX_LOCAL_STACK_FRAME(_hx_pos_e786f435ef0f38fa_61_translate,"pi_xy.triangleGML.triGML.GroupShape","translate",0x9d27501e,"pi_xy.triangleGML.triGML.GroupShape.translate","pi_xy/triangleGML/triGML/GroupShape.hx",61,0x3c4e4621)
HX_LOCAL_STACK_FRAME(_hx_pos_e786f435ef0f38fa_68_hit,"pi_xy.triangleGML.triGML.GroupShape","hit",0xa6e14323,"pi_xy.triangleGML.triGML.GroupShape.hit","pi_xy/triangleGML/triGML/GroupShape.hx",68,0x3c4e4621)
HX_LOCAL_STACK_FRAME(_hx_pos_e786f435ef0f38fa_75_clear,"pi_xy.triangleGML.triGML.GroupShape","clear",0x3502425d,"pi_xy.triangleGML.triGML.GroupShape.clear","pi_xy/triangleGML/triGML/GroupShape.hx",75,0x3c4e4621)
HX_LOCAL_STACK_FRAME(_hx_pos_e786f435ef0f38fa_78_setImage,"pi_xy.triangleGML.triGML.GroupShape","setImage",0xd0951989,"pi_xy.triangleGML.triGML.GroupShape.setImage","pi_xy/triangleGML/triGML/GroupShape.hx",78,0x3c4e4621)
namespace pi_xy{
namespace triangleGML{
namespace triGML{

void GroupShape_obj::__construct(::hx::Null< Float >  __o_opacity,::hx::Null< bool >  __o_visibility){
            		Float opacity = __o_opacity.Default(((Float)1.));
            		bool visibility = __o_visibility.Default(true);
            	HX_STACKFRAME(&_hx_pos_e786f435ef0f38fa_6_new)
HXLINE(  23)		this->scaleY = ((Float)1.);
HXLINE(  22)		this->scaleX = ((Float)1.);
HXLINE(  21)		this->skewY = ((Float)0.);
HXLINE(  20)		this->skewX = ((Float)0.);
HXLINE(  19)		this->transformCentreY = ((Float)0.);
HXLINE(  18)		this->transformCentreX = ((Float)0.);
HXLINE(  17)		this->rotation = ((Float)0.);
HXLINE(  16)		this->externalSoft = false;
HXLINE(  15)		this->edgeSoft = ((Float)0);
HXLINE(  13)		this->hitObj = null();
HXLINE(  12)		this->offY = ((Float)0.);
HXLINE(  11)		this->offX = ((Float)0.);
HXLINE(   7)		this->isDirty = true;
HXLINE(  25)		this->visibility = visibility;
HXLINE(  26)		this->opacity = opacity;
            	}

bool GroupShape_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x1a0bd5c0;
}

static ::pi_xy::triangleGML::triGML::ShapeInterface_obj _hx_pi_xy_triangleGML_triGML_GroupShape__hx_pi_xy_triangleGML_triGML_ShapeInterface= {
	( void (::hx::Object::*)(::String,::String))&::pi_xy::triangleGML::triGML::GroupShape_obj::setParameter,
	( void (::hx::Object::*)(Float,Float))&::pi_xy::triangleGML::triGML::GroupShape_obj::translate,
	( bool (::hx::Object::*)(Float,Float))&::pi_xy::triangleGML::triGML::GroupShape_obj::hit,
	(  ::Dynamic (::hx::Object::*)( ::Dynamic,int))&::pi_xy::triangleGML::triGML::GroupShape_obj::clear,
	(  ::Dynamic (::hx::Object::*)( ::Dynamic))&::pi_xy::triangleGML::triGML::GroupShape_obj::render,
	(  ::Dynamic (::hx::Object::*)(::String, ::Dynamic))&::pi_xy::triangleGML::triGML::GroupShape_obj::setImage,
};

void *GroupShape_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0x2bf2bdca: return &_hx_pi_xy_triangleGML_triGML_GroupShape__hx_pi_xy_triangleGML_triGML_ShapeInterface;
	}
	#ifdef HXCPP_SCRIPTABLE
	return super::_hx_getInterface(inHash);
	#else
	return 0;
	#endif
}

void GroupShape_obj::setParameter(::String name,::String value){
            	HX_STACKFRAME(&_hx_pos_e786f435ef0f38fa_29_setParameter)
HXDLIN(  29)		::String _hx_switch_0 = name;
            		if (  (_hx_switch_0==HX_("edgeSoft",c7,73,b5,5c)) ){
HXLINE(  54)			this->edgeSoft = ::Std_obj::parseFloat(value);
HXDLIN(  54)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("externalSoft",d5,0c,8b,39)) ){
HXLINE(  56)			bool _hx_tmp;
HXDLIN(  56)			if ((::StringTools_obj::trim(value).toLowerCase() == HX_("true",4e,a7,03,4d))) {
HXLINE(  56)				_hx_tmp = true;
            			}
            			else {
HXLINE(  56)				_hx_tmp = false;
            			}
HXDLIN(  56)			this->externalSoft = _hx_tmp;
HXDLIN(  56)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("opacity",cb,5d,65,eb)) ){
HXLINE(  33)			this->opacity = ::Std_obj::parseFloat(value);
HXDLIN(  33)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("rotation",3e,3d,86,08)) ){
HXLINE(  35)			Float degree = ::Std_obj::parseFloat(value);
HXLINE(  36)			Float _hx_tmp1;
HXDLIN(  36)			if ((degree == 0)) {
HXLINE(  36)				_hx_tmp1 = ( (Float)(0) );
            			}
            			else {
HXLINE(  36)				_hx_tmp1 = ((::Math_obj::PI * degree) / ( (Float)(180) ));
            			}
HXDLIN(  36)			this->rotation = _hx_tmp1;
HXLINE(  34)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("scale",8a,ce,ce,78)) ){
HXLINE(  52)			this->scaleX = (this->scaleY = ::Std_obj::parseFloat(value));
HXDLIN(  52)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("scaleX",8e,ea,25,3c)) ){
HXLINE(  48)			this->scaleX = ::Std_obj::parseFloat(value);
HXDLIN(  48)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("scaleY",8f,ea,25,3c)) ){
HXLINE(  50)			this->scaleY = ::Std_obj::parseFloat(value);
HXDLIN(  50)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("skewX",0e,96,1b,7e)) ){
HXLINE(  44)			this->skewX = ::Std_obj::parseFloat(value);
HXDLIN(  44)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("skewY",0f,96,1b,7e)) ){
HXLINE(  46)			this->skewY = ::Std_obj::parseFloat(value);
HXDLIN(  46)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("theta",1e,84,86,0f)) ){
HXLINE(  38)			this->rotation = ::Std_obj::parseFloat(value);
HXDLIN(  38)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("transformCentreX",d1,86,65,c9)) ){
HXLINE(  40)			this->transformCentreX = ::Std_obj::parseFloat(value);
HXDLIN(  40)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("transformCentreY",d2,86,65,c9)) ){
HXLINE(  42)			this->transformCentreY = ::Std_obj::parseFloat(value);
HXDLIN(  42)			goto _hx_goto_1;
            		}
            		if (  (_hx_switch_0==HX_("visibility",d2,ad,0d,d3)) ){
HXLINE(  31)			bool _hx_tmp2;
HXDLIN(  31)			if ((value.toLowerCase() == HX_("true",4e,a7,03,4d))) {
HXLINE(  31)				_hx_tmp2 = true;
            			}
            			else {
HXLINE(  31)				_hx_tmp2 = false;
            			}
HXDLIN(  31)			this->visibility = _hx_tmp2;
HXDLIN(  31)			goto _hx_goto_1;
            		}
            		/* default */{
HXLINE(  58)			::haxe::Log_obj::trace((HX_("property not found ",f6,14,bb,c9) + name),::hx::SourceInfo(HX_("src/pi_xy/triangleGML/triGML/GroupShape.hx",2c,dd,21,08),58,HX_("pi_xy.triangleGML.triGML.GroupShape",3e,b5,d3,e8),HX_("setParameter",a7,f5,ff,6c)));
            		}
            		_hx_goto_1:;
            	}


HX_DEFINE_DYNAMIC_FUNC2(GroupShape_obj,setParameter,(void))

void GroupShape_obj::translate(Float x,Float y){
            	HX_STACKFRAME(&_hx_pos_e786f435ef0f38fa_61_translate)
HXLINE(  62)		this->offX = x;
HXLINE(  63)		this->offY = y;
            	}


HX_DEFINE_DYNAMIC_FUNC2(GroupShape_obj,translate,(void))

HX_DEFINE_DYNAMIC_FUNC1(GroupShape_obj,render,return )

bool GroupShape_obj::hit(Float x,Float y){
            	HX_STACKFRAME(&_hx_pos_e786f435ef0f38fa_68_hit)
HXDLIN(  68)		if (::hx::IsNull( this->hitObj )) {
HXLINE(  69)			return false;
            		}
            		else {
HXLINE(  71)			return ::pi_xy::triangleGML::triGML::hitTest::IhitObj_obj::hit(this->hitObj,x,y);
            		}
HXLINE(  68)		return false;
            	}


HX_DEFINE_DYNAMIC_FUNC2(GroupShape_obj,hit,return )

 ::Dynamic GroupShape_obj::clear( ::Dynamic drawTool,int color){
            	HX_STACKFRAME(&_hx_pos_e786f435ef0f38fa_75_clear)
HXDLIN(  75)		return drawTool;
            	}


HX_DEFINE_DYNAMIC_FUNC2(GroupShape_obj,clear,return )

 ::Dynamic GroupShape_obj::setImage(::String name, ::Dynamic imageTool){
            	HX_STACKFRAME(&_hx_pos_e786f435ef0f38fa_78_setImage)
HXDLIN(  78)		return imageTool;
            	}


HX_DEFINE_DYNAMIC_FUNC2(GroupShape_obj,setImage,return )


GroupShape_obj::GroupShape_obj()
{
}

void GroupShape_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(GroupShape);
	HX_MARK_MEMBER_NAME(isDirty,"isDirty");
	HX_MARK_MEMBER_NAME(visibility,"visibility");
	HX_MARK_MEMBER_NAME(opacity,"opacity");
	HX_MARK_MEMBER_NAME(offX,"offX");
	HX_MARK_MEMBER_NAME(offY,"offY");
	HX_MARK_MEMBER_NAME(hitObj,"hitObj");
	HX_MARK_MEMBER_NAME(edgeSoft,"edgeSoft");
	HX_MARK_MEMBER_NAME(externalSoft,"externalSoft");
	HX_MARK_MEMBER_NAME(rotation,"rotation");
	HX_MARK_MEMBER_NAME(transformCentreX,"transformCentreX");
	HX_MARK_MEMBER_NAME(transformCentreY,"transformCentreY");
	HX_MARK_MEMBER_NAME(skewX,"skewX");
	HX_MARK_MEMBER_NAME(skewY,"skewY");
	HX_MARK_MEMBER_NAME(scaleX,"scaleX");
	HX_MARK_MEMBER_NAME(scaleY,"scaleY");
	HX_MARK_END_CLASS();
}

void GroupShape_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(isDirty,"isDirty");
	HX_VISIT_MEMBER_NAME(visibility,"visibility");
	HX_VISIT_MEMBER_NAME(opacity,"opacity");
	HX_VISIT_MEMBER_NAME(offX,"offX");
	HX_VISIT_MEMBER_NAME(offY,"offY");
	HX_VISIT_MEMBER_NAME(hitObj,"hitObj");
	HX_VISIT_MEMBER_NAME(edgeSoft,"edgeSoft");
	HX_VISIT_MEMBER_NAME(externalSoft,"externalSoft");
	HX_VISIT_MEMBER_NAME(rotation,"rotation");
	HX_VISIT_MEMBER_NAME(transformCentreX,"transformCentreX");
	HX_VISIT_MEMBER_NAME(transformCentreY,"transformCentreY");
	HX_VISIT_MEMBER_NAME(skewX,"skewX");
	HX_VISIT_MEMBER_NAME(skewY,"skewY");
	HX_VISIT_MEMBER_NAME(scaleX,"scaleX");
	HX_VISIT_MEMBER_NAME(scaleY,"scaleY");
}

::hx::Val GroupShape_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"hit") ) { return ::hx::Val( hit_dyn() ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"offX") ) { return ::hx::Val( offX ); }
		if (HX_FIELD_EQ(inName,"offY") ) { return ::hx::Val( offY ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"skewX") ) { return ::hx::Val( skewX ); }
		if (HX_FIELD_EQ(inName,"skewY") ) { return ::hx::Val( skewY ); }
		if (HX_FIELD_EQ(inName,"clear") ) { return ::hx::Val( clear_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"hitObj") ) { return ::hx::Val( hitObj ); }
		if (HX_FIELD_EQ(inName,"scaleX") ) { return ::hx::Val( scaleX ); }
		if (HX_FIELD_EQ(inName,"scaleY") ) { return ::hx::Val( scaleY ); }
		if (HX_FIELD_EQ(inName,"render") ) { return ::hx::Val( render_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"isDirty") ) { return ::hx::Val( isDirty ); }
		if (HX_FIELD_EQ(inName,"opacity") ) { return ::hx::Val( opacity ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"edgeSoft") ) { return ::hx::Val( edgeSoft ); }
		if (HX_FIELD_EQ(inName,"rotation") ) { return ::hx::Val( rotation ); }
		if (HX_FIELD_EQ(inName,"setImage") ) { return ::hx::Val( setImage_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"translate") ) { return ::hx::Val( translate_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"visibility") ) { return ::hx::Val( visibility ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"externalSoft") ) { return ::hx::Val( externalSoft ); }
		if (HX_FIELD_EQ(inName,"setParameter") ) { return ::hx::Val( setParameter_dyn() ); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"transformCentreX") ) { return ::hx::Val( transformCentreX ); }
		if (HX_FIELD_EQ(inName,"transformCentreY") ) { return ::hx::Val( transformCentreY ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val GroupShape_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"offX") ) { offX=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"offY") ) { offY=inValue.Cast< Float >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"skewX") ) { skewX=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"skewY") ) { skewY=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"hitObj") ) { hitObj=inValue.Cast< ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"scaleX") ) { scaleX=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"scaleY") ) { scaleY=inValue.Cast< Float >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"isDirty") ) { isDirty=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"opacity") ) { opacity=inValue.Cast< Float >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"edgeSoft") ) { edgeSoft=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"rotation") ) { rotation=inValue.Cast< Float >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"visibility") ) { visibility=inValue.Cast< bool >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"externalSoft") ) { externalSoft=inValue.Cast< bool >(); return inValue; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"transformCentreX") ) { transformCentreX=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"transformCentreY") ) { transformCentreY=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void GroupShape_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("isDirty",c8,f3,55,76));
	outFields->push(HX_("visibility",d2,ad,0d,d3));
	outFields->push(HX_("opacity",cb,5d,65,eb));
	outFields->push(HX_("offX",09,6e,ac,49));
	outFields->push(HX_("offY",0a,6e,ac,49));
	outFields->push(HX_("hitObj",64,77,19,57));
	outFields->push(HX_("edgeSoft",c7,73,b5,5c));
	outFields->push(HX_("externalSoft",d5,0c,8b,39));
	outFields->push(HX_("rotation",3e,3d,86,08));
	outFields->push(HX_("transformCentreX",d1,86,65,c9));
	outFields->push(HX_("transformCentreY",d2,86,65,c9));
	outFields->push(HX_("skewX",0e,96,1b,7e));
	outFields->push(HX_("skewY",0f,96,1b,7e));
	outFields->push(HX_("scaleX",8e,ea,25,3c));
	outFields->push(HX_("scaleY",8f,ea,25,3c));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo GroupShape_obj_sMemberStorageInfo[] = {
	{::hx::fsBool,(int)offsetof(GroupShape_obj,isDirty),HX_("isDirty",c8,f3,55,76)},
	{::hx::fsBool,(int)offsetof(GroupShape_obj,visibility),HX_("visibility",d2,ad,0d,d3)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,opacity),HX_("opacity",cb,5d,65,eb)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,offX),HX_("offX",09,6e,ac,49)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,offY),HX_("offY",0a,6e,ac,49)},
	{::hx::fsObject /* ::Dynamic */ ,(int)offsetof(GroupShape_obj,hitObj),HX_("hitObj",64,77,19,57)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,edgeSoft),HX_("edgeSoft",c7,73,b5,5c)},
	{::hx::fsBool,(int)offsetof(GroupShape_obj,externalSoft),HX_("externalSoft",d5,0c,8b,39)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,rotation),HX_("rotation",3e,3d,86,08)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,transformCentreX),HX_("transformCentreX",d1,86,65,c9)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,transformCentreY),HX_("transformCentreY",d2,86,65,c9)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,skewX),HX_("skewX",0e,96,1b,7e)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,skewY),HX_("skewY",0f,96,1b,7e)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,scaleX),HX_("scaleX",8e,ea,25,3c)},
	{::hx::fsFloat,(int)offsetof(GroupShape_obj,scaleY),HX_("scaleY",8f,ea,25,3c)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *GroupShape_obj_sStaticStorageInfo = 0;
#endif

static ::String GroupShape_obj_sMemberFields[] = {
	HX_("isDirty",c8,f3,55,76),
	HX_("visibility",d2,ad,0d,d3),
	HX_("opacity",cb,5d,65,eb),
	HX_("offX",09,6e,ac,49),
	HX_("offY",0a,6e,ac,49),
	HX_("hitObj",64,77,19,57),
	HX_("edgeSoft",c7,73,b5,5c),
	HX_("externalSoft",d5,0c,8b,39),
	HX_("rotation",3e,3d,86,08),
	HX_("transformCentreX",d1,86,65,c9),
	HX_("transformCentreY",d2,86,65,c9),
	HX_("skewX",0e,96,1b,7e),
	HX_("skewY",0f,96,1b,7e),
	HX_("scaleX",8e,ea,25,3c),
	HX_("scaleY",8f,ea,25,3c),
	HX_("setParameter",a7,f5,ff,6c),
	HX_("translate",4e,d7,7f,49),
	HX_("render",56,6b,29,05),
	HX_("hit",53,46,4f,00),
	HX_("clear",8d,71,5b,48),
	HX_("setImage",59,88,9d,cb),
	::String(null()) };

::hx::Class GroupShape_obj::__mClass;

void GroupShape_obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.triangleGML.triGML.GroupShape",3e,b5,d3,e8);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(GroupShape_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< GroupShape_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = GroupShape_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = GroupShape_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace triangleGML
} // end namespace triGML