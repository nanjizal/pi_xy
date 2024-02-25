// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo__TriPixelSmooth_TriPixelSmooth_Fields_
#define INCLUDED_pi_xy_algo__TriPixelSmooth_TriPixelSmooth_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,HitQuad)
HX_DECLARE_CLASS2(pi_xy,algo,HitTri)
HX_DECLARE_CLASS2(pi_xy,algo,IhitObj)
HX_DECLARE_CLASS2(pi_xy,algo,QuadPoints_)
HX_DECLARE_CLASS2(pi_xy,algo,TriPoints_)
HX_DECLARE_CLASS3(pi_xy,algo,_TriPixelSmooth,TriPixelSmooth_Fields_)

namespace pi_xy{
namespace algo{
namespace _TriPixelSmooth{


class HXCPP_CLASS_ATTRIBUTES TriPixelSmooth_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef TriPixelSmooth_Fields__obj OBJ_;
		TriPixelSmooth_Fields__obj();

	public:
		enum { _hx_ClassId = 0x0944e486 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.algo._TriPixelSmooth.TriPixelSmooth_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.algo._TriPixelSmooth.TriPixelSmooth_Fields_"); }

		inline static ::hx::ObjectPtr< TriPixelSmooth_Fields__obj > __new() {
			::hx::ObjectPtr< TriPixelSmooth_Fields__obj > __this = new TriPixelSmooth_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< TriPixelSmooth_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			TriPixelSmooth_Fields__obj *__this = (TriPixelSmooth_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(TriPixelSmooth_Fields__obj), false, "pi_xy.algo._TriPixelSmooth.TriPixelSmooth_Fields_"));
			*(void **)__this = TriPixelSmooth_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TriPixelSmooth_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("TriPixelSmooth_Fields_",30,06,72,83); }

		static  ::pi_xy::algo::HitQuad quadPentagonBarycentric( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy,int color,::hx::Null< bool >  hasHit);
		static ::Dynamic quadPentagonBarycentric_dyn();

		static  ::pi_xy::algo::HitTri triPentagonBarycentricBottom( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,int color,::hx::Null< bool >  hasHit,::hx::Null< bool >  hasUndo);
		static ::Dynamic triPentagonBarycentricBottom_dyn();

		static  ::pi_xy::algo::HitTri triPentagonBarycentricTop( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,int color,::hx::Null< bool >  hasHit,::hx::Null< bool >  hasUndo);
		static ::Dynamic triPentagonBarycentricTop_dyn();

		static  ::pi_xy::algo::HitTri triPentagonBarycentic( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,int color,::hx::Null< bool >  softAB,::hx::Null< bool >  softBC,::hx::Null< bool >  softCA,::hx::Null< bool >  hasHit,::hx::Null< bool >  hasUndo);
		static ::Dynamic triPentagonBarycentic_dyn();

};

} // end namespace pi_xy
} // end namespace algo
} // end namespace _TriPixelSmooth

#endif /* INCLUDED_pi_xy_algo__TriPixelSmooth_TriPixelSmooth_Fields_ */ 