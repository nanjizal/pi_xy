// Might have waxe without NME
#if nme
import nme.Assets;
#elseif waxe
import wx.Assets;
#end
#if cpp

#end



#if iosview
@:buildXml("
<files id='__lib__'>
  <file name='FrameworkInterface.mm'>
  </file>
</files>
")
#end
@:buildXml("

")


@:cppFileCode("
 
")
@:access(pi_xy.application.TestNME)
class ApplicationMain
{
   static public var engines : Array<Dynamic> = [
      
   ];


   #if waxe
   static public var frame : wx.Frame;
   static public var autoShowFrame : Bool = true;
   #if nme
   static public var nmeStage : wx.NMEStage;
   #end
   #end

   
   public static var winWidth:Float = 2076;
   public static var winHeight:Float = 1024;
   public static var winBackground:Int = 15658734;
   public static var onLoaded:Void->Void;

   public static function main()
   {
      #if cpp
        
      #end

      #if jsprime
      haxe.Log.trace = jsprimeLog;
      var closePreloader:Void->Void = (untyped Module).closePreloader;
      if (closePreloader!=null)
         closePreloader();
      #end


      #if flash

         nme.AssetData.create();

      #elseif nme

         

         nme.app.Application.setPackage("justinfront", "Application", "net.nanjizal.pi_xy.pixelimageNMEGridexample", "1.0.0");
         #if HXCPP_TELEMETRY
         
         
         #end
         nme.text.Font.useNative = true;

         nme.AssetData.create();

         #if (cpp||neko)
            nme.app.Application.setFixedOrientation(
               
                  nme.app.Application.OrientationLandscapeAny
               
           );
         #end

      #end
   

   
      #if flash
         // Flash
         flash.Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
         flash.Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;

         var load = function() ApplicationBoot.createInstance();

         
            onLoaded = load;
            var preloader = new nme.preloader.Basic();
            preloader.onInit();
            
         


      #elseif waxe
         // Waxe
         #if nme
            nme.display.ManagedStage.initSdlAudio();
         #end

         if (ApplicationBoot.canCallMain())
            ApplicationBoot.createInstance();
         else
         {
            wx.App.boot(function()
            {
               var size = { width: 2076, height: 1024 };
               
                  frame = wx.Frame.create(null, null, "Pixelimage example with NME", null, size);
               
               nme.Lib.title = "Pixelimage example with NME";
               var icon = Assets.info.get("null")==null ? null : Assets.getBitmapData("null");

               #if (nme && !nme_no_stage)
                  wx.NMEStage.create(frame, null, null,
                  {
                     width: 2076,
                     height: 1024,
                     fullscreen: false,
                     stencilBuffer: false,
                     depthBuffer: false,
                     antiAliasing: 0,
                     resizable: true,
                     vsync: false,
                     fps : 60 * 1.0,
                     color : 15658734,
                     title : "Pixelimage example with NME",
                     icon  : icon,
                  });

                  // Show frame before creating instance so context is good.
                  frame.shown = true;
                  ApplicationBoot.createInstance();
                  wx.App.setTopWindow(frame);
      
               #else
                  ApplicationBoot.createInstance();
                  if (autoShowFrame)
                  {
                     wx.App.setTopWindow(frame);
                     frame.shown = true;
                  }
               #end

           });
         }
      #elseif cppia
         // Cppia
         ApplicationBoot.createInstance();
      #elseif nme
         var flags:Int = 
         (true ? nme.app.Application.HARDWARE : 0) |
         (false ? nme.app.Application.DEPTH_BUFFER : 0) |
         (false ? nme.app.Application.STENCIL_BUFFER : 0) |
         (true ? nme.app.Application.RESIZABLE : 0) |
         (false ? nme.app.Application.BORDERLESS : 0) |
         (false ? nme.app.Application.VSYNC : 0) |
         (false ? nme.app.Application.FULLSCREEN : 0) |
         (0 == 4 ? nme.app.Application.HW_AA_HIRES : 0) |
         (0 == 2 ? nme.app.Application.HW_AA : 0)|
         (false ? nme.app.Application.SINGLE_INSTANCE : 0) |
         (false ? nme.app.Application.HIGH_DPI : 0) |
         (0 * nme.app.Application.SCALE_BASE)
         ;

         #if nme_metal
         flags |= nme.app.Application.HARDWARE_METAL;
         #end


         #if nme_application

            var params = { flags : flags,
               fps : 60 * 1.0,
               color : 15658734,
               width : 2076,
               height : 1024,
               title : "Pixelimage example with NME",
               icon  : Assets.info.get("null")==null ? null : Assets.getBitmapData("null")
            };

            nme.app.Application.createWindow(function(window:nme.app.Window) {
               new pi_xy.application.TestNME(window);
            }, params );

         #else

            nme.Lib.create(function() { 
                  nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
                  nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
                  nme.Lib.current.loaderInfo = nme.display.LoaderInfo.create (null);
                  ApplicationBoot.createInstance();
               },
               2076, 1024, 
               60, 
               15658734,
               flags,
               "Pixelimage example with NME"
               
            );

         #end
      #else
         // Unknown framework
         if (ApplicationBoot.canCallMain())
            ApplicationBoot.createInstance();
         else
            ApplicationBoot.createInstance();
      #end
   }

   @:keep function keepMe() return Reflect.callMethod;

   public static function setAndroidViewHaxeObject(inObj:Dynamic)
   {
      #if androidview
      try
      {
         var setHaxeObject = nme.JNI.createStaticMethod("null.nullBase",
              "setHaxeCallbackObject", "(Lorg/haxe/nme/HaxeObject;)V", true, true );
         if (setHaxeObject!=null)
            setHaxeObject([inObj]);
      }
      catch(e:Dynamic) {  }
      #end
   }

   #if jsprime
   @:access(js.Boot.__string_rec)
   static function jsprimeLog( v : Dynamic, ?infos : haxe.PosInfos ) : Void
   {
      var msg = if (infos != null) infos.fileName + ":" + infos.lineNumber + ": " else "";
      msg += js.Boot.__string_rec(v, "");
      if (infos != null && infos.customParams != null)
         for (v in infos.customParams)
            msg += "," + js.Boot.__string_rec(v, "");
      (untyped Module).print(msg);
   }
   #end

   public static function __init__ ()
   {
      #if jsprime
      untyped __define_feature__("Type.getClassName", {});
      untyped __define_feature__("Type.resolveClass", {});
      untyped __define_feature__("haxe.Log.trace", {});
      untyped __define_feature__("use.$iterator", {});
      untyped __define_feature__("use.$bind", {});
      untyped __define_feature__("HxOverrides.iter", {});
      #end

      #if neko
      untyped $loader.path = $array ("@executable_path/", $loader.path);
      #elseif cpp
        
      #end
   }
   
   
}

