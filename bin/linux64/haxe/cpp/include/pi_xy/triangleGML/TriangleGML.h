// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_triangleGML_TriangleGML
#define INCLUDED_pi_xy_triangleGML_TriangleGML

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_pi_xy_triangleGML_triGML_TriGML
#include <pi_xy/triangleGML/triGML/TriGML.h>
#endif
HX_DECLARE_CLASS0(Xml)
HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,triangleGML,TriangleGML)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,ShapeInterface)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,TriGML)

namespace pi_xy{
namespace triangleGML{


class HXCPP_CLASS_ATTRIBUTES TriangleGML_obj : public  ::pi_xy::triangleGML::triGML::TriGML_obj
{
	public:
		typedef  ::pi_xy::triangleGML::triGML::TriGML_obj super;
		typedef TriangleGML_obj OBJ_;
		TriangleGML_obj();

	public:
		enum { _hx_ClassId = 0x06984d03 };

		void __construct( ::pi_xy::ImageStruct drawTool, ::Xml xml, ::Dynamic x, ::Dynamic y);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.triangleGML.TriangleGML")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.triangleGML.TriangleGML"); }
		static ::hx::ObjectPtr< TriangleGML_obj > __new( ::pi_xy::ImageStruct drawTool, ::Xml xml, ::Dynamic x, ::Dynamic y);
		static ::hx::ObjectPtr< TriangleGML_obj > __alloc(::hx::Ctx *_hx_ctx, ::pi_xy::ImageStruct drawTool, ::Xml xml, ::Dynamic x, ::Dynamic y);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TriangleGML_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("TriangleGML",7e,69,80,9a); }

		static  ::pi_xy::triangleGML::TriangleGML withString( ::pi_xy::ImageStruct pixelImage,::String str,::hx::Null< Float >  x,::hx::Null< Float >  y,::hx::Null< bool >  renderNow);
		static ::Dynamic withString_dyn();

		::Dynamic getTriangleGML(::String nodeName);

};

} // end namespace pi_xy
} // end namespace triangleGML

#endif /* INCLUDED_pi_xy_triangleGML_TriangleGML */ 