// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo_RectanglePixel
#define INCLUDED_pi_xy_algo_RectanglePixel

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,RectanglePixel)

namespace pi_xy{
namespace algo{


class HXCPP_CLASS_ATTRIBUTES RectanglePixel_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef RectanglePixel_obj OBJ_;
		RectanglePixel_obj();

	public:
		enum { _hx_ClassId = 0x1e2c4891 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.algo.RectanglePixel")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.algo.RectanglePixel"); }
		static ::hx::ObjectPtr< RectanglePixel_obj > __new();
		static ::hx::ObjectPtr< RectanglePixel_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~RectanglePixel_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("RectanglePixel",f7,6b,6f,78); }

		 ::Dynamic _fillRadialRect;
		Dynamic _fillRadialRect_dyn() { return _fillRadialRect;}
};

} // end namespace pi_xy
} // end namespace algo

#endif /* INCLUDED_pi_xy_algo_RectanglePixel */ 
