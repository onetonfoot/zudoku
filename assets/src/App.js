import React from 'react';
import {
    BrowserRouter as Router,
    Route,
    Switch,
} from 'react-router-dom';
import { ApolloProvider } from '@apollo/react-hooks';
import client from './queries';
import AllLangauges from './pages/allLang';
import Lang from './pages/lang';
import NotFound from './pages/notFound';
import Question from './pages/question';

const App = () => {
    return (
        <ApolloProvider client={client}>
            <Router>
                <Switch>
                    <Route exact path="/" component={AllLangauges} />
                    <Route path="/lang/:name" component={Lang} />
                    <Route path="/ques/:id" component={Question} />
                    <Route component={NotFound} />
                </Switch>
            </Router>
        </ApolloProvider>
    );
};

export default App;
