// Generated by Haxe 4.3.3
#ifndef INCLUDED_iterMagic__Img_ImgMulti_Impl_
#define INCLUDED_iterMagic__Img_ImgMulti_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,ds,GenericStack_Int)
HX_DECLARE_CLASS2(haxe,io,ArrayBufferViewImpl)
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS1(iterMagic,ArrIntImg)
HX_DECLARE_CLASS1(iterMagic,BytesImg)
HX_DECLARE_CLASS1(iterMagic,Iimg)
HX_DECLARE_CLASS1(iterMagic,RawImageData)
HX_DECLARE_CLASS1(iterMagic,StackIntImg)
HX_DECLARE_CLASS1(iterMagic,U32ArrImg)
HX_DECLARE_CLASS1(iterMagic,VecIntImg)
HX_DECLARE_CLASS2(iterMagic,_Img,ImgMulti_Impl_)

namespace iterMagic{
namespace _Img{


class HXCPP_CLASS_ATTRIBUTES ImgMulti_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef ImgMulti_Impl__obj OBJ_;
		ImgMulti_Impl__obj();

	public:
		enum { _hx_ClassId = 0x71d1210f };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="iterMagic._Img.ImgMulti_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"iterMagic._Img.ImgMulti_Impl_"); }

		inline static ::hx::ObjectPtr< ImgMulti_Impl__obj > __new() {
			::hx::ObjectPtr< ImgMulti_Impl__obj > __this = new ImgMulti_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< ImgMulti_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			ImgMulti_Impl__obj *__this = (ImgMulti_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(ImgMulti_Impl__obj), false, "iterMagic._Img.ImgMulti_Impl_"));
			*(void **)__this = ImgMulti_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~ImgMulti_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("ImgMulti_Impl_",b6,50,e1,92); }

		static ::Dynamic create(int width,int height,::hx::Null< int >  imageType);
		static ::Dynamic create_dyn();

		static  ::Dynamic check(::Dynamic this1);
		static ::Dynamic check_dyn();

		static  ::iterMagic::ArrIntImg toArrIntImg(::Dynamic t,::Array< int > s);
		static ::Dynamic toArrIntImg_dyn();

		static  ::iterMagic::VecIntImg toVecIntImg(::Dynamic t,::Array< int > s);
		static ::Dynamic toVecIntImg_dyn();

		static  ::iterMagic::BytesImg toBytesImg(::Dynamic t, ::haxe::io::Bytes s);
		static ::Dynamic toBytesImg_dyn();

		static  ::iterMagic::U32ArrImg toU32ArrImg(::Dynamic t, ::haxe::io::ArrayBufferViewImpl s);
		static ::Dynamic toU32ArrImg_dyn();

		static  ::iterMagic::StackIntImg toStackIntImg(::Dynamic t, ::haxe::ds::GenericStack_Int s);
		static ::Dynamic toStackIntImg_dyn();

		static  ::iterMagic::ArrIntImg arrInt(int width,int height);
		static ::Dynamic arrInt_dyn();

		static  ::iterMagic::VecIntImg vecInt(int width,int height);
		static ::Dynamic vecInt_dyn();

		static  ::iterMagic::BytesImg bytes(int width,int height);
		static ::Dynamic bytes_dyn();

		static  ::iterMagic::U32ArrImg u32arr(int width,int height);
		static ::Dynamic u32arr_dyn();

		static  ::iterMagic::StackIntImg stackInt(int width,int height);
		static ::Dynamic stackInt_dyn();

		static int set(::Dynamic this1,int index,int value);
		static ::Dynamic set_dyn();

		static int get(::Dynamic this1,int index);
		static ::Dynamic get_dyn();

		static  ::iterMagic::RawImageData setRaw(::Dynamic this1, ::iterMagic::RawImageData d);
		static ::Dynamic setRaw_dyn();

		static  ::iterMagic::RawImageData getRaw(::Dynamic this1);
		static ::Dynamic getRaw_dyn();

		static int position(::Dynamic this1,Float px,Float py);
		static ::Dynamic position_dyn();

		static ::String toString(::Dynamic this1);
		static ::Dynamic toString_dyn();

		static bool hasNext(::Dynamic this1);
		static ::Dynamic hasNext_dyn();

		static int next(::Dynamic this1);
		static ::Dynamic next_dyn();

		static void resetCount(::Dynamic this1);
		static ::Dynamic resetCount_dyn();

		static void traceGrid(::Dynamic this1);
		static ::Dynamic traceGrid_dyn();

		static ::Dynamic fromTo(::Dynamic a,::Dynamic b);
		static ::Dynamic fromTo_dyn();

		static ::Dynamic toFrom(::Dynamic a,::Dynamic b);
		static ::Dynamic toFrom_dyn();

};

} // end namespace iterMagic
} // end namespace _Img

#endif /* INCLUDED_iterMagic__Img_ImgMulti_Impl_ */ 
