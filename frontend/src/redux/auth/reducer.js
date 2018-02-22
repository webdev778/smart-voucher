import { Map } from 'immutable';
import actions from './actions';

const initState = new Map({ idToken: null });

export default function authReducer(state = initState, action) {
  switch (action.type) {
    case actions.LOGIN_SUCCESS:
      return state.set('idToken', action.token);
    case actions.LOGOUT:
      return initState;
    default:
      return state;
  }
}
