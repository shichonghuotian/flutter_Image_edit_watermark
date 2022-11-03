package com.wy.image.edit.water.flutter_image_edit_watermark

import android.content.Context
import android.graphics.Bitmap
import android.net.Uri
import android.util.Log
import java.io.File

/**
 * Created by Arthur on 2022/11/3.
 */
object ImageEditUtil {

    fun createTextWaterMaskBottomLeft(
        context: Context,
        filePath: String, text: String,
        size: Int, color: Int,
        paddingLeft: Int = 0,
        paddingBottom: Int = 0
    ): String {

        val file = File(filePath)
        val uri = Uri.fromFile(file)
        val bitmap = BitmapUtil.getBitmapFromUri(context, uri)
        Log.e("wy", "load bitmap : $bitmap");
//        读取bitmap
        val resultBitmap =  WaterMaskUtil.drawTextToLeftBottom(
            context,
            bitmap,
            text,
            size,
            color,
            paddingLeft,
            paddingBottom
        )

        Log.e("wy", "load end bitmap : $resultBitmap");


        val savePath = Utils.saveBitmap(resultBitmap, filePath)

//        回收bitmap
        Utils.recycleBitmap(bitmap)
        Utils.recycleBitmap(resultBitmap)


        return savePath;
    }


//    File file = new File(path);
//    Uri uri = Uri.fromFile(file);

//    File file = new File(path);
//    Uri uri = Uri.fromFile(file);
//    return BitmapUtil.getBitmapFromUri(getApplicationContext(), uri,
//    Utils.getScreenWidth(this) / 2,
//    Utils.getScreenHeight(this) / 2);
}