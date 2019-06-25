import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch, customMiddleware));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

const addLoggingToDispatch = (store) => (next) => (action) => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState())
};

const customMiddleware = (store) => (next) => (action) => {
  console.log(next);
  console.log("GAAAAAAAAAAH");
  next(action);
}

export default configureStore;
