// Generated by Haxe 4.3.3
#ifndef INCLUDED_pi_xy_application__TestNME_TestNME_Fields_
#define INCLUDED_pi_xy_application__TestNME_TestNME_Fields_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(pi_xy,application,_TestNME,TestNME_Fields_)

namespace pi_xy{
namespace application{
namespace _TestNME{


class HXCPP_CLASS_ATTRIBUTES TestNME_Fields__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef TestNME_Fields__obj OBJ_;
		TestNME_Fields__obj();

	public:
		enum { _hx_ClassId = 0x0338a6fd };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="pi_xy.application._TestNME.TestNME_Fields_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"pi_xy.application._TestNME.TestNME_Fields_"); }

		inline static ::hx::ObjectPtr< TestNME_Fields__obj > __new() {
			::hx::ObjectPtr< TestNME_Fields__obj > __this = new TestNME_Fields__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< TestNME_Fields__obj > __alloc(::hx::Ctx *_hx_ctx) {
			TestNME_Fields__obj *__this = (TestNME_Fields__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(TestNME_Fields__obj), false, "pi_xy.application._TestNME.TestNME_Fields_"));
			*(void **)__this = TestNME_Fields__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TestNME_Fields__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("TestNME_Fields_",1b,03,9c,c9); }

		static void main();
		static ::Dynamic main_dyn();

};

} // end namespace pi_xy
} // end namespace application
} // end namespace _TestNME

#endif /* INCLUDED_pi_xy_application__TestNME_TestNME_Fields_ */ 