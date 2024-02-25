// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_text_TextLineMetrics
#define INCLUDED_nme_text_TextLineMetrics

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_STACK_FRAME(_hx_pos_c11e61f9a5cf6254_15_new)
HX_DECLARE_CLASS2(nme,text,TextLineMetrics)

namespace nme{
namespace text{


class HXCPP_CLASS_ATTRIBUTES TextLineMetrics_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef TextLineMetrics_obj OBJ_;
		TextLineMetrics_obj();

	public:
		enum { _hx_ClassId = 0x42401eb3 };

		void __construct( ::Dynamic in_x, ::Dynamic in_width, ::Dynamic in_height, ::Dynamic in_ascent, ::Dynamic in_descent, ::Dynamic in_leading);
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.text.TextLineMetrics")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.text.TextLineMetrics"); }

		inline static ::hx::ObjectPtr< TextLineMetrics_obj > __new( ::Dynamic in_x, ::Dynamic in_width, ::Dynamic in_height, ::Dynamic in_ascent, ::Dynamic in_descent, ::Dynamic in_leading) {
			::hx::ObjectPtr< TextLineMetrics_obj > __this = new TextLineMetrics_obj();
			__this->__construct(in_x,in_width,in_height,in_ascent,in_descent,in_leading);
			return __this;
		}

		inline static ::hx::ObjectPtr< TextLineMetrics_obj > __alloc(::hx::Ctx *_hx_ctx, ::Dynamic in_x, ::Dynamic in_width, ::Dynamic in_height, ::Dynamic in_ascent, ::Dynamic in_descent, ::Dynamic in_leading) {
			TextLineMetrics_obj *__this = (TextLineMetrics_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(TextLineMetrics_obj), false, "nme.text.TextLineMetrics"));
			*(void **)__this = TextLineMetrics_obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_c11e61f9a5cf6254_15_new)
HXLINE(  16)		( ( ::nme::text::TextLineMetrics)(__this) )->x = ( (Float)(in_x) );
HXLINE(  17)		( ( ::nme::text::TextLineMetrics)(__this) )->width = ( (Float)(in_width) );
HXLINE(  18)		( ( ::nme::text::TextLineMetrics)(__this) )->height = ( (Float)(in_height) );
HXLINE(  19)		( ( ::nme::text::TextLineMetrics)(__this) )->ascent = ( (Float)(in_ascent) );
HXLINE(  20)		( ( ::nme::text::TextLineMetrics)(__this) )->descent = ( (Float)(in_descent) );
HXLINE(  21)		( ( ::nme::text::TextLineMetrics)(__this) )->leading = ( (Float)(in_leading) );
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TextLineMetrics_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("TextLineMetrics",e2,c0,45,7d); }

		Float x;
		Float width;
		Float height;
		Float ascent;
		Float descent;
		Float leading;
};

} // end namespace nme
} // end namespace text

#endif /* INCLUDED_nme_text_TextLineMetrics */ 