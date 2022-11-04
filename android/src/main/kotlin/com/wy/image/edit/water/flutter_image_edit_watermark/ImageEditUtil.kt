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
        filePath: String,
        text: String,
        size: Int, color: Int,
    ): String {



        val file = File(filePath)
        val uri = Uri.fromFile(file)
        val bitmap = BitmapUtil.getBitmapFromUri(context, uri)
//        读取bitmap

        val width = bitmap.width
        val fontSize = width * 12 / 375
        val margin = width * 12  / 375


        val resultBitmap =  WaterMaskUtil.drawTextToLeftBottom(
            context,
            bitmap,
            text,
            fontSize,
            color,
            margin,
            margin

        )

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