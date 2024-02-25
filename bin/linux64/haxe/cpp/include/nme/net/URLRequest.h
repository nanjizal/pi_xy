// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_net_URLRequest
#define INCLUDED_nme_net_URLRequest

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS2(nme,net,URLRequest)
HX_DECLARE_CLASS2(nme,net,URLRequestHeader)
HX_DECLARE_CLASS2(nme,utils,ByteArray)
HX_DECLARE_CLASS2(nme,utils,IDataInput)
HX_DECLARE_CLASS2(nme,utils,IDataOutput)
HX_DECLARE_CLASS2(nme,utils,IMemoryRange)

namespace nme{
namespace net{


class HXCPP_CLASS_ATTRIBUTES URLRequest_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef URLRequest_obj OBJ_;
		URLRequest_obj();

	public:
		enum { _hx_ClassId = 0x11fd4b1f };

		void __construct(::String inURL);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="nme.net.URLRequest")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"nme.net.URLRequest"); }
		static ::hx::ObjectPtr< URLRequest_obj > __new(::String inURL);
		static ::hx::ObjectPtr< URLRequest_obj > __alloc(::hx::Ctx *_hx_ctx,::String inURL);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~URLRequest_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("URLRequest",c0,57,dd,76); }

		static void __boot();
		static int AUTH_BASIC;
		static int AUTH_DIGEST;
		static int AUTH_GSSNEGOTIATE;
		static int AUTH_NTLM;
		static int AUTH_DIGEST_IE;
		static int AUTH_DIGEST_ANY;
		static  ::Dynamic nme_get_url;
		static Dynamic nme_get_url_dyn() { return nme_get_url;}
		::String url;
		::String userAgent;
		::Array< ::Dynamic> requestHeaders;
		int authType;
		::String cookieString;
		bool verbose;
		::String method;
		::String contentType;
		 ::Dynamic data;
		::String credentials;
		bool followRedirects;
		 ::nme::utils::ByteArray _hx___bytes;
		virtual ::String toString();
		::Dynamic toString_dyn();

		void launchBrowser();
		::Dynamic launchBrowser_dyn();

		void basicAuth(::String inUser,::String inPasswd);
		::Dynamic basicAuth_dyn();

		void digestAuth(::String inUser,::String inPasswd);
		::Dynamic digestAuth_dyn();

		void nmePrepare();
		::Dynamic nmePrepare_dyn();

		 ::nme::utils::ByteArray get_nmeBytes();
		::Dynamic get_nmeBytes_dyn();

		 ::nme::utils::ByteArray set_nmeBytes( ::nme::utils::ByteArray value);
		::Dynamic set_nmeBytes_dyn();

};

} // end namespace nme
} // end namespace net

#endif /* INCLUDED_nme_net_URLRequest */ 