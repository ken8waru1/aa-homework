import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';
import { applyMiddleware } from 'redux';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // PHASE 1
  // const addLoggingToDispatch = (store) => {
  //   const dispatch = store.dispatch;
  //   return (action) => {
  //     console.log(store.getState());
  //     console.log(action);
  //     dispatch(action);
  //     console.log(store.getState());
  //   }
  // }
  // store.dispatch = addLoggingToDispatch(store);

  //PHASE 2 in ES5

  // const addLoggingToDispatch = (store) => {
  //   return function (next) {
  //     return function (action) {
  //       console.log(store.getState());
  //       console.log(action);
  //       next(action);
  //       console.log(store.getState())
  //     };
  //   };
  // };

  //PHASE 2 in ES6

  // const addLoggingToDispatch = (store) => (next) => (action) => {
  //   console.log(store.getState());
  //   console.log(action);
  //   next(action);
  //   console.log(store.getState())
  // };

  // const applyMiddlewares = (store, ...middlewares) => {
  //   let dispatch = store.dispatch;
  //   middlewares.forEach(middleware => {
  //     dispatch = middleware(store)(dispatch)
  //   });

  //   return Object.assign({}, store, { dispatch })
  // }

  // store = applyMiddlewares(store, addLoggingToDispatch);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
