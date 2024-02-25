// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_formats__BytesCameleon_BytesCameleon_Impl_
#define INCLUDED_pi_xy_formats__BytesCameleon_BytesCameleon_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(pi_xy,formats,_BytesCameleon,BytesCameleon_Impl_)

namespace pi_xy{
namespace formats{
namespace _BytesCameleon{


class HXCPP_CLASS_ATTRIBUTES BytesCameleon_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef BytesCameleon_Impl__obj OBJ_;
		BytesCameleon_Impl__obj();

	public:
		enum { _hx_ClassId = 0x159f6b8a };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.formats._BytesCameleon.BytesCameleon_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.formats._BytesCameleon.BytesCameleon_Impl_"); }

		inline static ::hx::ObjectPtr< BytesCameleon_Impl__obj > __new() {
			::hx::ObjectPtr< BytesCameleon_Impl__obj > __this = new BytesCameleon_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< BytesCameleon_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			BytesCameleon_Impl__obj *__this = (BytesCameleon_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(BytesCameleon_Impl__obj), false, "pi_xy.formats._BytesCameleon.BytesCameleon_Impl_"));
			*(void **)__this = BytesCameleon_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~BytesCameleon_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("BytesCameleon_Impl_",19,61,f8,5f); }

		static  ::haxe::io::Bytes _new( ::haxe::io::Bytes bytes);
		static ::Dynamic _new_dyn();

		static void ARGB_RGBA( ::haxe::io::Bytes this1);
		static ::Dynamic ARGB_RGBA_dyn();

		static void RGBA_ARGB( ::haxe::io::Bytes this1);
		static ::Dynamic RGBA_ARGB_dyn();

		static void ARGB_BGRA( ::haxe::io::Bytes this1);
		static ::Dynamic ARGB_BGRA_dyn();

		static void ARGB_ABGR( ::haxe::io::Bytes this1);
		static ::Dynamic ARGB_ABGR_dyn();

		static void ABGR_ARGB( ::haxe::io::Bytes this1);
		static ::Dynamic ABGR_ARGB_dyn();

		static void ABGR_RGBA( ::haxe::io::Bytes this1);
		static ::Dynamic ABGR_RGBA_dyn();

		static void BGRA_ARGB( ::haxe::io::Bytes this1);
		static ::Dynamic BGRA_ARGB_dyn();

		static void BGRA_RGBA( ::haxe::io::Bytes this1);
		static ::Dynamic BGRA_RGBA_dyn();

};

} // end namespace pi_xy
} // end namespace formats
} // end namespace _BytesCameleon

#endif /* INCLUDED_pi_xy_formats__BytesCameleon_BytesCameleon_Impl_ */ 