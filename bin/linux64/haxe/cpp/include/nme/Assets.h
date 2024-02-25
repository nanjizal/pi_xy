// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_Assets
#define INCLUDED_nme_Assets

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(haxe,IMap)
HX_DECLARE_CLASS2(haxe,ds,StringMap)
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS1(nme,AssetInfo)
HX_DECLARE_CLASS1(nme,AssetLib)
HX_DECLARE_CLASS1(nme,AssetType)
HX_DECLARE_CLASS1(nme,Assets)
HX_DECLARE_CLASS1(nme,Cache)
HX_DECLARE_CLASS2(nme,display,BitmapData)
HX_DECLARE_CLASS2(nme,display,DisplayObject)
HX_DECLARE_CLASS2(nme,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(nme,display,IBitmapDrawable)
HX_DECLARE_CLASS2(nme,display,InteractiveObject)
HX_DECLARE_CLASS2(nme,display,MovieClip)
HX_DECLARE_CLASS2(nme,display,Sprite)
HX_DECLARE_CLASS2(nme,events,EventDispatcher)
HX_DECLARE_CLASS2(nme,events,IEventDispatcher)
HX_DECLARE_CLASS2(nme,media,Sound)
HX_DECLARE_CLASS2(nme,text,Font)
HX_DECLARE_CLASS2(nme,utils,ByteArray)
HX_DECLARE_CLASS2(nme,utils,IDataInput)
HX_DECLARE_CLASS2(nme,utils,IDataOutput)
HX_DECLARE_CLASS2(nme,utils,IMemoryRange)

namespace nme{


class HXCPP_CLASS_ATTRIBUTES Assets_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef Assets_obj OBJ_;
		Assets_obj();

	public:
		enum { _hx_ClassId = 0x0d6351e9 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="nme.Assets")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"nme.Assets"); }

		inline static ::hx::ObjectPtr< Assets_obj > __new() {
			::hx::ObjectPtr< Assets_obj > __this = new Assets_obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< Assets_obj > __alloc(::hx::Ctx *_hx_ctx) {
			Assets_obj *__this = (Assets_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(Assets_obj), false, "nme.Assets"));
			*(void **)__this = Assets_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Assets_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Assets",a3,bc,97,80); }

		static void __boot();
		static int UNCACHED;
		static int WEAK_CACHE;
		static int STRONG_CACHE;
		static  ::haxe::ds::StringMap info;
		static  ::haxe::ds::StringMap pathMapper;
		static  ::haxe::ds::StringMap byteFactory;
		static  ::haxe::ds::StringMap libraryFactories;
		static  ::haxe::ds::StringMap loadedLibraries;
		static int cacheMode;
		static ::String scriptBase;
		static  ::nme::Cache cache;
		static void fromAssetList(::String assetList,bool inAddScriptBase,bool inAlphaToo);
		static ::Dynamic fromAssetList_dyn();

		static void loadAssetList();
		static ::Dynamic loadAssetList_dyn();

		static void loadScriptAssetList();
		static ::Dynamic loadScriptAssetList_dyn();

		static void loadScriptAssetList2();
		static ::Dynamic loadScriptAssetList2_dyn();

		static void addLibraryFactory( ::nme::AssetType inType, ::Dynamic inFactory);
		static ::Dynamic addLibraryFactory_dyn();

		static ::String getAssetPath(::String inName);
		static ::Dynamic getAssetPath_dyn();

		static ::String getPath(::String inName);
		static ::Dynamic getPath_dyn();

		static void addEventListener(::String type, ::Dynamic listener,::hx::Null< bool >  useCapture,::hx::Null< int >  priority,::hx::Null< bool >  useWeakReference);
		static ::Dynamic addEventListener_dyn();

		static bool isEmbedded(::String inName);
		static ::Dynamic isEmbedded_dyn();

		static  ::nme::utils::ByteArray getResource(::String inName);
		static ::Dynamic getResource_dyn();

		static bool isLocal(::String inId, ::nme::AssetType inType);
		static ::Dynamic isLocal_dyn();

		static  ::Dynamic list( ::nme::AssetType inFilter);
		static ::Dynamic list_dyn();

		static void removeBitmapData(::String inId);
		static ::Dynamic removeBitmapData_dyn();

		static void trySetCache( ::nme::AssetInfo info, ::Dynamic useCache, ::Dynamic data);
		static ::Dynamic trySetCache_dyn();

		static void noId(::String id,::String type);
		static ::Dynamic noId_dyn();

		static void badType(::String id,::String type);
		static ::Dynamic badType_dyn();

		static bool hasBitmapData(::String id);
		static ::Dynamic hasBitmapData_dyn();

		static  ::nme::AssetInfo getInfo(::String inName);
		static ::Dynamic getInfo_dyn();

		static  ::nme::display::BitmapData makeBitmapData(::String inClassName);
		static ::Dynamic makeBitmapData_dyn();

		static  ::nme::display::BitmapData getBitmapData(::String id, ::Dynamic useCache);
		static ::Dynamic getBitmapData_dyn();

		static  ::nme::display::BitmapData getImage(::String id, ::Dynamic useCache);
		static ::Dynamic getImage_dyn();

		static bool hasBytes(::String id);
		static ::Dynamic hasBytes_dyn();

		static bool exists(::String id, ::nme::AssetType type);
		static ::Dynamic exists_dyn();

		static  ::nme::utils::ByteArray getBytes(::String id, ::Dynamic useCache);
		static ::Dynamic getBytes_dyn();

		static  ::nme::utils::ByteArray getBytesInfo( ::nme::AssetInfo i, ::Dynamic useCache);
		static ::Dynamic getBytesInfo_dyn();

		static bool hasFont(::String id);
		static ::Dynamic hasFont_dyn();

		static  ::nme::text::Font getFont(::String id, ::Dynamic useCache);
		static ::Dynamic getFont_dyn();

		static bool hasSound(::String id);
		static ::Dynamic hasSound_dyn();

		static  ::nme::media::Sound getSound(::String id, ::Dynamic useCache,::hx::Null< bool >  forceMusic,::String inEngine);
		static ::Dynamic getSound_dyn();

		static  ::nme::media::Sound getMusic(::String id, ::Dynamic useCache);
		static ::Dynamic getMusic_dyn();

		static bool hasText(::String id);
		static ::Dynamic hasText_dyn();

		static bool hasString(::String id);
		static ::Dynamic hasString_dyn();

		static ::String getText(::String id, ::Dynamic useCache);
		static ::Dynamic getText_dyn();

		static ::String getString(::String id, ::Dynamic useCache);
		static ::Dynamic getString_dyn();

		static ::Array< ::String > parseLibId(::String id);
		static ::Dynamic parseLibId_dyn();

		static void loadLibrary(::String inLibName, ::Dynamic onLoad);
		static ::Dynamic loadLibrary_dyn();

		static  ::nme::AssetLib getLoadedLibrary(::String inLibName);
		static ::Dynamic getLoadedLibrary_dyn();

		static  ::nme::display::MovieClip getMovieClip(::String id);
		static ::Dynamic getMovieClip_dyn();

		static  ::Dynamic initResources;
		static void initialize();
		static ::Dynamic initialize_dyn();

};

} // end namespace nme

#endif /* INCLUDED_nme_Assets */ 