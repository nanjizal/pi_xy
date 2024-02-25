// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo__RectanglePixel_RectanglePixel_Fields_
#define INCLUDED_pi_xy_algo__RectanglePixel_RectanglePixel_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS3(pi_xy,algo,_RectanglePixel,RectanglePixel_Fields_)

namespace pi_xy{
namespace algo{
namespace _RectanglePixel{


class HXCPP_CLASS_ATTRIBUTES RectanglePixel_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef RectanglePixel_Fields__obj OBJ_;
		RectanglePixel_Fields__obj();

	public:
		enum { _hx_ClassId = 0x0f6cc462 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.algo._RectanglePixel.RectanglePixel_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.algo._RectanglePixel.RectanglePixel_Fields_"); }

		inline static ::hx::ObjectPtr< RectanglePixel_Fields__obj > __new() {
			::hx::ObjectPtr< RectanglePixel_Fields__obj > __this = new RectanglePixel_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< RectanglePixel_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			RectanglePixel_Fields__obj *__this = (RectanglePixel_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(RectanglePixel_Fields__obj), false, "pi_xy.algo._RectanglePixel.RectanglePixel_Fields_"));
			*(void **)__this = RectanglePixel_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~RectanglePixel_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("RectanglePixel_Fields_",1e,58,76,70); }

		static void fillRadialRect( ::pi_xy::ImageStruct pixelimage,Float x,Float y,Float wid,Float hi,int colorIn,int colorOut, ::Dynamic gx, ::Dynamic gy, ::Dynamic edgePoints);
		static ::Dynamic fillRadialRect_dyn();

};

} // end namespace pi_xy
} // end namespace algo
} // end namespace _RectanglePixel

#endif /* INCLUDED_pi_xy_algo__RectanglePixel_RectanglePixel_Fields_ */ 