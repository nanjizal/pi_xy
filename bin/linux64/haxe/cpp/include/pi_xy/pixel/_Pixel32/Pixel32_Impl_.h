// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_pixel__Pixel32_Pixel32_Impl_
#define INCLUDED_pi_xy_pixel__Pixel32_Pixel32_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(pi_xy,pixel,_Pixel32,Pixel32_Impl_)

namespace pi_xy{
namespace pixel{
namespace _Pixel32{


class HXCPP_CLASS_ATTRIBUTES Pixel32_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Pixel32_Impl__obj OBJ_;
		Pixel32_Impl__obj();

	public:
		enum { _hx_ClassId = 0x668e05a0 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.pixel._Pixel32.Pixel32_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.pixel._Pixel32.Pixel32_Impl_"); }

		inline static ::hx::ObjectPtr< Pixel32_Impl__obj > __new() {
			::hx::ObjectPtr< Pixel32_Impl__obj > __this = new Pixel32_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< Pixel32_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			Pixel32_Impl__obj *__this = (Pixel32_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Pixel32_Impl__obj), false, "pi_xy.pixel._Pixel32.Pixel32_Impl_"));
			*(void **)__this = Pixel32_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Pixel32_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Pixel32_Impl_",e5,36,ee,d7); }

		static int _new(int v);
		static ::Dynamic _new_dyn();

		static int hexChannel(int this1,int i);
		static ::Dynamic hexChannel_dyn();

		static int get_c0(int this1);
		static ::Dynamic get_c0_dyn();

		static int set_c0(int this1,int v);
		static ::Dynamic set_c0_dyn();

		static int get_c1(int this1);
		static ::Dynamic get_c1_dyn();

		static int set_c1(int this1,int v);
		static ::Dynamic set_c1_dyn();

		static int get_c2(int this1);
		static ::Dynamic get_c2_dyn();

		static int set_c2(int this1,int v);
		static ::Dynamic set_c2_dyn();

		static int get_c3(int this1);
		static ::Dynamic get_c3_dyn();

		static int set_c3(int this1,int v);
		static ::Dynamic set_c3_dyn();

		static int flip13(int this1);
		static ::Dynamic flip13_dyn();

		static int transferColor(int this1);
		static ::Dynamic transferColor_dyn();

		static ::String stringHash(int this1);
		static ::Dynamic stringHash_dyn();

		static bool isTransparent(int this1);
		static ::Dynamic isTransparent_dyn();

		static int fromPixel28Alpha(int col,int alpha);
		static ::Dynamic fromPixel28Alpha_dyn();

		static int fromChannels(int ch0,int ch1,int ch2,int ch3);
		static ::Dynamic fromChannels_dyn();

		static int from_argb(Float a,Float r,Float g,Float b);
		static ::Dynamic from_argb_dyn();

		static int maskPixel(int this1,int m);
		static ::Dynamic maskPixel_dyn();

		static int channelBlend(int this1,int ch0,int ch1,int ch2,int ch3);
		static ::Dynamic channelBlend_dyn();

		static int alphaBlend(int this1,int rhs);
		static ::Dynamic alphaBlend_dyn();

		static int colBlendFunc(Float x1,Float x2,Float a3,Float a2);
		static ::Dynamic colBlendFunc_dyn();

		static int alphaBlendFunc(Float a3,Float a2);
		static ::Dynamic alphaBlendFunc_dyn();

};

} // end namespace pi_xy
} // end namespace pixel
} // end namespace _Pixel32

#endif /* INCLUDED_pi_xy_pixel__Pixel32_Pixel32_Impl_ */ 