// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_Sys
#include <Sys.h>
#endif
#ifndef INCLUDED_format_png_Chunk
#include <format/png/Chunk.h>
#endif
#ifndef INCLUDED_format_png_Color
#include <format/png/Color.h>
#endif
#ifndef INCLUDED_format_png_Reader
#include <format/png/Reader.h>
#endif
#ifndef INCLUDED_format_png_Tools
#include <format/png/Tools.h>
#endif
#ifndef INCLUDED_format_png_Writer
#include <format/png/Writer.h>
#endif
#ifndef INCLUDED_format_tools_Deflate
#include <format/tools/Deflate.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_haxe_ds_GenericCell_Int
#include <haxe/ds/GenericCell_Int.h>
#endif
#ifndef INCLUDED_haxe_ds_GenericStack_Int
#include <haxe/ds/GenericStack_Int.h>
#endif
#ifndef INCLUDED_haxe_ds_List
#include <haxe/ds/List.h>
#endif
#ifndef INCLUDED_haxe_io_ArrayBufferViewImpl
#include <haxe/io/ArrayBufferViewImpl.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_haxe_io_Input
#include <haxe/io/Input.h>
#endif
#ifndef INCLUDED_haxe_io_Output
#include <haxe/io/Output.h>
#endif
#ifndef INCLUDED_haxe_io_Path
#include <haxe/io/Path.h>
#endif
#ifndef INCLUDED_iterMagic_ArrIntImg
#include <iterMagic/ArrIntImg.h>
#endif
#ifndef INCLUDED_iterMagic_BytesImg
#include <iterMagic/BytesImg.h>
#endif
#ifndef INCLUDED_iterMagic_Iimg
#include <iterMagic/Iimg.h>
#endif
#ifndef INCLUDED_iterMagic_StackIntImg
#include <iterMagic/StackIntImg.h>
#endif
#ifndef INCLUDED_iterMagic_U32ArrImg
#include <iterMagic/U32ArrImg.h>
#endif
#ifndef INCLUDED_iterMagic_VecIntImg
#include <iterMagic/VecIntImg.h>
#endif
#ifndef INCLUDED_pi_xy_ByteAccessor
#include <pi_xy/ByteAccessor.h>
#endif
#ifndef INCLUDED_pi_xy_ImageStruct
#include <pi_xy/ImageStruct.h>
#endif
#ifndef INCLUDED_pi_xy__Endian_Endian_Fields_
#include <pi_xy/_Endian/Endian_Fields_.h>
#endif
#ifndef INCLUDED_pi_xy_formats__Format_Format_Fields_
#include <pi_xy/formats/_Format/Format_Fields_.h>
#endif
#ifndef INCLUDED_sys_io_File
#include <sys/io/File.h>
#endif
#ifndef INCLUDED_sys_io_FileInput
#include <sys/io/FileInput.h>
#endif
#ifndef INCLUDED_sys_io_FileOutput
#include <sys/io/FileOutput.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_a5d0b09965748d59_12_toPNG,"pi_xy.formats._Format.Format_Fields_","toPNG",0x722a9ccf,"pi_xy.formats._Format.Format_Fields_.toPNG","pi_xy/formats/Format.hx",12,0x37ce358c)
HX_LOCAL_STACK_FRAME(_hx_pos_a5d0b09965748d59_55_fromPNG,"pi_xy.formats._Format.Format_Fields_","fromPNG",0x227cf680,"pi_xy.formats._Format.Format_Fields_.fromPNG","pi_xy/formats/Format.hx",55,0x37ce358c)
HX_LOCAL_STACK_FRAME(_hx_pos_a5d0b09965748d59_76_get_dir,"pi_xy.formats._Format.Format_Fields_","get_dir",0xf13deb05,"pi_xy.formats._Format.Format_Fields_.get_dir","pi_xy/formats/Format.hx",76,0x37ce358c)
namespace pi_xy{
namespace formats{
namespace _Format{

void Format_Fields__obj::__construct() { }

Dynamic Format_Fields__obj::__CreateEmpty() { return new Format_Fields__obj; }

void *Format_Fields__obj::_hx_vtable = 0;

Dynamic Format_Fields__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Format_Fields__obj > _hx_result = new Format_Fields__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Format_Fields__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x27f2461f;
}

void Format_Fields__obj::toPNG( ::pi_xy::ImageStruct pixelImage,::String name,::hx::Null< int >  __o_level){
            		int level = __o_level.Default(9);
            	HX_GC_STACKFRAME(&_hx_pos_a5d0b09965748d59_12_toPNG)
HXLINE(  13)		if ((name.substr(-4,1) == HX_(".",2e,00,00,00))) {
HXLINE(  14)			name = name.substr(0,-4);
            		}
HXLINE(  16)		int lh = pixelImage->height;
HXLINE(  17)		int lw = pixelImage->width;
HXLINE(  18)		int w = 0;
HXLINE(  19)		int r = 0;
HXLINE(  20)		 ::haxe::io::Bytes rgba = ::haxe::io::Bytes_obj::alloc((((lw * lh) * 4) + lh));
HXLINE(  21)		int w1 = 0;
HXDLIN(  21)		int row = 0;
HXLINE(  22)		{
HXLINE(  22)			int _g = 0;
HXDLIN(  22)			int _g1 = lh;
HXDLIN(  22)			while((_g < _g1)){
HXLINE(  22)				_g = (_g + 1);
HXDLIN(  22)				int y = (_g - 1);
HXLINE(  23)				{
HXLINE(  23)					w1 = (w1 + 1);
HXDLIN(  23)					rgba->b[(w1 - 1)] = ( (unsigned char)(0) );
            				}
HXLINE(  24)				{
HXLINE(  24)					int _g2 = 0;
HXDLIN(  24)					int _g3 = lw;
HXDLIN(  24)					while((_g2 < _g3)){
HXLINE(  24)						_g2 = (_g2 + 1);
HXDLIN(  24)						int x = (_g2 - 1);
HXLINE(  26)						::Dynamic this1 = pixelImage->image;
HXDLIN(  26)						int index;
HXDLIN(  26)						if (pixelImage->useVirtualPos) {
HXLINE(  26)							index = ::Std_obj::_hx_int(((((( (Float)(y) ) - pixelImage->virtualY) * ( (Float)(pixelImage->width) )) + x) - pixelImage->virtualX));
            						}
            						else {
HXLINE(  26)							index = ::Std_obj::_hx_int(( (Float)(((y * pixelImage->width) + x)) ));
            						}
HXDLIN(  26)						int c = ::iterMagic::Iimg_obj::get(this1,index);
HXDLIN(  26)						int v;
HXDLIN(  26)						if (::pi_xy::_Endian::Endian_Fields__obj::isLittleEndian) {
HXLINE(  26)							v = ((((((c >> 24) & 255) << 24) | ((c & 255) << 16)) | (((c >> 8) & 255) << 8)) | ((c >> 16) & 255));
            						}
            						else {
HXLINE(  26)							v = c;
            						}
HXDLIN(  26)						int col = v;
HXLINE(  27)						int a = ((col >> 24) & 255);
HXLINE(  28)						int row1 = ((col >> 16) & 255);
HXLINE(  29)						int g = ((col >> 8) & 255);
HXLINE(  30)						int b = (col & 255);
HXLINE(  31)						{
HXLINE(  31)							w1 = (w1 + 1);
HXDLIN(  31)							rgba->b[(w1 - 1)] = ( (unsigned char)(r) );
            						}
HXLINE(  32)						{
HXLINE(  32)							w1 = (w1 + 1);
HXDLIN(  32)							rgba->b[(w1 - 1)] = ( (unsigned char)(g) );
            						}
HXLINE(  33)						{
HXLINE(  33)							w1 = (w1 + 1);
HXDLIN(  33)							rgba->b[(w1 - 1)] = ( (unsigned char)(b) );
            						}
HXLINE(  34)						{
HXLINE(  34)							w1 = (w1 + 1);
HXDLIN(  34)							rgba->b[(w1 - 1)] = ( (unsigned char)(a) );
            						}
HXLINE(  35)						row1 = (row1 + 4);
            					}
            				}
            			}
            		}
HXLINE(  38)		 ::haxe::ds::List l =  ::haxe::ds::List_obj::__alloc( HX_CTX );
HXLINE(  39)		l->add(::format::png::Chunk_obj::CHeader( ::Dynamic(::hx::Anon_obj::Create(5)
            			->setFixed(0,HX_("width",06,b6,62,ca),pixelImage->width)
            			->setFixed(1,HX_("interlaced",91,cb,78,d9),false)
            			->setFixed(2,HX_("colbits",46,9b,c7,e6),8)
            			->setFixed(3,HX_("height",e7,07,4c,02),pixelImage->height)
            			->setFixed(4,HX_("color",63,71,5c,4a),::format::png::Color_obj::ColTrue(true)))));
HXLINE(  42)		l->add(::format::png::Chunk_obj::CData(::format::tools::Deflate_obj::run(rgba,level)));
HXLINE(  43)		l->add(::format::png::Chunk_obj::CEnd_dyn());
HXLINE(  44)		::haxe::Log_obj::trace(HX_("create writer",57,5f,86,cb),::hx::SourceInfo(HX_("src/pi_xy/formats/Format.hx",21,8e,05,9f),44,HX_("pi_xy.formats._Format.Format_Fields_",8f,bc,76,ff),HX_("toPNG",ee,f1,16,14)));
HXLINE(  45)		::String dir = ::haxe::io::Path_obj::directory(::Sys_obj::programPath());
HXLINE(  47)		 ::format::png::Writer writer =  ::format::png::Writer_obj::__alloc( HX_CTX ,::sys::io::File_obj::write(::haxe::io::Path_obj::join(::Array_obj< ::String >::__new(2)->init(0,dir)->init(1,(name + HX_(".png",3b,2d,bd,1e)))),true));
HXLINE(  50)		writer->write(l);
HXLINE(  51)		::haxe::Log_obj::trace(HX_("written",d7,5c,41,ab),::hx::SourceInfo(HX_("src/pi_xy/formats/Format.hx",21,8e,05,9f),51,HX_("pi_xy.formats._Format.Format_Fields_",8f,bc,76,ff),HX_("toPNG",ee,f1,16,14)));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Format_Fields__obj,toPNG,(void))

 ::pi_xy::ImageStruct Format_Fields__obj::fromPNG(::String name,::hx::Null< bool >  __o_transparent){
            		bool transparent = __o_transparent.Default(true);
            	HX_GC_STACKFRAME(&_hx_pos_a5d0b09965748d59_55_fromPNG)
HXLINE(  56)		if ((name.substr(-4,1) == HX_(".",2e,00,00,00))) {
HXLINE(  57)			name = name.substr(0,-4);
            		}
HXLINE(  59)		 ::format::png::Reader reader =  ::format::png::Reader_obj::__alloc( HX_CTX ,::sys::io::File_obj::read(::haxe::io::Path_obj::join(::Array_obj< ::String >::__new(2)->init(0,::haxe::io::Path_obj::directory(::Sys_obj::programPath()))->init(1,(name + HX_(".png",3b,2d,bd,1e)))),true));
HXLINE(  64)		 ::haxe::ds::List data = reader->read();
HXLINE(  65)		 ::Dynamic header = ::format::png::Tools_obj::getHeader(data);
HXLINE(  66)		 ::haxe::io::Bytes bytes = ::format::png::Tools_obj::extract32(data,null(),null());
HXLINE(  67)		 ::haxe::io::Bytes bytesCameleon = bytes;
HXLINE(  68)		int width = ( (int)(header->__Field(HX_("width",06,b6,62,ca),::hx::paccDynamic)) );
HXDLIN(  68)		int height = ( (int)(header->__Field(HX_("height",e7,07,4c,02),::hx::paccDynamic)) );
HXDLIN(  68)		 ::Dynamic imageType = null();
HXDLIN(  68)		 ::pi_xy::ImageStruct this1 =  ::pi_xy::ImageStruct_obj::__alloc( HX_CTX );
HXDLIN(  68)		if (::hx::IsNull( imageType )) {
HXLINE(  68)			imageType = ::pi_xy::ImageStruct_obj::defaultType;
            		}
HXDLIN(  68)		::Dynamic _hx_tmp;
HXDLIN(  68)		switch((int)(( (int)(imageType) ))){
            			case (int)0: {
HXLINE(  68)				 ::iterMagic::BytesImg byt =  ::iterMagic::BytesImg_obj::__alloc( HX_CTX );
HXDLIN(  68)				 ::iterMagic::BytesImg b = byt;
HXDLIN(  68)				{
HXLINE(  68)					b->width = width;
HXDLIN(  68)					b->height = height;
HXDLIN(  68)					b->length = ::Std_obj::_hx_int(( (Float)((width * height)) ));
HXDLIN(  68)					b->data = ::haxe::io::Bytes_obj::alloc((b->length * 4));
HXDLIN(  68)					{
HXLINE(  68)						int len = b->length;
HXDLIN(  68)						int w = 0;
HXDLIN(  68)						{
HXLINE(  68)							int _g = 0;
HXDLIN(  68)							int _g1 = b->height;
HXDLIN(  68)							while((_g < _g1)){
HXLINE(  68)								_g = (_g + 1);
HXDLIN(  68)								int y = (_g - 1);
HXDLIN(  68)								{
HXLINE(  68)									int _g2 = 0;
HXDLIN(  68)									int _g3 = b->width;
HXDLIN(  68)									while((_g2 < _g3)){
HXLINE(  68)										_g2 = (_g2 + 1);
HXDLIN(  68)										int x = (_g2 - 1);
HXDLIN(  68)										{
HXLINE(  68)											w = (w + 1);
HXDLIN(  68)											b->data->b[(w - 1)] = ( (unsigned char)(0) );
            										}
HXDLIN(  68)										{
HXLINE(  68)											w = (w + 1);
HXDLIN(  68)											b->data->b[(w - 1)] = ( (unsigned char)(0) );
            										}
HXDLIN(  68)										{
HXLINE(  68)											w = (w + 1);
HXDLIN(  68)											b->data->b[(w - 1)] = ( (unsigned char)(0) );
            										}
HXDLIN(  68)										{
HXLINE(  68)											w = (w + 1);
HXDLIN(  68)											b->data->b[(w - 1)] = ( (unsigned char)(0) );
            										}
            									}
            								}
            							}
            						}
            					}
            				}
HXDLIN(  68)				_hx_tmp = b;
            			}
            			break;
            			case (int)1: {
HXLINE(  68)				 ::iterMagic::ArrIntImg arrI =  ::iterMagic::ArrIntImg_obj::__alloc( HX_CTX );
HXDLIN(  68)				 ::iterMagic::ArrIntImg a = arrI;
HXDLIN(  68)				{
HXLINE(  68)					a->width = width;
HXDLIN(  68)					a->height = height;
HXDLIN(  68)					a->data = ::Array_obj< int >::__new(0);
HXDLIN(  68)					a->length = ::Std_obj::_hx_int(( (Float)((width * height)) ));
HXDLIN(  68)					{
HXLINE(  68)						int _g4 = 0;
HXDLIN(  68)						int _g5 = a->length;
HXDLIN(  68)						while((_g4 < _g5)){
HXLINE(  68)							_g4 = (_g4 + 1);
HXDLIN(  68)							int i = (_g4 - 1);
HXDLIN(  68)							a->data[i] = 0;
            						}
            					}
            				}
HXDLIN(  68)				_hx_tmp = a;
            			}
            			break;
            			case (int)2: {
HXLINE(  68)				 ::iterMagic::U32ArrImg u32a =  ::iterMagic::U32ArrImg_obj::__alloc( HX_CTX );
HXDLIN(  68)				 ::iterMagic::U32ArrImg b1 = u32a;
HXDLIN(  68)				{
HXLINE(  68)					b1->width = width;
HXDLIN(  68)					b1->height = height;
HXDLIN(  68)					b1->length = ::Std_obj::_hx_int(( (Float)((width * height)) ));
HXDLIN(  68)					int size = (b1->length * 4);
HXDLIN(  68)					b1->data =  ::haxe::io::ArrayBufferViewImpl_obj::__alloc( HX_CTX ,::haxe::io::Bytes_obj::alloc(size),0,size);
HXDLIN(  68)					{
HXLINE(  68)						int _g6 = 0;
HXDLIN(  68)						int _g7 = b1->length;
HXDLIN(  68)						while((_g6 < _g7)){
HXLINE(  68)							_g6 = (_g6 + 1);
HXDLIN(  68)							int i1 = (_g6 - 1);
HXDLIN(  68)							{
HXLINE(  68)								 ::haxe::io::ArrayBufferViewImpl this2 = b1->data;
HXDLIN(  68)								bool _hx_tmp1;
HXDLIN(  68)								if ((i1 >= 0)) {
HXLINE(  68)									_hx_tmp1 = (i1 < (this2->byteLength >> 2));
            								}
            								else {
HXLINE(  68)									_hx_tmp1 = false;
            								}
HXDLIN(  68)								if (_hx_tmp1) {
HXLINE(  68)									 ::haxe::io::Bytes _this = this2->bytes;
HXDLIN(  68)									int pos = ((i1 << 2) + this2->byteOffset);
HXDLIN(  68)									_this->b[pos] = ( (unsigned char)(0) );
HXDLIN(  68)									_this->b[(pos + 1)] = ( (unsigned char)(0) );
HXDLIN(  68)									_this->b[(pos + 2)] = ( (unsigned char)(0) );
HXDLIN(  68)									_this->b[(pos + 3)] = ( (unsigned char)(0) );
            								}
            							}
            						}
            					}
            				}
HXDLIN(  68)				_hx_tmp = b1;
            			}
            			break;
            			case (int)3: {
HXLINE(  68)				 ::iterMagic::VecIntImg vec =  ::iterMagic::VecIntImg_obj::__alloc( HX_CTX );
HXDLIN(  68)				 ::iterMagic::VecIntImg v = vec;
HXDLIN(  68)				{
HXLINE(  68)					v->width = width;
HXDLIN(  68)					v->height = height;
HXDLIN(  68)					v->length = ::Std_obj::_hx_int(( (Float)((width * height)) ));
HXDLIN(  68)					v->data = ::Array_obj< int >::__new(v->length);
HXDLIN(  68)					{
HXLINE(  68)						int _g8 = 0;
HXDLIN(  68)						int _g9 = v->length;
HXDLIN(  68)						while((_g8 < _g9)){
HXLINE(  68)							_g8 = (_g8 + 1);
HXDLIN(  68)							int i2 = (_g8 - 1);
HXDLIN(  68)							v->data->__unsafe_set(i2,0);
            						}
            					}
            				}
HXDLIN(  68)				_hx_tmp = v;
            			}
            			break;
            			case (int)4: {
HXLINE(  68)				 ::iterMagic::StackIntImg sInt =  ::iterMagic::StackIntImg_obj::__alloc( HX_CTX );
HXDLIN(  68)				 ::iterMagic::StackIntImg b2 = sInt;
HXDLIN(  68)				{
HXLINE(  68)					b2->width = width;
HXDLIN(  68)					b2->height = height;
HXDLIN(  68)					b2->length = ::Std_obj::_hx_int(( (Float)((width * height)) ));
HXDLIN(  68)					b2->data =  ::haxe::ds::GenericStack_Int_obj::__alloc( HX_CTX );
HXDLIN(  68)					{
HXLINE(  68)						int len1 = b2->length;
HXDLIN(  68)						 ::haxe::ds::GenericStack_Int d = b2->data;
HXDLIN(  68)						if (::hx::IsNull( d->head )) {
HXLINE(  68)							int _g10 = 0;
HXDLIN(  68)							int _g11 = len1;
HXDLIN(  68)							while((_g10 < _g11)){
HXLINE(  68)								_g10 = (_g10 + 1);
HXDLIN(  68)								int i3 = (_g10 - 1);
HXDLIN(  68)								d->head =  ::haxe::ds::GenericCell_Int_obj::__alloc( HX_CTX ,0,d->head);
            							}
            						}
            						else {
HXLINE(  68)							int _g12 = 0;
HXDLIN(  68)							int _g13 = len1;
HXDLIN(  68)							while((_g12 < _g13)){
HXLINE(  68)								_g12 = (_g12 + 1);
HXDLIN(  68)								int i4 = (_g12 - 1);
HXDLIN(  68)								{
HXLINE(  68)									 ::haxe::ds::GenericCell_Int l = b2->data->head;
HXDLIN(  68)									 ::haxe::ds::GenericCell_Int prev = null();
HXDLIN(  68)									{
HXLINE(  68)										int _g14 = 0;
HXDLIN(  68)										int _g15 = i4;
HXDLIN(  68)										while((_g14 < _g15)){
HXLINE(  68)											_g14 = (_g14 + 1);
HXDLIN(  68)											int i5 = (_g14 - 1);
HXDLIN(  68)											prev = l;
HXDLIN(  68)											l = l->next;
            										}
            									}
HXDLIN(  68)									if (::hx::IsNull( prev )) {
HXLINE(  68)										b2->data->head =  ::haxe::ds::GenericCell_Int_obj::__alloc( HX_CTX ,0,l->next);
HXDLIN(  68)										l = null();
            									}
            									else {
HXLINE(  68)										prev->next =  ::haxe::ds::GenericCell_Int_obj::__alloc( HX_CTX ,0,l->next);
HXDLIN(  68)										l = null();
            									}
            								}
            							}
            						}
            					}
            				}
HXDLIN(  68)				_hx_tmp = b2;
            			}
            			break;
            		}
HXDLIN(  68)		this1->image = _hx_tmp;
HXDLIN(  68)		this1->width = width;
HXDLIN(  68)		this1->height = height;
HXDLIN(  68)		this1->imageType = ( (int)(imageType) );
HXDLIN(  68)		 ::pi_xy::ImageStruct pixelImage = this1;
HXLINE(  69)		pixelImage->transparent = true;
HXLINE(  71)		{
HXLINE(  71)			int p = 0;
HXDLIN(  71)			int a1;
HXDLIN(  71)			int r;
HXDLIN(  71)			int g;
HXDLIN(  71)			int b3;
HXDLIN(  71)			{
HXLINE(  71)				int _g16 = 0;
HXDLIN(  71)				int _g17 = (bytesCameleon->length >> 2);
HXDLIN(  71)				while((_g16 < _g17)){
HXLINE(  71)					_g16 = (_g16 + 1);
HXDLIN(  71)					int i6 = (_g16 - 1);
HXDLIN(  71)					int b4 = ( (int)(bytesCameleon->b->__get(p)) );
HXDLIN(  71)					int g1 = ( (int)(bytesCameleon->b->__get((p + 1))) );
HXDLIN(  71)					int r1 = ( (int)(bytesCameleon->b->__get((p + 2))) );
HXDLIN(  71)					int a2 = ( (int)(bytesCameleon->b->__get((p + 3))) );
HXDLIN(  71)					{
HXLINE(  71)						p = (p + 1);
HXDLIN(  71)						bytesCameleon->b[(p - 1)] = ( (unsigned char)(r1) );
            					}
HXDLIN(  71)					{
HXLINE(  71)						p = (p + 1);
HXDLIN(  71)						bytesCameleon->b[(p - 1)] = ( (unsigned char)(g1) );
            					}
HXDLIN(  71)					{
HXLINE(  71)						p = (p + 1);
HXDLIN(  71)						bytesCameleon->b[(p - 1)] = ( (unsigned char)(b4) );
            					}
HXDLIN(  71)					{
HXLINE(  71)						p = (p + 1);
HXDLIN(  71)						bytesCameleon->b[(p - 1)] = ( (unsigned char)(a2) );
            					}
            				}
            			}
            		}
HXLINE(  72)		{
HXLINE(  72)			int width1 = pixelImage->width;
HXDLIN(  72)			int height1 = pixelImage->height;
HXDLIN(  72)			 ::iterMagic::BytesImg byt1 =  ::iterMagic::BytesImg_obj::__alloc( HX_CTX );
HXDLIN(  72)			 ::iterMagic::BytesImg b5 = byt1;
HXDLIN(  72)			{
HXLINE(  72)				b5->width = width1;
HXDLIN(  72)				b5->height = height1;
HXDLIN(  72)				b5->length = ::Std_obj::_hx_int(( (Float)((width1 * height1)) ));
HXDLIN(  72)				b5->data = ::haxe::io::Bytes_obj::alloc((b5->length * 4));
HXDLIN(  72)				{
HXLINE(  72)					int len2 = b5->length;
HXDLIN(  72)					int w1 = 0;
HXDLIN(  72)					{
HXLINE(  72)						int _g18 = 0;
HXDLIN(  72)						int _g19 = b5->height;
HXDLIN(  72)						while((_g18 < _g19)){
HXLINE(  72)							_g18 = (_g18 + 1);
HXDLIN(  72)							int y1 = (_g18 - 1);
HXDLIN(  72)							{
HXLINE(  72)								int _g20 = 0;
HXDLIN(  72)								int _g21 = b5->width;
HXDLIN(  72)								while((_g20 < _g21)){
HXLINE(  72)									_g20 = (_g20 + 1);
HXDLIN(  72)									int x1 = (_g20 - 1);
HXDLIN(  72)									{
HXLINE(  72)										w1 = (w1 + 1);
HXDLIN(  72)										b5->data->b[(w1 - 1)] = ( (unsigned char)(0) );
            									}
HXDLIN(  72)									{
HXLINE(  72)										w1 = (w1 + 1);
HXDLIN(  72)										b5->data->b[(w1 - 1)] = ( (unsigned char)(0) );
            									}
HXDLIN(  72)									{
HXLINE(  72)										w1 = (w1 + 1);
HXDLIN(  72)										b5->data->b[(w1 - 1)] = ( (unsigned char)(0) );
            									}
HXDLIN(  72)									{
HXLINE(  72)										w1 = (w1 + 1);
HXDLIN(  72)										b5->data->b[(w1 - 1)] = ( (unsigned char)(0) );
            									}
            								}
            							}
            						}
            					}
            				}
            			}
HXDLIN(  72)			 ::iterMagic::BytesImg imageBytes = b5;
HXDLIN(  72)			::Dynamic accessorBytes = imageBytes;
HXDLIN(  72)			accessorBytes->__SetField(HX_("data",2a,56,63,42),bytesCameleon,::hx::paccDynamic);
HXDLIN(  72)			{
HXLINE(  72)				int _g22 = 0;
HXDLIN(  72)				int _g23 = imageBytes->length;
HXDLIN(  72)				while((_g22 < _g23)){
HXLINE(  72)					_g22 = (_g22 + 1);
HXDLIN(  72)					int i7 = (_g22 - 1);
HXDLIN(  72)					::haxe::Log_obj::trace(i7,::hx::SourceInfo(HX_("src/pi_xy/Pixelimage.hx",36,00,3a,6f),488,HX_("pi_xy._Pixelimage.Pixelimage_Impl_",f6,5e,97,e3),HX_("fromBytes",a1,f2,20,72)));
HXDLIN(  72)					{
HXLINE(  72)						::Dynamic this3 = pixelImage->image;
HXDLIN(  72)						 ::haxe::io::Bytes _this1 = imageBytes->data;
HXDLIN(  72)						int pos1 = ::Std_obj::_hx_int(( (Float)((i7 * 4)) ));
HXDLIN(  72)						::iterMagic::Iimg_obj::set(this3,i7,(((( (int)(_this1->b->__get(pos1)) ) | (( (int)(_this1->b->__get((pos1 + 1))) ) << 8)) | (( (int)(_this1->b->__get((pos1 + 2))) ) << 16)) | (( (int)(_this1->b->__get((pos1 + 3))) ) << 24)));
            					}
            				}
            			}
            		}
HXLINE(  73)		return pixelImage;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Format_Fields__obj,fromPNG,return )

::String Format_Fields__obj::get_dir(){
            	HX_STACKFRAME(&_hx_pos_a5d0b09965748d59_76_get_dir)
HXLINE(  80)		::String dir = ::haxe::io::Path_obj::directory(::Sys_obj::executablePath());
HXLINE(  82)		return dir;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Format_Fields__obj,get_dir,return )


Format_Fields__obj::Format_Fields__obj()
{
}

bool Format_Fields__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"toPNG") ) { outValue = toPNG_dyn(); return true; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"fromPNG") ) { outValue = fromPNG_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"get_dir") ) { outValue = get_dir_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *Format_Fields__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *Format_Fields__obj_sStaticStorageInfo = 0;
#endif

::hx::Class Format_Fields__obj::__mClass;

static ::String Format_Fields__obj_sStaticFields[] = {
	HX_("toPNG",ee,f1,16,14),
	HX_("fromPNG",5f,11,00,58),
	HX_("get_dir",e4,05,c1,26),
	::String(null())
};

void Format_Fields__obj::__register()
{
	Format_Fields__obj _hx_dummy;
	Format_Fields__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("pi_xy.formats._Format.Format_Fields_",8f,bc,76,ff);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Format_Fields__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(Format_Fields__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< Format_Fields__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Format_Fields__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Format_Fields__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace pi_xy
} // end namespace formats
} // end namespace _Format
