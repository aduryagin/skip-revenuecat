import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.plugin.mpp.apple.XCFramework
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
}

kotlin {
    androidTarget ()
    val iosX64 = iosX64()
    val iosArm64 = iosArm64()
    val iosSimulatorArm64 = iosSimulatorArm64()
    val macosArm64 = macosArm64()
    val macosX64 = macosX64()

    val xcFramework = XCFramework("SkipRevenuecatLibrary")
    configure(listOf(iosX64, iosArm64, iosSimulatorArm64, macosArm64, macosX64)) {
        binaries {
            framework {
                // Re-export RevenueCat libraries
                export(libs.purchases.core)
                export(libs.purchases.datetime)   // Optional
                export(libs.purchases.either)     // Optional
                export(libs.purchases.result)     // Optional

                baseName = "SkipRevenuecatLibrary"
                isStatic = true
                xcFramework.add(this)
            }
        }
    }

    sourceSets {
        val commonMain by getting { }

        val iosMain by creating {
            dependsOn(commonMain)

            dependencies {
                //put your multiplatform dependencies here

                api(libs.purchases.core)
                api(libs.purchases.datetime)   // Optional
                api(libs.purchases.either)     // Optional
                api(libs.purchases.result)     // Optional
            }
        }
        val iosArm64Main by getting {
            dependsOn(iosMain)
        }
        val iosX64Main by getting {
            dependsOn(iosMain)
        }
        val iosSimulatorArm64Main by getting {
            dependsOn(iosMain)
        }
        val macosArm64Main by getting {
            dependsOn(commonMain)
        }
        val macosX64Main by getting {
            dependsOn(commonMain)
        }

        configureEach {
            languageSettings {
                optIn("kotlinx.cinterop.ExperimentalForeignApi")
            }
        }
    }
}

android {
    namespace = "skip.revenuecat.library"
    compileSdk = libs.versions.android.compileSdk.get().toInt()
    defaultConfig {
        minSdk = libs.versions.android.minSdk.get().toInt()
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
    }
}

// Configure the JVM Toolchain for Kotlin tasks
tasks.withType<KotlinCompile>().configureEach {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_21)
    }
}