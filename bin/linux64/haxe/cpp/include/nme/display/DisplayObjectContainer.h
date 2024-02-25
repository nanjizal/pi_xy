// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_display_DisplayObjectContainer
#define INCLUDED_nme_display_DisplayObjectContainer

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_nme_display_InteractiveObject
#include <nme/display/InteractiveObject.h>
#endif
HX_DECLARE_CLASS2(nme,display,DisplayObject)
HX_DECLARE_CLASS2(nme,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(nme,display,IBitmapDrawable)
HX_DECLARE_CLASS2(nme,display,InteractiveObject)
HX_DECLARE_CLASS2(nme,events,Event)
HX_DECLARE_CLASS2(nme,events,EventDispatcher)
HX_DECLARE_CLASS2(nme,events,IEventDispatcher)
HX_DECLARE_CLASS2(nme,geom,Point)

namespace nme{
namespace display{


class HXCPP_CLASS_ATTRIBUTES DisplayObjectContainer_obj : public  ::nme::display::InteractiveObject_obj
{
	public:
		typedef  ::nme::display::InteractiveObject_obj super;
		typedef DisplayObjectContainer_obj OBJ_;
		DisplayObjectContainer_obj();

	public:
		enum { _hx_ClassId = 0x5e732244 };

		void __construct( ::Dynamic inHandle,::String inType);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="nme.display.DisplayObjectContainer")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"nme.display.DisplayObjectContainer"); }
		static ::hx::ObjectPtr< DisplayObjectContainer_obj > __new( ::Dynamic inHandle,::String inType);
		static ::hx::ObjectPtr< DisplayObjectContainer_obj > __alloc(::hx::Ctx *_hx_ctx, ::Dynamic inHandle,::String inType);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~DisplayObjectContainer_obj();

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
		::String __ToString() const { return HX_("DisplayObjectContainer",80,f2,98,ea); }

		static void __boot();
		static ::cpp::Function<  ::hx::Object *  () > nme_create_display_object_container;
		static Dynamic nme_create_display_object_container_dyn() { return nme_create_display_object_container;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *) > nme_doc_add_child;
		static Dynamic nme_doc_add_child_dyn() { return nme_doc_add_child;}
		static ::cpp::Function< void  ( ::hx::Object *,int) > nme_doc_remove_child;
		static Dynamic nme_doc_remove_child_dyn() { return nme_doc_remove_child;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *,int) > nme_doc_set_child_index;
		static Dynamic nme_doc_set_child_index_dyn() { return nme_doc_set_child_index;}
		static ::cpp::Function< bool  ( ::hx::Object *) > nme_doc_get_mouse_children;
		static Dynamic nme_doc_get_mouse_children_dyn() { return nme_doc_get_mouse_children;}
		static ::cpp::Function< void  ( ::hx::Object *,bool) > nme_doc_set_mouse_children;
		static Dynamic nme_doc_set_mouse_children_dyn() { return nme_doc_set_mouse_children;}
		static ::cpp::Function< void  ( ::hx::Object *, ::hx::Object *, ::hx::Object *) > nme_doc_swap_children;
		static Dynamic nme_doc_swap_children_dyn() { return nme_doc_swap_children;}
		int numChildren;
		::Array< ::Dynamic> nmeChildren;
		 ::nme::display::DisplayObject addChild( ::nme::display::DisplayObject child);
		::Dynamic addChild_dyn();

		 ::nme::display::DisplayObject addChildAt( ::nme::display::DisplayObject child,int index);
		::Dynamic addChildAt_dyn();

		bool areInaccessibleObjectsUnderPoint( ::nme::geom::Point point);
		::Dynamic areInaccessibleObjectsUnderPoint_dyn();

		bool contains( ::nme::display::DisplayObject child);
		::Dynamic contains_dyn();

		 ::nme::display::DisplayObject getChildAt(int index);
		::Dynamic getChildAt_dyn();

		 ::nme::display::DisplayObject getChildByName(::String name);
		::Dynamic getChildByName_dyn();

		int getChildIndex( ::nme::display::DisplayObject child);
		::Dynamic getChildIndex_dyn();

		::Array< ::Dynamic> getObjectsUnderPoint( ::nme::geom::Point point);
		::Dynamic getObjectsUnderPoint_dyn();

		void nmeAddChild( ::nme::display::DisplayObject child);
		::Dynamic nmeAddChild_dyn();

		void nmeBroadcast( ::nme::events::Event inEvt);

		 ::nme::display::DisplayObject nmeFindByID(int inID);

		int nmeGetChildIndex( ::nme::display::DisplayObject child);
		::Dynamic nmeGetChildIndex_dyn();

		void nmeGetObjectsUnderPoint( ::nme::geom::Point point,::Array< ::Dynamic> result);

		void nmeOnAdded( ::nme::display::DisplayObject inObj,bool inIsOnStage);

		void nmeOnRemoved( ::nme::display::DisplayObject inObj,bool inWasOnStage);

		void nmeRemoveChildFromArray( ::nme::display::DisplayObject child);
		::Dynamic nmeRemoveChildFromArray_dyn();

		void nmeSetChildIndex( ::nme::display::DisplayObject child,int index);
		::Dynamic nmeSetChildIndex_dyn();

		void nmeSwapChildrenAt(int index1,int index2);
		::Dynamic nmeSwapChildrenAt_dyn();

		 ::nme::display::DisplayObject removeChild( ::nme::display::DisplayObject child);
		::Dynamic removeChild_dyn();

		 ::nme::display::DisplayObject removeChildAt(int index);
		::Dynamic removeChildAt_dyn();

		void removeChildren(::hx::Null< int >  beginIndex,::hx::Null< int >  endIndex);
		::Dynamic removeChildren_dyn();

		void setChildIndex( ::nme::display::DisplayObject child,int index);
		::Dynamic setChildIndex_dyn();

		void swapChildren( ::nme::display::DisplayObject child1, ::nme::display::DisplayObject child2);
		::Dynamic swapChildren_dyn();

		void swapChildrenAt(int index1,int index2);
		::Dynamic swapChildrenAt_dyn();

		bool get_mouseChildren();
		::Dynamic get_mouseChildren_dyn();

		bool set_mouseChildren(bool inVal);
		::Dynamic set_mouseChildren_dyn();

		int get_numChildren();
		::Dynamic get_numChildren_dyn();

		bool get_tabChildren();
		::Dynamic get_tabChildren_dyn();

		bool set_tabChildren(bool inValue);
		::Dynamic set_tabChildren_dyn();

};

} // end namespace nme
} // end namespace display

#endif /* INCLUDED_nme_display_DisplayObjectContainer */ 
