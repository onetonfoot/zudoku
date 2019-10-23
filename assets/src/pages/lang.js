import React from 'react';
import { useQuery } from '@apollo/react-hooks';
import { gql } from 'apollo-boost';
import { Link, useParams } from 'react-router-dom';

const LANGAUGE = gql`
    query FindLang($name: String) {
        findLang(name: $name) {
            id
            name
            desc
            questions {
                id
                question
                readme
            }
        }
    }
`;

function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function Lang() {
    let { name } = useParams();
    name = capitalizeFirstLetter(name);
    const { loading, error, data } = useQuery(LANGAUGE, {
        variables: { name },
    });

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;
    if (data.findLang === null) return <p> No such lang</p>;

    const { desc, questions } = data.findLang;

    return (
        <div className="App">
            <h1>{name}</h1>
            <p>{desc}</p>
            {questions.map(ques => (
                <div key={ques.id}>
                    <Link to={`/ques/${ques.id}`}>
                        <h2>{ques.question}</h2>
                    </Link>
                    <p>{ques.readme}</p>
                </div>
            ))}
        </div>
    );
}

export default Lang;
