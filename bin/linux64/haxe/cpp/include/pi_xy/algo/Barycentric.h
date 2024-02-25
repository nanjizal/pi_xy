// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_algo_Barycentric
#define INCLUDED_pi_xy_algo_Barycentric

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(pi_xy,algo,Barycentric)
HX_DECLARE_CLASS2(pi_xy,algo,BarycentricCoordinates)
HX_DECLARE_CLASS2(pi_xy,iter,IntIterStart)

namespace pi_xy{
namespace algo{


class HXCPP_CLASS_ATTRIBUTES Barycentric_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Barycentric_obj OBJ_;
		Barycentric_obj();

	public:
		enum { _hx_ClassId = 0x50e62ee4 };

		void __construct(Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.algo.Barycentric")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.algo.Barycentric"); }
		static ::hx::ObjectPtr< Barycentric_obj > __new(Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated);
		static ::hx::ObjectPtr< Barycentric_obj > __alloc(::hx::Ctx *_hx_ctx,Float ax,Float ay,Float bx,Float by,Float cx,Float cy,::hx::Null< bool >  __o_preCalculated);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Barycentric_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Barycentric",be,8f,d7,27); }

		Float ax;
		Float ay;
		Float bx;
		Float by;
		Float cx;
		Float cy;
		bool preCalculated;
		 ::pi_xy::iter::IntIterStart xIter3;
		 ::pi_xy::iter::IntIterStart yIter3;
		Float bcx;
		Float bcy;
		Float acx;
		Float acy;
		Float dot11;
		Float dot12;
		Float dot22;
		Float denom1;
		void preCalculateValues();
		::Dynamic preCalculateValues_dyn();

		 ::pi_xy::algo::BarycentricCoordinates getInsideRatios(Float x,Float y);
		::Dynamic getInsideRatios_dyn();

		 ::pi_xy::algo::BarycentricCoordinates getRatios(Float x,Float y);
		::Dynamic getRatios_dyn();

		Float get_centroidX();
		::Dynamic get_centroidX_dyn();

		Float get_centroidY();
		::Dynamic get_centroidY_dyn();

		Float medianABx();
		::Dynamic medianABx_dyn();

		Float medianBCx();
		::Dynamic medianBCx_dyn();

		Float medianCAx();
		::Dynamic medianCAx_dyn();

		Float medianABy();
		::Dynamic medianABy_dyn();

		Float medianBCy();
		::Dynamic medianBCy_dyn();

		Float medianCAy();
		::Dynamic medianCAy_dyn();

		 ::pi_xy::algo::Barycentric scaled(Float scaleA,Float scaleB,Float scaleC);
		::Dynamic scaled_dyn();

		Float scalePoint(Float point,Float scale,Float centre);
		::Dynamic scalePoint_dyn();

};

} // end namespace pi_xy
} // end namespace algo

#endif /* INCLUDED_pi_xy_algo_Barycentric */ 
