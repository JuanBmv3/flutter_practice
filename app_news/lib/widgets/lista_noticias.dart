import 'package:app_news/models/new_models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListaNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, i) {
          return _Noticia(
            noticia: noticias[i],
            index: i,
          );
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaImagen(
          noticia: noticia,
        ),
        _TarjetaTitulo(
          noticia: noticia,
        ),
        _TarjetaBottomBar(
          noticia: noticia,
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: Colors.white,
        )
      ],
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;
  const _TarjetaImagen({
    required this.noticia,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(noticia.url), mode: LaunchMode.externalApplication);
      },
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/giphy.gif'),
                  image: NetworkImage(noticia.urlToImage),
                )
              : const Image(image: AssetImage('assets/no-image.png')),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, );
    } else {
      throw 'No se pudo abrir la URL: $uri';
    }
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _TarjetaBottomBar extends StatelessWidget {
  final Article noticia;

  const _TarjetaBottomBar({
    required this.noticia,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        top: 10,
      ),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            noticia.source.name,
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.star_border)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
