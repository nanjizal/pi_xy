// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_native_Include
#define INCLUDED_nme_native_Include

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(nme,native,Include)

namespace nme{
namespace native{


class HXCPP_CLASS_ATTRIBUTES Include_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Include_obj OBJ_;
		Include_obj();

	public:
		enum { _hx_ClassId = 0x6bcd28cb };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.native.Include")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.native.Include"); }

		inline static ::hx::ObjectPtr< Include_obj > __new() {
			::hx::ObjectPtr< Include_obj > __this = new Include_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< Include_obj > __alloc(::hx::Ctx *_hx_ctx) {
			Include_obj *__this = (Include_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Include_obj), false, "nme.native.Include"));
			*(void **)__this = Include_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Include_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Include",08,26,48,1f); }

};

} // end namespace nme
} // end namespace native

#endif /* INCLUDED_nme_native_Include */ 
