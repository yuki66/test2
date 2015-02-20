//
//  QuizViewController.m
//  QuizSample
//
//  Created by Master on 2014/11/01.
//  Copyright (c) 2014年 net.masuhara. All rights reserved.
//

#import "QuizViewController.h"


@interface QuizViewController ()
<UIAlertViewDelegate>

@end

@implementation QuizViewController

{
    int currentQuiz;
    int correctAnswer;
    AVAudioPlayer *questionSound, *correctSound, *incorrectSound;
    NSMutableArray *quizArray;
    IBOutlet UITextView *problemTextView;
    IBOutlet UIImageView *quizImageView;
    IBOutlet UIButton *buttonA, *buttonB, *buttonC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    currentQuiz = 0;
    correctAnswer = 0;
    
    quizArray = [NSMutableArray new];
    quizArray = [self shuffleQuiz:[self setQuiz]];
    
    buttonA.tag = 1;
    buttonB.tag = 2;
    buttonC.tag = 3;
    
    
    [self setSounds];
    [self setQuestions];
}

- (void)viewDidAppear:(BOOL)animated
{
    [questionSound play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (NSMutableArray *)shuffleQuiz:(NSMutableArray *)qArray
{
    int numberOfQuiz = (int)[qArray count];
    
    for (int i = numberOfQuiz - 1; i > 0; i--) {
        int randNumber = arc4random() % i;
        [qArray exchangeObjectAtIndex:i withObjectAtIndex:randNumber];
    }
    
    NSLog(@"問題一覧 %@", qArray);
    
    return qArray;
}



#pragma mark - IBAction

- (IBAction)selectAnswer:(UIButton *)selectedButton
{
    if (selectedButton.tag == [[quizArray[currentQuiz] objectAtIndex:0] intValue]) {
        //正解だったとき
        [correctSound play];
        correctAnswer++;
    }else{
        //不正解だったとき
        [incorrectSound play];
    }
    
    currentQuiz++;
    [self setQuestions];
}


#pragma mark - Sounds

- (void)setSounds
{
    //問題が出たときの音
    NSString *questionSoundPath = [[NSBundle mainBundle] pathForResource:@"question" ofType:@"wav"];
    NSURL *questionSoundURL = [NSURL fileURLWithPath:questionSoundPath];
    
    //正解したときの音
    NSString *correctSoundPath = [[NSBundle mainBundle] pathForResource:@"correct" ofType:@"wav"];
    NSURL *correctSoundURL = [NSURL fileURLWithPath:correctSoundPath];
    
    //不正解だったときの音
    NSString *incorrectSoundPath = [[NSBundle mainBundle] pathForResource:@"incorrect" ofType:@"wav"];
    NSURL *incorrectSoundURL = [NSURL fileURLWithPath:incorrectSoundPath];
    
    
    questionSound = [[AVAudioPlayer alloc] initWithContentsOfURL:questionSoundURL error:nil];
    correctSound = [[AVAudioPlayer alloc] initWithContentsOfURL:correctSoundURL error:nil];
    incorrectSound = [[AVAudioPlayer alloc] initWithContentsOfURL:incorrectSoundURL error:nil];
    
    [questionSound prepareToPlay];
    [correctSound prepareToPlay];
    [incorrectSound prepareToPlay];
}



#pragma mark - Quiz

- (NSMutableArray *)setQuiz
{
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"yjimage-3.jpeg"], @"この絵が描かれたときの中国の名前は？", @"清", @"唐", @"元", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"yjimage-4.jpeg"], @"これは何についての絵？", @"原子力ロケット", @"核ミサイル", @"虫眼鏡", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"nichiro07021605.jpg"], @"この絵の右の船はどこの国？", @"フランス", @"中国", @"ロシア", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"nichiro07021603.jpg"], @"この絵の左の人物は？", @"ロシア人", @"イギリス人", @"アメリカ人", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"1324bf7e.jpg"], @"男性が墓型の投票箱に入れようとしている紙には何書かれているか？", @"白紙", @"もうたくさん", @"金がない", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"c0059946_11222488.jpg"], @"箱や袋は何を表している？", @"権力", @"軍事力", @"金", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"td_0803073.jpg"], @"後ろの人物は？", @"中国人", @"日本人", @"モンゴル人", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"1165748145_1.jpg"], @"この絵はいつ描かれた？", @"日露戦争前", @"第一次世界大戦前", @"第二次世界大戦前", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"2500753.jpg"], @"この絵の中の書き連ねられた文字は何と書いてある？", @"顔が思い出せない", @"意味は無い", @"描いてはいけない", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"PatOliphantAntiZionistCartoon.jpeg"], @"左の人物は？", @"ナチス", @"アメリカ", @"イギリス", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"sahm_zu06.jpg"], @"これは何を表す絵？", @"脱獄", @"国外逃亡", @"独裁政治", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"c0013092_10104946.jpg"], @"この絵で右の人達は何と言っている？", @"また始めてみるか", @"この間に逃げるか", @"これで安心だろう", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"frenchrevolution2.bmp"], @"これはいつ描かれた絵？", @"奴隷解放宣言", @"文明開化", @"フランス革命", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"Zuhan.jpeg"], @"コレはどこの国の絵？", @"イギリス", @"フランス", @"ロシア", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"explain.jpg"], @"右の人物は中国だが左の人物は？", @"日本", @"オーストラリア", @"朝鮮", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"nichiro07021601.jpg"], @"この絵の右の人物は？", @"ロシア", @"アメリカ", @"オーストリア", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"d0011701_623761.jpg"], @"男性が燃やしているのは何？", @"金", @"爪", @"国債", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"Cruikshank_-_Snuffing_out_Boney.png"], @"この風刺画の題名は？", @"イギリスの侵略", @"墓に行け！", @"題名無し", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"kal_unified_europe_4_thumb.gif"], @"これは何について描かれた絵？", @"ベルサイユ条約", @"日米通商条約", @"EU憲法条約", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"Carica2.jpeg"], @"これは何処についての絵？", @"フランス", @"イタリア", @"マドリード", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"picture01.jpg"], @"この絵は「草を編みて薦となす、雑皮にて表を偽り、縁るに文皮を以てす。」と書かれていた絵であるが何についてのものか？", @"畳", @"桑", @"茶", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"picture02.jpg"], @"これは今昔物語に載っていた絵だが何の絵か？", @"藺笠", @"藁麦", @"脱穀", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"picture04.jpg"], @"この絵は井草を加工している図だが、どこで行われている？", @"静岡", @"岡山", @"広島", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"jigyo0118.jpg"], @"この絵は何処についてのものか？", @"越後", @"伊丹", @"長州", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"photo.jpg"], @"左上にいる男は立ち売りの女から何を買おうとしている？", @"布", @"米", @"薬", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"8fe9cad0e85f19290ef86f4c3f4da56f"], @"これは何についての絵か？", @"徒然草", @"源氏物語", @"平家物語", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"E38398E3829AE383B3E794BBE9AEAEE6988EE9BE8DE9A6AC.jpg"], @"この人物の出身は？", @"薩摩", @"長州", @"土佐", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"otsueten_10-04_4.jpg"], @"この図の右の人物は何をしているか？", @"落書きを,している" @"耳を取っている", @"髪を剃っている", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"E99D92E38184E5BA87E381AEE887AAE794BBE5838F-thumbnail2.jpg"], @"この人物は誰か？", @"シャルダン" @"モランディ", @"マラー", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"28dd4862.jpg"], @"この絵画の作者は？", @"ナポレオン" @"ダヴィッド", @"レオナルド", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"9fdbaae0-s.jpg"], @"この絵画の作者は？", @"セザンヌ" @"ゴッホ", @"モネ", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"top_p.jpg"], @"この絵画の作者は？", @"ルノワール" @"セザンヌ", @"モネ", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"w0000006.jpg"], @"これは日本画の富士暮雪であるが作者は誰か？", @"師宜" @"康成", @"広重", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"Satomi_and_the_Eight_“Dogs”_WDL2937.pdf.jpg"], @"この本の作者は？", @"滝沢馬琴" @"歌川國芳", @"十返舎一九", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"01_s.jpg"], @"この絵の人物は何宗か？", @"浄土宗" @"浄土真宗", @"真言宗", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"04.jpg"], @"これはいつの絵か？", @"享禄6年" @"嘉永6年", @"大化6年", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"03.jpg"], @"これはいつ作成されたものであるか？", @"平安" @"江戸", @"明治", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"Martin_Luther_by_Lucas_Cranach_der_Ältere.jpg"], @"この人物が深く関わっている出来事は？", @"宗教改革" @"ルネサンス", @"フランス革命", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"EXP=1423310113.gif"], @"これは何を作っているときの図か？", @"城", @"墓", @"町", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"sen-furuwataribasi.gif"], @"これは何時代の絵か？", @"鎌倉時代", @"江戸時代", @"明治時代", nil]];
   
    return quizArray;

}
- (void)setQuestions
{
    if (currentQuiz < quizArray.count) {
        quizImageView.image = [quizArray[currentQuiz] objectAtIndex:1];
        problemTextView.text = [quizArray[currentQuiz] objectAtIndex:2];
        [buttonA setTitle:[quizArray[currentQuiz] objectAtIndex:3] forState:UIControlStateNormal];
        [buttonB setTitle:[quizArray[currentQuiz] objectAtIndex:4] forState:UIControlStateNormal];
        [buttonC setTitle:[quizArray[currentQuiz] objectAtIndex:5] forState:UIControlStateNormal];
    }else{
        NSString *messageString = [NSString stringWithFormat:@"%d問中、%d問正解でした！",currentQuiz, correctAnswer];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"結果" message:messageString delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            break;
    }
}

@end
