// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo_PolyPixel
#define INCLUDED_pi_xy_algo_PolyPixel

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,PolyPixel)

namespace pi_xy{
namespace algo{


class HXCPP_CLASS_ATTRIBUTES PolyPixel_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef PolyPixel_obj OBJ_;
		PolyPixel_obj();

	public:
		enum { _hx_ClassId = 0x1242ae20 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.algo.PolyPixel")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.algo.PolyPixel"); }
		static ::hx::ObjectPtr< PolyPixel_obj > __new();
		static ::hx::ObjectPtr< PolyPixel_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~PolyPixel_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("PolyPixel",7a,44,5e,fa); }

		 ::Dynamic _fillPolygonBuild;
		Dynamic _fillPolygonBuild_dyn() { return _fillPolygonBuild;}
		 ::Dynamic _tilePolygonBuild;
		Dynamic _tilePolygonBuild_dyn() { return _tilePolygonBuild;}
		 ::Dynamic _fillRadialPolyBuild;
		Dynamic _fillRadialPolyBuild_dyn() { return _fillRadialPolyBuild;}
};

} // end namespace pi_xy
} // end namespace algo

#endif /* INCLUDED_pi_xy_algo_PolyPixel */ 