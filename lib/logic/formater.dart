class Formatear {
  static int lengthText = 300;
  static String formatearTexto(String texto) {
    if (texto.length <= lengthText) {
      return texto;
    } else {
      return '${texto.substring(0, lengthText)}...';
    }
  }
}
