require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

   let(:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false) }
  

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
         it "assigns [my_question] to @Questions" do
          get :index
          expect(assigns(:questions)).to eq([my_question])
     end
  end

 describe "GET show" do
     it "returns http success" do
       get :show, {id: my_question.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, {id: my_question.id}
       expect(response).to render_template :show
     end
 
     it "assigns my_question to @Question" do
       get :show, {id: my_question.id}
       expect(assigns(:question)).to eq(my_question)
     end
   end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  
  
  it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
 # #3
      it "instantiates @Question" do
        get :new
        expect(assigns(:question)).not_to be_nil
      end
    end
 
    describe "Question create" do
 # #4
      it "increases number of Question by 1" do
        expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Question,:count).by(1)
      end
 
 # #5
      it "assigns the new Question to @Question" do
        post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph }
        expect(assigns(:question)).to eq Question.last
      end
 
 # #6
      it "redirects to the new Question" do
        post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to Question.last
      end
    end

 describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_question.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_question.id}
 # #1
       expect(response).to render_template :edit
     end
 
 # #2
     it "assigns Question to be updated to @Question" do
       get :edit, {id: my_question.id}
 
       Question_instance = assigns(:question)
 
       expect(Question_instance.id).to eq my_question.id
       expect(Question_instance.title).to eq my_question.title
       expect(Question_instance.body).to eq my_question.body
     end
   end
   
   describe "PUT update" do
     it "updates Question with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: false}
 
 # #3
       updated_Question = assigns(:question)
       expect(updated_Question.id).to eq my_question.id
       expect(updated_Question.title).to eq new_title
       expect(updated_Question.body).to eq new_body
     end
 
     it "redirects to the updated Question" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
 # #4
       put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: false }
       expect(response).to redirect_to my_question
     end
   end
   
   describe "DELETE destroy" do
     it "deletes the Question" do
       delete :destroy, {id: my_question.id}

       count = Question.where({id: my_question.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to Questions index" do
       delete :destroy, {id: my_question.id}
       expect(response).to redirect_to questions_path
     end
   end


end