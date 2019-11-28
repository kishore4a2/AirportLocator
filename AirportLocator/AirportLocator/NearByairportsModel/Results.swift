
import Foundation
struct Results : Codable {
	let geometry : Geometry?
	let icon : String?
	let id : String?
	let name : String?
	let opening_hours : Opening_hours?
	let photos : [Photos]?
	let place_id : String?
	let plus_code : Plus_code?
	let rating : Double?
	let reference : String?
	let scope : String?
	let types : [String]?
	let user_ratings_total : Int?
	let vicinity : String?

	enum CodingKeys: String, CodingKey {

		case geometry = "geometry"
		case icon = "icon"
		case id = "id"
		case name = "name"
		case opening_hours = "opening_hours"
		case photos = "photos"
		case place_id = "place_id"
		case plus_code = "plus_code"
		case rating = "rating"
		case reference = "reference"
		case scope = "scope"
		case types = "types"
		case user_ratings_total = "user_ratings_total"
		case vicinity = "vicinity"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		geometry = try values.decodeIfPresent(Geometry.self, forKey: .geometry)
		icon = try values.decodeIfPresent(String.self, forKey: .icon)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		opening_hours = try values.decodeIfPresent(Opening_hours.self, forKey: .opening_hours)
		photos = try values.decodeIfPresent([Photos].self, forKey: .photos)
		place_id = try values.decodeIfPresent(String.self, forKey: .place_id)
		plus_code = try values.decodeIfPresent(Plus_code.self, forKey: .plus_code)
		rating = try values.decodeIfPresent(Double.self, forKey: .rating)
		reference = try values.decodeIfPresent(String.self, forKey: .reference)
		scope = try values.decodeIfPresent(String.self, forKey: .scope)
		types = try values.decodeIfPresent([String].self, forKey: .types)
		user_ratings_total = try values.decodeIfPresent(Int.self, forKey: .user_ratings_total)
		vicinity = try values.decodeIfPresent(String.self, forKey: .vicinity)
	}

}
