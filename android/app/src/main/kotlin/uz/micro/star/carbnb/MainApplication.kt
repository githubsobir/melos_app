package uz.micro.star.carbnb
import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("973005bb-3cfc-4e46-81d2-26939d2b8c3c") // Your generated API key
    }
}
