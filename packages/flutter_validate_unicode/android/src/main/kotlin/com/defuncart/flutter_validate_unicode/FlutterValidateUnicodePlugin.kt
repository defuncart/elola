package com.defuncart.flutter_validate_unicode

import androidx.annotation.NonNull;
import android.graphics.Paint;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** FlutterValidateUnicodePlugin */
public class FlutterValidateUnicodePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_validate_unicode")
    channel.setMethodCallHandler(this);
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_validate_unicode")
      channel.setMethodCallHandler(FlutterValidateUnicodePlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "isCharacterSupported") {
      isCharacterSupported(call, result)
    } else {
      result.notImplemented()
    }
  }

  fun isCharacterSupported(@NonNull call: MethodCall, @NonNull result: Result) {
    val character: String? = call.argument<String>("character")
    if(character != null) {
      result.success(canRenderUnicode(character))
    } else {
      result.error("Invalid args", "", null)
    }
  }

  // taken from https://stackoverflow.com/a/41941569

  fun canRenderUnicode(character: String) : Boolean {
    var paint: Paint = Paint();
    try {
        return paint.hasGlyph(character);
    } catch (e: NoSuchMethodError) {
        // Compare display width of single-codepoint emoji to width of character emoji to determine
        // whether character is rendered as single glyph or two adjacent regional indicator symbols.
        var flagWidth: Float = paint.measureText(character);
        var standardWidth: Float = paint.measureText("\uD83D\uDC27"); //  U+1F427 Penguin
        return flagWidth < standardWidth * 1.25;
        // This assumes that a valid glyph for the character emoji must be less than 1.25 times
        // the width of the penguin.
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
