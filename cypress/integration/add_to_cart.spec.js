/// <reference types="cypress" />

describe("testing the shopping cart amount interaction", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("can nagivate to product detail page when a product is clicked on the home page", () => {
    cy.get("[data-id = 'my_cart']").last().contains("My Cart (0)");
    cy.get(".btn").first().click({ force: true });
    cy.get("[data-id = 'my_cart']").last().contains("My Cart (1)");
  });
});
