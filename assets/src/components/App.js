/* eslint-disable react/jsx-filename-extension */
import React from 'react';
import { useQuery, ApolloProvider } from '@apollo/react-hooks';
import { gql } from 'apollo-boost';
import logo from './logo.svg';
import './App.css';
import client from '../queries';

const ALL_LANGAUGES = gql`
    {
        allLanguages {
            id
            name
            desc
        }
    }
`;

const App = () => {
    return (
        <ApolloProvider client={client}>
            <Langauges />
        </ApolloProvider>
    );
};

function Langauges() {
    const { loading, error, data } = useQuery(ALL_LANGAUGES);

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;

    return (
        <div className="App">
            <header className="App-header">
                <img src={logo} className="App-logo" alt="logo" />
                <p>
                    Edit
                    <code>src/App.js</code>
                    and save to reload.
                </p>
                <a
                    className="App-link"
                    href="https://reactjs.org"
                    target="_blank"
                    rel="noopener noreferrer"
                >
                    <p>Ive loaded {JSON.stringify(data)}</p>
                </a>
            </header>
        </div>
    );
}

export default App;
