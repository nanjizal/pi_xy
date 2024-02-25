// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_nme_AlphaMode
#include <nme/AlphaMode.h>
#endif
#ifndef INCLUDED_nme_AssetInfo
#include <nme/AssetInfo.h>
#endif
#ifndef INCLUDED_nme_AssetType
#include <nme/AssetType.h>
#endif
#ifndef INCLUDED_nme_Assets
#include <nme/Assets.h>
#endif
#ifndef INCLUDED_nme_text_Font
#include <nme/text/Font.h>
#endif
#ifndef INCLUDED_nme_utils_WeakRef
#include <nme/utils/WeakRef.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_4559fd5e6d9876f1_17_new,"nme.AssetInfo","new",0x6a764f28,"nme.AssetInfo.new","nme/AssetInfo.hx",17,0x98e24ac9)
HX_LOCAL_STACK_FRAME(_hx_pos_4559fd5e6d9876f1_33_toString,"nme.AssetInfo","toString",0xc1e3bce4,"nme.AssetInfo.toString","nme/AssetInfo.hx",33,0x98e24ac9)
HX_LOCAL_STACK_FRAME(_hx_pos_4559fd5e6d9876f1_39_uncache,"nme.AssetInfo","uncache",0x06031411,"nme.AssetInfo.uncache","nme/AssetInfo.hx",39,0x98e24ac9)
HX_LOCAL_STACK_FRAME(_hx_pos_4559fd5e6d9876f1_43_getCache,"nme.AssetInfo","getCache",0x2a609604,"nme.AssetInfo.getCache","nme/AssetInfo.hx",43,0x98e24ac9)
HX_LOCAL_STACK_FRAME(_hx_pos_4559fd5e6d9876f1_54_setCache,"nme.AssetInfo","setCache",0xd8bdef78,"nme.AssetInfo.setCache","nme/AssetInfo.hx",54,0x98e24ac9)
namespace nme{

void AssetInfo_obj::__construct(::String inPath, ::nme::AssetType inType,bool inIsResource,::String inClassName,::String id, ::nme::AlphaMode inAlphaMode){
            	HX_GC_STACKFRAME(&_hx_pos_4559fd5e6d9876f1_17_new)
HXLINE(  18)		this->path = inPath;
HXLINE(  19)		this->type = inType;
HXLINE(  20)		this->className = inClassName;
HXLINE(  21)		this->isResource = inIsResource;
HXLINE(  22)		 ::nme::AlphaMode _hx_tmp;
HXDLIN(  22)		if (::hx::IsNull( inAlphaMode )) {
HXLINE(  22)			_hx_tmp = ::nme::AlphaMode_obj::AlphaDefault_dyn();
            		}
            		else {
HXLINE(  22)			_hx_tmp = inAlphaMode;
            		}
HXDLIN(  22)		this->alphaMode = _hx_tmp;
HXLINE(  24)		bool _hx_tmp1;
HXDLIN(  24)		if (::hx::IsPointerEq( this->type,::nme::AssetType_obj::FONT_dyn() )) {
HXLINE(  24)			if (!(this->isResource)) {
HXLINE(  24)				_hx_tmp1 = ::nme::Assets_obj::isEmbedded(id);
            			}
            			else {
HXLINE(  24)				_hx_tmp1 = true;
            			}
            		}
            		else {
HXLINE(  24)			_hx_tmp1 = false;
            		}
HXDLIN(  24)		if (_hx_tmp1) {
HXLINE(  26)			 ::nme::text::Font_obj::__alloc( HX_CTX ,HX_("",00,00,00,00),null(),null(),this->path,id);
            		}
            	}

Dynamic AssetInfo_obj::__CreateEmpty() { return new AssetInfo_obj; }

void *AssetInfo_obj::_hx_vtable = 0;

Dynamic AssetInfo_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< AssetInfo_obj > _hx_result = new AssetInfo_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5]);
	return _hx_result;
}

bool AssetInfo_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x3b58e0d8;
}

::String AssetInfo_obj::toString(){
            	HX_STACKFRAME(&_hx_pos_4559fd5e6d9876f1_33_toString)
HXDLIN(  33)		::String _hx_tmp = ((((HX_("{path:",9a,6c,3c,eb) + this->path) + HX_(" className:",57,24,70,f5)) + this->className) + HX_(" type:",20,fc,36,e6));
HXDLIN(  33)		::String _hx_tmp1 = ((_hx_tmp + ::Std_obj::string(this->type)) + HX_(" isResource:",42,42,1f,50));
HXDLIN(  33)		::String _hx_tmp2 = ((_hx_tmp1 + ::Std_obj::string(this->isResource)) + HX_(" cached:",f8,c9,6f,49));
HXDLIN(  33)		return ((_hx_tmp2 + ::Std_obj::string(::hx::IsNotNull( this->cache ))) + HX_("}",7d,00,00,00));
            	}


HX_DEFINE_DYNAMIC_FUNC0(AssetInfo_obj,toString,return )

void AssetInfo_obj::uncache(){
            	HX_STACKFRAME(&_hx_pos_4559fd5e6d9876f1_39_uncache)
HXDLIN(  39)		this->cache = null();
            	}


HX_DEFINE_DYNAMIC_FUNC0(AssetInfo_obj,uncache,(void))

 ::Dynamic AssetInfo_obj::getCache(){
            	HX_STACKFRAME(&_hx_pos_4559fd5e6d9876f1_43_getCache)
HXLINE(  44)		if (::hx::IsNull( this->cache )) {
HXLINE(  45)			return null();
            		}
HXLINE(  46)		 ::Dynamic val = this->cache->get();
HXLINE(  47)		if (::hx::IsNull( val )) {
HXLINE(  48)			this->cache = null();
            		}
HXLINE(  49)		return val;
            	}


HX_DEFINE_DYNAMIC_FUNC0(AssetInfo_obj,getCache,return )

void AssetInfo_obj::setCache( ::Dynamic inVal,bool inWeak){
            	HX_GC_STACKFRAME(&_hx_pos_4559fd5e6d9876f1_54_setCache)
HXDLIN(  54)		this->cache =  ::nme::utils::WeakRef_obj::__alloc( HX_CTX ,inVal,inWeak);
            	}


HX_DEFINE_DYNAMIC_FUNC2(AssetInfo_obj,setCache,(void))


::hx::ObjectPtr< AssetInfo_obj > AssetInfo_obj::__new(::String inPath, ::nme::AssetType inType,bool inIsResource,::String inClassName,::String id, ::nme::AlphaMode inAlphaMode) {
	::hx::ObjectPtr< AssetInfo_obj > __this = new AssetInfo_obj();
	__this->__construct(inPath,inType,inIsResource,inClassName,id,inAlphaMode);
	return __this;
}

::hx::ObjectPtr< AssetInfo_obj > AssetInfo_obj::__alloc(::hx::Ctx *_hx_ctx,::String inPath, ::nme::AssetType inType,bool inIsResource,::String inClassName,::String id, ::nme::AlphaMode inAlphaMode) {
	AssetInfo_obj *__this = (AssetInfo_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(AssetInfo_obj), true, "nme.AssetInfo"));
	*(void **)__this = AssetInfo_obj::_hx_vtable;
	__this->__construct(inPath,inType,inIsResource,inClassName,id,inAlphaMode);
	return __this;
}

AssetInfo_obj::AssetInfo_obj()
{
}

void AssetInfo_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(AssetInfo);
	HX_MARK_MEMBER_NAME(path,"path");
	HX_MARK_MEMBER_NAME(className,"className");
	HX_MARK_MEMBER_NAME(type,"type");
	HX_MARK_MEMBER_NAME(cache,"cache");
	HX_MARK_MEMBER_NAME(isResource,"isResource");
	HX_MARK_MEMBER_NAME(alphaMode,"alphaMode");
	HX_MARK_END_CLASS();
}

void AssetInfo_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(path,"path");
	HX_VISIT_MEMBER_NAME(className,"className");
	HX_VISIT_MEMBER_NAME(type,"type");
	HX_VISIT_MEMBER_NAME(cache,"cache");
	HX_VISIT_MEMBER_NAME(isResource,"isResource");
	HX_VISIT_MEMBER_NAME(alphaMode,"alphaMode");
}

::hx::Val AssetInfo_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"path") ) { return ::hx::Val( path ); }
		if (HX_FIELD_EQ(inName,"type") ) { return ::hx::Val( type ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"cache") ) { return ::hx::Val( cache ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"uncache") ) { return ::hx::Val( uncache_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"toString") ) { return ::hx::Val( toString_dyn() ); }
		if (HX_FIELD_EQ(inName,"getCache") ) { return ::hx::Val( getCache_dyn() ); }
		if (HX_FIELD_EQ(inName,"setCache") ) { return ::hx::Val( setCache_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"className") ) { return ::hx::Val( className ); }
		if (HX_FIELD_EQ(inName,"alphaMode") ) { return ::hx::Val( alphaMode ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"isResource") ) { return ::hx::Val( isResource ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val AssetInfo_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"path") ) { path=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"type") ) { type=inValue.Cast<  ::nme::AssetType >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"cache") ) { cache=inValue.Cast<  ::nme::utils::WeakRef >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"className") ) { className=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"alphaMode") ) { alphaMode=inValue.Cast<  ::nme::AlphaMode >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"isResource") ) { isResource=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void AssetInfo_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("path",a5,e5,51,4a));
	outFields->push(HX_("className",a3,92,3d,dc));
	outFields->push(HX_("type",ba,f2,08,4d));
	outFields->push(HX_("cache",42,9a,14,41));
	outFields->push(HX_("isResource",d8,6e,4f,8d));
	outFields->push(HX_("alphaMode",e1,ad,5a,e2));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo AssetInfo_obj_sMemberStorageInfo[] = {
	{::hx::fsString,(int)offsetof(AssetInfo_obj,path),HX_("path",a5,e5,51,4a)},
	{::hx::fsString,(int)offsetof(AssetInfo_obj,className),HX_("className",a3,92,3d,dc)},
	{::hx::fsObject /*  ::nme::AssetType */ ,(int)offsetof(AssetInfo_obj,type),HX_("type",ba,f2,08,4d)},
	{::hx::fsObject /*  ::nme::utils::WeakRef */ ,(int)offsetof(AssetInfo_obj,cache),HX_("cache",42,9a,14,41)},
	{::hx::fsBool,(int)offsetof(AssetInfo_obj,isResource),HX_("isResource",d8,6e,4f,8d)},
	{::hx::fsObject /*  ::nme::AlphaMode */ ,(int)offsetof(AssetInfo_obj,alphaMode),HX_("alphaMode",e1,ad,5a,e2)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *AssetInfo_obj_sStaticStorageInfo = 0;
#endif

static ::String AssetInfo_obj_sMemberFields[] = {
	HX_("path",a5,e5,51,4a),
	HX_("className",a3,92,3d,dc),
	HX_("type",ba,f2,08,4d),
	HX_("cache",42,9a,14,41),
	HX_("isResource",d8,6e,4f,8d),
	HX_("alphaMode",e1,ad,5a,e2),
	HX_("toString",ac,d0,6e,38),
	HX_("uncache",49,91,a5,3d),
	HX_("getCache",cc,a9,eb,a0),
	HX_("setCache",40,03,49,4f),
	::String(null()) };

::hx::Class AssetInfo_obj::__mClass;

void AssetInfo_obj::__register()
{
	AssetInfo_obj _hx_dummy;
	AssetInfo_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.AssetInfo",36,db,8d,a8);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(AssetInfo_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< AssetInfo_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = AssetInfo_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = AssetInfo_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme