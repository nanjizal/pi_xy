// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_pixel__Pixel28_Pixel28_Impl_
#define INCLUDED_pi_xy_pixel__Pixel28_Pixel28_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(pi_xy,pixel,_Pixel28,Pixel28_Impl_)

namespace pi_xy{
namespace pixel{
namespace _Pixel28{


class HXCPP_CLASS_ATTRIBUTES Pixel28_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Pixel28_Impl__obj OBJ_;
		Pixel28_Impl__obj();

	public:
		enum { _hx_ClassId = 0x4f0980c0 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.pixel._Pixel28.Pixel28_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.pixel._Pixel28.Pixel28_Impl_"); }

		inline static ::hx::ObjectPtr< Pixel28_Impl__obj > __new() {
			::hx::ObjectPtr< Pixel28_Impl__obj > __this = new Pixel28_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< Pixel28_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			Pixel28_Impl__obj *__this = (Pixel28_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Pixel28_Impl__obj), false, "pi_xy.pixel._Pixel28.Pixel28_Impl_"));
			*(void **)__this = Pixel28_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Pixel28_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Pixel28_Impl_",4c,8d,3c,98); }

		static int _new(int v);
		static ::Dynamic _new_dyn();

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

		static int fromChannels(int ch1,int ch2,int ch3);
		static ::Dynamic fromChannels_dyn();

};

} // end namespace pi_xy
} // end namespace pixel
} // end namespace _Pixel28

#endif /* INCLUDED_pi_xy_pixel__Pixel28_Pixel28_Impl_ */ 
