HDrawablePool pool;
HTimer timer;

final HColorPool colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

void setup() {
	size(640,640);
	H.init(this).background(#202020);
	smooth();

	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add (
			new HRect()
			.rounding(10)
		)
	    .onCreate (
		    new HCallback() {
		    	public void run(Object obj) {
		    		HDrawable d = (HDrawable) obj;
					d
						.strokeWeight(4)
						.stroke(#000000, 75)
						.fill( colors.getColor() )
						.loc( (int)random(width), (int)random(height) )
						.rotation(45)
						.size( 50+((int)random(3)*50) )
						.anchorAt( H.CENTER )
					;
				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(100)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
}

