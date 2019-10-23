import React from 'react';
import { ApolloProvider } from '@apollo/react-hooks';
import client from './queries';
import Langauges from './pages/lang';

const App = () => {
    return (
        <ApolloProvider client={client}>
            <Langauges />
        </ApolloProvider>
    );
};

export default App;
