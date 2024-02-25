// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo__TriPixelOld_TriPixelOld_Fields_
#define INCLUDED_pi_xy_algo__TriPixelOld_TriPixelOld_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,HitTri)
HX_DECLARE_CLASS2(pi_xy,algo,IhitObj)
HX_DECLARE_CLASS2(pi_xy,algo,TriPoints_)
HX_DECLARE_CLASS3(pi_xy,algo,_TriPixelOld,TriPixelOld_Fields_)

namespace pi_xy{
namespace algo{
namespace _TriPixelOld{


class HXCPP_CLASS_ATTRIBUTES TriPixelOld_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef TriPixelOld_Fields__obj OBJ_;
		TriPixelOld_Fields__obj();

	public:
		enum { _hx_ClassId = 0x06f866ec };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.algo._TriPixelOld.TriPixelOld_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.algo._TriPixelOld.TriPixelOld_Fields_"); }

		inline static ::hx::ObjectPtr< TriPixelOld_Fields__obj > __new() {
			::hx::ObjectPtr< TriPixelOld_Fields__obj > __this = new TriPixelOld_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< TriPixelOld_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			TriPixelOld_Fields__obj *__this = (TriPixelOld_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(TriPixelOld_Fields__obj), false, "pi_xy.algo._TriPixelOld.TriPixelOld_Fields_"));
			*(void **)__this = TriPixelOld_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TriPixelOld_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("TriPixelOld_Fields_",13,ab,92,b9); }

		static  ::pi_xy::algo::HitTri fillTriUnsafe5( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,int color,::hx::Null< bool >  hasHit,::hx::Null< bool >  hasUndo);
		static ::Dynamic fillTriUnsafe5_dyn();

		static  ::pi_xy::algo::HitTri fillTriUnsafe6( ::pi_xy::ImageStruct pixelImage,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,int color,::hx::Null< bool >  hasHit,::hx::Null< bool >  hasUndo);
		static ::Dynamic fillTriUnsafe6_dyn();

};

} // end namespace pi_xy
} // end namespace algo
} // end namespace _TriPixelOld

#endif /* INCLUDED_pi_xy_algo__TriPixelOld_TriPixelOld_Fields_ */ 