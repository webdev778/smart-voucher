import React, { Component } from 'react';
import LayoutContentWrapper from '../components/utility/layoutWrapper';
import LayoutContent from '../components/utility/layoutContent';

export default class extends Component {
  render() {
    return (
      <LayoutContentWrapper style={{ height: '100vh' }}>
        <LayoutContent>
          <h1>Wallets</h1>
          <iframe title="wallet" style={{width:'100%', height:'80%', border:'hidden'}} src="http://localhost:9000/wallet/index.html"/>
        </LayoutContent>
      </LayoutContentWrapper>
    );
  }
}
