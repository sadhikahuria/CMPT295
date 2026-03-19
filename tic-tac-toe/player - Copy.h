#ifndef PLAYER_H
#define PLAYER_H

class Player{
    public:
        int playernum;
        int board_data[9] = {0};
        char name[1024];
        Player(int num);
        ~Player();
        char* getname();
        void updatedata(int index);

        void printwinner();
        bool symmetry();


};

class Board {
    public:

        char board[9] = {'0', '1' , '2', '3', '4', '5', '6', '7', '8' };
        int reserved[9] = {0};
        bool checkTie();


        int getindex(Player p);
};
#endif
