# Movie Theater

Goal: Selling movie tickets online and tracking orders.

Requirements:

- List all movies playing with cost
- Display showtimes for each movie
- Do not allow customer to buy tickets to a sold out showing (finite number of tickets per showtime)
- Must pick a showtime first before selecting number of tickets (can buy multiple tickets at once)
- Capture on checkout:
  - Name
  - Email
  - Credit Card Number
  - Credit Card Expiration
- Check for validation errors and display them:
  - All fields required
  - Valid email address format
  - Valid Credit Card Number
  - Valid Expiration Date (in the future)
- Will not integrate with CC processor for now
- Send an unstyle email after order completion with:
  - Order Details:
    - Movie Name
    - Showtime (date & time)
  - Dollar Total
- Seed the database (no admin management)
- Save orders to the database
- Create an unauthenticated admin dashboard to view orders
  - List of all orders
  - List of orders for each movie
  - Summary of:
    - Most popular movies
    - Most popular times of the day to see a movie
    - Total revenue
    - Revenue by day of the week
- Site must work on mobile
- Capture thought processes in Readme file
- Push code to GitHub and delpoy to Heroku (provide both links when finished)

- Created [DB Diagram](https://dbdiagram.io/d/60a2e757b29a09603d154743)

- Not sure if a Customer should have orders or if an Order should have customers.
