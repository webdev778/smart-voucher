import React from 'react';
import { Switch, Route } from 'react-router-dom';
import asyncComponent from '../../helpers/AsyncFunc';

class AppRouter extends React.Component {
  render() {
    const { url } = this.props;
    return (
      <Switch>
        <Route
          exact
          path={`${url}/`}
          component={asyncComponent(() => import('../dashboard'))}
        />
        <Route
          exact
          path={`${url}/authCheck`}
          component={asyncComponent(() => import('../AuthCheck'))}
        />
        <Route
          exact
          path={`${url}/wallet`}
          component={asyncComponent(() => import('../wallet'))}
        />

        <Route
          exact
          path={`${url}/buyToken`}
          component={asyncComponent(() => import('../BuyToken'))}
        />

      </Switch>
    );
  }
}

export default AppRouter;
