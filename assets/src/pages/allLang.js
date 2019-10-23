import React from 'react';
import { useQuery } from '@apollo/react-hooks';
import { gql } from 'apollo-boost';
import { Link } from 'react-router-dom';

const ALL_LANGAUGES = gql`
    {
        allLanguages {
            id
            name
            desc
        }
    }
`;

function AllLangauges() {
    const { loading, error, data } = useQuery(ALL_LANGAUGES);

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;

    return (
        <div className="App">
            {data.allLanguages.map(lang => (
                <div key={lang.name}>
                    <Link to={`/lang/${lang.name}`}>
                        <h1>{lang.name}</h1>
                    </Link>
                    <p>{lang.desc}</p>
                </div>
            ))}
        </div>
    );
}

export default AllLangauges;
