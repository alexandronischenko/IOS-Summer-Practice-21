import UIKit

var NAMES = ["Liam", "Olivia", "Noah", "Emma", "Oliver", "Ava", "Elijah", "Charlotte", "William", "Sophia", "James", "Amelia", "Benjamin", "Lucas", "Mia", "Henry", "Evelyn", "Alexander", "Harper"]

// MARK: Objects

class Player: Equatable{
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name
    }
    
    var name: String
    var damage: Int = 2
    var health: Int = 7
    
    init(newName: String) {
        name = newName
    }
    
    func Attack(opponent: Player){
        if opponent.IsAlive() {
            if (Int.random(in: 0...9) > 4){
                opponent.health -= damage
            }
        }
    }
    
    func IsAlive() -> Bool{
        if health > 0 {
            return true
        }
        return false
    }
}


class Team{
    var number: Int
    var players = [Player]()
    
    init(num: Int) {
        number = num
        for _ in 0...4{
            players.append(Player(newName: NAMES[Int.random(in: 0...18)]))
        }
    }
    
    func IsAlive() -> Bool{
        if players.count > 1
        {
            return true
        }
        return false
    }
    
    public var description: String { return "\(players[0].name), \(players[1].name), \(players[2].name), \(players[3].name), \(players[4].name)" }
}

// MARK: - CONTROLS
class GameController{
    var teams = [Team]()
    var survivedTeams = [Team]()
    
    func Preparing(n: Int){
        print("Создание команд...")
        let countOfTeams = Int(truncating: NSDecimalNumber(decimal: pow(2, n)))
        
        for i in 0..<countOfTeams {
            let newTeam = Team(num: i)
            print("Команда \(newTeam.number) сформирована. Участники: \(newTeam.description)")
            teams.append(newTeam)
        }
        print("Команды готовы к битве!\n")
    }
    
    func Start(){
        print("Команды высадились на остров")
        while teams.count > 1 {
            print("___Поиск лута___")
            LootSearching()
            print("___Поиск лута завершен___")
            print()
            
            for i in 0...teams.count - 1 where i % 2 == 0 {
                let firstTeam = teams[i]
                let secondTeam = teams[i + 1]
                
                print("___Команда \(firstTeam.number) напала на команду \(secondTeam.number)___")
                let newSurvivedTeam = Fight(attacker: firstTeam, defender: secondTeam)
                
                print("-После битвы у команды \(newSurvivedTeam.number) осталось \(newSurvivedTeam.players.count) игрока-")
                survivedTeams.append(newSurvivedTeam)
                
                print("===Команда \(newSurvivedTeam.number) победила===\n")
            }
            CreateNewTournament()
        }
        print("Команда \(teams.first!.number) победила")
    }
    // return killed team
    func Fight(attacker: Team, defender: Team) -> Team{
        while attacker.IsAlive() && defender.IsAlive() {
            
            var attackerPlayer = attacker.players.randomElement()
            var defenderPlayer = defender.players.randomElement()
            attackerPlayer?.Attack(opponent: defenderPlayer!)
            
            print("\(attackerPlayer?.name ?? "") напал на \(defenderPlayer?.name ?? "")")
            if !defenderPlayer!.IsAlive() {
                print("\(defenderPlayer?.name ?? "") умер в ходе битвы")
                if let index = defender.players.firstIndex(of: defenderPlayer!) {
                    defender.players.remove(at: index)
                }
            }
            
            attackerPlayer = attacker.players.randomElement()
            defenderPlayer = defender.players.randomElement()
            defenderPlayer?.Attack(opponent: attackerPlayer!)
            
            print("\(defenderPlayer?.name ?? "") напал на \(attackerPlayer?.name ?? "")")
            if !attackerPlayer!.IsAlive() {
                print("\(attackerPlayer?.name ?? "") умер в ходе битвы")
                if let index = attacker.players.firstIndex(of: attackerPlayer!) {
                    attacker.players.remove(at: index)
                }
            }
        }
        
        if attacker.IsAlive() {
            return attacker
        }
        return defender
    }
    
    func LootSearching(){
        for i in 0...teams.count - 1 {
            for _ in teams[i].players{
                let found = Int.random(in: 0...2)
                if(found == 0){
                    let damage = Int.random(in: 1...3)
                    let player = teams[i].players.randomElement()
                    player?.health -= damage
                    print("Игрок \(player?.name ?? "") попал в ловушку к жизням -\(damage)")
                }
                if(found == 1){
                    let weapon = Int.random(in: 1...3)
                    let player = teams[i].players.randomElement()
                    player?.damage += weapon
                    print("Игрок \(player?.name ?? "") получил к урону +\(weapon)")
                }
                if(found == 2){
                    let heal = Int.random(in: 1...3)
                    let player = teams[i].players.randomElement()
                    player?.damage += heal
                    print("Игрок \(player?.name ?? "") получил к жизням +\(heal)")
                }
                
            }
        }
    }
    
    func CreateNewTournament()
    {
        teams.removeAll()
        for team in survivedTeams {
            teams.append(team)
        }
        survivedTeams.removeAll()
    }
}

var game = GameController()
game.Preparing(n: 4)
game.Start()
