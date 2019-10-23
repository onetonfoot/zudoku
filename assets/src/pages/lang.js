import React from 'react';
import { useQuery } from '@apollo/react-hooks';
import { gql } from 'apollo-boost';

const ALL_LANGAUGES = gql`
    {
        allLanguages {
            id
            name
            desc
        }
    }
`;

function Langauges() {
    const { loading, error, data } = useQuery(ALL_LANGAUGES);

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;

    return (
        <div className="App">
            {data.allLanguages.map(lang => (
                <>
                    <h1>{lang.name}</h1>
                    <p key={lang.id}>{lang.desc}</p>
                </>
            ))}
        </div>
    );
}

export default Langauges;
