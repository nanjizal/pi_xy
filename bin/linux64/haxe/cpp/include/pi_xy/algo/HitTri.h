// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo_HitTri
#define INCLUDED_pi_xy_algo_HitTri

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_pi_xy_algo_TriPoints_
#include <pi_xy/algo/TriPoints_.h>
#endif
#ifndef INCLUDED_pi_xy_algo_IhitObj
#include <pi_xy/algo/IhitObj.h>
#endif
HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,algo,HitTri)
HX_DECLARE_CLASS2(pi_xy,algo,IhitObj)
HX_DECLARE_CLASS2(pi_xy,algo,TriPoints_)
HX_DECLARE_CLASS2(pi_xy,iter,IntIterStart)

namespace pi_xy{
namespace algo{


class HXCPP_CLASS_ATTRIBUTES HitTri_obj : public  ::pi_xy::algo::TriPoints__obj
{
	public:
		typedef  ::pi_xy::algo::TriPoints__obj super;
		typedef HitTri_obj OBJ_;
		HitTri_obj();

	public:
		enum { _hx_ClassId = 0x36c8846e };

		void __construct(Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.algo.HitTri")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.algo.HitTri"); }
		static ::hx::ObjectPtr< HitTri_obj > __new(Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated);
		static ::hx::ObjectPtr< HitTri_obj > __alloc(::hx::Ctx *_hx_ctx,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~HitTri_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_("HitTri",b8,c4,b1,8b); }

		bool preCalculated;
		Float s0;
		Float sx;
		Float sy;
		Float t0;
		Float tx;
		Float ty;
		Float A;
		 ::pi_xy::iter::IntIterStart xIter3;
		 ::pi_xy::iter::IntIterStart yIter3;
		 ::pi_xy::ImageStruct undoImage;
		int undoX;
		int undoY;
		void preCalculateValues();
		::Dynamic preCalculateValues_dyn();

		bool hit(Float x,Float y);
		::Dynamic hit_dyn();

};

} // end namespace pi_xy
} // end namespace algo

#endif /* INCLUDED_pi_xy_algo_HitTri */ 
