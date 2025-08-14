module MyModule::EsportsTournament {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Stores prize pool and basic anti-cheat flag
    struct Tournament has key, store {
        prize_pool: u64,
        winner: address,
        anti_cheat_passed: bool,
    }

    /// Create a tournament with no winner yet
    public fun create_tournament(creator: &signer) {
        let t = Tournament {
            prize_pool: 0,
            winner: @0x0, // placeholder address
            anti_cheat_passed: false,
        };
        move_to(creator, t);
    }

    /// Distribute prize to the winner if anti-cheat passed
    public fun distribute_prize(
        host: &signer,
        winner: address,
        amount: u64,
        passed: bool
    ) acquires Tournament {
        let tourney = borrow_global_mut<Tournament>(signer::address_of(host));

        // Mark anti-cheat result
        tourney.anti_cheat_passed = passed;
        tourney.winner = winner;

        if (passed) {
            // Transfer prize
            let prize = coin::withdraw<AptosCoin>(host, amount);
            coin::deposit<AptosCoin>(winner, prize);
            tourney.prize_pool = tourney.prize_pool + amount;
        }
    }
}