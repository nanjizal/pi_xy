// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_Loader
#define INCLUDED_nme_Loader

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(nme,Loader)

namespace nme{


class HXCPP_CLASS_ATTRIBUTES Loader_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Loader_obj OBJ_;
		Loader_obj();

	public:
		enum { _hx_ClassId = 0x19cf5179 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.Loader")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.Loader"); }

		inline static ::hx::ObjectPtr< Loader_obj > __new() {
			::hx::ObjectPtr< Loader_obj > __this = new Loader_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< Loader_obj > __alloc(::hx::Ctx *_hx_ctx) {
			Loader_obj *__this = (Loader_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Loader_obj), false, "nme.Loader"));
			*(void **)__this = Loader_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Loader_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Loader",33,bc,03,8d); }

		static void __boot();
		static bool foundNdll;
		static bool moduleInit;
		static ::String moduleName;
		static ::String findHaxeLib(::String inLib);
		static ::Dynamic findHaxeLib_dyn();

		static  ::Dynamic load(::String func,int args);
		static ::Dynamic load_dyn();

		static void loaderTrace(::String inStr);
		static ::Dynamic loaderTrace_dyn();

		static ::String sysName();
		static ::Dynamic sysName_dyn();

		static  ::Dynamic tryLoad(::String inName,::String func,int args);
		static ::Dynamic tryLoad_dyn();

};

} // end namespace nme

#endif /* INCLUDED_nme_Loader */ 