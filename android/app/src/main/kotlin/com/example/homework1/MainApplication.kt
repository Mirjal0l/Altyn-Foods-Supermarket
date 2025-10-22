package com.example.homework1

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("en_US") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("fe586884-4933-41a1-a832-f717692a940a") // Your generated API key
    }
}