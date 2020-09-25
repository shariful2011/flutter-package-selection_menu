class MenuItem {
  String text;
  double width;

  MenuItem({
    this.text,
    this.width,
  });
}

List<MenuItem> aboutUs = [
  MenuItem(
    text: 'Our services',
    width: 'Our services'.length * 13.0,
  ),
  MenuItem(
    text: 'Contact Us',
    width: 'Our services'.length * 3.0,
  ),
];

List<MenuItem> directory = [
  MenuItem(
    text: 'Directory of Language Companies',
    width: 'Directory of Translators and Interpreters'.length * 9.0,
  ),
  MenuItem(
    text: 'Directory of Translators and Interpreters',
    width: 'Directory of Translators and Interpreters'.length * 1.0,
  ),
];

List<MenuItem> translation = [
  MenuItem(
    text: 'I am looking for translators/interpreters',
    width: 'I am looking for translators/interpreters'.length * 9.0,
  ),
  MenuItem(
    text: 'Articles & Researches',
    width: 'I am looking for translators/interpreters'.length * 41.0,
  ),
  MenuItem(
    text: 'Translated Texts (Bilingual Texts)',
    width: 'I am looking for translators/interpreters'.length * 41.0,
  ),
];

List<MenuItem> courses = [
  MenuItem(
    text: 'Courses & Events',
    width: 'Training and Certification'.length * 10.0,
  ),
  MenuItem(
    text: 'Training and Certification',
    width: 'Training and Certification'.length * 27.0,
  ),
];
