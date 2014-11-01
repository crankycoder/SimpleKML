all:
	./gradlew jar

upload:
	./gradlew bintrayUpload
