# [How RCV Works](https://www.fairvote.org/how_rcv_works)

## Problem

Voters pick a first-choice candidate and have the option to rank backup candidates in order of their choice: second, third, and so on. If a candidate receives more than half of the first choices, that candidate wins, just like in any other election. However, if there is no majority winner after counting first choices, the race is decided by an "instant runoff." The candidate with the fewest votes is eliminated, and voters who picked that candidate as ‘number 1’ will have their votes count for their next choice. This process continues until a candidate wins with more than half of the votes.

## Scenarios

### Winner Tiebreaker

| Candidates |
| ---------- |
| Don        |
| Liz        |

| Choice #1 | Choice #2 |
| --------- | --------- |
| Liz       | Don       |
| Liz       | Don       |
| Don       | Liz       |
| Don       | Liz       |

| Winner |
| ------ |
| Liz    |

### One Round of Instant Runoff

| Candidates |
| ---------- |
| Joe        |
| Don        |
| Liz        |

| Choice #1 | Choice #2 | Choice #3 |
| --------- | --------- | --------- |
| Liz       | Joe       | Don       |
| Liz       | Joe       | Don       |
| Don       | Joe       | Liz       |
| Don       | Joe       | Liz       |
| Joe       | Liz       | Don       |

| Winner |
| ------ |
| Liz    |

### Losers Tiebreaker

| Candidates |
| ---------- |
| Joe        |
| Don        |
| Liz        |

| Choice #1 | Choice #2 | Choice #3 |
| --------- | --------- | --------- |
| Liz       | Joe       | Don       |
| Liz       | Joe       | Don       |
| Liz       | Joe       | Don       |
| Don       | Joe       | Liz       |
| Don       | Joe       | Liz       |
| Joe       | Don       | Liz       |
| Joe       | Don       | Liz       |

| Winner |
| ------ |
| Don    |

### Multiple Rounds of Instant Runoff

| Candidates |
| ---------- |
| Joe        |
| Don        |
| Liz        |
| Andy       |

| Choice #1 | Choice #2 | Choice #3 | Choice #4 |
| --------- | --------- | --------- | --------- |
| Don       | Joe       | Andy      | Liz       |
| Don       | Joe       | Andy      | Liz       |
| Don       | Joe       | Andy      | Liz       |
| Don       | Joe       | Andy      | Liz       |
| Liz       | Joe       | Andy      | Don       |
| Liz       | Joe       | Andy      | Don       |
| Joe       | Liz       | Andy      | Don       |
| Joe       | Liz       | Andy      | Don       |
| Andy      | Liz       | Joe       | Don       |

| Winner |
| ------ |
| Liz    |


