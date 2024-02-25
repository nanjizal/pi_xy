// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_triangleGML_CircleForm
#define INCLUDED_pi_xy_triangleGML_CircleForm

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_pi_xy_triangleGML_triGML_shape_form_CircleForm_
#include <pi_xy/triangleGML/triGML/shape/form/CircleForm_.h>
#endif
HX_DECLARE_CLASS1(pi_xy,ImageStruct)
HX_DECLARE_CLASS2(pi_xy,triangleGML,CircleForm)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,BasicShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,FillForm)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,GroupShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,ShapeInterface)
HX_DECLARE_CLASS5(pi_xy,triangleGML,triGML,shape,form,CircleForm_)

namespace pi_xy{
namespace triangleGML{


class HXCPP_CLASS_ATTRIBUTES CircleForm_obj : public  ::pi_xy::triangleGML::triGML::shape::form::CircleForm__obj
{
	public:
		typedef  ::pi_xy::triangleGML::triGML::shape::form::CircleForm__obj super;
		typedef CircleForm_obj OBJ_;
		CircleForm_obj();

	public:
		enum { _hx_ClassId = 0x59602077 };

		void __construct( ::Dynamic opacity, ::Dynamic visibility, ::Dynamic strokeColor, ::Dynamic strokeWidth,::Array< ::String > strokeDashGapArray, ::Dynamic fill, ::Dynamic left, ::Dynamic top, ::Dynamic diameter);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.triangleGML.CircleForm")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.triangleGML.CircleForm"); }
		static ::hx::ObjectPtr< CircleForm_obj > __new( ::Dynamic opacity, ::Dynamic visibility, ::Dynamic strokeColor, ::Dynamic strokeWidth,::Array< ::String > strokeDashGapArray, ::Dynamic fill, ::Dynamic left, ::Dynamic top, ::Dynamic diameter);
		static ::hx::ObjectPtr< CircleForm_obj > __alloc(::hx::Ctx *_hx_ctx, ::Dynamic opacity, ::Dynamic visibility, ::Dynamic strokeColor, ::Dynamic strokeWidth,::Array< ::String > strokeDashGapArray, ::Dynamic fill, ::Dynamic left, ::Dynamic top, ::Dynamic diameter);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~CircleForm_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("CircleForm",94,4b,62,ea); }

		 ::Dynamic render( ::Dynamic _tmp_pixelImage);

		void buildCircle( ::pi_xy::ImageStruct temp);
		::Dynamic buildCircle_dyn();

};

} // end namespace pi_xy
} // end namespace triangleGML

#endif /* INCLUDED_pi_xy_triangleGML_CircleForm */ 