// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_nme_events_EventDispatcher
#include <nme/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_nme_events_IEventDispatcher
#include <nme/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_nme_media_SoundTransform
#include <nme/media/SoundTransform.h>
#endif
#ifndef INCLUDED_nme_media_StageVideo
#include <nme/media/StageVideo.h>
#endif
#ifndef INCLUDED_nme_net_NetConnection
#include <nme/net/NetConnection.h>
#endif
#ifndef INCLUDED_nme_net_NetStream
#include <nme/net/NetStream.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_83e184be3823e0ea_36_new,"nme.net.NetStream","new",0xa27ef116,"nme.net.NetStream.new","nme/net/NetStream.hx",36,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_50_attach,"nme.net.NetStream","attach",0x49e5b0cf,"nme.net.NetStream.attach","nme/net/NetStream.hx",50,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_53_get_time,"nme.net.NetStream","get_time",0x9f2c1320,"nme.net.NetStream.get_time","nme/net/NetStream.hx",53,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_59_seek,"nme.net.NetStream","seek",0x8fe20402,"nme.net.NetStream.seek","nme/net/NetStream.hx",59,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_65_close,"nme.net.NetStream","close",0x242051ee,"nme.net.NetStream.close","nme/net/NetStream.hx",65,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_71_dispose,"nme.net.NetStream","dispose",0xec753455,"nme.net.NetStream.dispose","nme/net/NetStream.hx",71,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_74_play,"nme.net.NetStream","play",0x8debac7e,"nme.net.NetStream.play","nme/net/NetStream.hx",74,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_83_pause,"nme.net.NetStream","pause",0x9915112c,"nme.net.NetStream.pause","nme/net/NetStream.hx",83,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_89_togglePause,"nme.net.NetStream","togglePause",0x4f0a5578,"nme.net.NetStream.togglePause","nme/net/NetStream.hx",89,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_95_resume,"nme.net.NetStream","resume",0x725a1eb7,"nme.net.NetStream.resume","nme/net/NetStream.hx",95,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_102_receiveAudio,"nme.net.NetStream","receiveAudio",0xb6bae87d,"nme.net.NetStream.receiveAudio","nme/net/NetStream.hx",102,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_106_receiveVideo,"nme.net.NetStream","receiveVideo",0xc6368422,"nme.net.NetStream.receiveVideo","nme/net/NetStream.hx",106,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_109_onPeerConnect,"nme.net.NetStream","onPeerConnect",0xc79457bf,"nme.net.NetStream.onPeerConnect","nme/net/NetStream.hx",109,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_112_get_bytesTotal,"nme.net.NetStream","get_bytesTotal",0x6f50aeac,"nme.net.NetStream.get_bytesTotal","nme/net/NetStream.hx",112,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_118_get_bytesLoaded,"nme.net.NetStream","get_bytesLoaded",0xb7e0781d,"nme.net.NetStream.get_bytesLoaded","nme/net/NetStream.hx",118,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_124_get_decodedFrames,"nme.net.NetStream","get_decodedFrames",0xd96c0a49,"nme.net.NetStream.get_decodedFrames","nme/net/NetStream.hx",124,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_129_get_peerStreams,"nme.net.NetStream","get_peerStreams",0xd2118bbe,"nme.net.NetStream.get_peerStreams","nme/net/NetStream.hx",129,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_133_get_soundTransform,"nme.net.NetStream","get_soundTransform",0xe60eeb70,"nme.net.NetStream.get_soundTransform","nme/net/NetStream.hx",133,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_138_set_soundTransform,"nme.net.NetStream","set_soundTransform",0xc2be1de4,"nme.net.NetStream.set_soundTransform","nme/net/NetStream.hx",138,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_10_boot,"nme.net.NetStream","boot",0x84ad02bc,"nme.net.NetStream.boot","nme/net/NetStream.hx",10,0x2e74929c)
HX_LOCAL_STACK_FRAME(_hx_pos_83e184be3823e0ea_11_boot,"nme.net.NetStream","boot",0x84ad02bc,"nme.net.NetStream.boot","nme/net/NetStream.hx",11,0x2e74929c)
namespace nme{
namespace net{

void NetStream_obj::__construct( ::nme::net::NetConnection inConnection,::String peerID){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_36_new)
HXLINE(  37)		super::__construct(null());
HXLINE(  38)		this->nmeConnection = inConnection;
HXLINE(  39)		this->client = null();
HXLINE(  40)		this->nmeReceiveAudio = true;
HXLINE(  41)		this->nmeReceiveVideo = true;
HXLINE(  42)		this->nmeVolume = ((Float)1.0);
HXLINE(  43)		this->nmeSoundPan = ((Float)0.0);
HXLINE(  44)		this->objectEncoding = 0;
HXLINE(  45)		this->nmePaused = false;
HXLINE(  46)		this->nmeSeek = ((Float)0.0);
            	}

Dynamic NetStream_obj::__CreateEmpty() { return new NetStream_obj; }

void *NetStream_obj::_hx_vtable = 0;

Dynamic NetStream_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< NetStream_obj > _hx_result = new NetStream_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool NetStream_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x169017a6) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x169017a6;
	} else {
		return inClassId==(int)0x5bdd2d02;
	}
}

void NetStream_obj::attach( ::nme::net::NetConnection inConnection){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_50_attach)
HXDLIN(  50)		this->nmeConnection = inConnection;
            	}


HX_DEFINE_DYNAMIC_FUNC1(NetStream_obj,attach,(void))

Float NetStream_obj::get_time(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_53_get_time)
HXLINE(  54)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE(  55)			return this->nmeAttachedVideo->nmeGetTime();
            		}
HXLINE(  56)		return ((Float)0.0);
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,get_time,return )

void NetStream_obj::seek(Float offset){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_59_seek)
HXLINE(  60)		this->nmeSeek = offset;
HXLINE(  61)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE(  62)			this->nmeAttachedVideo->nmeSeek(offset);
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(NetStream_obj,seek,(void))

void NetStream_obj::close(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_65_close)
HXLINE(  66)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE(  67)			this->nmeAttachedVideo->nmeDestroy();
            		}
HXLINE(  68)		this->nmeFilename = null();
HXLINE(  69)		this->nmeSeek = ((Float)0.0);
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,close,(void))

void NetStream_obj::dispose(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_71_dispose)
HXDLIN(  71)		this->close();
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,dispose,(void))

void NetStream_obj::play(::String inFilename,::hx::Null< Float >  __o_startSeconds, ::Dynamic __o_lenSeconds, ::Dynamic p4, ::Dynamic p5){
            		Float startSeconds = __o_startSeconds.Default(((Float)0.0));
            		 ::Dynamic lenSeconds = __o_lenSeconds;
            		if (::hx::IsNull(__o_lenSeconds)) lenSeconds = -1;
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_74_play)
HXLINE(  75)		this->nmeFilename = inFilename;
HXLINE(  76)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE(  77)			this->nmeAttachedVideo->nmePlay(this->nmeFilename,startSeconds,lenSeconds);
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC5(NetStream_obj,play,(void))

void NetStream_obj::pause(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_83_pause)
HXLINE(  84)		this->nmePaused = true;
HXLINE(  85)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE(  86)			this->nmeAttachedVideo->nmePause();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,pause,(void))

void NetStream_obj::togglePause(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_89_togglePause)
HXLINE(  90)		this->nmePaused = !(this->nmePaused);
HXLINE(  91)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE(  92)			this->nmeAttachedVideo->nmeTogglePause();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,togglePause,(void))

void NetStream_obj::resume(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_95_resume)
HXLINE(  96)		this->nmePaused = false;
HXLINE(  97)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE(  98)			this->nmeAttachedVideo->nmeResume();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,resume,(void))

void NetStream_obj::receiveAudio(bool flag){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_102_receiveAudio)
HXDLIN( 102)		this->nmeReceiveAudio = flag;
            	}


HX_DEFINE_DYNAMIC_FUNC1(NetStream_obj,receiveAudio,(void))

void NetStream_obj::receiveVideo(bool flag){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_106_receiveVideo)
HXDLIN( 106)		this->nmeReceiveVideo = flag;
            	}


HX_DEFINE_DYNAMIC_FUNC1(NetStream_obj,receiveVideo,(void))

bool NetStream_obj::onPeerConnect( ::nme::net::NetStream subscriber){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_109_onPeerConnect)
HXDLIN( 109)		return true;
            	}


HX_DEFINE_DYNAMIC_FUNC1(NetStream_obj,onPeerConnect,return )

int NetStream_obj::get_bytesTotal(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_112_get_bytesTotal)
HXLINE( 113)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE( 114)			return this->nmeAttachedVideo->nmeGetBytesTotal();
            		}
HXLINE( 115)		return 0;
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,get_bytesTotal,return )

int NetStream_obj::get_bytesLoaded(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_118_get_bytesLoaded)
HXLINE( 119)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE( 120)			return this->nmeAttachedVideo->nmeGetBytesLoaded();
            		}
HXLINE( 121)		return 0;
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,get_bytesLoaded,return )

int NetStream_obj::get_decodedFrames(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_124_get_decodedFrames)
HXLINE( 125)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE( 126)			return this->nmeAttachedVideo->nmeGetDecodedFrames();
            		}
HXLINE( 127)		return 0;
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,get_decodedFrames,return )

::cpp::VirtualArray NetStream_obj::get_peerStreams(){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_129_get_peerStreams)
HXDLIN( 129)		return ::cpp::VirtualArray_obj::__new();
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,get_peerStreams,return )

 ::nme::media::SoundTransform NetStream_obj::get_soundTransform(){
            	HX_GC_STACKFRAME(&_hx_pos_83e184be3823e0ea_133_get_soundTransform)
HXDLIN( 133)		return  ::nme::media::SoundTransform_obj::__alloc( HX_CTX ,this->nmeVolume,this->nmeSoundPan);
            	}


HX_DEFINE_DYNAMIC_FUNC0(NetStream_obj,get_soundTransform,return )

 ::nme::media::SoundTransform NetStream_obj::set_soundTransform( ::nme::media::SoundTransform inTransform){
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_138_set_soundTransform)
HXLINE( 139)		this->nmeVolume = inTransform->volume;
HXLINE( 140)		this->nmeSoundPan = inTransform->pan;
HXLINE( 141)		if (::hx::IsNotNull( this->nmeAttachedVideo )) {
HXLINE( 142)			this->nmeAttachedVideo->nmeSetSoundTransform(this->nmeVolume,this->nmeSoundPan);
            		}
HXLINE( 143)		return inTransform;
            	}


HX_DEFINE_DYNAMIC_FUNC1(NetStream_obj,set_soundTransform,return )

::String NetStream_obj::CONNECT_TO_FMS;

::String NetStream_obj::DIRECT_CONNECTIONS;


::hx::ObjectPtr< NetStream_obj > NetStream_obj::__new( ::nme::net::NetConnection inConnection,::String peerID) {
	::hx::ObjectPtr< NetStream_obj > __this = new NetStream_obj();
	__this->__construct(inConnection,peerID);
	return __this;
}

::hx::ObjectPtr< NetStream_obj > NetStream_obj::__alloc(::hx::Ctx *_hx_ctx, ::nme::net::NetConnection inConnection,::String peerID) {
	NetStream_obj *__this = (NetStream_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(NetStream_obj), true, "nme.net.NetStream"));
	*(void **)__this = NetStream_obj::_hx_vtable;
	__this->__construct(inConnection,peerID);
	return __this;
}

NetStream_obj::NetStream_obj()
{
}

void NetStream_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(NetStream);
	HX_MARK_MEMBER_NAME(bytesTotal,"bytesTotal");
	HX_MARK_MEMBER_NAME(bytesLoaded,"bytesLoaded");
	HX_MARK_MEMBER_NAME(decodedFrames,"decodedFrames");
	HX_MARK_MEMBER_NAME(client,"client");
	HX_MARK_MEMBER_NAME(objectEncoding,"objectEncoding");
	HX_MARK_MEMBER_NAME(peerStreams,"peerStreams");
	HX_MARK_MEMBER_NAME(time,"time");
	HX_MARK_MEMBER_NAME(nmeConnection,"nmeConnection");
	HX_MARK_MEMBER_NAME(nmeReceiveAudio,"nmeReceiveAudio");
	HX_MARK_MEMBER_NAME(nmeReceiveVideo,"nmeReceiveVideo");
	HX_MARK_MEMBER_NAME(nmeVolume,"nmeVolume");
	HX_MARK_MEMBER_NAME(nmeSoundPan,"nmeSoundPan");
	HX_MARK_MEMBER_NAME(nmeFilename,"nmeFilename");
	HX_MARK_MEMBER_NAME(nmePaused,"nmePaused");
	HX_MARK_MEMBER_NAME(nmeSeek,"nmeSeek");
	HX_MARK_MEMBER_NAME(nmeAttachedVideo,"nmeAttachedVideo");
	 ::nme::events::EventDispatcher_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void NetStream_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(bytesTotal,"bytesTotal");
	HX_VISIT_MEMBER_NAME(bytesLoaded,"bytesLoaded");
	HX_VISIT_MEMBER_NAME(decodedFrames,"decodedFrames");
	HX_VISIT_MEMBER_NAME(client,"client");
	HX_VISIT_MEMBER_NAME(objectEncoding,"objectEncoding");
	HX_VISIT_MEMBER_NAME(peerStreams,"peerStreams");
	HX_VISIT_MEMBER_NAME(time,"time");
	HX_VISIT_MEMBER_NAME(nmeConnection,"nmeConnection");
	HX_VISIT_MEMBER_NAME(nmeReceiveAudio,"nmeReceiveAudio");
	HX_VISIT_MEMBER_NAME(nmeReceiveVideo,"nmeReceiveVideo");
	HX_VISIT_MEMBER_NAME(nmeVolume,"nmeVolume");
	HX_VISIT_MEMBER_NAME(nmeSoundPan,"nmeSoundPan");
	HX_VISIT_MEMBER_NAME(nmeFilename,"nmeFilename");
	HX_VISIT_MEMBER_NAME(nmePaused,"nmePaused");
	HX_VISIT_MEMBER_NAME(nmeSeek,"nmeSeek");
	HX_VISIT_MEMBER_NAME(nmeAttachedVideo,"nmeAttachedVideo");
	 ::nme::events::EventDispatcher_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val NetStream_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"time") ) { return ::hx::Val( inCallProp != ::hx::paccNever ? get_time() : time ); }
		if (HX_FIELD_EQ(inName,"seek") ) { return ::hx::Val( seek_dyn() ); }
		if (HX_FIELD_EQ(inName,"play") ) { return ::hx::Val( play_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"close") ) { return ::hx::Val( close_dyn() ); }
		if (HX_FIELD_EQ(inName,"pause") ) { return ::hx::Val( pause_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"client") ) { return ::hx::Val( client ); }
		if (HX_FIELD_EQ(inName,"attach") ) { return ::hx::Val( attach_dyn() ); }
		if (HX_FIELD_EQ(inName,"resume") ) { return ::hx::Val( resume_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"nmeSeek") ) { return ::hx::Val( nmeSeek ); }
		if (HX_FIELD_EQ(inName,"dispose") ) { return ::hx::Val( dispose_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"get_time") ) { return ::hx::Val( get_time_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"nmeVolume") ) { return ::hx::Val( nmeVolume ); }
		if (HX_FIELD_EQ(inName,"nmePaused") ) { return ::hx::Val( nmePaused ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bytesTotal") ) { return ::hx::Val( inCallProp != ::hx::paccNever ? get_bytesTotal() : bytesTotal ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"bytesLoaded") ) { return ::hx::Val( inCallProp != ::hx::paccNever ? get_bytesLoaded() : bytesLoaded ); }
		if (HX_FIELD_EQ(inName,"peerStreams") ) { return ::hx::Val( inCallProp != ::hx::paccNever ? get_peerStreams() : peerStreams ); }
		if (HX_FIELD_EQ(inName,"nmeSoundPan") ) { return ::hx::Val( nmeSoundPan ); }
		if (HX_FIELD_EQ(inName,"nmeFilename") ) { return ::hx::Val( nmeFilename ); }
		if (HX_FIELD_EQ(inName,"togglePause") ) { return ::hx::Val( togglePause_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"receiveAudio") ) { return ::hx::Val( receiveAudio_dyn() ); }
		if (HX_FIELD_EQ(inName,"receiveVideo") ) { return ::hx::Val( receiveVideo_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"decodedFrames") ) { return ::hx::Val( inCallProp != ::hx::paccNever ? get_decodedFrames() : decodedFrames ); }
		if (HX_FIELD_EQ(inName,"nmeConnection") ) { return ::hx::Val( nmeConnection ); }
		if (HX_FIELD_EQ(inName,"onPeerConnect") ) { return ::hx::Val( onPeerConnect_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"objectEncoding") ) { return ::hx::Val( objectEncoding ); }
		if (HX_FIELD_EQ(inName,"soundTransform") ) { if (inCallProp != ::hx::paccNever) return ::hx::Val( get_soundTransform() ); }
		if (HX_FIELD_EQ(inName,"get_bytesTotal") ) { return ::hx::Val( get_bytesTotal_dyn() ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"nmeReceiveAudio") ) { return ::hx::Val( nmeReceiveAudio ); }
		if (HX_FIELD_EQ(inName,"nmeReceiveVideo") ) { return ::hx::Val( nmeReceiveVideo ); }
		if (HX_FIELD_EQ(inName,"get_bytesLoaded") ) { return ::hx::Val( get_bytesLoaded_dyn() ); }
		if (HX_FIELD_EQ(inName,"get_peerStreams") ) { return ::hx::Val( get_peerStreams_dyn() ); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"nmeAttachedVideo") ) { return ::hx::Val( nmeAttachedVideo ); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"get_decodedFrames") ) { return ::hx::Val( get_decodedFrames_dyn() ); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"get_soundTransform") ) { return ::hx::Val( get_soundTransform_dyn() ); }
		if (HX_FIELD_EQ(inName,"set_soundTransform") ) { return ::hx::Val( set_soundTransform_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val NetStream_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"time") ) { time=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"client") ) { client=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"nmeSeek") ) { nmeSeek=inValue.Cast< Float >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"nmeVolume") ) { nmeVolume=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"nmePaused") ) { nmePaused=inValue.Cast< bool >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bytesTotal") ) { bytesTotal=inValue.Cast< int >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"bytesLoaded") ) { bytesLoaded=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"peerStreams") ) { peerStreams=inValue.Cast< ::cpp::VirtualArray >(); return inValue; }
		if (HX_FIELD_EQ(inName,"nmeSoundPan") ) { nmeSoundPan=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"nmeFilename") ) { nmeFilename=inValue.Cast< ::String >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"decodedFrames") ) { decodedFrames=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"nmeConnection") ) { nmeConnection=inValue.Cast<  ::nme::net::NetConnection >(); return inValue; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"objectEncoding") ) { objectEncoding=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"soundTransform") ) { if (inCallProp != ::hx::paccNever) return ::hx::Val( set_soundTransform(inValue.Cast<  ::nme::media::SoundTransform >()) ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"nmeReceiveAudio") ) { nmeReceiveAudio=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"nmeReceiveVideo") ) { nmeReceiveVideo=inValue.Cast< bool >(); return inValue; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"nmeAttachedVideo") ) { nmeAttachedVideo=inValue.Cast<  ::nme::media::StageVideo >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void NetStream_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("bytesTotal",59,57,da,45));
	outFields->push(HX_("bytesLoaded",d0,66,ca,99));
	outFields->push(HX_("decodedFrames",bc,4b,b5,7c));
	outFields->push(HX_("client",4b,ca,4f,0a));
	outFields->push(HX_("objectEncoding",b2,1e,15,2a));
	outFields->push(HX_("peerStreams",71,7a,fb,b3));
	outFields->push(HX_("time",0d,cc,fc,4c));
	outFields->push(HX_("soundTransform",9d,ee,de,22));
	outFields->push(HX_("nmeConnection",04,8f,bb,ba));
	outFields->push(HX_("nmeReceiveAudio",59,c4,47,a7));
	outFields->push(HX_("nmeReceiveVideo",fe,5f,c3,b6));
	outFields->push(HX_("nmeVolume",c0,2d,15,fa));
	outFields->push(HX_("nmeSoundPan",34,71,da,6b));
	outFields->push(HX_("nmeFilename",2d,78,a1,c9));
	outFields->push(HX_("nmePaused",94,44,46,8a));
	outFields->push(HX_("nmeSeek",de,a3,c1,d1));
	outFields->push(HX_("nmeAttachedVideo",51,8f,7f,93));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo NetStream_obj_sMemberStorageInfo[] = {
	{::hx::fsInt,(int)offsetof(NetStream_obj,bytesTotal),HX_("bytesTotal",59,57,da,45)},
	{::hx::fsInt,(int)offsetof(NetStream_obj,bytesLoaded),HX_("bytesLoaded",d0,66,ca,99)},
	{::hx::fsInt,(int)offsetof(NetStream_obj,decodedFrames),HX_("decodedFrames",bc,4b,b5,7c)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(NetStream_obj,client),HX_("client",4b,ca,4f,0a)},
	{::hx::fsInt,(int)offsetof(NetStream_obj,objectEncoding),HX_("objectEncoding",b2,1e,15,2a)},
	{::hx::fsObject /* ::cpp::VirtualArray */ ,(int)offsetof(NetStream_obj,peerStreams),HX_("peerStreams",71,7a,fb,b3)},
	{::hx::fsFloat,(int)offsetof(NetStream_obj,time),HX_("time",0d,cc,fc,4c)},
	{::hx::fsObject /*  ::nme::net::NetConnection */ ,(int)offsetof(NetStream_obj,nmeConnection),HX_("nmeConnection",04,8f,bb,ba)},
	{::hx::fsBool,(int)offsetof(NetStream_obj,nmeReceiveAudio),HX_("nmeReceiveAudio",59,c4,47,a7)},
	{::hx::fsBool,(int)offsetof(NetStream_obj,nmeReceiveVideo),HX_("nmeReceiveVideo",fe,5f,c3,b6)},
	{::hx::fsFloat,(int)offsetof(NetStream_obj,nmeVolume),HX_("nmeVolume",c0,2d,15,fa)},
	{::hx::fsFloat,(int)offsetof(NetStream_obj,nmeSoundPan),HX_("nmeSoundPan",34,71,da,6b)},
	{::hx::fsString,(int)offsetof(NetStream_obj,nmeFilename),HX_("nmeFilename",2d,78,a1,c9)},
	{::hx::fsBool,(int)offsetof(NetStream_obj,nmePaused),HX_("nmePaused",94,44,46,8a)},
	{::hx::fsFloat,(int)offsetof(NetStream_obj,nmeSeek),HX_("nmeSeek",de,a3,c1,d1)},
	{::hx::fsObject /*  ::nme::media::StageVideo */ ,(int)offsetof(NetStream_obj,nmeAttachedVideo),HX_("nmeAttachedVideo",51,8f,7f,93)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo NetStream_obj_sStaticStorageInfo[] = {
	{::hx::fsString,(void *) &NetStream_obj::CONNECT_TO_FMS,HX_("CONNECT_TO_FMS",3d,b8,c3,53)},
	{::hx::fsString,(void *) &NetStream_obj::DIRECT_CONNECTIONS,HX_("DIRECT_CONNECTIONS",1f,c5,56,bd)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static ::String NetStream_obj_sMemberFields[] = {
	HX_("bytesTotal",59,57,da,45),
	HX_("bytesLoaded",d0,66,ca,99),
	HX_("decodedFrames",bc,4b,b5,7c),
	HX_("client",4b,ca,4f,0a),
	HX_("objectEncoding",b2,1e,15,2a),
	HX_("peerStreams",71,7a,fb,b3),
	HX_("time",0d,cc,fc,4c),
	HX_("nmeConnection",04,8f,bb,ba),
	HX_("nmeReceiveAudio",59,c4,47,a7),
	HX_("nmeReceiveVideo",fe,5f,c3,b6),
	HX_("nmeVolume",c0,2d,15,fa),
	HX_("nmeSoundPan",34,71,da,6b),
	HX_("nmeFilename",2d,78,a1,c9),
	HX_("nmePaused",94,44,46,8a),
	HX_("nmeSeek",de,a3,c1,d1),
	HX_("nmeAttachedVideo",51,8f,7f,93),
	HX_("attach",c5,fb,0f,e0),
	HX_("get_time",96,87,b7,cc),
	HX_("seek",78,85,50,4c),
	HX_("close",b8,17,63,48),
	HX_("dispose",9f,80,4c,bb),
	HX_("play",f4,2d,5a,4a),
	HX_("pause",f6,d6,57,bd),
	HX_("togglePause",c2,8e,1e,e5),
	HX_("resume",ad,69,84,08),
	HX_("receiveAudio",f3,cf,58,72),
	HX_("receiveVideo",98,6b,d4,81),
	HX_("onPeerConnect",89,f7,20,36),
	HX_("get_bytesTotal",a2,df,cf,bb),
	HX_("get_bytesLoaded",67,1e,ac,5a),
	HX_("get_decodedFrames",13,57,25,83),
	HX_("get_peerStreams",08,32,dd,74),
	HX_("get_soundTransform",66,cf,78,be),
	HX_("set_soundTransform",da,01,28,9b),
	::String(null()) };

static void NetStream_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(NetStream_obj::CONNECT_TO_FMS,"CONNECT_TO_FMS");
	HX_MARK_MEMBER_NAME(NetStream_obj::DIRECT_CONNECTIONS,"DIRECT_CONNECTIONS");
};

#ifdef HXCPP_VISIT_ALLOCS
static void NetStream_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(NetStream_obj::CONNECT_TO_FMS,"CONNECT_TO_FMS");
	HX_VISIT_MEMBER_NAME(NetStream_obj::DIRECT_CONNECTIONS,"DIRECT_CONNECTIONS");
};

#endif

::hx::Class NetStream_obj::__mClass;

static ::String NetStream_obj_sStaticFields[] = {
	HX_("CONNECT_TO_FMS",3d,b8,c3,53),
	HX_("DIRECT_CONNECTIONS",1f,c5,56,bd),
	::String(null())
};

void NetStream_obj::__register()
{
	NetStream_obj _hx_dummy;
	NetStream_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.net.NetStream",24,6e,07,a6);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = NetStream_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(NetStream_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(NetStream_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< NetStream_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = NetStream_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = NetStream_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = NetStream_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void NetStream_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_10_boot)
HXDLIN(  10)		CONNECT_TO_FMS = HX_("connectToFMS",47,1e,89,3f);
            	}
{
            	HX_STACKFRAME(&_hx_pos_83e184be3823e0ea_11_boot)
HXDLIN(  11)		DIRECT_CONNECTIONS = HX_("directConnections",ec,35,08,24);
            	}
}

} // end namespace nme
} // end namespace net