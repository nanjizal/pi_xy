// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_triangleGML_ArcForm
#define INCLUDED_pi_xy_triangleGML_ArcForm

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_pi_xy_triangleGML_triGML_shape_form_ArcForm_
#include <pi_xy/triangleGML/triGML/shape/form/ArcForm_.h>
#endif
HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,triangleGML,ArcForm)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,BasicShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,FillForm)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,GroupShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,ShapeInterface)
HX_DECLARE_CLASS5(pi_xy,triangleGML,triGML,shape,form,ArcForm_)

namespace pi_xy{
namespace triangleGML{


class HXCPP_CLASS_ATTRIBUTES ArcForm_obj : public  ::pi_xy::triangleGML::triGML::shape::form::ArcForm__obj
{
	public:
		typedef  ::pi_xy::triangleGML::triGML::shape::form::ArcForm__obj super;
		typedef ArcForm_obj OBJ_;
		ArcForm_obj();

	public:
		enum { _hx_ClassId = 0x0dcd4ab7 };

		void __construct( ::Dynamic opacity, ::Dynamic visibility, ::Dynamic strokeColor, ::Dynamic strokeWidth,::Array< ::String > strokeDashGapArray, ::Dynamic fill, ::Dynamic left, ::Dynamic top, ::Dynamic width, ::Dynamic height, ::Dynamic startAngle, ::Dynamic sweepAngle,::String __o_arcType);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.triangleGML.ArcForm")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.triangleGML.ArcForm"); }
		static ::hx::ObjectPtr< ArcForm_obj > __new( ::Dynamic opacity, ::Dynamic visibility, ::Dynamic strokeColor, ::Dynamic strokeWidth,::Array< ::String > strokeDashGapArray, ::Dynamic fill, ::Dynamic left, ::Dynamic top, ::Dynamic width, ::Dynamic height, ::Dynamic startAngle, ::Dynamic sweepAngle,::String __o_arcType);
		static ::hx::ObjectPtr< ArcForm_obj > __alloc(::hx::Ctx *_hx_ctx, ::Dynamic opacity, ::Dynamic visibility, ::Dynamic strokeColor, ::Dynamic strokeWidth,::Array< ::String > strokeDashGapArray, ::Dynamic fill, ::Dynamic left, ::Dynamic top, ::Dynamic width, ::Dynamic height, ::Dynamic startAngle, ::Dynamic sweepAngle,::String __o_arcType);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~ArcForm_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("ArcForm",96,44,e7,52); }

		 ::Dynamic render( ::Dynamic _tmp_pixelImage);

		void chord( ::pi_xy::ImageStruct temp);
		::Dynamic chord_dyn();

		void ellipse( ::pi_xy::ImageStruct temp);
		::Dynamic ellipse_dyn();

		void pie( ::pi_xy::ImageStruct temp);
		::Dynamic pie_dyn();

};

} // end namespace pi_xy
} // end namespace triangleGML

#endif /* INCLUDED_pi_xy_triangleGML_ArcForm */ 
