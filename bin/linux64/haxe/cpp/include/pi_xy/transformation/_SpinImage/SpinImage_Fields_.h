// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_transformation__SpinImage_SpinImage_Fields_
#define INCLUDED_pi_xy_transformation__SpinImage_SpinImage_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS3(pi_xy,transformation,_SpinImage,SpinImage_Fields_)

namespace pi_xy{
namespace transformation{
namespace _SpinImage{


class HXCPP_CLASS_ATTRIBUTES SpinImage_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef SpinImage_Fields__obj OBJ_;
		SpinImage_Fields__obj();

	public:
		enum { _hx_ClassId = 0x7b8b0c96 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.transformation._SpinImage.SpinImage_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.transformation._SpinImage.SpinImage_Fields_"); }

		inline static ::hx::ObjectPtr< SpinImage_Fields__obj > __new() {
			::hx::ObjectPtr< SpinImage_Fields__obj > __this = new SpinImage_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< SpinImage_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			SpinImage_Fields__obj *__this = (SpinImage_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(SpinImage_Fields__obj), false, "pi_xy.transformation._SpinImage.SpinImage_Fields_"));
			*(void **)__this = SpinImage_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~SpinImage_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("SpinImage_Fields_",40,cc,e5,ac); }

		static  ::pi_xy::ImageStruct spinClock90( ::pi_xy::ImageStruct thisImage,Float x,Float y,Float w,Float h,::hx::Null< bool >  transparent,::hx::Null< bool >  includeMask);
		static ::Dynamic spinClock90_dyn();

		static  ::pi_xy::ImageStruct spinAntiClock90( ::pi_xy::ImageStruct thisImage,Float x,Float y,Float w,Float h,::hx::Null< bool >  transparent,::hx::Null< bool >  includeMask);
		static ::Dynamic spinAntiClock90_dyn();

		static  ::pi_xy::ImageStruct spin180( ::pi_xy::ImageStruct thisImage,Float x,Float y,Float w,Float h,::hx::Null< bool >  transparent,::hx::Null< bool >  includeMask);
		static ::Dynamic spin180_dyn();

		static  ::pi_xy::ImageStruct rotatingClockwiseDegrees( ::pi_xy::ImageStruct thisImage,Float angle,::hx::Null< Float >  centreX,::hx::Null< Float >  centreY,::hx::Null< bool >  transparent,::hx::Null< bool >  includeMask);
		static ::Dynamic rotatingClockwiseDegrees_dyn();

		static  ::pi_xy::ImageStruct rotatingClockwiseRadians( ::pi_xy::ImageStruct thisImage,Float theta,::hx::Null< Float >  centreX,::hx::Null< Float >  centreY,::hx::Null< bool >  transparent,::hx::Null< bool >  includeMask);
		static ::Dynamic rotatingClockwiseRadians_dyn();

		static  ::pi_xy::ImageStruct rotating( ::pi_xy::ImageStruct thisImage,Float theta,::hx::Null< Float >  centreX,::hx::Null< Float >  centreY,::hx::Null< bool >  transparent,::hx::Null< bool >  includeMask);
		static ::Dynamic rotating_dyn();

};

} // end namespace pi_xy
} // end namespace transformation
} // end namespace _SpinImage

#endif /* INCLUDED_pi_xy_transformation__SpinImage_SpinImage_Fields_ */ 