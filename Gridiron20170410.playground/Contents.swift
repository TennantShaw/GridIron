enum ScoringEvent: Int {
    case touchdown
    case extraPoint
    case twoPointConversion
    case fieldGoal
    case safety
    
    var pointValue: Int {
        switch self {
        case .touchdown:
            return 6
        case .extraPoint:
            return 1
        case .twoPointConversion, .safety:
            return 2
        case .fieldGoal:
            return 3
        }
    }
}


typealias Team = String

struct Game: Equatable {
var teamAName: Team
var teamBName: Team
var arrayOfScoringEventsForTeamA = [ScoringEvent]()
var arrayOfScoringEventsForTeamB = [ScoringEvent]()
    
    public static func == (lhs: Game, rhs: Game) -> Bool {
        return (lhs.teamAName == rhs.teamAName && lhs.teamBName == rhs.teamBName) && (lhs.arrayOfScoringEventsForTeamA == rhs.arrayOfScoringEventsForTeamA && lhs.arrayOfScoringEventsForTeamB == rhs.arrayOfScoringEventsForTeamB)
    }
    
    init(teamA: Team, teamB: Team, score: (teamA: [ScoringEvent], teamB: [ScoringEvent])) {
        self.teamAName = teamA
        self.teamBName = teamB
        self.arrayOfScoringEventsForTeamA = score.teamA
        self.arrayOfScoringEventsForTeamB = score.teamB
    }
    
    func getScore(_ team: Team) -> Int? {
        var individualTeamScore = 0
        
        switch team {
        case teamAName:
            for i in arrayOfScoringEventsForTeamA {
                individualTeamScore += i.rawValue
            }
        case teamBName:
            for i in arrayOfScoringEventsForTeamB {
                individualTeamScore += i.rawValue
            }
        default:
            return nil
        }
        return individualTeamScore
    }
}



func record(_ event: ScoringEvent, _ team: Team, _ game: Game) -> Game? {
    var newGame = game
    
    switch team {
    case game.teamAName:
        newGame.arrayOfScoringEventsForTeamA.append(event)
    case game.teamBName:
        newGame.arrayOfScoringEventsForTeamB.append(event)
    default:
        return nil
    }
    return newGame
}






