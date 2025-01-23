package tictactoe;
import java.util.Scanner;

public class TicTacToe {
    private static final int SIZE = 3;
    private static final char EMPTY = '-';
    private static final char PLAYER1_SYMBOL = 'O';
    private static final char PLAYER2_SYMBOL = 'X';

    public static void main(String[] args) {
        char[][] board = new char[SIZE][SIZE];
        initializeBoard(board);

        Scanner scanner = new Scanner(System.in);
        boolean player1Turn = true;
        boolean gameWon = false;

        while (true) {
            printBoard(board);
            System.out.println("Player " + (player1Turn ? "1 (O)" : "2 (X)") + " move: ");
            
            int x = scanner.nextInt();
            int y = scanner.nextInt();
            
            if (!isValidMove(board, x, y)) {
                System.out.println("Invalid move. Try again.");
                continue;
            }

            board[x][y] = player1Turn ? PLAYER1_SYMBOL : PLAYER2_SYMBOL;

            if (checkWin(board, player1Turn ? PLAYER1_SYMBOL : PLAYER2_SYMBOL)) {
                printBoard(board);
                System.out.println("Player " + (player1Turn ? "1 (O)" : "2 (X)") + " wins!");
                gameWon = true;
                break;
            }

            if (isBoardFull(board)) {
                printBoard(board);
                System.out.println("It's a draw!");
                break;
            }

            player1Turn = !player1Turn;
        }

        scanner.close();
    }

    private static void initializeBoard(char[][] board) {
        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {
                board[i][j] = EMPTY;
            }
        }
    }

    private static void printBoard(char[][] board) {
        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {
                System.out.print(board[i][j] + " ");
            }
            System.out.println();
        }
    }

    private static boolean isValidMove(char[][] board, int x, int y) {
        return x >= 0 && x < SIZE && y >= 0 && y < SIZE && board[x][y] == EMPTY;
    }

    private static boolean isBoardFull(char[][] board) {
        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {
                if (board[i][j] == EMPTY) {
                    return false;
                }
            }
        }
        return true;
    }

    private static boolean checkWin(char[][] board, char symbol) {
        // Check rows
        for (int i = 0; i < SIZE; i++) {
            if (board[i][0] == symbol && board[i][1] == symbol && board[i][2] == symbol) {
                return true;
            }
        }

        // Check columns
        for (int j = 0; j < SIZE; j++) {
            if (board[0][j] == symbol && board[1][j] == symbol && board[2][j] == symbol) {
                return true;
            }
        }

        // Check diagonals
        if (board[0][0] == symbol && board[1][1] == symbol && board[2][2] == symbol) {
            return true;
        }

        if (board[0][2] == symbol && board[1][1] == symbol && board[2][0] == symbol) {
            return true;
        }

        return false;
    }
}
