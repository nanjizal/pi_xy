// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_AssetData
#define INCLUDED_nme_AssetData

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(nme,AssetData)

namespace nme{


class HXCPP_CLASS_ATTRIBUTES AssetData_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef AssetData_obj OBJ_;
		AssetData_obj();

	public:
		enum { _hx_ClassId = 0x3800fe94 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.AssetData")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.AssetData"); }

		inline static ::hx::ObjectPtr< AssetData_obj > __new() {
			::hx::ObjectPtr< AssetData_obj > __this = new AssetData_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< AssetData_obj > __alloc(::hx::Ctx *_hx_ctx) {
			AssetData_obj *__this = (AssetData_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(AssetData_obj), false, "nme.AssetData"));
			*(void **)__this = AssetData_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~AssetData_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("AssetData",1a,84,dc,48); }

		static void create();
		static ::Dynamic create_dyn();

};

} // end namespace nme

#endif /* INCLUDED_nme_AssetData */ 
