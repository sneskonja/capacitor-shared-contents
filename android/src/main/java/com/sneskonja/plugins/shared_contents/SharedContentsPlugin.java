package com.sneskonja.plugins.shared_contents;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.JSArray;
import org.json.JSONException;
import android.content.SharedPreferences;
import android.content.Intent;
import android.content.Context;
import android.content.ComponentName;
import android.appwidget.AppWidgetManager;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

@CapacitorPlugin(name = "SharedContents")
public class SharedContentsPlugin extends Plugin {

    private SharedContents implementation = new SharedContents();

    @PluginMethod
    public void writeContents(PluginCall call) {
        String value = call.getString("value");
        String key = call.getString("key");
        SharedPreferences sharedPref = getBridge().getActivity().getSharedPreferences("shared_contents", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putString(key, value);
        editor.apply();
        JSObject result = new JSObject();
        result.put("status", "success");
        result.put("message", "Service started successfully");

        call.resolve(result);
    }

    @PluginMethod
    public void removeContents(PluginCall call) {
        String key = call.getString("key");
        SharedPreferences sharedPref = getBridge().getActivity().getSharedPreferences("shared_contents", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.remove(key);
        editor.apply();
        JSObject result = new JSObject();
        result.put("status", "success");
        result.put("message", "Service started successfully");

        call.resolve(result);
    }

    @PluginMethod
    public void updateWidgets(PluginCall call) {
        try {
            JSArray stringArray = call.getArray("widgets");
            if (stringArray != null) {
                Context context = getBridge().getContext();
                for (int i = 0; i < stringArray.length(); i++) {
                    String widget = stringArray.getString(i);
                    sendIntentBroadcast(context, widget);
                }
                JSObject response = new JSObject();
                response.put("success", true);
                call.resolve(response);
            } else{
            call.reject("Array is null or not provided");
            }
        } catch (JSONException e) {
            call.reject("Failed to extract array", e);
        } catch (ClassNotFoundException e) {
            call.reject("Cannot find class", e);
        }
    }

    private void sendIntentBroadcast(Context context, String widget) throws ClassNotFoundException {
        Class widgetProviderClass = Class.forName(widget);
        AppWidgetManager appWidgetManager = AppWidgetManager.getInstance(context);
        ComponentName componentName = new ComponentName(context, widgetProviderClass);
        int[] appWidgetIds = appWidgetManager.getAppWidgetIds(componentName);

        if (appWidgetIds.length > 0) {
            Intent updateIntent = new Intent(context, widgetProviderClass);
            updateIntent.setAction(AppWidgetManager.ACTION_APPWIDGET_UPDATE);
            updateIntent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS, appWidgetIds);
            context.sendBroadcast(updateIntent);
        }
    }
}
