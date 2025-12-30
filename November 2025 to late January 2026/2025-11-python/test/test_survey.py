import pytest
from survey import AnonymousSurvery

@pytest.fixture
def language_survey():
    question = "What lanuage did you first learn to speak?"
    language_survey = AnonymousSurvery(question)
    return language_survey
 
def test_store_single_response(language_survey):
    language_survey.store_response('English')
    assert 'English' in language_survey.responses
    
def test_store_three_response(language_survey):
    responses = ['English', 'Spanish', 'Mandarin']
    for response in responses:
        language_survey.store_response(response)
    
    for response in responses:
        assert response in language_survey.responses
        
        
        