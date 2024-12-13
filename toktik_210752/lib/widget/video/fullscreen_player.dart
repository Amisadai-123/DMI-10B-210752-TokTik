import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    // No llamar a métodos como setVolume, setLooping, o play hasta que se haya inicializado el controlador.
    controller = VideoPlayerController.asset(widget.videoUrl);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          // Mientras se inicializa el controlador, mostrar un indicador de carga.
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }

        // Una vez que se haya inicializado, configuramos las opciones y comenzamos a reproducir el video.
        controller.setVolume(0);  // Ajusta el volumen.
        controller.setLooping(true); // Configura el bucle.
        controller.play(); // Comienza a reproducir el video.

        return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        );
      },
    );
  }
}
