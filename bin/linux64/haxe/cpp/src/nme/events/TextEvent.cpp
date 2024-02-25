// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_nme_events_Event
#include <nme/events/Event.h>
#endif
#ifndef INCLUDED_nme_events_TextEvent
#include <nme/events/TextEvent.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_0ab0578dc5885a06_13_new,"nme.events.TextEvent","new",0xc3d81192,"nme.events.TextEvent.new","nme/events/TextEvent.hx",13,0xcadee83e)
HX_LOCAL_STACK_FRAME(_hx_pos_0ab0578dc5885a06_21_clone,"nme.events.TextEvent","clone",0x265f850f,"nme.events.TextEvent.clone","nme/events/TextEvent.hx",21,0xcadee83e)
HX_LOCAL_STACK_FRAME(_hx_pos_0ab0578dc5885a06_26_toString,"nme.events.TextEvent","toString",0x66b6fa3a,"nme.events.TextEvent.toString","nme/events/TextEvent.hx",26,0xcadee83e)
HX_LOCAL_STACK_FRAME(_hx_pos_0ab0578dc5885a06_7_boot,"nme.events.TextEvent","boot",0x91504ec0,"nme.events.TextEvent.boot","nme/events/TextEvent.hx",7,0xcadee83e)
HX_LOCAL_STACK_FRAME(_hx_pos_0ab0578dc5885a06_8_boot,"nme.events.TextEvent","boot",0x91504ec0,"nme.events.TextEvent.boot","nme/events/TextEvent.hx",8,0xcadee83e)
namespace nme{
namespace events{

void TextEvent_obj::__construct(::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::String __o_text){
            		bool bubbles = __o_bubbles.Default(false);
            		bool cancelable = __o_cancelable.Default(false);
            		::String text = __o_text;
            		if (::hx::IsNull(__o_text)) text = HX_("",00,00,00,00);
            	HX_STACKFRAME(&_hx_pos_0ab0578dc5885a06_13_new)
HXLINE(  14)		super::__construct(type,bubbles,cancelable);
HXLINE(  16)		this->text = text;
            	}

Dynamic TextEvent_obj::__CreateEmpty() { return new TextEvent_obj; }

void *TextEvent_obj::_hx_vtable = 0;

Dynamic TextEvent_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< TextEvent_obj > _hx_result = new TextEvent_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool TextEvent_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x113d0d1f) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x113d0d1f;
	} else {
		return inClassId==(int)0x4d3203b2;
	}
}

 ::nme::events::Event TextEvent_obj::clone(){
            	HX_GC_STACKFRAME(&_hx_pos_0ab0578dc5885a06_21_clone)
HXDLIN(  21)		::String _hx_tmp = this->get_type();
HXDLIN(  21)		bool _hx_tmp1 = this->get_bubbles();
HXDLIN(  21)		bool _hx_tmp2 = this->get_cancelable();
HXDLIN(  21)		return  ::nme::events::TextEvent_obj::__alloc( HX_CTX ,_hx_tmp,_hx_tmp1,_hx_tmp2,this->text);
            	}


::String TextEvent_obj::toString(){
            	HX_STACKFRAME(&_hx_pos_0ab0578dc5885a06_26_toString)
HXDLIN(  26)		::String _hx_tmp = ((HX_("[TextEvent type=",f5,d9,2b,e5) + this->get_type()) + HX_(" bubbles=",16,5f,ba,28));
HXDLIN(  26)		::String _hx_tmp1 = ((_hx_tmp + ::Std_obj::string(this->get_bubbles())) + HX_(" cancelable=",89,25,e0,5d));
HXDLIN(  26)		::String _hx_tmp2 = ((_hx_tmp1 + ::Std_obj::string(this->get_cancelable())) + HX_(" text=",d0,d6,04,d9));
HXDLIN(  26)		return ((_hx_tmp2 + this->text) + HX_("]",5d,00,00,00));
            	}


::String TextEvent_obj::LINK;

::String TextEvent_obj::TEXT_INPUT;


::hx::ObjectPtr< TextEvent_obj > TextEvent_obj::__new(::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::String __o_text) {
	::hx::ObjectPtr< TextEvent_obj > __this = new TextEvent_obj();
	__this->__construct(type,__o_bubbles,__o_cancelable,__o_text);
	return __this;
}

::hx::ObjectPtr< TextEvent_obj > TextEvent_obj::__alloc(::hx::Ctx *_hx_ctx,::String type,::hx::Null< bool >  __o_bubbles,::hx::Null< bool >  __o_cancelable,::String __o_text) {
	TextEvent_obj *__this = (TextEvent_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(TextEvent_obj), true, "nme.events.TextEvent"));
	*(void **)__this = TextEvent_obj::_hx_vtable;
	__this->__construct(type,__o_bubbles,__o_cancelable,__o_text);
	return __this;
}

TextEvent_obj::TextEvent_obj()
{
}

void TextEvent_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(TextEvent);
	HX_MARK_MEMBER_NAME(text,"text");
	 ::nme::events::Event_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void TextEvent_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(text,"text");
	 ::nme::events::Event_obj::__Visit(HX_VISIT_ARG);
}

::hx::Val TextEvent_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"text") ) { return ::hx::Val( text ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return ::hx::Val( clone_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"toString") ) { return ::hx::Val( toString_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val TextEvent_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"text") ) { text=inValue.Cast< ::String >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void TextEvent_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("text",ad,cc,f9,4c));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo TextEvent_obj_sMemberStorageInfo[] = {
	{::hx::fsString,(int)offsetof(TextEvent_obj,text),HX_("text",ad,cc,f9,4c)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo TextEvent_obj_sStaticStorageInfo[] = {
	{::hx::fsString,(void *) &TextEvent_obj::LINK,HX_("LINK",fa,df,73,32)},
	{::hx::fsString,(void *) &TextEvent_obj::TEXT_INPUT,HX_("TEXT_INPUT",98,17,d6,79)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static ::String TextEvent_obj_sMemberFields[] = {
	HX_("text",ad,cc,f9,4c),
	HX_("clone",5d,13,63,48),
	HX_("toString",ac,d0,6e,38),
	::String(null()) };

static void TextEvent_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(TextEvent_obj::LINK,"LINK");
	HX_MARK_MEMBER_NAME(TextEvent_obj::TEXT_INPUT,"TEXT_INPUT");
};

#ifdef HXCPP_VISIT_ALLOCS
static void TextEvent_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(TextEvent_obj::LINK,"LINK");
	HX_VISIT_MEMBER_NAME(TextEvent_obj::TEXT_INPUT,"TEXT_INPUT");
};

#endif

::hx::Class TextEvent_obj::__mClass;

static ::String TextEvent_obj_sStaticFields[] = {
	HX_("LINK",fa,df,73,32),
	HX_("TEXT_INPUT",98,17,d6,79),
	::String(null())
};

void TextEvent_obj::__register()
{
	TextEvent_obj _hx_dummy;
	TextEvent_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("nme.events.TextEvent",a0,a0,af,e4);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = TextEvent_obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(TextEvent_obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(TextEvent_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< TextEvent_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = TextEvent_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = TextEvent_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = TextEvent_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void TextEvent_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_0ab0578dc5885a06_7_boot)
HXDLIN(   7)		LINK = HX_("link",fa,17,b3,47);
            	}
{
            	HX_STACKFRAME(&_hx_pos_0ab0578dc5885a06_8_boot)
HXDLIN(   8)		TEXT_INPUT = HX_("textInput",1d,54,0b,57);
            	}
}

} // end namespace nme
} // end namespace events