// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_imageAbstracts__FillShape_FillShape_Impl_
#define INCLUDED_pi_xy_imageAbstracts__FillShape_FillShape_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,HitQuad)
HX_DECLARE_CLASS2(pi_xy,algo,HitTri)
HX_DECLARE_CLASS2(pi_xy,algo,HitTriArray)
HX_DECLARE_CLASS2(pi_xy,algo,IhitObj)
HX_DECLARE_CLASS2(pi_xy,algo,QuadPoints_)
HX_DECLARE_CLASS2(pi_xy,algo,TriPoints_)
HX_DECLARE_CLASS3(pi_xy,imageAbstracts,_FillShape,FillShape_Impl_)

namespace pi_xy{
namespace imageAbstracts{
namespace _FillShape{


class HXCPP_CLASS_ATTRIBUTES FillShape_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef FillShape_Impl__obj OBJ_;
		FillShape_Impl__obj();

	public:
		enum { _hx_ClassId = 0x073c83a2 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.imageAbstracts._FillShape.FillShape_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.imageAbstracts._FillShape.FillShape_Impl_"); }

		inline static ::hx::ObjectPtr< FillShape_Impl__obj > __new() {
			::hx::ObjectPtr< FillShape_Impl__obj > __this = new FillShape_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< FillShape_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			FillShape_Impl__obj *__this = (FillShape_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(FillShape_Impl__obj), false, "pi_xy.imageAbstracts._FillShape.FillShape_Impl_"));
			*(void **)__this = FillShape_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~FillShape_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("FillShape_Impl_",9e,58,45,4e); }

		static  ::pi_xy::ImageStruct _new(int w,int h);
		static ::Dynamic _new_dyn();

		static void square( ::pi_xy::ImageStruct this1,Float x,Float y,Float d,int color);
		static ::Dynamic square_dyn();

		static  ::pi_xy::algo::HitTri triangle( ::pi_xy::ImageStruct this1,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,int color,::hx::Null< bool >  hasHit,::hx::Null< bool >  hasUndo);
		static ::Dynamic triangle_dyn();

		static  ::pi_xy::algo::HitQuad quad( ::pi_xy::ImageStruct this1,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,Float dx,Float dy,int color,::hx::Null< bool >  hasHit);
		static ::Dynamic quad_dyn();

		static  ::pi_xy::algo::HitQuad line( ::pi_xy::ImageStruct this1,Float px,Float py,Float qx,Float qy,Float thick,int color,::hx::Null< bool >  hasHit, ::Dynamic debugCorners);
		static ::Dynamic line_dyn();

		static void roundRectangle( ::pi_xy::ImageStruct this1,Float x,Float y,Float hi,Float wid,int color, ::Dynamic dx, ::Dynamic dy, ::Dynamic fat, ::Dynamic tall);
		static ::Dynamic roundRectangle_dyn();

		static void quadrant( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,Float startAngle,int color, ::Dynamic phi, ::Dynamic targetError);
		static ::Dynamic quadrant_dyn();

		static void quadrantI( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic quadrantI_dyn();

		static void quadrantII( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic quadrantII_dyn();

		static void quadrantIII( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic quadrantIII_dyn();

		static void quadrantIV( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic quadrantIV_dyn();

		static void simonSays( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float radius);
		static ::Dynamic simonSays_dyn();

		static void circle( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float r,int color, ::Dynamic phi);
		static ::Dynamic circle_dyn();

		static void ellipse( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic ellipse_dyn();

		static void polyBuild( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi, ::Dynamic sides,::hx::Null< bool >  cornerUp);
		static ::Dynamic polyBuild_dyn();

		static void arrowHead( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic arrowHead_dyn();

		static void pentagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic pentagon_dyn();

		static void hexagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic hexagon_dyn();

		static void heptagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic heptagon_dyn();

		static void septagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic septagon_dyn();

		static void octagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic octagon_dyn();

		static void nonagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic nonagon_dyn();

		static void enneagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic enneagon_dyn();

		static void decagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic decagon_dyn();

		static void hendecagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic hendecagon_dyn();

		static void undecagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic undecagon_dyn();

		static void dodecagon( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi);
		static ::Dynamic dodecagon_dyn();

		static  ::pi_xy::algo::HitTriArray pie( ::pi_xy::ImageStruct this1,Float ax,Float ay,Float rx,Float ry,Float startRadian,Float sweepRadian,int color,::hx::Null< bool >  hasHit, ::Dynamic targetError);
		static ::Dynamic pie_dyn();

		static  ::pi_xy::algo::HitTri sweepTri( ::pi_xy::ImageStruct this1,Float ax,Float ay,Float rx,Float ry,Float startRadian,Float sweepRadian,int color,::hx::Null< bool >  hasHit);
		static ::Dynamic sweepTri_dyn();

		static void lineGrid( ::pi_xy::ImageStruct this1,Float x,Float y,Float w,Float h,Float delta,Float thick,int color);
		static ::Dynamic lineGrid_dyn();

		static void lineGridWH( ::pi_xy::ImageStruct this1,Float x,Float y,Float w,Float h,Float deltaW,Float deltaH,Float thick,int color);
		static ::Dynamic lineGridWH_dyn();

		static  ::pi_xy::algo::HitTriArray arrow( ::pi_xy::ImageStruct this1,Float px,Float py,Float qx,Float qy,Float thick,int color,::hx::Null< bool >  flare,::hx::Null< bool >  reverseFlare,::hx::Null< bool >  hasHit);
		static ::Dynamic arrow_dyn();

		static  ::pi_xy::algo::HitTriArray arrowBoth( ::pi_xy::ImageStruct this1,Float px,Float py,Float qx,Float qy,Float thick,int color,::hx::Null< bool >  hasHit);
		static ::Dynamic arrowBoth_dyn();

		static  ::pi_xy::algo::HitTriArray fixArrow( ::pi_xy::ImageStruct this1,Float px,Float py,Float qx,Float qy,Float arrowWidth,Float arrowHeight,Float thick,int color,::hx::Null< bool >  flare,::hx::Null< bool >  reverseFlare,::hx::Null< bool >  hasHit);
		static ::Dynamic fixArrow_dyn();

		static  ::pi_xy::algo::HitTriArray fixArrowBoth( ::pi_xy::ImageStruct this1,Float px,Float py,Float qx,Float qy,Float arrowWidth,Float arrowHeight,Float thick,int color,::hx::Null< bool >  hasHit);
		static ::Dynamic fixArrowBoth_dyn();

		static void ellipseTri( ::pi_xy::ImageStruct this1,Float cx,Float cy,Float rx,Float ry,int color, ::Dynamic phi, ::Dynamic printSides, ::Dynamic targetError);
		static ::Dynamic ellipseTri_dyn();

};

} // end namespace pi_xy
} // end namespace imageAbstracts
} // end namespace _FillShape

#endif /* INCLUDED_pi_xy_imageAbstracts__FillShape_FillShape_Impl_ */ 