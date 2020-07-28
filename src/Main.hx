package;
import haxe.Json;
import io.javalin.http.Context;
import io.javalin.http.Handler;
import io.javalin.Javalin;

final class Main  implements Handler {
	static function main() new Main();

	function new() {
		final app = Javalin.create().start(7000);
		app.get("/", this);
	}

	public function handle(ctx:Context):Void {
		ctx.result(Json.stringify({
			status: "hello world!"
		}));
	}
}
