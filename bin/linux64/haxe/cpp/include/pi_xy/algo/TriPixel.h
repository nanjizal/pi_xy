// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo_TriPixel
#define INCLUDED_pi_xy_algo_TriPixel

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,HitTri)
HX_DECLARE_CLASS2(pi_xy,algo,IhitObj)
HX_DECLARE_CLASS2(pi_xy,algo,TriPixel)
HX_DECLARE_CLASS2(pi_xy,algo,TriPoints_)

namespace pi_xy{
namespace algo{


class HXCPP_CLASS_ATTRIBUTES TriPixel_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef TriPixel_obj OBJ_;
		TriPixel_obj();

	public:
		enum { _hx_ClassId = 0x00ad7a95 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.algo.TriPixel")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.algo.TriPixel"); }
		static ::hx::ObjectPtr< TriPixel_obj > __new();
		static ::hx::ObjectPtr< TriPixel_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TriPixel_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("TriPixel",7b,6d,66,9a); }

		 ::Dynamic _fillTriUnsafe;
		Dynamic _fillTriUnsafe_dyn() { return _fillTriUnsafe;}
		 ::Dynamic _tileTriUnsafe;
		Dynamic _tileTriUnsafe_dyn() { return _tileTriUnsafe;}
		 ::Dynamic _fillGradTriangle;
		Dynamic _fillGradTriangle_dyn() { return _fillGradTriangle;}
};

} // end namespace pi_xy
} // end namespace algo

#endif /* INCLUDED_pi_xy_algo_TriPixel */ 