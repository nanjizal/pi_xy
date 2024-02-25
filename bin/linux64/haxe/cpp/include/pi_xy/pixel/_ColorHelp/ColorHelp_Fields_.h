// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_pixel__ColorHelp_ColorHelp_Fields_
#define INCLUDED_pi_xy_pixel__ColorHelp_ColorHelp_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(pi_xy,pixel,_ColorHelp,ColorHelp_Fields_)

namespace pi_xy{
namespace pixel{
namespace _ColorHelp{


class HXCPP_CLASS_ATTRIBUTES ColorHelp_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef ColorHelp_Fields__obj OBJ_;
		ColorHelp_Fields__obj();

	public:
		enum { _hx_ClassId = 0x76e85947 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.pixel._ColorHelp.ColorHelp_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.pixel._ColorHelp.ColorHelp_Fields_"); }

		inline static ::hx::ObjectPtr< ColorHelp_Fields__obj > __new() {
			::hx::ObjectPtr< ColorHelp_Fields__obj > __this = new ColorHelp_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< ColorHelp_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			ColorHelp_Fields__obj *__this = (ColorHelp_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(ColorHelp_Fields__obj), false, "pi_xy.pixel._ColorHelp.ColorHelp_Fields_"));
			*(void **)__this = ColorHelp_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~ColorHelp_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("ColorHelp_Fields_",cb,7e,8f,b8); }

		static ::String stringColor(int col, ::Dynamic alpha);
		static ::Dynamic stringColor_dyn();

		static ::String stringHashARGB(int col);
		static ::Dynamic stringHashARGB_dyn();

		static Float alphaChannel(int _hx_int);
		static ::Dynamic alphaChannel_dyn();

		static Float redChannel(int _hx_int);
		static ::Dynamic redChannel_dyn();

		static Float greenChannel(int _hx_int);
		static ::Dynamic greenChannel_dyn();

		static Float blueChannel(int _hx_int);
		static ::Dynamic blueChannel_dyn();

		static int AplusRGB(int col,int alpha);
		static ::Dynamic AplusRGB_dyn();

		static int argbInt(int a,int r,int g,int b);
		static ::Dynamic argbInt_dyn();

		static Float avg(Float p,Float q);
		static ::Dynamic avg_dyn();

		static Float between(Float a,Float b,::hx::Null< Float >  t);
		static ::Dynamic between_dyn();

		static Float alphaAvg(int a,int b);
		static ::Dynamic alphaAvg_dyn();

		static Float alphaBetween(int a,int b,::hx::Null< Float >  t);
		static ::Dynamic alphaBetween_dyn();

		static Float redAvg(int a,int b);
		static ::Dynamic redAvg_dyn();

		static Float redBetween(int a,int b,::hx::Null< Float >  t);
		static ::Dynamic redBetween_dyn();

		static Float greenAvg(int a,int b);
		static ::Dynamic greenAvg_dyn();

		static Float greenBetween(int a,int b,::hx::Null< Float >  t);
		static ::Dynamic greenBetween_dyn();

		static Float blueAvg(int a,int b);
		static ::Dynamic blueAvg_dyn();

		static Float blueBetween(int a,int b,::hx::Null< Float >  t);
		static ::Dynamic blueBetween_dyn();

		static int from_argb(Float a,Float r,Float g,Float b);
		static ::Dynamic from_argb_dyn();

		static int argbIntAvg(int a,int b);
		static ::Dynamic argbIntAvg_dyn();

		static int argbIntBetween(int a,int b,::hx::Null< Float >  t);
		static ::Dynamic argbIntBetween_dyn();

		static  ::Dynamic hexToARGB(int _hx_int);
		static ::Dynamic hexToARGB_dyn();

		static int toHexInt(Float c);
		static ::Dynamic toHexInt_dyn();

		static int rgbInt(int c);
		static ::Dynamic rgbInt_dyn();

		static Float getAlpha(Float c);
		static ::Dynamic getAlpha_dyn();

		static Float alpha1();
		static ::Dynamic alpha1_dyn();

		static int getColor(Float c);
		static ::Dynamic getColor_dyn();

		static int colorAlpha(int color,Float alpha);
		static ::Dynamic colorAlpha_dyn();

		static int colorIntAlpha(int color,int alpha);
		static ::Dynamic colorIntAlpha_dyn();

		static int luminosityGrey(int color,::hx::Null< bool >  useAlpha);
		static ::Dynamic luminosityGrey_dyn();

};

} // end namespace pi_xy
} // end namespace pixel
} // end namespace _ColorHelp

#endif /* INCLUDED_pi_xy_pixel__ColorHelp_ColorHelp_Fields_ */ 
