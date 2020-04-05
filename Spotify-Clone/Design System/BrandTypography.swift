struct BrandStyle {
	let fontName: String
	let fontSize: CGFloat
	let textColor: UIColor

	init(name: String, size: CGFloat, color: UIColor) {
		fontName = name
		fontSize = size
		textColor = color
	}
}

let recentlyPlayedTitle = BrandStyle(name: "Montserrat-Medium", size: 11, color: UIColor.white)
let homeSectionTitle = BrandStyle(name: "Montserrat-Bold", size: 20, color: UIColor.white)
