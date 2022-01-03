using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Library.Data;
using Library.Models;

namespace Library.Pages.Books
{
    public class EditModel : PageModel
    {
        private readonly Library.Data.LibraryContext _context;

        public EditModel(Library.Data.LibraryContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Book Book { get; set; }
        [BindProperty]
        public int AuthorId { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            LoadAuthors();
            if (id == null)
            {
                return NotFound();
            }

            Book = await _context.Books.Include(A=>A.Author).FirstOrDefaultAsync(m => m.Id == id);

            if (Book == null)
            {
                return NotFound();
            }
            AuthorId = Book.Author.Id;
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            Book.Author = _context.Authors.Find(AuthorId);
            _context.Attach(Book).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookExists(Book.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool BookExists(int id)
        {
            return _context.Books.Any(e => e.Id == id);
        }
        public void LoadAuthors()
        {
            ViewData["Authors"] = new SelectList(_context.Authors.OrderBy(a => a.Name), nameof(Author.Id), nameof(Author.Name));
        }
    }
}
