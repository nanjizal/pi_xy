// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_media_SoundLoaderContext
#define INCLUDED_nme_media_SoundLoaderContext

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_STACK_FRAME(_hx_pos_b04fd0ba64e79f69_7_new)
HX_DECLARE_CLASS2(nme,media,SoundLoaderContext)

namespace nme{
namespace media{


class HXCPP_CLASS_ATTRIBUTES SoundLoaderContext_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef SoundLoaderContext_obj OBJ_;
		SoundLoaderContext_obj();

	public:
		enum { _hx_ClassId = 0x4939a0d3 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.media.SoundLoaderContext")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.media.SoundLoaderContext"); }

		inline static ::hx::ObjectPtr< SoundLoaderContext_obj > __new() {
			::hx::ObjectPtr< SoundLoaderContext_obj > __this = new SoundLoaderContext_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< SoundLoaderContext_obj > __alloc(::hx::Ctx *_hx_ctx) {
			SoundLoaderContext_obj *__this = (SoundLoaderContext_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(SoundLoaderContext_obj), false, "nme.media.SoundLoaderContext"));
			*(void **)__this = SoundLoaderContext_obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_b04fd0ba64e79f69_7_new)
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~SoundLoaderContext_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("SoundLoaderContext",ed,bf,f5,97); }

};

} // end namespace nme
} // end namespace media

#endif /* INCLUDED_nme_media_SoundLoaderContext */ 
