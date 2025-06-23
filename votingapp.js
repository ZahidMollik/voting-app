class VotingDApp {
  constructor(contractAddress, abi) {
    this.web3 = new Web3(window.ethereum);
    this.contract = new this.web3.eth.Contract(abi, contractAddress);
  }

  async createProposal(description) {
    const accounts = await this.web3.eth.requestAccounts();
    await this.contract.methods.createProposal(description).send({
      from: accounts[0]
    });
  }

  async vote(proposalId) {
    const accounts = await this.web3.eth.requestAccounts();
    await this.contract.methods.vote(proposalId).send({
      from: accounts[0]
    });
  }

  async getResults(proposalId) {
    return await this.contract.methods.getResults(proposalId).call();
  }
}
