import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: '',
      num2: ''
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    this.setState({num1: e.currentTarget.value});
  }

  setNum2(e) {
    this.setState({ num2: e.currentTarget.value });
  }

  add(e) {
    e.preventDefault();
    const num1 = parseInt(this.state.num1);
    const num2 = parseInt(this.state.num2);

    this.setState({ result: num1 + num2 });
  }

  subtract(e) {
    e.preventDefault();
    const num1 = parseInt(this.state.num1);
    const num2 = parseInt(this.state.num2);

    this.setState({ result: num1 - num2 });
  }

  multiply(e) {
    e.preventDefault();
    const num1 = parseInt(this.state.num1);
    const num2 = parseInt(this.state.num2);

    this.setState({ result: num1 * num2 });
  }

  divide(e) {
    e.preventDefault();
    const num1 = parseInt(this.state.num1);
    const num2 = parseInt(this.state.num2);

    this.setState({ result: num1 / num2 });
  }

  clear(e) {
    e.preventDefault();
    this.setState({num1: '', num2: '', result: 0});
  }

  render() {
    const { num1, num2 } = this.state

    return (
      <div>

        <input onChange={this.setNum1} value={num1} />
        <br/>
        <br/>
        <input onChange={this.setNum2} value={num2} />
        <br />
        <br />
        {this.state.result}
        <br />
        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>DIVIDE AND CONQUER</button>
        <br />
        <br />
        <button onClick={this.clear}>GET RID OF IT ALL</button>
      </div>
    )
  }
}

export default Calculator;