// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_display_PixelSnapping
#define INCLUDED_nme_display_PixelSnapping

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(nme,display,PixelSnapping)
namespace nme{
namespace display{


class PixelSnapping_obj : public ::hx::EnumBase_obj
{
	typedef ::hx::EnumBase_obj super;
		typedef PixelSnapping_obj OBJ_;

	public:
		PixelSnapping_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		static bool __GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::String GetEnumName( ) const { return HX_("nme.display.PixelSnapping",ee,2b,b7,e6); }
		::String __ToString() const { return HX_("PixelSnapping.",ac,7b,2c,7f) + _hx_tag; }

		static ::nme::display::PixelSnapping ALWAYS;
		static inline ::nme::display::PixelSnapping ALWAYS_dyn() { return ALWAYS; }
		static ::nme::display::PixelSnapping AUTO;
		static inline ::nme::display::PixelSnapping AUTO_dyn() { return AUTO; }
		static ::nme::display::PixelSnapping NEVER;
		static inline ::nme::display::PixelSnapping NEVER_dyn() { return NEVER; }
};

} // end namespace nme
} // end namespace display

#endif /* INCLUDED_nme_display_PixelSnapping */ 
