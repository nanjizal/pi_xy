// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_AssetType
#define INCLUDED_nme_AssetType

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(nme,AssetType)
namespace nme{


class AssetType_obj : public ::hx::EnumBase_obj
{
	typedef ::hx::EnumBase_obj super;
		typedef AssetType_obj OBJ_;

	public:
		AssetType_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		static bool __GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::String GetEnumName( ) const { return HX_("nme.AssetType",82,95,db,af); }
		::String __ToString() const { return HX_("AssetType.",44,74,5a,be) + _hx_tag; }

		static ::nme::AssetType BINARY;
		static inline ::nme::AssetType BINARY_dyn() { return BINARY; }
		static ::nme::AssetType FONT;
		static inline ::nme::AssetType FONT_dyn() { return FONT; }
		static ::nme::AssetType IMAGE;
		static inline ::nme::AssetType IMAGE_dyn() { return IMAGE; }
		static ::nme::AssetType MOVIE_CLIP;
		static inline ::nme::AssetType MOVIE_CLIP_dyn() { return MOVIE_CLIP; }
		static ::nme::AssetType MUSIC;
		static inline ::nme::AssetType MUSIC_dyn() { return MUSIC; }
		static ::nme::AssetType SOUND;
		static inline ::nme::AssetType SOUND_dyn() { return SOUND; }
		static ::nme::AssetType SWF;
		static inline ::nme::AssetType SWF_dyn() { return SWF; }
		static ::nme::AssetType TEXT;
		static inline ::nme::AssetType TEXT_dyn() { return TEXT; }
};

} // end namespace nme

#endif /* INCLUDED_nme_AssetType */ 