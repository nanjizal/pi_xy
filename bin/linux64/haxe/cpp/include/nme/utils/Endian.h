// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_utils_Endian
#define INCLUDED_nme_utils_Endian

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(nme,utils,Endian)

namespace nme{
namespace utils{


class HXCPP_CLASS_ATTRIBUTES Endian_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Endian_obj OBJ_;
		Endian_obj();

	public:
		enum { _hx_ClassId = 0x6c01d226 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.utils.Endian")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.utils.Endian"); }

		inline static ::hx::ObjectPtr< Endian_obj > __new() {
			::hx::ObjectPtr< Endian_obj > __this = new Endian_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< Endian_obj > __alloc(::hx::Ctx *_hx_ctx) {
			Endian_obj *__this = (Endian_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Endian_obj), false, "nme.utils.Endian"));
			*(void **)__this = Endian_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Endian_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Endian",bb,0c,1d,2f); }

		static void __boot();
		static ::String _hx_BIG_ENDIAN;
		static ::String _hx_LITTLE_ENDIAN;
};

} // end namespace nme
} // end namespace utils

#endif /* INCLUDED_nme_utils_Endian */ 