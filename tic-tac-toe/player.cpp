#include "player.h"
#include <iostream>


// class Player{

//     public:
//         int board_data[9];
//         char* name[1024];
        Player::Player(int num){
            playernum = num;
        }
        Player::~Player(){
            delete[] name;
        }
        char* Player::getname(){
            std::cin >> name;

        }
        void Player::updatedata(int index){
            board_data[index] = 1;

        }

        void Player::printwinner(){
            std::cout << name << " has won!";
        }
/*
0 | 1 | 2
3 | 4 | 5
6 | 7 | 8

*/

        Board::Board() {
        }
        
        bool Player::symmetry(){
            bool check = false;

            for (int i = 0; i < 3; i+3) {
                if((board_data[i] == board_data[i+1] == board_data[i+2]) == 1){
                    check == true;
                    return check;
                }
            }
            
            for (int i = 0; i < 3; i++){
                if((board_data[i] == board_data[i+3] == board_data[i+6]) == 1){
                    check = true;
                    return check;
                }
            }

            if ((board_data[0] == board_data[4] == board_data[8]) == 1){
                check = true;
                return check;
            }

            if (board_data[2] == board_data[4] == board_data[6] == 1){
                check = true;
                return check;
            }

            return check;
            
        }

        bool Board::checkTie(){
            bool check = true;
            for (int i = 0; i < 9 ; i++){
                if (reserved[i] == 0){
                    check = false;
                    return check;
                }
            }
        }


int Board::getindex(Player p){
    
    std::cout << p.name << "'s turn, Enter your position: " << std::endl;\
    int index;
    std::cin >> index;
    p.updatedata(index);
    reserved[index] = 1;
        
    

    return index;
}
