// Generated by Haxe 4.3.3
#ifndef INCLUDED_nme_utils_IMemoryRange
#define INCLUDED_nme_utils_IMemoryRange

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS2(nme,utils,ByteArray)
HX_DECLARE_CLASS2(nme,utils,IDataInput)
HX_DECLARE_CLASS2(nme,utils,IDataOutput)
HX_DECLARE_CLASS2(nme,utils,IMemoryRange)

namespace nme{
namespace utils{


class HXCPP_CLASS_ATTRIBUTES IMemoryRange_obj {
	public:
		typedef ::hx::Object super;
		HX_DO_INTERFACE_RTTI;

		 ::nme::utils::ByteArray (::hx::Object :: *_hx_getByteBuffer)(); 
		static inline  ::nme::utils::ByteArray getByteBuffer( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( ::hx::interface_cast< ::nme::utils::IMemoryRange_obj *>(_hx_.mPtr->_hx_getInterface(0x915e561e)))->_hx_getByteBuffer)();
		}
		int (::hx::Object :: *_hx_getStart)(); 
		static inline int getStart( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( ::hx::interface_cast< ::nme::utils::IMemoryRange_obj *>(_hx_.mPtr->_hx_getInterface(0x915e561e)))->_hx_getStart)();
		}
		int (::hx::Object :: *_hx_getLength)(); 
		static inline int getLength( ::Dynamic _hx_) {
			return (_hx_.mPtr->*( ::hx::interface_cast< ::nme::utils::IMemoryRange_obj *>(_hx_.mPtr->_hx_getInterface(0x915e561e)))->_hx_getLength)();
		}
};

} // end namespace nme
} // end namespace utils

#endif /* INCLUDED_nme_utils_IMemoryRange */ 