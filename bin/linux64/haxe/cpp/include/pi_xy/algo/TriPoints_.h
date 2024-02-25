// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo_TriPoints_
#define INCLUDED_pi_xy_algo_TriPoints_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_STACK_FRAME(_hx_pos_868a4e1e42a5e8d9_19_new)
HX_DECLARE_CLASS2(pi_xy,algo,TriPoints_)

namespace pi_xy{
namespace algo{


class HXCPP_CLASS_ATTRIBUTES TriPoints__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef TriPoints__obj OBJ_;
		TriPoints__obj();

	public:
		enum { _hx_ClassId = 0x6c0be2ab };

		void __construct(Float ax,Float ay,Float bx,Float by,Float cx,Float cy);
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.algo.TriPoints_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.algo.TriPoints_"); }

		inline static ::hx::ObjectPtr< TriPoints__obj > __new(Float ax,Float ay,Float bx,Float by,Float cx,Float cy) {
			::hx::ObjectPtr< TriPoints__obj > __this = new TriPoints__obj();
			__this->__construct(ax,ay,bx,by,cx,cy);
			return __this;
		}

		inline static ::hx::ObjectPtr< TriPoints__obj > __alloc(::hx::Ctx *_hx_ctx,Float ax,Float ay,Float bx,Float by,Float cx,Float cy) {
			TriPoints__obj *__this = (TriPoints__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(TriPoints__obj), false, "pi_xy.algo.TriPoints_"));
			*(void **)__this = TriPoints__obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_868a4e1e42a5e8d9_19_new)
HXLINE(  20)		bool adjustWinding = (((((ax * by) - (bx * ay)) + ((bx * cy) - (cx * by))) + ((cx * ay) - (ax * cy))) > 0);
HXLINE(  21)		if (!(adjustWinding)) {
HXLINE(  22)			Float bx_ = bx;
HXLINE(  23)			Float by_ = by;
HXLINE(  24)			bx = cx;
HXLINE(  25)			by = cy;
HXLINE(  26)			cx = bx_;
HXLINE(  27)			cy = by_;
            		}
HXLINE(  29)		( ( ::pi_xy::algo::TriPoints_)(__this) )->ax = ax;
HXLINE(  30)		( ( ::pi_xy::algo::TriPoints_)(__this) )->ay = ay;
HXLINE(  31)		( ( ::pi_xy::algo::TriPoints_)(__this) )->bx = bx;
HXLINE(  32)		( ( ::pi_xy::algo::TriPoints_)(__this) )->by = by;
HXLINE(  33)		( ( ::pi_xy::algo::TriPoints_)(__this) )->cx = cx;
HXLINE(  34)		( ( ::pi_xy::algo::TriPoints_)(__this) )->cy = cy;
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TriPoints__obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("TriPoints_",11,db,13,9c); }

		Float ax;
		Float ay;
		Float bx;
		Float by;
		Float cx;
		Float cy;
};

} // end namespace pi_xy
} // end namespace algo

#endif /* INCLUDED_pi_xy_algo_TriPoints_ */ 