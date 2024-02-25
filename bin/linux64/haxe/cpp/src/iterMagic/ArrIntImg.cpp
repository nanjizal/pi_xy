// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_haxe_Exception
#include <haxe/Exception.h>
#endif
#ifndef INCLUDED_iterMagic_ArrIntImg
#include <iterMagic/ArrIntImg.h>
#endif
#ifndef INCLUDED_iterMagic_Iimg
#include <iterMagic/Iimg.h>
#endif
#ifndef INCLUDED_iterMagic_RawImageData
#include <iterMagic/RawImageData.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_62e17d0bd1821534_107_new,"iterMagic.ArrIntImg","new",0xd35d89ae,"iterMagic.ArrIntImg.new","iterMagic/Img.hx",107,0x8899afd5)
HX_LOCAL_STACK_FRAME(_hx_pos_62e17d0bd1821534_113_set,"iterMagic.ArrIntImg","set",0xd36154f0,"iterMagic.ArrIntImg.set","iterMagic/Img.hx",113,0x8899afd5)
HX_LOCAL_STACK_FRAME(_hx_pos_62e17d0bd1821534_119_get,"iterMagic.ArrIntImg","get",0xd35839e4,"iterMagic.ArrIntImg.get","iterMagic/Img.hx",119,0x8899afd5)
HX_LOCAL_STACK_FRAME(_hx_pos_62e17d0bd1821534_122_zero,"iterMagic.ArrIntImg","zero",0x26697a1a,"iterMagic.ArrIntImg.zero","iterMagic/Img.hx",122,0x8899afd5)
HX_LOCAL_STACK_FRAME(_hx_pos_62e17d0bd1821534_127_size,"iterMagic.ArrIntImg","size",0x21cc0bb3,"iterMagic.ArrIntImg.size","iterMagic/Img.hx",127,0x8899afd5)
HX_LOCAL_STACK_FRAME(_hx_pos_62e17d0bd1821534_134_setRaw,"iterMagic.ArrIntImg","setRaw",0xe40ceed8,"iterMagic.ArrIntImg.setRaw","iterMagic/Img.hx",134,0x8899afd5)
HX_LOCAL_STACK_FRAME(_hx_pos_62e17d0bd1821534_157_getRaw,"iterMagic.ArrIntImg","getRaw",0x17c49a64,"iterMagic.ArrIntImg.getRaw","iterMagic/Img.hx",157,0x8899afd5)
namespace iterMagic{

void ArrIntImg_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_62e17d0bd1821534_107_new)
HXDLIN( 107)		this->count = 0;
            	}

Dynamic ArrIntImg_obj::__CreateEmpty() { return new ArrIntImg_obj; }

void *ArrIntImg_obj::_hx_vtable = 0;

Dynamic ArrIntImg_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< ArrIntImg_obj > _hx_result = new ArrIntImg_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool ArrIntImg_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x71ed54a0;
}

static ::iterMagic::Iimg_obj _hx_iterMagic_ArrIntImg__hx_iterMagic_Iimg= {
	( int (::hx::Object::*)(int,int))&::iterMagic::ArrIntImg_obj::set,
	( int (::hx::Object::*)(int))&::iterMagic::ArrIntImg_obj::get,
	(  ::Dynamic (::hx::Object::*)(int))&::iterMagic::ArrIntImg_obj::zero_e55b6ed4,
	(  ::Dynamic (::hx::Object::*)(int,int))&::iterMagic::ArrIntImg_obj::size_a9623fd7,
	(  ::iterMagic::RawImageData (::hx::Object::*)( ::iterMagic::RawImageData))&::iterMagic::ArrIntImg_obj::setRaw,
	(  ::iterMagic::RawImageData (::hx::Object::*)())&::iterMagic::ArrIntImg_obj::getRaw,
};

 ::Dynamic ArrIntImg_obj::size_a9623fd7(int width,int height) {
			return size(width,height);
}

 ::Dynamic ArrIntImg_obj::zero_e55b6ed4(int len) {
			return zero(len);
}
void *ArrIntImg_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0xed2c7ccf: return &_hx_iterMagic_ArrIntImg__hx_iterMagic_Iimg;
	}
	#ifdef HXCPP_SCRIPTABLE
	return super::_hx_getInterface(inHash);
	#else
	return 0;
	#endif
}

int ArrIntImg_obj::set(int index,int value){
            	HX_STACKFRAME(&_hx_pos_62e17d0bd1821534_113_set)
HXLINE( 114)		this->data[index] = value;
HXLINE( 115)		return value;
            	}


HX_DEFINE_DYNAMIC_FUNC2(ArrIntImg_obj,set,return )

int ArrIntImg_obj::get(int index){
            	HX_STACKFRAME(&_hx_pos_62e17d0bd1821534_119_get)
HXDLIN( 119)		return this->data->__get(index);
            	}


HX_DEFINE_DYNAMIC_FUNC1(ArrIntImg_obj,get,return )

::Array< int > ArrIntImg_obj::zero(int len){
            	HX_STACKFRAME(&_hx_pos_62e17d0bd1821534_122_zero)
HXLINE( 123)		{
HXLINE( 123)			int _g = 0;
HXDLIN( 123)			int _g1 = len;
HXDLIN( 123)			while((_g < _g1)){
HXLINE( 123)				_g = (_g + 1);
HXDLIN( 123)				int i = (_g - 1);
HXDLIN( 123)				this->data[i] = 0;
            			}
            		}
HXLINE( 124)		return this->data;
            	}


HX_DEFINE_DYNAMIC_FUNC1(ArrIntImg_obj,zero,return )

::Array< int > ArrIntImg_obj::size(int width,int height){
            	HX_STACKFRAME(&_hx_pos_62e17d0bd1821534_127_size)
HXLINE( 128)		this->width = width;
HXLINE( 129)		this->height = height;
HXLINE( 130)		this->data = ::Array_obj< int >::__new(0);
HXLINE( 131)		this->length = ::Std_obj::_hx_int(( (Float)((width * height)) ));
HXLINE( 132)		{
HXLINE( 132)			int _g = 0;
HXDLIN( 132)			int _g1 = this->length;
HXDLIN( 132)			while((_g < _g1)){
HXLINE( 132)				_g = (_g + 1);
HXDLIN( 132)				int i = (_g - 1);
HXDLIN( 132)				this->data[i] = 0;
            			}
            		}
HXDLIN( 132)		return this->data;
            	}


HX_DEFINE_DYNAMIC_FUNC2(ArrIntImg_obj,size,return )

 ::iterMagic::RawImageData ArrIntImg_obj::setRaw( ::iterMagic::RawImageData d){
            	HX_GC_STACKFRAME(&_hx_pos_62e17d0bd1821534_134_setRaw)
HXLINE( 135)		::Array< int > dataD;
HXDLIN( 135)		if ((d->_hx_getIndex() == 1)) {
HXLINE( 136)			::Array< int > a = d->_hx_getObject(0).StaticCast< ::Array< int > >();
HXLINE( 137)			if ((a->length == this->data->length)) {
HXLINE( 135)				dataD = a;
            			}
            			else {
HXLINE( 140)				int diff = (a->length - this->data->length);
HXLINE( 141)				if ((diff > 0)) {
HXLINE( 142)					HX_STACK_DO_THROW( ::haxe::Exception_obj::__alloc( HX_CTX ,(HX_("ArrInt is too long ",14,3f,0d,1c) + diff),null(),null()));
            				}
            				else {
HXLINE( 143)					if ((diff < 0)) {
HXLINE( 144)						HX_STACK_DO_THROW( ::haxe::Exception_obj::__alloc( HX_CTX ,(HX_("ArrInt is too short ",34,42,ed,34) + diff),null(),null()));
            					}
            				}
HXLINE( 135)				dataD = null();
            			}
            		}
            		else {
HXLINE( 149)			 ::iterMagic::RawImageData notA = d;
HXLINE( 150)			HX_STACK_DO_THROW( ::haxe::Exception_obj::__alloc( HX_CTX ,(HX_("can not accept incorrect RawImageData ",6d,da,1b,a7) + ::Std_obj::string(notA)),null(),null()));
            		}
HXLINE( 153)		if (::hx::IsNotNull( dataD )) {
HXLINE( 153)			this->data = dataD;
            		}
HXLINE( 154)		return d;
            	}


HX_DEFINE_DYNAMIC_FUNC1(ArrIntImg_obj,setRaw,return )

 ::iterMagic::RawImageData ArrIntImg_obj::getRaw(){
            	HX_STACKFRAME(&_hx_pos_62e17d0bd1821534_157_getRaw)
HXDLIN( 157)		return ::iterMagic::RawImageData_obj::RawArrImg(this->data);
            	}


HX_DEFINE_DYNAMIC_FUNC0(ArrIntImg_obj,getRaw,return )


::hx::ObjectPtr< ArrIntImg_obj > ArrIntImg_obj::__new() {
	::hx::ObjectPtr< ArrIntImg_obj > __this = new ArrIntImg_obj();
	__this->__construct();
	return __this;
}

::hx::ObjectPtr< ArrIntImg_obj > ArrIntImg_obj::__alloc(::hx::Ctx *_hx_ctx) {
	ArrIntImg_obj *__this = (ArrIntImg_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(ArrIntImg_obj), true, "iterMagic.ArrIntImg"));
	*(void **)__this = ArrIntImg_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

ArrIntImg_obj::ArrIntImg_obj()
{
}

void ArrIntImg_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(ArrIntImg);
	HX_MARK_MEMBER_NAME(data,"data");
	HX_MARK_MEMBER_NAME(count,"count");
	HX_MARK_MEMBER_NAME(width,"width");
	HX_MARK_MEMBER_NAME(height,"height");
	HX_MARK_MEMBER_NAME(length,"length");
	HX_MARK_END_CLASS();
}

void ArrIntImg_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(data,"data");
	HX_VISIT_MEMBER_NAME(count,"count");
	HX_VISIT_MEMBER_NAME(width,"width");
	HX_VISIT_MEMBER_NAME(height,"height");
	HX_VISIT_MEMBER_NAME(length,"length");
}

::hx::Val ArrIntImg_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"set") ) { return ::hx::Val( set_dyn() ); }
		if (HX_FIELD_EQ(inName,"get") ) { return ::hx::Val( get_dyn() ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"data") ) { return ::hx::Val( data ); }
		if (HX_FIELD_EQ(inName,"zero") ) { return ::hx::Val( zero_dyn() ); }
		if (HX_FIELD_EQ(inName,"size") ) { return ::hx::Val( size_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"count") ) { return ::hx::Val( count ); }
		if (HX_FIELD_EQ(inName,"width") ) { return ::hx::Val( width ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { return ::hx::Val( height ); }
		if (HX_FIELD_EQ(inName,"length") ) { return ::hx::Val( length ); }
		if (HX_FIELD_EQ(inName,"setRaw") ) { return ::hx::Val( setRaw_dyn() ); }
		if (HX_FIELD_EQ(inName,"getRaw") ) { return ::hx::Val( getRaw_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val ArrIntImg_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"data") ) { data=inValue.Cast< ::Array< int > >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"count") ) { count=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"width") ) { width=inValue.Cast< int >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { height=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"length") ) { length=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void ArrIntImg_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("data",2a,56,63,42));
	outFields->push(HX_("count",cf,44,63,4a));
	outFields->push(HX_("width",06,b6,62,ca));
	outFields->push(HX_("height",e7,07,4c,02));
	outFields->push(HX_("length",e6,94,07,9f));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo ArrIntImg_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /* ::Array< int > */ ,(int)offsetof(ArrIntImg_obj,data),HX_("data",2a,56,63,42)},
	{::hx::fsInt,(int)offsetof(ArrIntImg_obj,count),HX_("count",cf,44,63,4a)},
	{::hx::fsInt,(int)offsetof(ArrIntImg_obj,width),HX_("width",06,b6,62,ca)},
	{::hx::fsInt,(int)offsetof(ArrIntImg_obj,height),HX_("height",e7,07,4c,02)},
	{::hx::fsInt,(int)offsetof(ArrIntImg_obj,length),HX_("length",e6,94,07,9f)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *ArrIntImg_obj_sStaticStorageInfo = 0;
#endif

static ::String ArrIntImg_obj_sMemberFields[] = {
	HX_("data",2a,56,63,42),
	HX_("count",cf,44,63,4a),
	HX_("width",06,b6,62,ca),
	HX_("height",e7,07,4c,02),
	HX_("length",e6,94,07,9f),
	HX_("set",a2,9b,57,00),
	HX_("get",96,80,4e,00),
	HX_("zero",28,0f,f1,50),
	HX_("size",c1,a0,53,4c),
	HX_("setRaw",66,63,6e,6f),
	HX_("getRaw",f2,0e,26,a3),
	::String(null()) };

::hx::Class ArrIntImg_obj::__mClass;

void ArrIntImg_obj::__register()
{
	ArrIntImg_obj _hx_dummy;
	ArrIntImg_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("iterMagic.ArrIntImg",bc,da,57,23);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(ArrIntImg_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< ArrIntImg_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = ArrIntImg_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = ArrIntImg_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace iterMagic
