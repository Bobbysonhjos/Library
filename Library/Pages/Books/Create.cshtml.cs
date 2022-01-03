using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Library.Data;
using Library.Models;

namespace Library.Pages.Books
{
    public class CreateModel : PageModel
    {
        private readonly Library.Data.LibraryContext _context;
       

        public CreateModel(Library.Data.LibraryContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            LoadAuthors();
            return Page();
        }

        [BindProperty]
        public Book Book { get; set; }
        [BindProperty]
        public int AuthorId { get; set; }


        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            LoadAuthors();
            if (!ModelState.IsValid)
            {
                return Page();
            }
            Book.Author = _context.Authors.Find(AuthorId);
            _context.Books.Add(Book);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
        public void LoadAuthors()
        {
            ViewData["Authors"] = new SelectList(_context.Authors.OrderBy(a => a.Name), nameof(Author.Id), nameof(Author.Name));
        }

    }
}
