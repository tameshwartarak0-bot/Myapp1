allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io")
    }
}
buildscript {
    ext {
        set("kotlin_version", "1.7.10")
    }
}
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
    project.configurations.all {
        resolutionStrategy.eachDependency {
            if (requested.name == "kotlin-stdlib") {
                useVersion("1.7.10")
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
