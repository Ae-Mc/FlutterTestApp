class Planet {
  String name;
  String imagePath;
  String description;

  Planet(this.name, this.imagePath, this.description);

  static List<Planet> fetchAll() {
    return [
      Planet(
        "Earth",
        "assets/images/Earth.png",
        "Earth. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            " Habitant sem ut sit fames in adipiscing. Ac magna donec"
            " egestas habitant.",
      ),
      Planet(
        "Earth2",
        "assets/images/Earth.png",
        "Earth2. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            " Habitant sem ut sit fames in adipiscing. Ac magna donec"
            " egestas habitant.",
      ),
      Planet(
        "Earth3",
        "assets/images/Earth.png",
        "Earth3. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            " Habitant sem ut sit fames in adipiscing. Ac magna donec"
            " egestas habitant.",
      ),
    ];
  }
}
