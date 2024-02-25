// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_media_SoundTransform
#include <nme/media/SoundTransform.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_8ab08465e4d2e328_11_new,"nme.media.SoundTransform","new",0x7f7341a1,"nme.media.SoundTransform.new","nme/media/SoundTransform.hx",11,0x5a2d5bed)
HX_LOCAL_STACK_FRAME(_hx_pos_8ab08465e4d2e328_18_clone,"nme.media.SoundTransform","clone",0x633216de,"nme.media.SoundTransform.clone","nme/media/SoundTransform.hx",18,0x5a2d5bed)
namespace nme{
namespace media{

void SoundTransform_obj::__construct(::hx::Null< Float >  __o_vol,::hx::Null< Float >  __o_panning){
            		Float vol = __o_vol.Default(((Float)1.0));
            		Float panning = __o_panning.Default(((Float)0.0));
            	HX_STACKFRAME(&_hx_pos_8ab08465e4d2e328_11_new)
HXLINE(  12)		this->volume = vol;
HXLINE(  13)		this->pan = panning;
            	}

Dynamic SoundTransform_obj::__CreateEmpty() { return new SoundTransform_obj; }

void *SoundTransform_obj::_hx_vtable = 0;

Dynamic SoundTransform_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< SoundTransform_obj > _hx_result = new SoundTransform_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool SoundTransform_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x6bfa5bdb;
}

 ::nme::media::SoundTransform SoundTransform_obj::clone(){
            	HX_GC_STACKFRAME(&_hx_pos_8ab08465e4d2e328_18_clone)
HXDLIN(  18)		return  ::nme::media::SoundTransform_obj::__alloc( HX_CTX ,this->volume,this->pan);
            	}


HX_DEFINE_DYNAMIC_FUNC0(SoundTransform_obj,clone,return )


SoundTransform_obj::SoundTransform_obj()
{
}

::hx::Val SoundTransform_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"pan") ) { return ::hx::Val( pan ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return ::hx::Val( clone_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"volume") ) { return ::hx::Val( volume ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val SoundTransform_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"pan") ) { pan=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"volume") ) { volume=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void SoundTransform_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("pan",5d,51,55,00));
	outFields->push(HX_("volume",da,29,53,5f));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo SoundTransform_obj_sMemberStorageInfo[] = {
	{::hx::fsFloat,(int)offsetof(SoundTransform_obj,pan),HX_("pan",5d,51,55,00)},
	{::hx::fsFloat,(int)offsetof(SoundTransform_obj,volume),HX_("volume",da,29,53,5f)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *SoundTransform_obj_sStaticStorageInfo = 0;
#endif

static ::String SoundTransform_obj_sMemberFields[] = {
	HX_("pan",5d,51,55,00),
	HX_("volume",da,29,53,5f),
	HX_("clone",5d,13,63,48),
	::String(null()) };

::hx::Class SoundTransform_obj::__mClass;

void SoundTransform_obj::__register()
{
	SoundTransform_obj _hx_dummy;
	SoundTransform_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.media.SoundTransform",2f,dd,2f,ff);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(SoundTransform_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< SoundTransform_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = SoundTransform_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = SoundTransform_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace nme
} // end namespace media