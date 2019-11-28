
import Foundation
struct AirportListModel : Codable {
	let html_attributions : [String]?
	let next_page_token : String?
	let results : [Results]?
	let status : String?

	enum CodingKeys: String, CodingKey {

		case html_attributions = "html_attributions"
		case next_page_token = "next_page_token"
		case results = "results"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		html_attributions = try values.decodeIfPresent([String].self, forKey: .html_attributions)
		next_page_token = try values.decodeIfPresent(String.self, forKey: .next_page_token)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
		status = try values.decodeIfPresent(String.self, forKey: .status)
	}

}
