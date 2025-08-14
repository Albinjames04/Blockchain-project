# Decentralized Esports Tournament Smart Contract

## Description
This Move-based Aptos smart contract enables the creation of decentralized esports tournaments with transparent on-chain prize distribution and an anti-cheat validation mechanism. The contract ensures that tournament winnings are only distributed if anti-cheat verification passes, thereby promoting fairness and trust among participants.

## Vision
To build a transparent, trustless, and community-driven esports ecosystem where tournament hosting, participation, and reward distribution are all governed by on-chain logic — eliminating the need for centralized intermediaries and reducing cheating risks.

## Future Scope
- **On-chain Player Registration**: Allow participants to register and pay entry fees directly into the prize pool.
- **Automated Prize Pool Management**: Lock funds from multiple players and release them based on match results and anti-cheat checks.
- **Decentralized Anti-Cheat Oracles**: Integrate with decentralized oracle networks for external cheat detection.
- **Multi-Winner Support**: Enable prize splitting for team-based games or multiple ranked positions.
- **Leaderboard Integration**: Store and update player rankings on-chain.

## Contract Details
**Module Name**: `MyModule::EsportsTournament`  
**Contract Address**: `0x02de5c30a0f64e72b0b25b37077ec4d421cf3fb1458746388491cf307e490b4d'* 
<img width="1875" height="805" alt="image" src="https://github.com/user-attachments/assets/b3d68245-a2b8-4d41-b19e-15f57dd91529" />


### Functions
1. **`create_tournament(host: &signer)`**  
   Initializes a new tournament with an empty prize pool and no anti-cheat result.
2. **`distribute_prize(host: &signer, winner: address, amount: u64, passed: bool)`**  
   Transfers the specified prize amount to the winner if anti-cheat verification passes.

---
