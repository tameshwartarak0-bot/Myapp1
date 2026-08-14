plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-pulgin")
}

android {
    namespace = "com.tameshwar.myapp"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.tameshwar.myapp"
        minSdk = 21
        targetSdk = 34
        versionCode = flutter.versionCode.toInt()
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    implementation("androidx.multidex:multidex:2.0.1")
}