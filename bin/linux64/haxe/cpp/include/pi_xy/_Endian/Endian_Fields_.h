// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy__Endian_Endian_Fields_
#define INCLUDED_pi_xy__Endian_Endian_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(pi_xy,_Endian,Endian_Fields_)

namespace pi_xy{
namespace _Endian{


class HXCPP_CLASS_ATTRIBUTES Endian_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Endian_Fields__obj OBJ_;
		Endian_Fields__obj();

	public:
		enum { _hx_ClassId = 0x55718c55 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy._Endian.Endian_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy._Endian.Endian_Fields_"); }

		inline static ::hx::ObjectPtr< Endian_Fields__obj > __new() {
			::hx::ObjectPtr< Endian_Fields__obj > __this = new Endian_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< Endian_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			Endian_Fields__obj *__this = (Endian_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Endian_Fields__obj), false, "pi_xy._Endian.Endian_Fields_"));
			*(void **)__this = Endian_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Endian_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Endian_Fields_",e2,5c,98,7e); }

		static void __boot();
		static bool isLittleEndian;
};

} // end namespace pi_xy
} // end namespace _Endian

#endif /* INCLUDED_pi_xy__Endian_Endian_Fields_ */ 
