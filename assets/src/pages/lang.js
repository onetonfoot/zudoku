import React from 'react';
import { useQuery } from '@apollo/react-hooks';
import { gql } from 'apollo-boost';
import { useParams } from 'react-router-dom';

const LANGAUGE = gql`
    query FindLang($name: String) {
        findLang(name: $name) {
            id
            name
            desc
            questions {
                id
                question
            }
        }
    }
`;

function Lang() {
    const { name } = useParams();
    const { loading, error, data } = useQuery(LANGAUGE, {
        variables: { name },
    });

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;

    const { desc } = data.findLang;

    return (
        <div className="App">
            <h1>{name}</h1>
            <p>{desc}</p>
        </div>
    );
}

export default Lang;
