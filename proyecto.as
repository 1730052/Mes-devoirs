package {
	//Librerias que vamos a utilizar
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.sampler.NewObjectSample;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	import fl.transitions.Tween;
	import fl.transitions.*;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;

	public class proyecto extends MovieClip {

		public function proyecto() {
			//===========================================================================
			//===============================Variables===================================
			//Variables para la transicion entre frames
			var movi: Number = 0;//Es la variable que nos indica a que frame vamos a ir
			var tiempo: int = 0;//tiempo es solo un contador
			var timer: Timer = new Timer(1000, 10);//Timer que hace un tick cada segundo

			//Variables para reproducir swf´s
			var esew: Loader = new Loader();
			var ruta: URLRequest;
			var peli: String;

			//===========================================================================
			//=================================Llamar swf================================
			function iralloader() {
				gotoAndStop(707);//Vamos al frame donde se reproducen
				ruta = new URLRequest(peli);//Llamamos la variable con la ruta
				esew.load(ruta);//Cargamos el swf
				addChild(esew);//Añadimos el child
				salirbtn.addEventListener(MouseEvent.CLICK, quitar);//Al entrar al frame, se asigna el boton para quitar y salir
			}

			function llamargtween(event: MouseEvent) {
				peli = ("Multimedia/Imagenes_tween/Practica_7_final.swf");//Buscamos la ruta del swf
				iralloader();//Llamos la funcion iralloader
				esew.x = 75;//Damos las posiciones en x y y
				esew.y = 75;
			}

			function llamargzoom(event: MouseEvent) {
				peli = ("Multimedia/Galeria/Galeria.swf");
				iralloader();
				esew.x = 75;
				esew.y = 75;
			}

			function llamarvideos(event: MouseEvent) {
				peli = ("Multimedia/Videos_cuphead/Práctica_11.swf");
				iralloader();
				esew.x = 75;
				esew.y = 75;
			}

			function llamaropinion(event: MouseEvent) {
				peli = ("Multimedia/Opinion/opinion.swf");
				iralloader();
				esew.x = 75;
				esew.y = 75;

			}
			//===========================================================================
			//===========================Transiciones al inicio==========================
			//Transiciones cuando se entra al primer frame, es un fadein y solo funciona una vez
			TransitionManager.start(fondo, {
				type: Fade,
				direction: Transition.IN,
				duration: 33,
				easing: Strong.easeOut
			});
			TransitionManager.start(barra, {
				type: Fade,
				direction: Transition.IN,
				duration: 33,
				easing: Strong.easeOut
			});
			TransitionManager.start(cosasinicio, {
				type: Fade,
				direction: Transition.IN,
				duration: 33,
				easing: Strong.easeOut
			});

			//===========================================================================
			//=================================Tweens====================================
			//Tweens para los botones que nos llevan a los distintos apartados
			var ini2: Tween = new Tween(logo, "x", Regular.easeInOut, -350, 50, 2, true);
			var ini3: Tween = new Tween(iniciobtn1, "x", Regular.easeInOut, -350, 37.95, 3, true);
			var ini4: Tween = new Tween(practicasbtn1, "x", Regular.easeInOut, -350, 37.95, 4, true);
			var ini5: Tween = new Tween(juegosbtn1, "x", Regular.easeInOut, -350, 37.95, 5, true);
			var ini7: Tween = new Tween(multimediabtn1, "x", Regular.easeInOut, -350, 37.95, 6, true);
			var ini6: Tween = new Tween(tareasbtn1, "x", Regular.easeInOut, -350, 37.95, 7, true);
			
			//Añadimos las funciones a los botones
			iniciobtn1.addEventListener(MouseEvent.CLICK, entrarinicio);
			practicasbtn1.addEventListener(MouseEvent.CLICK, entrarpracticas);
			juegosbtn1.addEventListener(MouseEvent.CLICK, entrarjuegos);
			multimediabtn1.addEventListener(MouseEvent.CLICK, entrarmultimedia);
			tareasbtn1.addEventListener(MouseEvent.CLICK, entrartareas);

			//========================================================================================
			//====================================Quitar el swf=======================================
			//Funcion para remover el child del swf
			//Nos envia al frame 4 y volvemos a asignar todos los botones
			function quitar(event: MouseEvent) {
				removeChild(esew);
				gotoAndStop(4);

				multimedian1.addEventListener(MouseEvent.CLICK, llamargtween);
				multimedian2.addEventListener(MouseEvent.CLICK, llamargzoom);
				multimedian3.addEventListener(MouseEvent.CLICK, llamarvideos);

				iniciobtn1.addEventListener(MouseEvent.CLICK, entrarinicio);
				practicasbtn1.addEventListener(MouseEvent.CLICK, entrarpracticas);
				juegosbtn1.addEventListener(MouseEvent.CLICK, entrarjuegos);
				multimediabtn1.addEventListener(MouseEvent.CLICK, entrarmultimedia);
				tareasbtn1.addEventListener(MouseEvent.CLICK, entrartareas);
			}

			//========================================================================================
			//==============================Funciones de los timers===================================
			function Finicio(tiempoevent: TimerEvent) {
				tiempo++;//La variable tiempo aumenta en uno despues de un segundo
				trace("Vas a inicio " + tiempo);
				if (tiempo == 1) {//Cuando tiempo sea uno...
					movi = 0;//Se borra el valor anterior
					timer.stop();//Se detiene el timer
					timer.reset();
					tiempo = 0;//Tiempo reinicia su valor a cero
					gotoAndStop(1);//Nos envia al frame uno
					
					//Asignamos los listener de los botones
					iniciobtn1.addEventListener(MouseEvent.CLICK, entrarinicio);
					practicasbtn1.addEventListener(MouseEvent.CLICK, entrarpracticas);
					juegosbtn1.addEventListener(MouseEvent.CLICK, entrarjuegos);
					multimediabtn1.addEventListener(MouseEvent.CLICK, entrarmultimedia);
					tareasbtn1.addEventListener(MouseEvent.CLICK, entrartareas);

				}
			}

			function Fpractica(tiempoevent: TimerEvent) {
				tiempo++;
				trace("Vas a practicas " + tiempo);
				if (tiempo == 1) {
					movi = 0;
					timer.stop();
					timer.reset()
					gotoAndStop(2);
					tiempo = 0;
					iniciobtn1.addEventListener(MouseEvent.CLICK, entrarinicio);
					practicasbtn1.addEventListener(MouseEvent.CLICK, entrarpracticas);
					juegosbtn1.addEventListener(MouseEvent.CLICK, entrarjuegos);
					multimediabtn1.addEventListener(MouseEvent.CLICK, entrarmultimedia);
					tareasbtn1.addEventListener(MouseEvent.CLICK, entrartareas);

					practican1.addEventListener(MouseEvent.CLICK, Fpractica1);
					practican2.addEventListener(MouseEvent.CLICK, Fpractica2);
					practican3.addEventListener(MouseEvent.CLICK, Fpractica3);
					practican4.addEventListener(MouseEvent.CLICK, Fpractica4);
					practican5.addEventListener(MouseEvent.CLICK, Fpractica5);
					practican6.addEventListener(MouseEvent.CLICK, Fpractica6);
					practican7.addEventListener(MouseEvent.CLICK, Fpractica7);
					practican8.addEventListener(MouseEvent.CLICK, llamargtween);
					practican9.addEventListener(MouseEvent.CLICK, Fpractica9);
					practican10.addEventListener(MouseEvent.CLICK, Fpractica10);

				}
			}

			function Fjuegos(tiempoevent: TimerEvent) {
				tiempo++;
				trace("Vas a juegos " + tiempo);
				if (tiempo == 1) {
					movi = 0;
					timer.stop();
					timer.reset()
					gotoAndStop(3);
					tiempo = 0;
					iniciobtn1.addEventListener(MouseEvent.CLICK, entrarinicio);
					practicasbtn1.addEventListener(MouseEvent.CLICK, entrarpracticas);
					juegosbtn1.addEventListener(MouseEvent.CLICK, entrarjuegos);
					multimediabtn1.addEventListener(MouseEvent.CLICK, entrarmultimedia);
					tareasbtn1.addEventListener(MouseEvent.CLICK, entrartareas);

					juegon1.addEventListener(MouseEvent.CLICK, Fjuego1);
					juegon2.addEventListener(MouseEvent.CLICK, Fjuego2);
					juegon3.addEventListener(MouseEvent.CLICK, Fjuego3);

				}
			}

			function Fmultimedia(tiempoevent: TimerEvent) {
				tiempo++;
				trace("Vas a multimedia " + tiempo);
				if (tiempo == 1) {
					movi = 0;
					timer.stop();
					timer.reset()
					gotoAndStop(4);
					tiempo = 0;
					iniciobtn1.addEventListener(MouseEvent.CLICK, entrarinicio);
					practicasbtn1.addEventListener(MouseEvent.CLICK, entrarpracticas);
					juegosbtn1.addEventListener(MouseEvent.CLICK, entrarjuegos);
					multimediabtn1.addEventListener(MouseEvent.CLICK, entrarmultimedia);
					tareasbtn1.addEventListener(MouseEvent.CLICK, entrartareas);

					multimedian1.addEventListener(MouseEvent.CLICK, llamargtween);
					multimedian2.addEventListener(MouseEvent.CLICK, llamargzoom);
					multimedian3.addEventListener(MouseEvent.CLICK, llamarvideos);
					multimedian4.addEventListener(MouseEvent.CLICK, llamaropinion);
				}
			}

			function Ftareas(tiempoevent: TimerEvent) {
				tiempo++;
				trace("Vas a tareas " + tiempo);
				if (tiempo == 1) {
					movi = 0;
					timer.stop();
					gotoAndStop(5);
					tiempo = 0;
					iniciobtn1.addEventListener(MouseEvent.CLICK, entrarinicio);
					practicasbtn1.addEventListener(MouseEvent.CLICK, entrarpracticas);
					juegosbtn1.addEventListener(MouseEvent.CLICK, entrarjuegos);
					multimediabtn1.addEventListener(MouseEvent.CLICK, entrarmultimedia);
					tareasbtn1.addEventListener(MouseEvent.CLICK, entrartareas);

					tarean1.addEventListener(MouseEvent.CLICK, Ftarea1);
					tarean2.addEventListener(MouseEvent.CLICK, Ftarea2);
					tarean3.addEventListener(MouseEvent.CLICK, Ftarea3);
				}
			}
			
			//===================================================================================
			//=======================Interpolaciones para navegar entre frames===================
			function entrarinicio(event: MouseEvent): void {
				movi = 1;//Le damos un valor de uno a movi
				trace("Movi tiene valor de " + movi);
				if (currentFrame == 2 && movi == 1) {//Si el frame actual es dos y movi es igual a uno...
					gotoAndPlay(146);//Nos lleva a la parte de la interpolacion en que va del frame dos al uno
					timer.addEventListener(TimerEvent.TIMER, Finicio);//Añadimos la funcion Finicio
					timer.start();//Empieza a contar el timer
				} else if (currentFrame == 3 && movi == 1) {
					gotoAndPlay(236);
					timer.addEventListener(TimerEvent.TIMER, Finicio);
					timer.start();
				} else if (currentFrame == 4 && movi == 1) {
					gotoAndPlay(427);
					timer.addEventListener(TimerEvent.TIMER, Finicio);
					timer.start();
				} else if (currentFrame == 5 && movi == 1) {
					gotoAndPlay(567);
					timer.addEventListener(TimerEvent.TIMER, Finicio);
					timer.start();
				}
			}

			function entrarpracticas(event: MouseEvent): void {
				movi = 2;
				trace("Movi tiene valor de " + movi);
				if (currentFrame == 1 && movi == 2) {
					gotoAndPlay(6);
					timer.addEventListener(TimerEvent.TIMER, Fpractica);
					timer.start();
				} else if (currentFrame == 3 && movi == 2) {
					gotoAndPlay(321);
					timer.addEventListener(TimerEvent.TIMER, Fpractica);
					timer.start();
				} else if (currentFrame == 4 && movi == 2) {
					gotoAndPlay(462);
					timer.addEventListener(TimerEvent.TIMER, Fpractica);
					timer.start();
				} else if (currentFrame == 5 && movi == 2) {
					gotoAndPlay(602);
					timer.addEventListener(TimerEvent.TIMER, Fpractica);
					timer.start();
				}
			}

			function entrarjuegos(event: MouseEvent): void {
				movi = 3;
				trace("Movi tiene valor de " + movi);
				if (currentFrame == 1 && movi == 3) {
					gotoAndPlay(41);
					timer.addEventListener(TimerEvent.TIMER, Fjuegos);
					timer.start();
				} else if (currentFrame == 2 && movi == 3) {
					gotoAndPlay(181);
					timer.addEventListener(TimerEvent.TIMER, Fjuegos);
					timer.start();
				} else if (currentFrame == 4 && movi == 3) {
					gotoAndPlay(497);
					timer.addEventListener(TimerEvent.TIMER, Fjuegos);
					timer.start();
				} else if (currentFrame == 5 && movi == 3) {
					gotoAndPlay(637);
					timer.addEventListener(TimerEvent.TIMER, Fjuegos);
					timer.start();
				}
			}

			function entrarmultimedia(event: MouseEvent): void {
				movi = 4;
				trace("Movi tiene valor de " + movi);
				if (currentFrame == 1 && movi == 4) {
					gotoAndPlay(76);
					timer.addEventListener(TimerEvent.TIMER, Fmultimedia);
					timer.start();
				} else if (currentFrame == 2 && movi == 4) {
					gotoAndPlay(216);
					timer.addEventListener(TimerEvent.TIMER, Fmultimedia);
					timer.start();
				} else if (currentFrame == 3 && movi == 4) {
					gotoAndPlay(355);
					timer.addEventListener(TimerEvent.TIMER, Fmultimedia);
					timer.start();
				} else if (currentFrame == 5 && movi == 4) {
					gotoAndPlay(672);
					timer.addEventListener(TimerEvent.TIMER, Fmultimedia);
					timer.start();
				}
			}

			function entrartareas(event: MouseEvent): void {
				movi = 5;
				trace("Movi tiene valor de " + movi);
				if (currentFrame == 1 && movi == 5) {
					gotoAndPlay(111);
					timer.addEventListener(TimerEvent.TIMER, Ftareas);
					timer.start();
				} else if (currentFrame == 2 && movi == 5) {
					gotoAndPlay(251);
					timer.addEventListener(TimerEvent.TIMER, Ftareas);
					timer.start();
				} else if (currentFrame == 3 && movi == 5) {
					gotoAndPlay(392);
					timer.addEventListener(TimerEvent.TIMER, Ftareas);
					timer.start();
				} else if (currentFrame == 4 && movi == 5) {
					gotoAndPlay(532);
					timer.addEventListener(TimerEvent.TIMER, Ftareas);
					timer.start();
				}
				trace(Ftareas);
			}
			
			//===================================================================================
			//===========================Llamar practicas en HTML================================
			function Fpractica1(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_1.html");//Ponemos la direccion donde está el archivo .html
				navigateToURL(miURL, "_blank");//Lo abrimos en el navegador, el _blank es para abrirlo en una pestaña nueva
			}

			function Fpractica2(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_2.html");
				navigateToURL(miURL, "_blank");
			}

			function Fpractica3(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_2.html");
				navigateToURL(miURL, "_blank");
			}

			function Fpractica4(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_4_Final.html");
				navigateToURL(miURL, "_blank");
			}

			function Fpractica5(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_5.html");
				navigateToURL(miURL, "_blank");
			}

			function Fpractica6(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_6.html");
				navigateToURL(miURL, "_blank");
			}

			function Fpractica7(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_7.html");
				navigateToURL(miURL, "_blank");
			}

			function Fpractica8(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_8.html");
				navigateToURL(miURL, "_blank");
			}

			function Fpractica9(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/practica8-demo.html");
				navigateToURL(miURL, "_blank");
			}

			function Fpractica10(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Prácticas/Práctica_10.html");
				navigateToURL(miURL, "_blank");
			}

			function Ftarea1(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Tareas/Tarea_3.html");
				navigateToURL(miURL, "_blank");
			}

			function Ftarea2(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Tareas/Tarea_4.html");
				navigateToURL(miURL, "_blank");
			}

			function Ftarea3(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Tareas/Tarea_5.html");
				navigateToURL(miURL, "_blank");
			}

			function Fjuego1(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Juegos/Práctica_4_Final.html");
				navigateToURL(miURL, "_blank");
			}

			function Fjuego2(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Juegos/memorama.html");
				navigateToURL(miURL, "_blank");
			}

			function Fjuego3(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Juegos/serpientes.html");
				navigateToURL(miURL, "_blank");
			}

			function Fmultimedia1(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Multimedia/Práctica_8.html");
				navigateToURL(miURL, "_blank");
			}

			function Fmultimedia2(event: MouseEvent): void {
				var miURL: URLRequest = new URLRequest("Multimedia/Práctica_11.html");
				navigateToURL(miURL, "_blank");
			}
		}
	}
}