
# create a tic_tac_toe game in shiny

library(shiny)

# UI
ui <- fluidPage(
    titlePanel("Tic-Tac-Toe"),
    sidebarLayout(
        sidebarPanel(
            actionButton("new_game", "New Game"),
            h4("Current Player:"),
            textOutput("current_player")
        ),
        mainPanel(
            uiOutput("board"),
            h3(textOutput("game_status"))
        )
    )
)

# Server
server <- function(input, output, session) {

    # Game state
    game <- reactiveValues(
        board = matrix(rep("", 3), nrow = 3, ncol = 3),
        current_player = "X",
        game_over = FALSE,
        winner = NULL
    )

    # Render the game board
    output$board <- renderUI({
        fluidRow(
            lapply(1:3, function(i) {
                column(4,
                    lapply(1:3, function(j) {
                        actionButton(paste0("cell_", i, "_", j), label = game$board[i, j], style = "width:100px; height:100px; font-size: 40px;")
                    })
                )
            })
        )
    })

    # Display current player
    output$current_player <- renderText({
        game$current_player
    })

    # Handle cell clicks
    observe({
        lapply(1:3, function(i) {
            lapply(1:3, function(j) {
                observeEvent(input[[paste0("cell_", i, "_", j)]], {
                    if (game$board[i, j] == "" && !game$game_over) {
                        game$board[i, j] <- game$current_player
                        check_winner()
                        if (!game$game_over) {
                            game$current_player <- ifelse(game$current_player == "X", "O", "X")
                        }
                    }
                })
            })
        })
    })

    # Check for a winner
    check_winner <- function() {
        board <- game$board
        # Check rows
        for (i in 1:3) {
            if (all(board[i, ] == game$current_player) && board[i, 1] != "") {
                game$winner <- game$current_player
                game$game_over <- TRUE
                return()
            }
        }
        # Check columns
        for (j in 1:3) {
            if (all(board[, j] == game$current_player) && board[1, j] != "") {
                game$winner <- game$current_player
                game$game_over <- TRUE
                return()
            }
        }
        # Check diagonals
        if (all(diag(board) == game$current_player) && board[1, 1] != "") {
            game$winner <- game$current_player
            game$game_over <- TRUE
            return()
        }
        if (all(diag(board[ , 3:1]) == game$current_player) && board[1, 3] != "") {
            game$winner <- game$current_player
            game$game_over <- TRUE
            return()
        }
        # Check for a tie
        if (all(board != "")) {
            game$winner <- "Tie"
            game$game_over <- TRUE
        }
    }

    # Display game status
    output$game_status <- renderText({
        if (game$game_over) {
            if (game$winner == "Tie") {
                "It's a tie!"
            } else {
                paste("Player", game$winner, "wins!")
            }
        }
    })

    # New game button
    observeEvent(input$new_game, {
        game$board <- matrix(rep("", 3), nrow = 3, ncol = 3)
        game$current_player <- "X"
        game$game_over <- FALSE
        game$winner <- NULL
    })

}

# Run the application
shinyApp(ui = ui, server = server)
