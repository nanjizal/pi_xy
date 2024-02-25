// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_pi_xy_formats__BytesCameleon_BytesCameleon_Impl_
#include <pi_xy/formats/_BytesCameleon/BytesCameleon_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_5__new,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","_new",0xd56a7711,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_._new","pi_xy/formats/BytesCameleon.hx",5,0x86b17580)
HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_10_ARGB_RGBA,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","ARGB_RGBA",0x6d952c17,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_.ARGB_RGBA","pi_xy/formats/BytesCameleon.hx",10,0x86b17580)
HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_28_RGBA_ARGB,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","RGBA_ARGB",0xb8f74c47,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_.RGBA_ARGB","pi_xy/formats/BytesCameleon.hx",28,0x86b17580)
HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_46_ARGB_BGRA,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","ARGB_BGRA",0x6301d017,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_.ARGB_BGRA","pi_xy/formats/BytesCameleon.hx",46,0x86b17580)
HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_64_ARGB_ABGR,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","ARGB_ABGR",0x6254c4af,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_.ARGB_ABGR","pi_xy/formats/BytesCameleon.hx",64,0x86b17580)
HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_82_ABGR_ARGB,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","ABGR_ARGB",0x34ef8caf,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_.ABGR_ARGB","pi_xy/formats/BytesCameleon.hx",82,0x86b17580)
HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_100_ABGR_RGBA,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","ABGR_RGBA",0x4023d017,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_.ABGR_RGBA","pi_xy/formats/BytesCameleon.hx",100,0x86b17580)
HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_118_BGRA_ARGB,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","BGRA_ARGB",0x23382847,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_.BGRA_ARGB","pi_xy/formats/BytesCameleon.hx",118,0x86b17580)
HX_LOCAL_STACK_FRAME(_hx_pos_1f47fe87a1498559_136_BGRA_RGBA,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_","BGRA_RGBA",0x2e6c6baf,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_.BGRA_RGBA","pi_xy/formats/BytesCameleon.hx",136,0x86b17580)
namespace pi_xy{
namespace formats{
namespace _BytesCameleon{

void BytesCameleon_Impl__obj::__construct() { }

Dynamic BytesCameleon_Impl__obj::__CreateEmpty() { return new BytesCameleon_Impl__obj; }

void *BytesCameleon_Impl__obj::_hx_vtable = 0;

Dynamic BytesCameleon_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< BytesCameleon_Impl__obj > _hx_result = new BytesCameleon_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool BytesCameleon_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x159f6b8a;
}

 ::haxe::io::Bytes BytesCameleon_Impl__obj::_new( ::haxe::io::Bytes bytes){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_5__new)
HXDLIN(   5)		return bytes;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,_new,return )

void BytesCameleon_Impl__obj::ARGB_RGBA( ::haxe::io::Bytes this1){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_10_ARGB_RGBA)
HXLINE(  11)		int p = 0;
HXLINE(  12)		int a;
HXLINE(  13)		int r;
HXLINE(  14)		int g;
HXLINE(  15)		int b;
HXLINE(  16)		{
HXLINE(  16)			int _g = 0;
HXDLIN(  16)			int _g1 = (this1->length >> 2);
HXDLIN(  16)			while((_g < _g1)){
HXLINE(  16)				_g = (_g + 1);
HXDLIN(  16)				int i = (_g - 1);
HXLINE(  17)				int a1 = ( (int)(this1->b->__get(p)) );
HXLINE(  18)				int r1 = ( (int)(this1->b->__get((p + 1))) );
HXLINE(  19)				int g1 = ( (int)(this1->b->__get((p + 2))) );
HXLINE(  20)				int b1 = ( (int)(this1->b->__get((p + 3))) );
HXLINE(  21)				{
HXLINE(  21)					p = (p + 1);
HXDLIN(  21)					this1->b[(p - 1)] = ( (unsigned char)(r1) );
            				}
HXLINE(  22)				{
HXLINE(  22)					p = (p + 1);
HXDLIN(  22)					this1->b[(p - 1)] = ( (unsigned char)(g1) );
            				}
HXLINE(  23)				{
HXLINE(  23)					p = (p + 1);
HXDLIN(  23)					this1->b[(p - 1)] = ( (unsigned char)(b1) );
            				}
HXLINE(  24)				{
HXLINE(  24)					p = (p + 1);
HXDLIN(  24)					this1->b[(p - 1)] = ( (unsigned char)(a1) );
            				}
            			}
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,ARGB_RGBA,(void))

void BytesCameleon_Impl__obj::RGBA_ARGB( ::haxe::io::Bytes this1){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_28_RGBA_ARGB)
HXLINE(  29)		int p = 0;
HXLINE(  30)		int a;
HXLINE(  31)		int r;
HXLINE(  32)		int g;
HXLINE(  33)		int b;
HXLINE(  34)		{
HXLINE(  34)			int _g = 0;
HXDLIN(  34)			int _g1 = (this1->length >> 2);
HXDLIN(  34)			while((_g < _g1)){
HXLINE(  34)				_g = (_g + 1);
HXDLIN(  34)				int i = (_g - 1);
HXLINE(  35)				int r1 = ( (int)(this1->b->__get(p)) );
HXLINE(  36)				int g1 = ( (int)(this1->b->__get((p + 1))) );
HXLINE(  37)				int b1 = ( (int)(this1->b->__get((p + 2))) );
HXLINE(  38)				int a1 = ( (int)(this1->b->__get((p + 3))) );
HXLINE(  39)				{
HXLINE(  39)					p = (p + 1);
HXDLIN(  39)					this1->b[(p - 1)] = ( (unsigned char)(a1) );
            				}
HXLINE(  40)				{
HXLINE(  40)					p = (p + 1);
HXDLIN(  40)					this1->b[(p - 1)] = ( (unsigned char)(r1) );
            				}
HXLINE(  41)				{
HXLINE(  41)					p = (p + 1);
HXDLIN(  41)					this1->b[(p - 1)] = ( (unsigned char)(g1) );
            				}
HXLINE(  42)				{
HXLINE(  42)					p = (p + 1);
HXDLIN(  42)					this1->b[(p - 1)] = ( (unsigned char)(b1) );
            				}
            			}
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,RGBA_ARGB,(void))

void BytesCameleon_Impl__obj::ARGB_BGRA( ::haxe::io::Bytes this1){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_46_ARGB_BGRA)
HXLINE(  47)		int p = 0;
HXLINE(  48)		int a;
HXLINE(  49)		int r;
HXLINE(  50)		int g;
HXLINE(  51)		int b;
HXLINE(  52)		{
HXLINE(  52)			int _g = 0;
HXDLIN(  52)			int _g1 = (this1->length >> 2);
HXDLIN(  52)			while((_g < _g1)){
HXLINE(  52)				_g = (_g + 1);
HXDLIN(  52)				int i = (_g - 1);
HXLINE(  53)				int a1 = ( (int)(this1->b->__get(p)) );
HXLINE(  54)				int r1 = ( (int)(this1->b->__get((p + 1))) );
HXLINE(  55)				int g1 = ( (int)(this1->b->__get((p + 2))) );
HXLINE(  56)				int b1 = ( (int)(this1->b->__get((p + 3))) );
HXLINE(  57)				{
HXLINE(  57)					p = (p + 1);
HXDLIN(  57)					this1->b[(p - 1)] = ( (unsigned char)(b1) );
            				}
HXLINE(  58)				{
HXLINE(  58)					p = (p + 1);
HXDLIN(  58)					this1->b[(p - 1)] = ( (unsigned char)(g1) );
            				}
HXLINE(  59)				{
HXLINE(  59)					p = (p + 1);
HXDLIN(  59)					this1->b[(p - 1)] = ( (unsigned char)(r1) );
            				}
HXLINE(  60)				{
HXLINE(  60)					p = (p + 1);
HXDLIN(  60)					this1->b[(p - 1)] = ( (unsigned char)(a1) );
            				}
            			}
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,ARGB_BGRA,(void))

void BytesCameleon_Impl__obj::ARGB_ABGR( ::haxe::io::Bytes this1){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_64_ARGB_ABGR)
HXLINE(  65)		int p = 0;
HXLINE(  66)		int a;
HXLINE(  67)		int r;
HXLINE(  68)		int g;
HXLINE(  69)		int b;
HXLINE(  70)		{
HXLINE(  70)			int _g = 0;
HXDLIN(  70)			int _g1 = (this1->length >> 2);
HXDLIN(  70)			while((_g < _g1)){
HXLINE(  70)				_g = (_g + 1);
HXDLIN(  70)				int i = (_g - 1);
HXLINE(  71)				int a1 = ( (int)(this1->b->__get(p)) );
HXLINE(  72)				int r1 = ( (int)(this1->b->__get((p + 1))) );
HXLINE(  73)				int g1 = ( (int)(this1->b->__get((p + 2))) );
HXLINE(  74)				int b1 = ( (int)(this1->b->__get((p + 3))) );
HXLINE(  75)				{
HXLINE(  75)					p = (p + 1);
HXDLIN(  75)					this1->b[(p - 1)] = ( (unsigned char)(a1) );
            				}
HXLINE(  76)				{
HXLINE(  76)					p = (p + 1);
HXDLIN(  76)					this1->b[(p - 1)] = ( (unsigned char)(b1) );
            				}
HXLINE(  77)				{
HXLINE(  77)					p = (p + 1);
HXDLIN(  77)					this1->b[(p - 1)] = ( (unsigned char)(g1) );
            				}
HXLINE(  78)				{
HXLINE(  78)					p = (p + 1);
HXDLIN(  78)					this1->b[(p - 1)] = ( (unsigned char)(r1) );
            				}
            			}
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,ARGB_ABGR,(void))

void BytesCameleon_Impl__obj::ABGR_ARGB( ::haxe::io::Bytes this1){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_82_ABGR_ARGB)
HXLINE(  83)		int p = 0;
HXLINE(  84)		int a;
HXLINE(  85)		int r;
HXLINE(  86)		int g;
HXLINE(  87)		int b;
HXLINE(  88)		{
HXLINE(  88)			int _g = 0;
HXDLIN(  88)			int _g1 = (this1->length >> 2);
HXDLIN(  88)			while((_g < _g1)){
HXLINE(  88)				_g = (_g + 1);
HXDLIN(  88)				int i = (_g - 1);
HXLINE(  89)				int a1 = ( (int)(this1->b->__get(p)) );
HXLINE(  90)				int b1 = ( (int)(this1->b->__get((p + 1))) );
HXLINE(  91)				int g1 = ( (int)(this1->b->__get((p + 2))) );
HXLINE(  92)				int r1 = ( (int)(this1->b->__get((p + 3))) );
HXLINE(  93)				{
HXLINE(  93)					p = (p + 1);
HXDLIN(  93)					this1->b[(p - 1)] = ( (unsigned char)(a1) );
            				}
HXLINE(  94)				{
HXLINE(  94)					p = (p + 1);
HXDLIN(  94)					this1->b[(p - 1)] = ( (unsigned char)(r1) );
            				}
HXLINE(  95)				{
HXLINE(  95)					p = (p + 1);
HXDLIN(  95)					this1->b[(p - 1)] = ( (unsigned char)(g1) );
            				}
HXLINE(  96)				{
HXLINE(  96)					p = (p + 1);
HXDLIN(  96)					this1->b[(p - 1)] = ( (unsigned char)(b1) );
            				}
            			}
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,ABGR_ARGB,(void))

void BytesCameleon_Impl__obj::ABGR_RGBA( ::haxe::io::Bytes this1){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_100_ABGR_RGBA)
HXLINE( 101)		int p = 0;
HXLINE( 102)		int a;
HXLINE( 103)		int r;
HXLINE( 104)		int g;
HXLINE( 105)		int b;
HXLINE( 106)		{
HXLINE( 106)			int _g = 0;
HXDLIN( 106)			int _g1 = (this1->length >> 2);
HXDLIN( 106)			while((_g < _g1)){
HXLINE( 106)				_g = (_g + 1);
HXDLIN( 106)				int i = (_g - 1);
HXLINE( 107)				int a1 = ( (int)(this1->b->__get(p)) );
HXLINE( 108)				int b1 = ( (int)(this1->b->__get((p + 1))) );
HXLINE( 109)				int g1 = ( (int)(this1->b->__get((p + 2))) );
HXLINE( 110)				int r1 = ( (int)(this1->b->__get((p + 3))) );
HXLINE( 111)				{
HXLINE( 111)					p = (p + 1);
HXDLIN( 111)					this1->b[(p - 1)] = ( (unsigned char)(r1) );
            				}
HXLINE( 112)				{
HXLINE( 112)					p = (p + 1);
HXDLIN( 112)					this1->b[(p - 1)] = ( (unsigned char)(g1) );
            				}
HXLINE( 113)				{
HXLINE( 113)					p = (p + 1);
HXDLIN( 113)					this1->b[(p - 1)] = ( (unsigned char)(b1) );
            				}
HXLINE( 114)				{
HXLINE( 114)					p = (p + 1);
HXDLIN( 114)					this1->b[(p - 1)] = ( (unsigned char)(a1) );
            				}
            			}
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,ABGR_RGBA,(void))

void BytesCameleon_Impl__obj::BGRA_ARGB( ::haxe::io::Bytes this1){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_118_BGRA_ARGB)
HXLINE( 119)		int p = 0;
HXLINE( 120)		int a;
HXLINE( 121)		int r;
HXLINE( 122)		int g;
HXLINE( 123)		int b;
HXLINE( 124)		{
HXLINE( 124)			int _g = 0;
HXDLIN( 124)			int _g1 = (this1->length >> 2);
HXDLIN( 124)			while((_g < _g1)){
HXLINE( 124)				_g = (_g + 1);
HXDLIN( 124)				int i = (_g - 1);
HXLINE( 125)				int b1 = ( (int)(this1->b->__get(p)) );
HXLINE( 126)				int g1 = ( (int)(this1->b->__get((p + 1))) );
HXLINE( 127)				int r1 = ( (int)(this1->b->__get((p + 2))) );
HXLINE( 128)				int a1 = ( (int)(this1->b->__get((p + 3))) );
HXLINE( 129)				{
HXLINE( 129)					p = (p + 1);
HXDLIN( 129)					this1->b[(p - 1)] = ( (unsigned char)(a1) );
            				}
HXLINE( 130)				{
HXLINE( 130)					p = (p + 1);
HXDLIN( 130)					this1->b[(p - 1)] = ( (unsigned char)(r1) );
            				}
HXLINE( 131)				{
HXLINE( 131)					p = (p + 1);
HXDLIN( 131)					this1->b[(p - 1)] = ( (unsigned char)(g1) );
            				}
HXLINE( 132)				{
HXLINE( 132)					p = (p + 1);
HXDLIN( 132)					this1->b[(p - 1)] = ( (unsigned char)(b1) );
            				}
            			}
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,BGRA_ARGB,(void))

void BytesCameleon_Impl__obj::BGRA_RGBA( ::haxe::io::Bytes this1){
            	HX_STACKFRAME(&_hx_pos_1f47fe87a1498559_136_BGRA_RGBA)
HXLINE( 137)		int p = 0;
HXLINE( 138)		int a;
HXLINE( 139)		int r;
HXLINE( 140)		int g;
HXLINE( 141)		int b;
HXLINE( 142)		{
HXLINE( 142)			int _g = 0;
HXDLIN( 142)			int _g1 = (this1->length >> 2);
HXDLIN( 142)			while((_g < _g1)){
HXLINE( 142)				_g = (_g + 1);
HXDLIN( 142)				int i = (_g - 1);
HXLINE( 143)				int b1 = ( (int)(this1->b->__get(p)) );
HXLINE( 144)				int g1 = ( (int)(this1->b->__get((p + 1))) );
HXLINE( 145)				int r1 = ( (int)(this1->b->__get((p + 2))) );
HXLINE( 146)				int a1 = ( (int)(this1->b->__get((p + 3))) );
HXLINE( 147)				{
HXLINE( 147)					p = (p + 1);
HXDLIN( 147)					this1->b[(p - 1)] = ( (unsigned char)(r1) );
            				}
HXLINE( 148)				{
HXLINE( 148)					p = (p + 1);
HXDLIN( 148)					this1->b[(p - 1)] = ( (unsigned char)(g1) );
            				}
HXLINE( 149)				{
HXLINE( 149)					p = (p + 1);
HXDLIN( 149)					this1->b[(p - 1)] = ( (unsigned char)(b1) );
            				}
HXLINE( 150)				{
HXLINE( 150)					p = (p + 1);
HXDLIN( 150)					this1->b[(p - 1)] = ( (unsigned char)(a1) );
            				}
            			}
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(BytesCameleon_Impl__obj,BGRA_RGBA,(void))


BytesCameleon_Impl__obj::BytesCameleon_Impl__obj()
{
}

bool BytesCameleon_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"_new") ) { outValue = _new_dyn(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"ARGB_RGBA") ) { outValue = ARGB_RGBA_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"RGBA_ARGB") ) { outValue = RGBA_ARGB_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"ARGB_BGRA") ) { outValue = ARGB_BGRA_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"ARGB_ABGR") ) { outValue = ARGB_ABGR_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"ABGR_ARGB") ) { outValue = ABGR_ARGB_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"ABGR_RGBA") ) { outValue = ABGR_RGBA_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"BGRA_ARGB") ) { outValue = BGRA_ARGB_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"BGRA_RGBA") ) { outValue = BGRA_RGBA_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *BytesCameleon_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *BytesCameleon_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class BytesCameleon_Impl__obj::__mClass;

static ::String BytesCameleon_Impl__obj_sStaticFields[] = {
	HX_("_new",61,15,1f,3f),
	HX_("ARGB_RGBA",c7,ab,f0,b6),
	HX_("RGBA_ARGB",f7,cb,52,02),
	HX_("ARGB_BGRA",c7,4f,5d,ac),
	HX_("ARGB_ABGR",5f,44,b0,ab),
	HX_("ABGR_ARGB",5f,0c,4b,7e),
	HX_("ABGR_RGBA",c7,4f,7f,89),
	HX_("BGRA_ARGB",f7,a7,93,6c),
	HX_("BGRA_RGBA",5f,eb,c7,77),
	::String(null())
};

void BytesCameleon_Impl__obj::__register()
{
	BytesCameleon_Impl__obj _hx_dummy;
	BytesCameleon_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.formats._BytesCameleon.BytesCameleon_Impl_",be,5c,a4,e0);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &BytesCameleon_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(BytesCameleon_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< BytesCameleon_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = BytesCameleon_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = BytesCameleon_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace formats
} // end namespace _BytesCameleon