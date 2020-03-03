import Foundation

public class ActivityLogAnalyzerResultMessage: ActivityLogMessage {
    public let steps: [ActivityLogAnalyzerStep]
    public let resultType: String?
    public let keyEventIndex: Int

    enum ActivityLogAnalyzerResultMessageCodingKeys: String, CodingKey {
        case steps
        case resultType
        case keyEventIndex
    }

     required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ActivityLogAnalyzerResultMessageCodingKeys.self)
        steps = try container.decodeXCResultArray(forKey: .steps)
        resultType = try container.decodeXCResultTypeIfPresent(forKey: .resultType)
        keyEventIndex = try container.decodeXCResultType(forKey: .keyEventIndex)
        try super.init(from: decoder)
    }
}
