describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('navigates to the product detail page when a product is clicked', () => {
    cy.get('.products article').first().click()
    cy.url().should('include', '/products/')
  })
})