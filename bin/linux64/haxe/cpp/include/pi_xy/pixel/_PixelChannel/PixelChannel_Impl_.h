// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_pixel__PixelChannel_PixelChannel_Impl_
#define INCLUDED_pi_xy_pixel__PixelChannel_PixelChannel_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(pi_xy,pixel,_PixelChannel,PixelChannel_Impl_)

namespace pi_xy{
namespace pixel{
namespace _PixelChannel{


class HXCPP_CLASS_ATTRIBUTES PixelChannel_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef PixelChannel_Impl__obj OBJ_;
		PixelChannel_Impl__obj();

	public:
		enum { _hx_ClassId = 0x6b93b916 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.pixel._PixelChannel.PixelChannel_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.pixel._PixelChannel.PixelChannel_Impl_"); }

		inline static ::hx::ObjectPtr< PixelChannel_Impl__obj > __new() {
			::hx::ObjectPtr< PixelChannel_Impl__obj > __this = new PixelChannel_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< PixelChannel_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			PixelChannel_Impl__obj *__this = (PixelChannel_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(PixelChannel_Impl__obj), false, "pi_xy.pixel._PixelChannel.PixelChannel_Impl_"));
			*(void **)__this = PixelChannel_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~PixelChannel_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("PixelChannel_Impl_",5d,43,d9,33); }

		static int _new(int v);
		static ::Dynamic _new_dyn();

		static int toHexInt(Float c);
		static ::Dynamic toHexInt_dyn();

		static Float colIntToFloat(int this1);
		static ::Dynamic colIntToFloat_dyn();

		static ::String stringHash(int this1);
		static ::Dynamic stringHash_dyn();

		static int boundChannel(Float f);
		static ::Dynamic boundChannel_dyn();

};

} // end namespace pi_xy
} // end namespace pixel
} // end namespace _PixelChannel

#endif /* INCLUDED_pi_xy_pixel__PixelChannel_PixelChannel_Impl_ */ 