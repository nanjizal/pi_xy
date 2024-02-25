// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy__Pixelimage_Pixelimage_Impl_
#define INCLUDED_pi_xy__Pixelimage_Pixelimage_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS1(iterMagic,Iimg)
HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,_Pixelimage,Pixelimage_Impl_)
HX_DECLARE_CLASS2(pi_xy,algo,RectangleWindow)

namespace pi_xy{
namespace _Pixelimage{


class HXCPP_CLASS_ATTRIBUTES Pixelimage_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Pixelimage_Impl__obj OBJ_;
		Pixelimage_Impl__obj();

	public:
		enum { _hx_ClassId = 0x5c591c26 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy._Pixelimage.Pixelimage_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy._Pixelimage.Pixelimage_Impl_"); }

		inline static ::hx::ObjectPtr< Pixelimage_Impl__obj > __new() {
			::hx::ObjectPtr< Pixelimage_Impl__obj > __this = new Pixelimage_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< Pixelimage_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			Pixelimage_Impl__obj *__this = (Pixelimage_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Pixelimage_Impl__obj), false, "pi_xy._Pixelimage.Pixelimage_Impl_"));
			*(void **)__this = Pixelimage_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Pixelimage_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Pixelimage_Impl_",95,09,69,3d); }

		static int get_defaultType( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_defaultType_dyn();

		static int set_defaultType( ::pi_xy::ImageStruct this1,int v);
		static ::Dynamic set_defaultType_dyn();

		static  ::pi_xy::ImageStruct _new(int width,int height, ::Dynamic imageType);
		static ::Dynamic _new_dyn();

		static ::Dynamic get_image( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_image_dyn();

		static  ::Dynamic imageTypeString( ::pi_xy::ImageStruct this1);
		static ::Dynamic imageTypeString_dyn();

		static int get_width( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_width_dyn();

		static int get_height( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_height_dyn();

		static void setRelativePosition( ::pi_xy::ImageStruct this1,int x,int y, ::Dynamic update);
		static ::Dynamic setRelativePosition_dyn();

		static bool get_transparent( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_transparent_dyn();

		static bool set_transparent( ::pi_xy::ImageStruct this1,bool v);
		static ::Dynamic set_transparent_dyn();

		static  ::pi_xy::ImageStruct get_mask( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_mask_dyn();

		static  ::pi_xy::ImageStruct set_mask( ::pi_xy::ImageStruct this1, ::pi_xy::ImageStruct v);
		static ::Dynamic set_mask_dyn();

		static bool set_hasMask( ::pi_xy::ImageStruct this1,bool v);
		static ::Dynamic set_hasMask_dyn();

		static bool get_hasMask( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_hasMask_dyn();

		static  ::pi_xy::algo::RectangleWindow get_rectWindow( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_rectWindow_dyn();

		static  ::pi_xy::algo::RectangleWindow set_rectWindow( ::pi_xy::ImageStruct this1, ::pi_xy::algo::RectangleWindow r);
		static ::Dynamic set_rectWindow_dyn();

		static int pos4( ::pi_xy::ImageStruct this1,int x,int y, ::Dynamic off);
		static ::Dynamic pos4_dyn();

		static int position( ::pi_xy::ImageStruct this1,int x,int y);
		static ::Dynamic position_dyn();

		static int setPixel( ::pi_xy::ImageStruct this1,int x,int y,int color);
		static ::Dynamic setPixel_dyn();

		static void zeroPixel( ::pi_xy::ImageStruct this1,int x,int y);
		static ::Dynamic zeroPixel_dyn();

		static int setARGB( ::pi_xy::ImageStruct this1,int x,int y,int color);
		static ::Dynamic setARGB_dyn();

		static int getPixel( ::pi_xy::ImageStruct this1,int x,int y);
		static ::Dynamic getPixel_dyn();

		static int getARGB( ::pi_xy::ImageStruct this1,int x,int y);
		static ::Dynamic getARGB_dyn();

		static void set_argbPixel( ::pi_xy::ImageStruct this1,int a,int r,int g,int b,int location);
		static ::Dynamic set_argbPixel_dyn();

		static void argbToPixel( ::pi_xy::ImageStruct this1,int a,int r,int g,int b,int location);
		static ::Dynamic argbToPixel_dyn();

		static void channelBlend( ::pi_xy::ImageStruct this1,int a,int r,int g,int b,int location);
		static ::Dynamic channelBlend_dyn();

		static void colorBlend( ::pi_xy::ImageStruct this1,int color,int location);
		static ::Dynamic colorBlend_dyn();

		static ::String getPixelString( ::pi_xy::ImageStruct this1,int x,int y);
		static ::Dynamic getPixelString_dyn();

		static void simpleRect( ::pi_xy::ImageStruct this1,Float x,Float y,Float w,Float h,int color);
		static ::Dynamic simpleRect_dyn();

		static void clearRectWindow( ::pi_xy::ImageStruct this1, ::pi_xy::algo::RectangleWindow rectangle);
		static ::Dynamic clearRectWindow_dyn();

		static void clearRect( ::pi_xy::ImageStruct this1,Float x,Float y,Float w,Float h);
		static ::Dynamic clearRect_dyn();

		static void putPixelImage( ::pi_xy::ImageStruct this1, ::pi_xy::ImageStruct pixelImage,int x,int y, ::Dynamic useAvaliableMask,::hx::Null< bool >  forceClear);
		static ::Dynamic putPixelImage_dyn();

		static void putPixelImageRect( ::pi_xy::ImageStruct this1, ::pi_xy::ImageStruct pixelImage,int x,int y,int rectLeft,int rectTop,int rectRight,int rectBottom, ::Dynamic useAvaliableMask,::hx::Null< bool >  forceClear);
		static ::Dynamic putPixelImageRect_dyn();

		static  ::pi_xy::ImageStruct transferClone( ::pi_xy::ImageStruct this1);
		static ::Dynamic transferClone_dyn();

		static void transferIn( ::pi_xy::ImageStruct this1, ::pi_xy::ImageStruct p);
		static ::Dynamic transferIn_dyn();

		static  ::haxe::io::Bytes getBytes( ::pi_xy::ImageStruct this1);
		static ::Dynamic getBytes_dyn();

		static  ::pi_xy::ImageStruct fromBytes( ::pi_xy::ImageStruct this1, ::haxe::io::Bytes bytes);
		static ::Dynamic fromBytes_dyn();

		static  ::pi_xy::ImageStruct get_raw( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_raw_dyn();

		static  ::pi_xy::ImageStruct get_transform( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_transform_dyn();

		static  ::pi_xy::ImageStruct get_fillShape( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_fillShape_dyn();

		static  ::pi_xy::ImageStruct get_softShape( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_softShape_dyn();

		static  ::pi_xy::ImageStruct get_lineShape( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_lineShape_dyn();

		static  ::pi_xy::ImageStruct get_tileShape( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_tileShape_dyn();

		static  ::pi_xy::ImageStruct get_imageShape( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_imageShape_dyn();

		static  ::pi_xy::ImageStruct get_gradientShape( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_gradientShape_dyn();

		static  ::pi_xy::ImageStruct get_pattern( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_pattern_dyn();

		static  ::pi_xy::ImageStruct get_convolution( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_convolution_dyn();

		static  ::pi_xy::ImageStruct get_colorform( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_colorform_dyn();

		static  ::pi_xy::ImageStruct get_rectanglePad( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_rectanglePad_dyn();

		static  ::pi_xy::ImageStruct get_png( ::pi_xy::ImageStruct this1);
		static ::Dynamic get_png_dyn();

};

} // end namespace pi_xy
} // end namespace _Pixelimage

#endif /* INCLUDED_pi_xy__Pixelimage_Pixelimage_Impl_ */ 
