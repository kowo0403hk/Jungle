/// <reference types="cypress" />

describe("visit the Jungle page", () => {
  beforeEach(() => {
    // we use "/" because we want to interact with the mock data. Whenever we have an initializer to generate mock data, we don't need to set any baseUrl. In this case we have cypress_rails/rb
    cy.visit("/");
  });
  it("displays product categories", () => {
    cy.get(".nav-link").first().should("have.text", "Evergreens");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
