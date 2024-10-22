// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TournamentManager
{
    // Structure to store tournament information
    struct Tournament {
        uint256 id;
        address[] users; // List of users addresses participating in the tournament
        mapping(address => uint256) scores;
        bool exists;
    }

    // Mapping to store tournaments by ID
    mapping(uint256 => Tournament) public tournaments;

    // Event to notify when a tournament is created or a score is updated
    event TournamentCreated(uint256 tournamentId, address[] users);
    event ScoreUpdated(uint256 tournamentId, address user, uint256 newScore);

    // Function to create a tournament
    function createTournament(uint256 _tournamentId, address[] memory _users) public 
    {
        require(!tournaments[_tournamentId].exists, "Tournament already exists");

        Tournament storage newTournament = tournaments[_tournamentId];
        newTournament.id = _tournamentId;
        newTournament.users = _users;
        newTournament.exists = true;

        emit TournamentCreated(_tournamentId, _users);
    }

    // Function to update the score of a user in a tournament
    function updateScore(uint256 _tournamentId, address _user, uint256 _score) public
    {
        require(tournaments[_tournamentId].exists, "Tournament does not exist");

        Tournament storage tournament = tournaments[_tournamentId];

        tournament.scores[_user] = _score;

        emit ScoreUpdated(_tournamentId, _user, _score);
    }

    // Function to get the score of a user in a tournament
    function getScore(uint256 _tournamentId, address _user) public view returns (uint256)
    {
        require(tournaments[_tournamnetId].exists, "Tournamnet does not exist");
        return tournaments[_tournamentId].scores[_user];
    }

    // Internal function to check if a user is in the tournament
    function isUserInTournament(Tournament storage tournament, address _user) internal view return (bool)
    {
        for (uint256 i = 0; i < tournament.users.length; i++)
        {
            if (tournament.user[i] == _user)
            {
                return (true);
            }
        }
        return (false);
    }
}