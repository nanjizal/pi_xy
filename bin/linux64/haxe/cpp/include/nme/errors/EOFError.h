// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_errors_EOFError
#define INCLUDED_nme_errors_EOFError

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_nme_errors_Error
#include <nme/errors/Error.h>
#endif
HX_DECLARE_STACK_FRAME(_hx_pos_af3f52189d1752b9_8_new)
HX_DECLARE_CLASS2(nme,errors,EOFError)
HX_DECLARE_CLASS2(nme,errors,Error)

namespace nme{
namespace errors{


class HXCPP_CLASS_ATTRIBUTES EOFError_obj : public  ::nme::errors::Error_obj
{
	public:
		typedef  ::nme::errors::Error_obj super;
		typedef EOFError_obj OBJ_;
		EOFError_obj();

	public:
		enum { _hx_ClassId = 0x39087499 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="nme.errors.EOFError")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"nme.errors.EOFError"); }

		inline static ::hx::ObjectPtr< EOFError_obj > __new() {
			::hx::ObjectPtr< EOFError_obj > __this = new EOFError_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< EOFError_obj > __alloc(::hx::Ctx *_hx_ctx) {
			EOFError_obj *__this = (EOFError_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(EOFError_obj), true, "nme.errors.EOFError"));
			*(void **)__this = EOFError_obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_af3f52189d1752b9_8_new)
HXDLIN(   8)		__this->super::__construct(HX_("End of file was encountered",fb,7f,d6,0b),2030);
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~EOFError_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("EOFError",8c,e5,0a,43); }

};

} // end namespace nme
} // end namespace errors

#endif /* INCLUDED_nme_errors_EOFError */ 