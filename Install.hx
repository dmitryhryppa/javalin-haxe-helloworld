import sys.io.File;
import sys.FileSystem;

final class Install {
	static function main():Void {
		final args = [
			"-jar", "ivy-2.5.0.jar",
			"-ivy", "ivy.xml",
			"-retrieve", "lib/[artifact]-[revision](-[classifier]).[ext]"
		];

		if (Sys.command("java", args) == 0) {
			final libs = FileSystem.readDirectory("./lib");
			final buf = new StringBuf();

			for (filename in libs) {
				buf.add('--java-lib ./lib/$filename\n');
			}

			File.saveContent("./libs.hxml", buf.toString());
		}
	}
}
