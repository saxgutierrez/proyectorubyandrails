


restaurantes = Category.create(name: "Restaurantes")

Expense.create(category: restaurantes, date: Date.current, concept: "Hamburguesas el burral", amount: 32000)