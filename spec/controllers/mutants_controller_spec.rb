require 'rails_helper'

RSpec.describe MutantsController, :type => :controller do
  describe "GET #index" do
    it "assigns mutants array" do
      mutant = Mutant.create(name: "mutant")
      get :index
      expect(assigns(:mutants)).to eq([mutant])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "assigns a new mutant" do
      get :new
      expect(assigns(:mutant)).to be_a_new(Mutant)
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a mutant" do
        expect{ post :create, mutant: { name: "mutant" } }.to change(Mutant, :count).by(1)
      end

      it "redirects to index" do
        post :create, mutant: { name: "mutant" }
        expect(response).to redirect_to(mutants_path)
      end
    end

    context "with invalid attributes" do
      it "does not create a mutant" do
        expect{ post :create, mutant: { name: "" } }.to_not change(Mutant, :count)
      end

      it "re-renders the :new view" do
        post :create, mutant: { name: "" }
        expect(response).to render_template("new")
      end
    end
  end

=begin
  describe "GET #edit" do
    it "assigns the correct mutant" do
      mutant = Mutant.create(name: "mutant")
      get :edit, id: mutant
      expect(assigns(:mutant)).to eq(mutant)
    end

    it "renders the :edit view" do
      get :edit, id: Mutant.create(name: "mutant")
      expect(response).to render_template("edit")
    end
  end

  describe "PUT #update" do
    before :each do
      @mutant = Mutant.create(name: "mutant")
    end

    context "with valid attributes" do
      it "updates the mutant" do
        put :update, id: @mutant, name: "mutant2"
        expect(@mutant.name).to eq("mutant2")
      end

      it "redirects to index" do
        put :update, id: @mutant, name: "mutant2"
        expect(response).to redirect_to(mutants_path)
      end
    end

    context "with invalid attributes" do
      it "does not update the mutant" do
        put :update, id: @mutant, name: ""
        expect(@mutant.name).to eq("mutant")
      end

      it "re-renders the :edit view" do
        put :update, id: @mutant, name: ""
        expect(response).to render_template("edit")
      end
    end
  end
=end
end
