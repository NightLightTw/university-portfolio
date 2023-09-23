//五子棋
#include<iostream>
#include<iomanip>
#include<cmath>
#include<fstream>
using namespace std;

//選單
class Menu: public fstream
{
    public:
        void setStep(int);
        int getStep();
        void showMenu();
        void gameStart();
        void showRecord();
        void howtogame();
    protected:
        char choice;
        int step;
};

void Menu:: setStep(int x)
{
    step = x;
}

int Menu:: getStep()
{
    return step;
}

void Menu:: showMenu()
{   
    while (step == 1)
    {
        cout<<"----------選單----------"<<endl;
        cout<<"1: 遊戲開始"<<endl;
        cout<<"2: 對弈紀錄"<<endl;
        cout<<"3: 遊戲說明"<<endl;
        cout<<"q: 離開程式"<<endl;
        cout<<endl;

        cout<<"請輸入選項： ";
        cin>>choice;
        switch (choice)
        {
            case '1':
                gameStart();
                break;
            case '2':
                showRecord();
                break;
            case '3':
                howtogame();
                break;
            case 'q': cout<<"\nBye Bye!\n";
                exit(1);
            default :cout<<"錯誤選項\n\n";
        }
    }
}

void Menu::gameStart()
{
    setStep(2);
    cout<<"遊戲開始"<<endl;
}

void Menu::showRecord()
{   
    cout<<"對弈紀錄: "<<endl;
    cout<<"尚未完成"<<endl;
}

void Menu::howtogame()
{
    cout<<"-----------說明-----------"<<endl;
    cout<<"遊戲玩法： Free-style Gomoku規則"<<endl;
    cout<<"1. 遊戲棋盤為15*15。"<<endl;
    cout<<"2. 黑子先行，黑白雙方輪流落子。"<<endl;
    cout<<"3. 黑子由電腦和玩家隨機挑選，另者為白子。"<<endl;
    cout<<"4. 首先在橫、豎、斜方向上成五（連續五個己方棋子）者為勝。"<<endl;
}

//game
class Game: public Menu
{
    protected:
        int x,y,k;
        int zi;
        int bZi;
        int wZi;
        char checkYN;
        int inputData[15][15];//資料儲存與座標差-1
        string chessData[15][15];
    public:
        void initialGame();
        void showBoard();
        void boolWin();
        void play();
        void inputLocal();
        void turnData();
        void whoFirst();
        void player();
        void computer();
};

void Game::initialGame()
{
    //初始化
    bZi = 1;
    wZi = 2;
    x = 1;
    y = 1;
    k = -1;
    zi = -1;

    for(int i = 0;i<15;i++) //y
    {
        for(int j = 0;j<15;j++) //x
        {
            inputData[i][j] = 0;//預設為0
        }
    }

    for(int i = 0;i<15;i++) //y
    {
        for(int j = 0;j<15;j++) //x
        {
            chessData[i][j] = " ";//預設為空白
        }

    }
}

void Game::showBoard()
{
    turnData();
    //棋盤chesssData[y][x]
    cout<<"    001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 "<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"001| "<<chessData[0][0]<<" | "<<chessData[0][1]<<" | "<<chessData[0][2]<<" | "<<chessData[0][3]<<" | "<<chessData[0][4]<<" | "<<chessData[0][5]<<" | "<<chessData[0][6]<<" | "<<chessData[0][7]<<" | "<<chessData[0][8]<<" | "<<chessData[0][9]<<" | "<<chessData[0][10]<<" | "<<chessData[0][11]<<" | "<<chessData[0][12]<<" | "<<chessData[0][13]<<" | "<<chessData[0][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"002| "<<chessData[1][0]<<" | "<<chessData[1][1]<<" | "<<chessData[1][2]<<" | "<<chessData[1][3]<<" | "<<chessData[1][4]<<" | "<<chessData[1][5]<<" | "<<chessData[1][6]<<" | "<<chessData[1][7]<<" | "<<chessData[1][8]<<" | "<<chessData[1][9]<<" | "<<chessData[1][10]<<" | "<<chessData[1][11]<<" | "<<chessData[1][12]<<" | "<<chessData[1][13]<<" | "<<chessData[1][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"003| "<<chessData[2][0]<<" | "<<chessData[2][1]<<" | "<<chessData[2][2]<<" | "<<chessData[2][3]<<" | "<<chessData[2][4]<<" | "<<chessData[2][5]<<" | "<<chessData[2][6]<<" | "<<chessData[2][7]<<" | "<<chessData[2][8]<<" | "<<chessData[2][9]<<" | "<<chessData[2][10]<<" | "<<chessData[2][11]<<" | "<<chessData[2][12]<<" | "<<chessData[2][13]<<" | "<<chessData[2][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"004| "<<chessData[3][0]<<" | "<<chessData[3][1]<<" | "<<chessData[3][2]<<" | "<<chessData[3][3]<<" | "<<chessData[3][4]<<" | "<<chessData[3][5]<<" | "<<chessData[3][6]<<" | "<<chessData[3][7]<<" | "<<chessData[3][8]<<" | "<<chessData[3][9]<<" | "<<chessData[3][10]<<" | "<<chessData[3][11]<<" | "<<chessData[3][12]<<" | "<<chessData[3][13]<<" | "<<chessData[3][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"005| "<<chessData[4][0]<<" | "<<chessData[4][1]<<" | "<<chessData[4][2]<<" | "<<chessData[4][3]<<" | "<<chessData[4][4]<<" | "<<chessData[4][5]<<" | "<<chessData[4][6]<<" | "<<chessData[4][7]<<" | "<<chessData[4][8]<<" | "<<chessData[4][9]<<" | "<<chessData[4][10]<<" | "<<chessData[4][11]<<" | "<<chessData[4][12]<<" | "<<chessData[4][13]<<" | "<<chessData[4][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"006| "<<chessData[5][0]<<" | "<<chessData[5][1]<<" | "<<chessData[5][2]<<" | "<<chessData[5][3]<<" | "<<chessData[5][4]<<" | "<<chessData[5][5]<<" | "<<chessData[5][6]<<" | "<<chessData[5][7]<<" | "<<chessData[5][8]<<" | "<<chessData[5][9]<<" | "<<chessData[5][10]<<" | "<<chessData[5][11]<<" | "<<chessData[5][12]<<" | "<<chessData[5][13]<<" | "<<chessData[5][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"007| "<<chessData[6][0]<<" | "<<chessData[6][1]<<" | "<<chessData[6][2]<<" | "<<chessData[6][3]<<" | "<<chessData[6][4]<<" | "<<chessData[6][5]<<" | "<<chessData[6][6]<<" | "<<chessData[6][7]<<" | "<<chessData[6][8]<<" | "<<chessData[6][9]<<" | "<<chessData[6][10]<<" | "<<chessData[6][11]<<" | "<<chessData[6][12]<<" | "<<chessData[6][13]<<" | "<<chessData[6][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"008| "<<chessData[7][0]<<" | "<<chessData[7][1]<<" | "<<chessData[7][2]<<" | "<<chessData[7][3]<<" | "<<chessData[7][4]<<" | "<<chessData[7][5]<<" | "<<chessData[7][6]<<" | "<<chessData[7][7]<<" | "<<chessData[7][8]<<" | "<<chessData[7][9]<<" | "<<chessData[7][10]<<" | "<<chessData[7][11]<<" | "<<chessData[7][12]<<" | "<<chessData[7][13]<<" | "<<chessData[7][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"009| "<<chessData[8][0]<<" | "<<chessData[8][1]<<" | "<<chessData[8][2]<<" | "<<chessData[8][3]<<" | "<<chessData[8][4]<<" | "<<chessData[8][5]<<" | "<<chessData[8][6]<<" | "<<chessData[8][7]<<" | "<<chessData[8][8]<<" | "<<chessData[8][9]<<" | "<<chessData[8][10]<<" | "<<chessData[8][11]<<" | "<<chessData[8][12]<<" | "<<chessData[8][13]<<" | "<<chessData[8][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"010| "<<chessData[9][0]<<" | "<<chessData[9][1]<<" | "<<chessData[9][2]<<" | "<<chessData[9][3]<<" | "<<chessData[9][4]<<" | "<<chessData[9][5]<<" | "<<chessData[9][6]<<" | "<<chessData[9][7]<<" | "<<chessData[9][8]<<" | "<<chessData[9][9]<<" | "<<chessData[9][10]<<" | "<<chessData[9][11]<<" | "<<chessData[9][12]<<" | "<<chessData[9][13]<<" | "<<chessData[9][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"011| "<<chessData[10][0]<<" | "<<chessData[10][1]<<" | "<<chessData[10][2]<<" | "<<chessData[10][3]<<" | "<<chessData[10][4]<<" | "<<chessData[10][5]<<" | "<<chessData[10][6]<<" | "<<chessData[10][7]<<" | "<<chessData[10][8]<<" | "<<chessData[10][9]<<" | "<<chessData[10][10]<<" | "<<chessData[10][11]<<" | "<<chessData[10][12]<<" | "<<chessData[10][13]<<" | "<<chessData[10][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"012| "<<chessData[11][0]<<" | "<<chessData[11][1]<<" | "<<chessData[11][2]<<" | "<<chessData[11][3]<<" | "<<chessData[11][4]<<" | "<<chessData[11][5]<<" | "<<chessData[11][6]<<" | "<<chessData[11][7]<<" | "<<chessData[11][8]<<" | "<<chessData[11][9]<<" | "<<chessData[11][10]<<" | "<<chessData[11][11]<<" | "<<chessData[11][12]<<" | "<<chessData[11][13]<<" | "<<chessData[11][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"013| "<<chessData[12][0]<<" | "<<chessData[12][1]<<" | "<<chessData[12][2]<<" | "<<chessData[12][3]<<" | "<<chessData[12][4]<<" | "<<chessData[12][5]<<" | "<<chessData[12][6]<<" | "<<chessData[12][7]<<" | "<<chessData[12][8]<<" | "<<chessData[12][9]<<" | "<<chessData[12][10]<<" | "<<chessData[12][11]<<" | "<<chessData[12][12]<<" | "<<chessData[12][13]<<" | "<<chessData[12][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"014| "<<chessData[13][0]<<" | "<<chessData[13][1]<<" | "<<chessData[13][2]<<" | "<<chessData[13][3]<<" | "<<chessData[13][4]<<" | "<<chessData[13][5]<<" | "<<chessData[13][6]<<" | "<<chessData[13][7]<<" | "<<chessData[13][8]<<" | "<<chessData[13][9]<<" | "<<chessData[13][10]<<" | "<<chessData[13][11]<<" | "<<chessData[13][12]<<" | "<<chessData[13][13]<<" | "<<chessData[13][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
    cout<<"015| "<<chessData[14][0]<<" | "<<chessData[14][1]<<" | "<<chessData[14][2]<<" | "<<chessData[14][3]<<" | "<<chessData[14][4]<<" | "<<chessData[14][5]<<" | "<<chessData[14][6]<<" | "<<chessData[14][7]<<" | "<<chessData[14][8]<<" | "<<chessData[14][9]<<" | "<<chessData[14][10]<<" | "<<chessData[14][11]<<" | "<<chessData[14][12]<<" | "<<chessData[14][13]<<" | "<<chessData[14][14]<<" |"<<endl;
    cout<<"    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- "<<endl;
}

void Game::boolWin()
{
    int win = 0;
    //直連五獲勝
    int colScore = 1;
    for(int i=1;;i++)
    {
        if(inputData[y-1+i][x-1] == zi)//往上連
        {
            colScore++;
        }
        else break;
    }
    for(int i=1;;i++)
    {
        if(inputData[y-1-i][x-1] == zi)//往下連
        {
            colScore++;
        }
        else break;
    }

    if(colScore>=5)
    {
        win = 1;
    }
    //橫連五獲勝
    int rowScore = 1;
    for(int i=1;;i++)
    {
        if(inputData[y-1][x-1+i] == zi)//往右連
        {
            rowScore++;
        }
        else break;
    }
    for(int i=1;;i++)
    {
        if(inputData[y-1][x-1-i] == zi)//往左連
        {
            rowScore++;
        }
        else break;
    }

    if(rowScore>=5)
    {
        win = 1;
    }
    //左斜連五獲勝
    int leftScore = 1;
    for(int i=1;i<15;i++)
    {
        if(inputData[y-1-i][x-1-i] == zi)//往左上連
        {
            leftScore++;
        }
        else break;
    }
    for(int i=1;;i++)
    {
        if(inputData[y-1+i][x-1+i] == zi)//往右下連
        {
            leftScore++;
        }
        else break;
    }

    if(leftScore>=5)
    {
        win = 1;
    }
    //右斜連五獲勝
    int rightScore = 1;
    for(int i=1;;i++)
    {
        if(inputData[y-1-i][x-1+i] == zi)//往右上連
        {
            rightScore++;
        }
        else break;
    }
    for(int i=1;;i++)
    {
        if(inputData[y-1+i][x-1-i] == zi)//往左下連
        {
            rightScore++;
        }
        else break;
    }

    if(rightScore>=5)
    {
        win = 1;
    }

    //XX獲勝，返回選單，將結果寫入文件
    if(win == 1)
    {
        if(zi == 1)
        {
            cout<<"黑子獲勝!!!"<<endl;
            cout<<"返回選單。"<<endl;
            setStep(1);
        }
        if(zi == 2)
        {
            cout<<"白子獲勝!!!"<<endl;
            cout<<"返回選單。"<<endl;
            setStep(1);
        }
    }
}

void Game::play()
{
    whoFirst();
    showBoard();//空棋盤
    while(step == 2)
    {
        if(k == 0)
        {
            cout<<"電腦回合！"<<endl;
            computer();
            showBoard();
            boolWin();
            if(step == 1)
            {
                break;
            }
            cout<<"玩家回合！"<<endl;
            player();
        }
        if(k == 1)
        {
            cout<<"玩家回合！"<<endl;
            player();
            showBoard();
            boolWin();
            if(step == 1)
            {
                break;
            }
            cout<<"電腦回合！"<<endl;
            computer();
        }
        showBoard();
        boolWin();
        if(step == 1)
            {
                break;
            }
    }
}



void Game::turnData()
{
    //轉換
    for(int i = 0;i<15;i++)
    {
        for(int j = 0;j<15;j++)
        {
            if(inputData[i][j] == 0)
            {
                chessData[i][j] = " ";
            }
            if(inputData[i][j] == 1)
            {
                chessData[i][j] = "●";
            }
            if(inputData[i][j] == 2)
            {
                chessData[i][j] = "○";
            }
        }
    }
}

void Game::whoFirst()
{
    cout<<"選擇誰先手（0)電腦（1)玩家： "<<endl;
    cin>>k;
    if(k == 0)
    {
        cout<<"電腦先手！"<<endl;
    }
    else//1為玩家先手
    {
        cout<<"玩家先手！"<<endl;
    }
}

void Game::computer()
{
    while(1)
    {
        srand(unsigned(time(NULL)));
        x = abs(rand()%15 + 1);
        y = abs((rand()*487)%15 + 1);
        if(k == 0)
        {
            zi = bZi;
        }
        if(k == 1)
        {
            zi = wZi;
        }

        if(inputData[y-1][x-1] == 0)//落點無子
            {
                break;
            }
    }
    inputData[y-1][x-1] = zi;
    cout<<"電腦下("<<y<<","<<x<<")"<<endl;
}

void Game::player()
{
    //與電腦相反
    if(k == 1)
    {
        zi = bZi;
    }
    if(k == 0)
    {
        zi = wZi;
    }
    
    while(1)
    {
        cout<<"你要輸入的位置（y,x): "<<endl;
        cout<<"y: ";
        cin>>y;
        cout<<"x: ";
        cin>>x;
        cout<<"確定下"<<"("<<y<<","<<x<<")? (y/n)"<<endl;
        cin>>checkYN;
        if(checkYN =='y')//是否正確
        {
            if(inputData[y-1][x-1] == 0)//落點無子
            {
                break;
            }
            if(inputData[y-1][x-1] == zi)
            {
                continue;
            }
        }
    }

    inputData[y-1][x-1] = zi;//確定輸入
}

int main()
{
    Menu menu;
    Game game;
    menu.setStep(1);
    game.setStep(2);
    while(1) 
    {
        while(menu.getStep() == 1)
        {
            menu.showMenu();
            game.initialGame();
        }
        while(menu.getStep() == 2)
        {
            game.setStep(2);
            game.play();
            menu.setStep(game.getStep());
        }    
    }
    
    return 0;

}