// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_filters_BitmapFilter
#define INCLUDED_nme_filters_BitmapFilter

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_STACK_FRAME(_hx_pos_6127804af30e1a01_10_new)
HX_DECLARE_CLASS2(nme,filters,BitmapFilter)

namespace nme{
namespace filters{


class HXCPP_CLASS_ATTRIBUTES BitmapFilter_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef BitmapFilter_obj OBJ_;
		BitmapFilter_obj();

	public:
		enum { _hx_ClassId = 0x2a5ecac0 };

		void __construct(::String inType);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="nme.filters.BitmapFilter")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"nme.filters.BitmapFilter"); }

		inline static ::hx::ObjectPtr< BitmapFilter_obj > __new(::String inType) {
			::hx::ObjectPtr< BitmapFilter_obj > __this = new BitmapFilter_obj();
			__this->__construct(inType);
			return __this;
		}

		inline static ::hx::ObjectPtr< BitmapFilter_obj > __alloc(::hx::Ctx *_hx_ctx,::String inType) {
			BitmapFilter_obj *__this = (BitmapFilter_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(BitmapFilter_obj), true, "nme.filters.BitmapFilter"));
			*(void **)__this = BitmapFilter_obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_6127804af30e1a01_10_new)
HXDLIN(  10)		( ( ::nme::filters::BitmapFilter)(__this) )->type = inType;
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~BitmapFilter_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("BitmapFilter",27,0d,67,58); }

		::String type;
		 ::nme::filters::BitmapFilter clone();
		::Dynamic clone_dyn();

};

} // end namespace nme
} // end namespace filters

#endif /* INCLUDED_nme_filters_BitmapFilter */ 