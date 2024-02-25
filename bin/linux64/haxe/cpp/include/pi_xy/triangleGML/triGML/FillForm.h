// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_triangleGML_triGML_FillForm
#define INCLUDED_pi_xy_triangleGML_triGML_FillForm

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_pi_xy_triangleGML_triGML_BasicShape
#include <pi_xy/triangleGML/triGML/BasicShape.h>
#endif
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,BasicShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,FillForm)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,GroupShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,ShapeInterface)

namespace pi_xy{
namespace triangleGML{
namespace triGML{


class HXCPP_CLASS_ATTRIBUTES FillForm_obj : public  ::pi_xy::triangleGML::triGML::BasicShape_obj
{
	public:
		typedef  ::pi_xy::triangleGML::triGML::BasicShape_obj super;
		typedef FillForm_obj OBJ_;
		FillForm_obj();

	public:
		enum { _hx_ClassId = 0x4f186619 };

		void __construct(::hx::Null< Float >  __o_opacity,::hx::Null< bool >  __o_visibility,::hx::Null< int >  __o_strokeColor,::hx::Null< Float >  __o_strokeWidth,::Array< ::String > strokeDashGapArray,::hx::Null< int >  __o_fill);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.triangleGML.triGML.FillForm")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.triangleGML.triGML.FillForm"); }

		//~FillForm_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("FillForm",87,15,84,3e); }

		int fill;
		virtual void setParameter(::String name,::String value);

};

} // end namespace pi_xy
} // end namespace triangleGML
} // end namespace triGML

#endif /* INCLUDED_pi_xy_triangleGML_triGML_FillForm */ 
