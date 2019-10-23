import React from 'react';
import { useQuery } from '@apollo/react-hooks';
import { gql } from 'apollo-boost';
import { useParams } from 'react-router-dom';

const QUESTION = gql`
    query FindQuestion($id: Int) {
        findQuestion(id: $id) {
            id
            lang {
                id
                name
            }
            question
            readme
        }
    }
`;

function Question() {
    const { id } = useParams();
    const { loading, error, data } = useQuery(QUESTION, {
        variables: { id },
    });

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;
    if (data.findQuestion === null) return <p>Question not in DB</p>;

    const { lang, question, readme } = data.findQuestion;

    return (
        <div>
            <h1>{lang.name}</h1>
            <h1>{question}</h1>
            <p>{readme}</p>
        </div>
    );
}

export default Question;
