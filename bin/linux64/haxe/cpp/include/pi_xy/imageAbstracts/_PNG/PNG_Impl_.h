// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_imageAbstracts__PNG_PNG_Impl_
#define INCLUDED_pi_xy_imageAbstracts__PNG_PNG_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS3(pi_xy,imageAbstracts,_PNG,PNG_Impl_)

namespace pi_xy{
namespace imageAbstracts{
namespace _PNG{


class HXCPP_CLASS_ATTRIBUTES PNG_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef PNG_Impl__obj OBJ_;
		PNG_Impl__obj();

	public:
		enum { _hx_ClassId = 0x0652bfa6 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.imageAbstracts._PNG.PNG_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.imageAbstracts._PNG.PNG_Impl_"); }

		inline static ::hx::ObjectPtr< PNG_Impl__obj > __new() {
			::hx::ObjectPtr< PNG_Impl__obj > __this = new PNG_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< PNG_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			PNG_Impl__obj *__this = (PNG_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(PNG_Impl__obj), false, "pi_xy.imageAbstracts._PNG.PNG_Impl_"));
			*(void **)__this = PNG_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~PNG_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("PNG_Impl_",e9,c1,cc,2d); }

		static  ::pi_xy::ImageStruct _new(int w,int h);
		static ::Dynamic _new_dyn();

		static  ::pi_xy::ImageStruct to( ::pi_xy::ImageStruct this1,::String name);
		static ::Dynamic to_dyn();

		static  ::pi_xy::ImageStruct from( ::pi_xy::ImageStruct this1,::String name);
		static ::Dynamic from_dyn();

};

} // end namespace pi_xy
} // end namespace imageAbstracts
} // end namespace _PNG

#endif /* INCLUDED_pi_xy_imageAbstracts__PNG_PNG_Impl_ */ 
