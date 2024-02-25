// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_triangleGML_triGML_shape_picture_NineSlicePicture_
#define INCLUDED_pi_xy_triangleGML_triGML_shape_picture_NineSlicePicture_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_pi_xy_triangleGML_triGML_FillForm
#include <pi_xy/triangleGML/triGML/FillForm.h>
#endif
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,BasicShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,FillForm)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,GroupShape)
HX_DECLARE_CLASS3(pi_xy,triangleGML,triGML,ShapeInterface)
HX_DECLARE_CLASS5(pi_xy,triangleGML,triGML,shape,picture,NineSlicePicture_)

namespace pi_xy{
namespace triangleGML{
namespace triGML{
namespace shape{
namespace picture{


class HXCPP_CLASS_ATTRIBUTES NineSlicePicture__obj : public  ::pi_xy::triangleGML::triGML::FillForm_obj
{
	public:
		typedef  ::pi_xy::triangleGML::triGML::FillForm_obj super;
		typedef NineSlicePicture__obj OBJ_;
		NineSlicePicture__obj();

	public:
		enum { _hx_ClassId = 0x79ec058e };

		void __construct(::hx::Null< Float >  __o_opacity,::hx::Null< bool >  __o_visibility,::hx::Null< int >  __o_strokeColor,::hx::Null< Float >  __o_strokeWidth,::Array< ::String > strokeDashGapArray,::hx::Null< int >  __o_fill,::hx::Null< Float >  __o_left,::hx::Null< Float >  __o_top,::hx::Null< Float >  __o_initWid,::hx::Null< Float >  __o_initHi,::hx::Null< Float >  __o_initLeft,::hx::Null< Float >  __o_initTop,::hx::Null< Float >  __o_initFat,::hx::Null< Float >  __o_initTall,::hx::Null< Float >  __o_newWid,::hx::Null< Float >  __o_newHi,::hx::Null< Float >  __o_newLeft,::hx::Null< Float >  __o_newTop,::hx::Null< Float >  __o_newFat,::hx::Null< Float >  __o_newTall, ::Dynamic imageTexture,::hx::Null< Float >  __o_pictureX,::hx::Null< Float >  __o_pictureY,::hx::Null< Float >  __o_pictureWidth,::hx::Null< Float >  __o_pictureHeight,::hx::Null< bool >  __o_rounded);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="pi_xy.triangleGML.triGML.shape.picture.NineSlicePicture_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"pi_xy.triangleGML.triGML.shape.picture.NineSlicePicture_"); }

		//~NineSlicePicture__obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("NineSlicePicture_",a1,4b,89,d2); }

		Float left;
		Float top;
		Float initWid;
		Float initHi;
		Float initLeft;
		Float initTop;
		Float initFat;
		Float initTall;
		Float newWid;
		Float newHi;
		Float newLeft;
		Float newTop;
		Float newFat;
		Float newTall;
		 ::Dynamic imageTexture;
		Float pictureX;
		Float pictureY;
		Float pictureWidth;
		Float pictureHeight;
		bool rounded;
		virtual void setParameter(::String name,::String value);

};

} // end namespace pi_xy
} // end namespace triangleGML
} // end namespace triGML
} // end namespace shape
} // end namespace picture

#endif /* INCLUDED_pi_xy_triangleGML_triGML_shape_picture_NineSlicePicture_ */ 