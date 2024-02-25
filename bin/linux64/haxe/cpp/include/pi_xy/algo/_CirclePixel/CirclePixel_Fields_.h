// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo__CirclePixel_CirclePixel_Fields_
#define INCLUDED_pi_xy_algo__CirclePixel_CirclePixel_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(pi_xy,algo,_CirclePixel,CirclePixel_Fields_)

namespace pi_xy{
namespace algo{
namespace _CirclePixel{


class HXCPP_CLASS_ATTRIBUTES CirclePixel_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef CirclePixel_Fields__obj OBJ_;
		CirclePixel_Fields__obj();

	public:
		enum { _hx_ClassId = 0x4dde40ac };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.algo._CirclePixel.CirclePixel_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.algo._CirclePixel.CirclePixel_Fields_"); }

		inline static ::hx::ObjectPtr< CirclePixel_Fields__obj > __new() {
			::hx::ObjectPtr< CirclePixel_Fields__obj > __this = new CirclePixel_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< CirclePixel_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			CirclePixel_Fields__obj *__this = (CirclePixel_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(CirclePixel_Fields__obj), false, "pi_xy.algo._CirclePixel.CirclePixel_Fields_"));
			*(void **)__this = CirclePixel_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~CirclePixel_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("CirclePixel_Fields_",5d,a5,84,e8); }

		static int circleError(Float radius, ::Dynamic targetE, ::Dynamic minN, ::Dynamic maxN);
		static ::Dynamic circleError_dyn();

		static int getSidesDivisible4(Float rx,Float ry,::hx::Null< Float >  targetError);
		static ::Dynamic getSidesDivisible4_dyn();

};

} // end namespace pi_xy
} // end namespace algo
} // end namespace _CirclePixel

#endif /* INCLUDED_pi_xy_algo__CirclePixel_CirclePixel_Fields_ */ 