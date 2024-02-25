// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_transformation__ScaleImage_ScaleImage_Fields_
#define INCLUDED_pi_xy_transformation__ScaleImage_ScaleImage_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS3(pi_xy,transformation,_ScaleImage,ScaleImage_Fields_)

namespace pi_xy{
namespace transformation{
namespace _ScaleImage{


class HXCPP_CLASS_ATTRIBUTES ScaleImage_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef ScaleImage_Fields__obj OBJ_;
		ScaleImage_Fields__obj();

	public:
		enum { _hx_ClassId = 0x0be548a0 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.transformation._ScaleImage.ScaleImage_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.transformation._ScaleImage.ScaleImage_Fields_"); }

		inline static ::hx::ObjectPtr< ScaleImage_Fields__obj > __new() {
			::hx::ObjectPtr< ScaleImage_Fields__obj > __this = new ScaleImage_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< ScaleImage_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			ScaleImage_Fields__obj *__this = (ScaleImage_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(ScaleImage_Fields__obj), false, "pi_xy.transformation._ScaleImage.ScaleImage_Fields_"));
			*(void **)__this = ScaleImage_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~ScaleImage_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("ScaleImage_Fields_",b8,e6,91,0d); }

		static  ::pi_xy::ImageStruct scaleUpInteger( ::pi_xy::ImageStruct thisImage,::hx::Null< int >  scaleW,::hx::Null< int >  scaleH,::hx::Null< bool >  transparent,::hx::Null< bool >  includeMask);
		static ::Dynamic scaleUpInteger_dyn();

		static  ::pi_xy::ImageStruct scalingXY( ::pi_xy::ImageStruct thisImage,Float sx,Float sy,::hx::Null< bool >  transparent,::hx::Null< bool >  includeMask);
		static ::Dynamic scalingXY_dyn();

};

} // end namespace pi_xy
} // end namespace transformation
} // end namespace _ScaleImage

#endif /* INCLUDED_pi_xy_transformation__ScaleImage_ScaleImage_Fields_ */ 
