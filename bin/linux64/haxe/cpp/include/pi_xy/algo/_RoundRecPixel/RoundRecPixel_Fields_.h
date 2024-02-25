// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo__RoundRecPixel_RoundRecPixel_Fields_
#define INCLUDED_pi_xy_algo__RoundRecPixel_RoundRecPixel_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS3(pi_xy,algo,_RoundRecPixel,RoundRecPixel_Fields_)

namespace pi_xy{
namespace algo{
namespace _RoundRecPixel{


class HXCPP_CLASS_ATTRIBUTES RoundRecPixel_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef RoundRecPixel_Fields__obj OBJ_;
		RoundRecPixel_Fields__obj();

	public:
		enum { _hx_ClassId = 0x2001916c };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.algo._RoundRecPixel.RoundRecPixel_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.algo._RoundRecPixel.RoundRecPixel_Fields_"); }

		inline static ::hx::ObjectPtr< RoundRecPixel_Fields__obj > __new() {
			::hx::ObjectPtr< RoundRecPixel_Fields__obj > __this = new RoundRecPixel_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< RoundRecPixel_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			RoundRecPixel_Fields__obj *__this = (RoundRecPixel_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(RoundRecPixel_Fields__obj), false, "pi_xy.algo._RoundRecPixel.RoundRecPixel_Fields_"));
			*(void **)__this = RoundRecPixel_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~RoundRecPixel_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("RoundRecPixel_Fields_",8b,3e,cc,93); }

		static void fillRoundRectangle( ::pi_xy::ImageStruct pixelimage,Float x,Float y,Float wid,Float hi,int color, ::Dynamic dx, ::Dynamic dy, ::Dynamic fat, ::Dynamic tall);
		static ::Dynamic fillRoundRectangle_dyn();

		static void tileRoundRectangle( ::pi_xy::ImageStruct pixelimage,Float x,Float y,Float wid,Float hi, ::pi_xy::ImageStruct tileImage, ::Dynamic dx, ::Dynamic dy, ::Dynamic fat, ::Dynamic tall);
		static ::Dynamic tileRoundRectangle_dyn();

		static void fillGrad4RoundRectangle( ::pi_xy::ImageStruct pixelimage,Float x,Float y,Float hi,Float wid,int colorA,int colorB,int colorC,int colorD, ::Dynamic dx, ::Dynamic dy, ::Dynamic fat, ::Dynamic tall);
		static ::Dynamic fillGrad4RoundRectangle_dyn();

};

} // end namespace pi_xy
} // end namespace algo
} // end namespace _RoundRecPixel

#endif /* INCLUDED_pi_xy_algo__RoundRecPixel_RoundRecPixel_Fields_ */ 
