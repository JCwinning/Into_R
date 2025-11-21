library(shiny)

# UI
ui <- fluidPage(
  titlePanel("Connect Four"),
  sidebarLayout(
    sidebarPanel(
      actionButton("reset", "New Game"),
      hr(),
      uiOutput("game_status_ui")
    ),
    mainPanel(
      uiOutput("board")
    )
  )
)

# Server
server <- function(input, output, session) {

  # Game state
  game <- reactiveValues(
    board = matrix(0, 6, 7),
    current_player = 1,
    winner = 0 # 0: in progress, 1: player 1 wins, 2: player 2 wins, -1: draw
  )

  # Game Status UI (current player)
  output$game_status_ui <- renderUI({
    if (game$winner == 0) {
      player_color_name <- if (game$current_player == 1) "Red" else "Yellow"
      player_color_hex <- if (game$current_player == 1) "red" else "yellow"
      tagList(
        h4("Current Turn:"),
        div(
          style = paste0(
            "width: 30px; height: 30px; background-color: ", player_color_hex, "; ",
            "border-radius: 50%; display: inline-block; vertical-align: middle; border: 1px solid black;"
          )
        ),
        tags$span(player_color_name, style = "font-size: 18px; vertical-align: middle; margin-left: 10px;")
      )
    }
  })

  # Create the game board UI
  output$board <- renderUI({
    board_matrix <- game$board

    # Column buttons on top
    col_buttons <- fluidRow(
      lapply(1:7, function(col) {
        actionButton(
          inputId = paste0("col_", col),
          label = as.character(col),
          style = "width: 50px; height: 50px; border-radius: 50%; margin: 2px;"
        )
      })
    )

    # The grid of circles
    board_html <- lapply(1:6, function(row) {
      fluidRow(
        lapply(1:7, function(col) {
          cell_value <- board_matrix[row, col]
          cell_color <- if (cell_value == 1) "red" else if (cell_value == 2) "yellow" else "lightgrey"
          div(
            style = paste0(
              "display:inline-block; vertical-align:top; ",
              "width:50px; height:50px; background-color:", cell_color, "; ",
              "border: 1px solid black; border-radius: 50%; margin: 2px;"
            )
          )
        })
      )
    })

    tagList(col_buttons, board_html)
  })

  # Handle column clicks
  observe({
    lapply(1:7, function(col) {
      observeEvent(input[[paste0("col_", col)]], {
        # Proceed only if game is not over
        if (game$winner == 0) {
          # Find the lowest empty cell in the column
          empty_cells <- which(game$board[, col] == 0)
          if (length(empty_cells) > 0) {
            row <- max(empty_cells)
            game$board[row, col] <- game$current_player

            # Check for winner
            if (check_winner(game$board, game$current_player)) {
              game$winner <- game$current_player
              winner_color <- if (game$winner == 1) "Red" else "Yellow"
              showModal(modalDialog(
                title = "Game Over",
                paste(winner_color, "wins!"),
                easyClose = TRUE,
                footer = NULL
              ))
            } else if (all(game$board != 0)) { # Check for a draw
                game$winner <- -1 # Using -1 to signify a draw
                showModal(modalDialog(
                    title = "Game Over",
                    "It's a draw!",
                    easyClose = TRUE,
                    footer = NULL
                ))
            } else {
              # Switch player
              game$current_player <- if (game$current_player == 1) 2 else 1
            }
          }
        }
      })
    })
  })

  # Check for a winner
  check_winner <- function(board, player) {
    # Check rows
    for (r in 1:6) {
      for (c in 1:4) {
        if (all(board[r, c:(c + 3)] == player)) return(TRUE)
      }
    }

    # Check columns
    for (r in 1:3) {
      for (c in 1:7) {
        if (all(board[r:(r + 3), c] == player)) return(TRUE)
      }
    }

    # Check diagonals (top-left to bottom-right)
    for (r in 1:3) {
      for (c in 1:4) {
        if (all(diag(board[r:(r + 3), c:(c + 3)]) == player)) return(TRUE)
      }
    }

    # Check diagonals (top-right to bottom-left)
    for (r in 1:3) {
      for (c in 4:7) {
        if (all(c(board[r, c], board[r + 1, c - 1], board[r + 2, c - 2], board[r + 3, c - 3]) == player)) {
          return(TRUE)
        }
      }
    }

    return(FALSE)
  }

  # Reset the game
  observeEvent(input$reset, {
    game$board <- matrix(0, 6, 7)
    game$current_player <- 1
    game$winner <- 0
  })

}

# Run the app
shinyApp(ui = ui, server = server)
