// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_text_TextField
#define INCLUDED_nme_text_TextField

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_nme_display_InteractiveObject
#include <nme/display/InteractiveObject.h>
#endif
HX_DECLARE_CLASS2(nme,display,DisplayObject)
HX_DECLARE_CLASS2(nme,display,IBitmapDrawable)
HX_DECLARE_CLASS2(nme,display,InteractiveObject)
HX_DECLARE_CLASS2(nme,events,EventDispatcher)
HX_DECLARE_CLASS2(nme,events,IEventDispatcher)
HX_DECLARE_CLASS2(nme,geom,Rectangle)
HX_DECLARE_CLASS2(nme,text,AntiAliasType)
HX_DECLARE_CLASS2(nme,text,GridFitType)
HX_DECLARE_CLASS2(nme,text,TextField)
HX_DECLARE_CLASS2(nme,text,TextFieldAutoSize)
HX_DECLARE_CLASS2(nme,text,TextFieldType)
HX_DECLARE_CLASS2(nme,text,TextFormat)
HX_DECLARE_CLASS2(nme,text,TextLineMetrics)

namespace nme{
namespace text{


class HXCPP_CLASS_ATTRIBUTES TextField_obj : public  ::nme::display::InteractiveObject_obj
{
	public:
		typedef  ::nme::display::InteractiveObject_obj super;
		typedef TextField_obj OBJ_;
		TextField_obj();

	public:
		enum { _hx_ClassId = 0x094681ea };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="nme.text.TextField")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"nme.text.TextField"); }
		static ::hx::ObjectPtr< TextField_obj > __new();
		static ::hx::ObjectPtr< TextField_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~TextField_obj();

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
		::String __ToString() const { return HX_("TextField",ad,04,54,3b); }

		static void __boot();
		static ::cpp::Function<  ::hx::Object *  () > nme_text_field_create;
		static Dynamic nme_text_field_create_dyn() { return nme_text_field_create;}
		static  ::Dynamic nme_text_field_get_text;
		static Dynamic nme_text_field_get_text_dyn() { return nme_text_field_get_text;}
		static  ::Dynamic nme_text_field_set_text;
		static Dynamic nme_text_field_set_text_dyn() { return nme_text_field_set_text;}
		static  ::Dynamic nme_text_field_get_html_text;
		static Dynamic nme_text_field_get_html_text_dyn() { return nme_text_field_get_html_text;}
		static  ::Dynamic nme_text_field_set_html_text;
		static Dynamic nme_text_field_set_html_text_dyn() { return nme_text_field_set_html_text;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_text_color;
		static Dynamic nme_text_field_get_text_color_dyn() { return nme_text_field_get_text_color;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_text_field_set_text_color;
		static Dynamic nme_text_field_set_text_color_dyn() { return nme_text_field_set_text_color;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_text_field_get_selectable;
		static Dynamic nme_text_field_get_selectable_dyn() { return nme_text_field_get_selectable;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_text_field_set_selectable;
		static Dynamic nme_text_field_set_selectable_dyn() { return nme_text_field_set_selectable;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_text_field_get_display_as_password;
		static Dynamic nme_text_field_get_display_as_password_dyn() { return nme_text_field_get_display_as_password;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_text_field_set_display_as_password;
		static Dynamic nme_text_field_set_display_as_password_dyn() { return nme_text_field_set_display_as_password;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *) > nme_text_field_get_def_text_format;
		static Dynamic nme_text_field_get_def_text_format_dyn() { return nme_text_field_get_def_text_format;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *) > nme_text_field_set_def_text_format;
		static Dynamic nme_text_field_set_def_text_format_dyn() { return nme_text_field_set_def_text_format;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_auto_size;
		static Dynamic nme_text_field_get_auto_size_dyn() { return nme_text_field_get_auto_size;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_text_field_set_auto_size;
		static Dynamic nme_text_field_set_auto_size_dyn() { return nme_text_field_set_auto_size;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_text_field_get_type;
		static Dynamic nme_text_field_get_type_dyn() { return nme_text_field_get_type;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_text_field_set_type;
		static Dynamic nme_text_field_set_type_dyn() { return nme_text_field_set_type;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_text_field_get_multiline;
		static Dynamic nme_text_field_get_multiline_dyn() { return nme_text_field_get_multiline;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_text_field_set_multiline;
		static Dynamic nme_text_field_set_multiline_dyn() { return nme_text_field_set_multiline;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_text_field_get_word_wrap;
		static Dynamic nme_text_field_get_word_wrap_dyn() { return nme_text_field_get_word_wrap;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_text_field_set_word_wrap;
		static Dynamic nme_text_field_set_word_wrap_dyn() { return nme_text_field_set_word_wrap;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_text_field_get_border;
		static Dynamic nme_text_field_get_border_dyn() { return nme_text_field_get_border;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_text_field_set_border;
		static Dynamic nme_text_field_set_border_dyn() { return nme_text_field_set_border;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_border_color;
		static Dynamic nme_text_field_get_border_color_dyn() { return nme_text_field_get_border_color;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_text_field_set_border_color;
		static Dynamic nme_text_field_set_border_color_dyn() { return nme_text_field_set_border_color;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_text_field_get_background;
		static Dynamic nme_text_field_get_background_dyn() { return nme_text_field_get_background;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_text_field_set_background;
		static Dynamic nme_text_field_set_background_dyn() { return nme_text_field_set_background;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_background_color;
		static Dynamic nme_text_field_get_background_color_dyn() { return nme_text_field_get_background_color;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_text_field_set_background_color;
		static Dynamic nme_text_field_set_background_color_dyn() { return nme_text_field_set_background_color;}
		static ::cpp::Function< Float  ( ::hx::Object *) > nme_text_field_get_text_width;
		static Dynamic nme_text_field_get_text_width_dyn() { return nme_text_field_get_text_width;}
		static ::cpp::Function< Float  ( ::hx::Object *) > nme_text_field_get_text_height;
		static Dynamic nme_text_field_get_text_height_dyn() { return nme_text_field_get_text_height;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *,int,int) > nme_text_field_get_text_format;
		static Dynamic nme_text_field_get_text_format_dyn() { return nme_text_field_get_text_format;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *,int,int) > nme_text_field_set_text_format;
		static Dynamic nme_text_field_set_text_format_dyn() { return nme_text_field_set_text_format;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_max_scroll_v;
		static Dynamic nme_text_field_get_max_scroll_v_dyn() { return nme_text_field_get_max_scroll_v;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_max_scroll_h;
		static Dynamic nme_text_field_get_max_scroll_h_dyn() { return nme_text_field_get_max_scroll_h;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_bottom_scroll_v;
		static Dynamic nme_text_field_get_bottom_scroll_v_dyn() { return nme_text_field_get_bottom_scroll_v;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_scroll_h;
		static Dynamic nme_text_field_get_scroll_h_dyn() { return nme_text_field_get_scroll_h;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_text_field_set_scroll_h;
		static Dynamic nme_text_field_set_scroll_h_dyn() { return nme_text_field_set_scroll_h;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_scroll_v;
		static Dynamic nme_text_field_get_scroll_v_dyn() { return nme_text_field_get_scroll_v;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_text_field_set_scroll_v;
		static Dynamic nme_text_field_set_scroll_v_dyn() { return nme_text_field_set_scroll_v;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_num_lines;
		static Dynamic nme_text_field_get_num_lines_dyn() { return nme_text_field_get_num_lines;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_max_chars;
		static Dynamic nme_text_field_get_max_chars_dyn() { return nme_text_field_get_max_chars;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_text_field_set_max_chars;
		static Dynamic nme_text_field_set_max_chars_dyn() { return nme_text_field_set_max_chars;}
		static  ::Dynamic nme_text_field_get_line_text;
		static Dynamic nme_text_field_get_line_text_dyn() { return nme_text_field_get_line_text;}
		static ::cpp::Function< void  ( ::hx::Object *,int, ::hx::Object *) > nme_text_field_get_line_metrics;
		static Dynamic nme_text_field_get_line_metrics_dyn() { return nme_text_field_get_line_metrics;}
		static ::cpp::Function< int  ( ::hx::Object *,int) > nme_text_field_get_line_offset;
		static Dynamic nme_text_field_get_line_offset_dyn() { return nme_text_field_get_line_offset;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_text_field_get_embed_fonts;
		static Dynamic nme_text_field_get_embed_fonts_dyn() { return nme_text_field_get_embed_fonts;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_text_field_set_embed_fonts;
		static Dynamic nme_text_field_set_embed_fonts_dyn() { return nme_text_field_set_embed_fonts;}
		static ::cpp::Function< void  ( ::hx::Object *,int, ::hx::Object *) > nme_text_field_get_char_boundaries;
		static Dynamic nme_text_field_get_char_boundaries_dyn() { return nme_text_field_get_char_boundaries;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_selection_begin_index;
		static Dynamic nme_text_field_get_selection_begin_index_dyn() { return nme_text_field_get_selection_begin_index;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_selection_end_index;
		static Dynamic nme_text_field_get_selection_end_index_dyn() { return nme_text_field_get_selection_end_index;}
		static ::cpp::Function< void  ( ::hx::Object *,int,int) > nme_text_field_set_selection;
		static Dynamic nme_text_field_set_selection_dyn() { return nme_text_field_set_selection;}
		static ::cpp::Function< int  ( ::hx::Object *) > nme_text_field_get_caret_index;
		static Dynamic nme_text_field_get_caret_index_dyn() { return nme_text_field_get_caret_index;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_text_field_set_caret_index;
		static Dynamic nme_text_field_set_caret_index_dyn() { return nme_text_field_set_caret_index;}
		static ::cpp::Function< void  ( ::hx::Object *,int, ::hx::Object *) > nme_text_field_get_line_positions;
		static Dynamic nme_text_field_get_line_positions_dyn() { return nme_text_field_get_line_positions;}
		static ::cpp::Function< int  ( ::hx::Object *,int) > nme_text_field_get_line_for_char;
		static Dynamic nme_text_field_get_line_for_char_dyn() { return nme_text_field_get_line_for_char;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *) > nme_text_field_replace_selected_text;
		static Dynamic nme_text_field_replace_selected_text_dyn() { return nme_text_field_replace_selected_text;}
		static ::cpp::Function< void  ( ::hx::Object *,int,int, ::hx::Object *) > nme_text_field_replace_text;
		static Dynamic nme_text_field_replace_text_dyn() { return nme_text_field_replace_text;}
		static ::cpp::Function< void  ( ::hx::Object *,int,int,int) > nme_text_field_send_key;
		static Dynamic nme_text_field_send_key_dyn() { return nme_text_field_send_key;}
		 ::nme::text::AntiAliasType antiAliasType;
		int bottomScrollV;
		 ::nme::text::GridFitType gridFitType;
		int maxScrollH;
		int maxScrollV;
		int selectionBeginIndex;
		int selectionEndIndex;
		int numLines;
		Float sharpness;
		Float textHeight;
		Float textWidth;
		void appendText(::String newText);
		::Dynamic appendText_dyn();

		int getLineOffset(int lineIndex);
		::Dynamic getLineOffset_dyn();

		int getLineIndexOfChar(int charIndex);
		::Dynamic getLineIndexOfChar_dyn();

		::Array< Float > getLinePositions(int startLine,int endLine);
		::Dynamic getLinePositions_dyn();

		::String getLineText(int lineIndex);
		::Dynamic getLineText_dyn();

		 ::nme::text::TextLineMetrics getLineMetrics(int lineIndex);
		::Dynamic getLineMetrics_dyn();

		 ::nme::text::TextFormat getTextFormat(::hx::Null< int >  beginIndex,::hx::Null< int >  endIndex);
		::Dynamic getTextFormat_dyn();

		 ::nme::geom::Rectangle getCharBoundaries(int charIndex);
		::Dynamic getCharBoundaries_dyn();

		void setSelection(int beginIndex,int endIndex);
		::Dynamic setSelection_dyn();

		void setTextFormat( ::nme::text::TextFormat format,::hx::Null< int >  beginIndex,::hx::Null< int >  endIndex);
		::Dynamic setTextFormat_dyn();

		void replaceSelectedText(::String inNewText);
		::Dynamic replaceSelectedText_dyn();

		void replaceText(int c0,int c1,::String inNewText);
		::Dynamic replaceText_dyn();

		void sendKey(int charCode,int keyId,bool shift,bool ctrl,bool alt);
		::Dynamic sendKey_dyn();

		void sendCopy();
		::Dynamic sendCopy_dyn();

		void sendPaste();
		::Dynamic sendPaste_dyn();

		 ::nme::text::TextFieldAutoSize get_autoSize();
		::Dynamic get_autoSize_dyn();

		 ::nme::text::TextFieldAutoSize set_autoSize( ::nme::text::TextFieldAutoSize inVal);
		::Dynamic set_autoSize_dyn();

		bool get_background();
		::Dynamic get_background_dyn();

		bool set_background(bool inVal);
		::Dynamic set_background_dyn();

		int get_backgroundColor();
		::Dynamic get_backgroundColor_dyn();

		int set_backgroundColor(int inVal);
		::Dynamic set_backgroundColor_dyn();

		bool get_border();
		::Dynamic get_border_dyn();

		bool set_border(bool inVal);
		::Dynamic set_border_dyn();

		int get_borderColor();
		::Dynamic get_borderColor_dyn();

		int set_borderColor(int inVal);
		::Dynamic set_borderColor_dyn();

		int get_bottomScrollV();
		::Dynamic get_bottomScrollV_dyn();

		 ::nme::text::TextFormat get_defaultTextFormat();
		::Dynamic get_defaultTextFormat_dyn();

		 ::nme::text::TextFormat set_defaultTextFormat( ::nme::text::TextFormat inFormat);
		::Dynamic set_defaultTextFormat_dyn();

		bool get_displayAsPassword();
		::Dynamic get_displayAsPassword_dyn();

		bool set_displayAsPassword(bool inVal);
		::Dynamic set_displayAsPassword_dyn();

		bool get_embedFonts();
		::Dynamic get_embedFonts_dyn();

		bool set_embedFonts(bool inVal);
		::Dynamic set_embedFonts_dyn();

		bool get_forceFreeType();
		::Dynamic get_forceFreeType_dyn();

		bool set_forceFreeType(bool inVal);
		::Dynamic set_forceFreeType_dyn();

		::String get_htmlText();
		::Dynamic get_htmlText_dyn();

		::String set_htmlText(::String inText);
		::Dynamic set_htmlText_dyn();

		int get_maxChars();
		::Dynamic get_maxChars_dyn();

		int set_maxChars(int inVal);
		::Dynamic set_maxChars_dyn();

		int get_maxScrollH();
		::Dynamic get_maxScrollH_dyn();

		int get_maxScrollV();
		::Dynamic get_maxScrollV_dyn();

		bool get_multiline();
		::Dynamic get_multiline_dyn();

		bool set_multiline(bool inVal);
		::Dynamic set_multiline_dyn();

		int get_numLines();
		::Dynamic get_numLines_dyn();

		int get_scrollH();
		::Dynamic get_scrollH_dyn();

		int set_scrollH(int inVal);
		::Dynamic set_scrollH_dyn();

		int get_scrollV();
		::Dynamic get_scrollV_dyn();

		int set_scrollV(int inVal);
		::Dynamic set_scrollV_dyn();

		bool get_selectable();
		::Dynamic get_selectable_dyn();

		bool set_selectable(bool inSel);
		::Dynamic set_selectable_dyn();

		int get_selectionBeginIndex();
		::Dynamic get_selectionBeginIndex_dyn();

		int get_selectionEndIndex();
		::Dynamic get_selectionEndIndex_dyn();

		::String get_text();
		::Dynamic get_text_dyn();

		::String set_text(::String inText);
		::Dynamic set_text_dyn();

		int get_textColor();
		::Dynamic get_textColor_dyn();

		int set_textColor(int inCol);
		::Dynamic set_textColor_dyn();

		Float get_textWidth();
		::Dynamic get_textWidth_dyn();

		Float get_textHeight();
		::Dynamic get_textHeight_dyn();

		 ::nme::text::TextFieldType get_type();
		::Dynamic get_type_dyn();

		 ::nme::text::TextFieldType set_type( ::nme::text::TextFieldType inType);
		::Dynamic set_type_dyn();

		bool get_wordWrap();
		::Dynamic get_wordWrap_dyn();

		bool set_wordWrap(bool inVal);
		::Dynamic set_wordWrap_dyn();

		int get_caretIndex();
		::Dynamic get_caretIndex_dyn();

		int set_caretIndex(int inVal);
		::Dynamic set_caretIndex_dyn();

};

} // end namespace nme
} // end namespace text

#endif /* INCLUDED_nme_text_TextField */ 