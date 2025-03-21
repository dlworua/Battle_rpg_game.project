import "dart:io";
import "dart:math";

void main() {
  Character character = Character('name', 1, 2, 3);
  Monster monster = Monster('name', 1);
  Game game = Game(character, [monster], 1);
  game.startGame();
  //파일로부터 데이터 읽어오기
  var characterStat = File('characters.txt');
  //첫번째 파일 읽어와서 String 타입의 변수에 담기
  String text = characterStat.readAsStringSync();
  //두번째 읽어온 문자열을 ,단위로 분류해서 List<String>타입으로 담기
  List<String> stats = text.split(',');
  print(stats);
  //세번째 List<String>안에 있는 값들을 int로 바꾸기
  // List<int> stats = stat as int;
  var monsterStat = File('monsters.txt');
  monsterStat.readAsLinesSync();
}

//캐릭터 클래스 생성
class Character {
  String name;
  int hp;
  int op;
  int dp;

  Character(this.name, this.hp, this.op, this.dp);
  //공격 메서드
  void attackMonster(Monster monster) {}
  //방어 메서드
  void defend() {}
  //상태를 출력하는 메서드
  void showStatus() {}
}

//몬스터 클래스
class Monster {
  String name;
  int hp;

  Monster(this.name, this.hp);
  //공격 메서드
  void attackCharacter(Character character) {}
  // 상태 출력 메서드
  void showStatus() {}
}

//게임을 시작하는 메서드
class Game {
  Character character;
  List<Monster> monsters;
  int count;
  Game(this.character, this.monsters, this.count);
  //게임을 시작하는 메서드
  void startGame() {
    while (character.hp > 0) {
      print('다음 몬스터와 대결하시겠습니까? (y/n)');
      battle();
    }
    //게임종료
    //몬스터를 물리칠때마다 다음몬스터와 대결 할 것인지 선택
  }

  // 전투를 진행하는 메서드
  void battle() {
    print('공격은 1번, 방어는 2번');
    //입력받기
    String? input = stdin.readLineSync();
    //공격하기 (1)
    if (input == '1') {
      print('공격');
    }
    //방어하기 (2)
    if (input == '2') {
      print('방어');
    }
    //
  }

  //랜덤으로 몬스터를 불러오는 메서드
  Monster getRandomMonster() {
    //random값 구하기 , 0~몬스터 리스트 개수 -1까지
    Random random = Random();
    int randomValue = random.nextInt(monsters.length);
    return monsters[randomValue];
  }
}

//  >>필수기능
//몬스터 리스트

void startGame() {}

//전투를 진행하는 메서드
void battle() {}
//물리친 몬스터 개수(몬스터 리스트개수보다 크면안됨)



//파일 읽기 print(file.readAsStringSync());

//파일 쓰기
//String contents = '파일에 쓸 내용';
//file.writeAsStringSync(contents);

/* 1.랜덤으로 값을 뽑아내는 기능
   2.파일 입출력을 처리하는 기능
   3.객체 지향을 활용한 전체구조 생각하기
*/