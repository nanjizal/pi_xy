// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo__QuadPixel_QuadPixel_Fields_
#define INCLUDED_pi_xy_algo__QuadPixel_QuadPixel_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,HitQuad)
HX_DECLARE_CLASS2(pi_xy,algo,IhitObj)
HX_DECLARE_CLASS2(pi_xy,algo,QuadPoints_)
HX_DECLARE_CLASS2(pi_xy,algo,RectangleWindow)
HX_DECLARE_CLASS3(pi_xy,algo,_QuadPixel,QuadPixel_Fields_)

namespace pi_xy{
namespace algo{
namespace _QuadPixel{


class HXCPP_CLASS_ATTRIBUTES QuadPixel_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef QuadPixel_Fields__obj OBJ_;
		QuadPixel_Fields__obj();

	public:
		enum { _hx_ClassId = 0x1d0470b0 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.algo._QuadPixel.QuadPixel_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.algo._QuadPixel.QuadPixel_Fields_"); }

		inline static ::hx::ObjectPtr< QuadPixel_Fields__obj > __new() {
			::hx::ObjectPtr< QuadPixel_Fields__obj > __this = new QuadPixel_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< QuadPixel_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			QuadPixel_Fields__obj *__this = (QuadPixel_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(QuadPixel_Fields__obj), false, "pi_xy.algo._QuadPixel.QuadPixel_Fields_"));
			*(void **)__this = QuadPixel_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~QuadPixel_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("QuadPixel_Fields_",46,00,93,01); }

		static  ::pi_xy::algo::HitQuad fillQuadrilateral( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy,int color,::hx::Null< bool >  hasHit);
		static ::Dynamic fillQuadrilateral_dyn();

		static  ::pi_xy::algo::HitQuad fillSoftQuadrilateral( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy,int color,::hx::Null< Float >  soft,::hx::Null< bool >  softAB,::hx::Null< bool >  softBC,::hx::Null< bool >  softCD,::hx::Null< bool >  softDA,::hx::Null< bool >  hasHit);
		static ::Dynamic fillSoftQuadrilateral_dyn();

		static  ::pi_xy::algo::HitQuad fillSoftQuadrilateralFudge( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy,int color,::hx::Null< Float >  soft,::hx::Null< bool >  softAB,::hx::Null< bool >  softBC,::hx::Null< bool >  softCD,::hx::Null< bool >  softDA,::hx::Null< bool >  hasHit);
		static ::Dynamic fillSoftQuadrilateralFudge_dyn();

		static  ::pi_xy::algo::HitQuad fillSoftQuadrilateralQuarter( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy,int color,::hx::Null< Float >  soft,::hx::Null< bool >  softAB,::hx::Null< bool >  softBC,::hx::Null< bool >  softCD,::hx::Null< bool >  softDA,::hx::Null< bool >  hasHit);
		static ::Dynamic fillSoftQuadrilateralQuarter_dyn();

		static  ::pi_xy::algo::HitQuad tileQuadrilateral( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy, ::pi_xy::ImageStruct tileImage,::hx::Null< bool >  hasHit);
		static ::Dynamic tileQuadrilateral_dyn();

		static  ::pi_xy::algo::HitQuad fillGradQuadrilateral( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,int colorA,Float bx,Float by,int colorB,Float cx,Float cy,int colorC,Float dx,Float dy,int colorD,::hx::Null< bool >  hasHit);
		static ::Dynamic fillGradQuadrilateral_dyn();

		static  ::pi_xy::algo::HitQuad imgQuadrilateralFudge( ::pi_xy::ImageStruct pixelImage, ::pi_xy::ImageStruct texture, ::pi_xy::algo::RectangleWindow win,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy,::hx::Null< bool >  hasHit);
		static ::Dynamic imgQuadrilateralFudge_dyn();

		static  ::pi_xy::algo::HitQuad imgQuadrilateral( ::pi_xy::ImageStruct pixelImage, ::pi_xy::ImageStruct texture, ::pi_xy::algo::RectangleWindow win,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy,::hx::Null< Float >  au,::hx::Null< Float >  av,::hx::Null< Float >  bu,::hx::Null< Float >  bv,::hx::Null< Float >  cu,::hx::Null< Float >  cv,::hx::Null< Float >  du,::hx::Null< Float >  dv,::hx::Null< bool >  hasHit);
		static ::Dynamic imgQuadrilateral_dyn();

		static  ::pi_xy::algo::HitQuad imageNineSlice( ::pi_xy::ImageStruct pixelImage, ::pi_xy::ImageStruct texture, ::pi_xy::algo::RectangleWindow win,Float x,Float y,Float wid,Float hi,Float left,Float top,Float fat,Float tall,Float widNew,Float hiNew,Float leftNew,Float topNew,Float fatNew,Float tallNew,::hx::Null< bool >  hasHit);
		static ::Dynamic imageNineSlice_dyn();

};

} // end namespace pi_xy
} // end namespace algo
} // end namespace _QuadPixel

#endif /* INCLUDED_pi_xy_algo__QuadPixel_QuadPixel_Fields_ */ 