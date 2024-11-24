import 'dart:math';

List<String> words = [
  'Constitution',
  'POCSO',
  'Freedom',
  'JuvenileJustice',
  'Privacy',
];

String getImageUrlForWord(String word) {
  switch (word) {
    case 'Constitution':
      return '/assets/images/web/constitution_image.png'; // Replace with actual URL
    case 'POCSO':
      return '/assets/images/web/pocso_image.jpg'; // Replace with actual URL
    case 'Freedom':
      return '/assets/images/web/freedom_image.jpg'; // Replace with actual URL
    case 'JuvenileJustice':
      return '/assets/images/web/juvenile_justice_image.jpg'; // Replace with actual URL
    case 'Privacy':
      return '/assets/images/web/privacy_image.jpg'; // Replace with actual URL
    default:
      return '';
  }
}
