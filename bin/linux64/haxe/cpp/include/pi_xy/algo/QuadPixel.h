// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo_QuadPixel
#define INCLUDED_pi_xy_algo_QuadPixel

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,HitQuad)
HX_DECLARE_CLASS2(pi_xy,algo,IhitObj)
HX_DECLARE_CLASS2(pi_xy,algo,QuadPixel)
HX_DECLARE_CLASS2(pi_xy,algo,QuadPoints_)

namespace pi_xy{
namespace algo{


class HXCPP_CLASS_ATTRIBUTES QuadPixel_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef QuadPixel_obj OBJ_;
		QuadPixel_obj();

	public:
		enum { _hx_ClassId = 0x0d7815c5 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.algo.QuadPixel")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.algo.QuadPixel"); }
		static ::hx::ObjectPtr< QuadPixel_obj > __new();
		static ::hx::ObjectPtr< QuadPixel_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~QuadPixel_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("QuadPixel",1f,ac,93,f5); }

		 ::Dynamic _fillQuadrilateral;
		Dynamic _fillQuadrilateral_dyn() { return _fillQuadrilateral;}
		 ::Dynamic _tileQuadrilateral;
		Dynamic _tileQuadrilateral_dyn() { return _tileQuadrilateral;}
		 ::Dynamic _fillGradQuadrilateral;
		Dynamic _fillGradQuadrilateral_dyn() { return _fillGradQuadrilateral;}
};

} // end namespace pi_xy
} // end namespace algo

#endif /* INCLUDED_pi_xy_algo_QuadPixel */ 
