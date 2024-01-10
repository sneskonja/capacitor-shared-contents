package com.sneskonja.plugins.shared_contents;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import android.content.SharedPreferences;
import android.content.Intent;
import android.content.Context;
import android.content.ComponentName;
import android.appwidget.AppWidgetManager;

@CapacitorPlugin(name = "SharedContents")
public class SharedContentsPlugin extends Plugin {

    private SharedContents implementation = new SharedContents();

    @PluginMethod
    public void writeContents(PluginCall call) {
        String value = call.getString("value");
        String key = call.getString("key");
        String widget = call.getString("widget");

        SharedPreferences sharedPref = getBridge().getActivity().getSharedPreferences("shared_contents", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putString(key, value);
        editor.apply();

        Intent broadcastIntent = new Intent();

        broadcastIntent.setAction("android.appwidget.action.APPWIDGET_UPDATE");
        Context context = getBridge().getContext();
        ComponentName name = new ComponentName(context, widget);
        int [] ids = AppWidgetManager.getInstance(context).getAppWidgetIds(name);
        broadcastIntent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS, ids);
        context.sendBroadcast(broadcastIntent);

        JSObject result = new JSObject();
        result.put("status", "success");
        result.put("message", "Service started successfully");

        call.resolve(result);
    }
}
