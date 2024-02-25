// Generated by Haxe 4.3.3
#ifndef INCLUDED_iterMagic_StackIntImg
#define INCLUDED_iterMagic_StackIntImg

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_iterMagic_Iimg
#include <iterMagic/Iimg.h>
#endif
HX_DECLARE_CLASS2(haxe,ds,GenericStack_Int)
HX_DECLARE_CLASS1(iterMagic,Iimg)
HX_DECLARE_CLASS1(iterMagic,RawImageData)
HX_DECLARE_CLASS1(iterMagic,StackIntImg)

namespace iterMagic{


class HXCPP_CLASS_ATTRIBUTES StackIntImg_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef StackIntImg_obj OBJ_;
		StackIntImg_obj();

	public:
		enum { _hx_ClassId = 0x4fcb89eb };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="iterMagic.StackIntImg")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"iterMagic.StackIntImg"); }
		static ::hx::ObjectPtr< StackIntImg_obj > __new();
		static ::hx::ObjectPtr< StackIntImg_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~StackIntImg_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		 ::Dynamic size_a9623fd7(int width,int height);

		 ::Dynamic zero_e55b6ed4(int len);
		::String __ToString() const { return HX_("StackIntImg",9c,4f,54,2a); }

		 ::haxe::ds::GenericStack_Int data;
		int count;
		int width;
		int height;
		int length;
		int set(int index,int value);
		::Dynamic set_dyn();

		int get(int index);
		::Dynamic get_dyn();

		 ::haxe::ds::GenericStack_Int zero(int len);
		::Dynamic zero_dyn();

		 ::haxe::ds::GenericStack_Int size(int width,int height);
		::Dynamic size_dyn();

		 ::iterMagic::RawImageData setRaw( ::iterMagic::RawImageData d);
		::Dynamic setRaw_dyn();

		 ::iterMagic::RawImageData getRaw();
		::Dynamic getRaw_dyn();

};

} // end namespace iterMagic

#endif /* INCLUDED_iterMagic_StackIntImg */ 