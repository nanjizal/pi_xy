// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_filters_BitmapFilter
#include <nme/filters/BitmapFilter.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_6127804af30e1a01_10_new,"nme.filters.BitmapFilter","new",0x2bdd03d4,"nme.filters.BitmapFilter.new","nme/filters/BitmapFilter.hx",10,0xa4fc5b5a)
HX_LOCAL_STACK_FRAME(_hx_pos_6127804af30e1a01_15_clone,"nme.filters.BitmapFilter","clone",0x4f370bd1,"nme.filters.BitmapFilter.clone","nme/filters/BitmapFilter.hx",15,0xa4fc5b5a)
namespace nme{
namespace filters{

void BitmapFilter_obj::__construct(::String inType){
            	HX_STACKFRAME(&_hx_pos_6127804af30e1a01_10_new)
HXDLIN(  10)		this->type = inType;
            	}

Dynamic BitmapFilter_obj::__CreateEmpty() { return new BitmapFilter_obj; }

void *BitmapFilter_obj::_hx_vtable = 0;

Dynamic BitmapFilter_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< BitmapFilter_obj > _hx_result = new BitmapFilter_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool BitmapFilter_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x2a5ecac0;
}

 ::nme::filters::BitmapFilter BitmapFilter_obj::clone(){
            	HX_STACKFRAME(&_hx_pos_6127804af30e1a01_15_clone)
HXDLIN(  15)		HX_STACK_DO_THROW(HX_("clone not implemented",72,97,37,e3));
HXDLIN(  15)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC0(BitmapFilter_obj,clone,return )


BitmapFilter_obj::BitmapFilter_obj()
{
}

void BitmapFilter_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(BitmapFilter);
	HX_MARK_MEMBER_NAME(type,"type");
	HX_MARK_END_CLASS();
}

void BitmapFilter_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(type,"type");
}

::hx::Val BitmapFilter_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"type") ) { return ::hx::Val( type ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return ::hx::Val( clone_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val BitmapFilter_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"type") ) { type=inValue.Cast< ::String >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void BitmapFilter_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("type",ba,f2,08,4d));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo BitmapFilter_obj_sMemberStorageInfo[] = {
	{::hx::fsString,(int)offsetof(BitmapFilter_obj,type),HX_("type",ba,f2,08,4d)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *BitmapFilter_obj_sStaticStorageInfo = 0;
#endif

static ::String BitmapFilter_obj_sMemberFields[] = {
	HX_("type",ba,f2,08,4d),
	HX_("clone",5d,13,63,48),
	::String(null()) };

::hx::Class BitmapFilter_obj::__mClass;

void BitmapFilter_obj::__register()
{
	BitmapFilter_obj _hx_dummy;
	BitmapFilter_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.filters.BitmapFilter",e2,c9,79,b1);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(BitmapFilter_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< BitmapFilter_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = BitmapFilter_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = BitmapFilter_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace filters