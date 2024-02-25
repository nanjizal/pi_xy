// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_triangleGML_triGML_GroupShape
#define INCLUDED_pi_xy_triangleGML_triGML_GroupShape

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_pi_xy_triangleGML_triGML_ShapeInterface
#include <pi_xy/triangleGML/triGML/ShapeInterface.h>
#endif
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,GroupShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,ShapeInterface)
HX_DECLARE_CLASS4(pi_xy,triangleGML,triGML,hitTest,IhitObj)

namespace pi_xy{
namespace triangleGML{
namespace triGML{


class HXCPP_CLASS_ATTRIBUTES GroupShape_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef GroupShape_obj OBJ_;
		GroupShape_obj();

	public:
		enum { _hx_ClassId = 0x1a0bd5c0 };

		void __construct(::hx::Null< Float >  __o_opacity,::hx::Null< bool >  __o_visibility);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.triangleGML.triGML.GroupShape")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.triangleGML.triGML.GroupShape"); }

		//~GroupShape_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_("GroupShape",82,7f,99,e9); }

		bool isDirty;
		bool visibility;
		Float opacity;
		Float offX;
		Float offY;
		::Dynamic hitObj;
		Float edgeSoft;
		bool externalSoft;
		Float rotation;
		Float transformCentreX;
		Float transformCentreY;
		Float skewX;
		Float skewY;
		Float scaleX;
		Float scaleY;
		virtual void setParameter(::String name,::String value);
		::Dynamic setParameter_dyn();

		void translate(Float x,Float y);
		::Dynamic translate_dyn();

		virtual  ::Dynamic render( ::Dynamic drawTool) { return 0; }
		::Dynamic render_dyn();
		bool hit(Float x,Float y);
		::Dynamic hit_dyn();

		virtual  ::Dynamic clear( ::Dynamic drawTool,int color);
		::Dynamic clear_dyn();

		virtual  ::Dynamic setImage(::String name, ::Dynamic imageTool);
		::Dynamic setImage_dyn();

};

} // end namespace pi_xy
} // end namespace triangleGML
} // end namespace triGML

#endif /* INCLUDED_pi_xy_triangleGML_triGML_GroupShape */ 