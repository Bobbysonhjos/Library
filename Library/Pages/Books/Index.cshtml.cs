using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Library.Data;
using Library.Models;

namespace Library.Pages.Books
{
    public class IndexModel : PageModel
    {
        private readonly Library.Data.LibraryContext _context;

        public IndexModel(Library.Data.LibraryContext context)
        {
            _context = context;
        }

        public IList<Book> Book { get; set; }





        public async Task OnGetAsync()
        {
            Book = await _context.Books.Include(b => b.Author).ToListAsync();
        }




        public async Task<IActionResult> OnGetAuthorSort(string order)
        {
            switch (order)
            {
                case "Asc":
                    Book = await _context.Books.Include(b => b.Author).OrderBy(b => b.Author.Name).ToListAsync();
                    return Page();

                case "Desc":
                    Book = await _context.Books.Include(b => b.Author).OrderByDescending(b => b.Author.Name).ToListAsync();
                    return Page();

                default:
                    Book = await _context.Books.Include(b => b.Author).ToListAsync();
                    return Page();

            }
        }


            public async Task<IActionResult> OnGetGenreSort(string order)
            {
            Book = await _context.Books.Include(b => b.Author).ToListAsync();
            switch (order)
                {
                    case "Asc":
                    Book=Book.OrderBy(b => b.Genre.ToString()).ToList();
                       // Book = await _context.Books.Include(b => b.Author).OrderBy(b=>(int)Enum.Parse(typeof(Genre),b.Genre.ToString())).ToListAsync();
                        return Page();

                    case "Desc":
                    Book = Book.OrderByDescending(b => b.Genre.ToString()).ToList();
                    // Book = await _context.Books.Include(b => b.Author).OrderByDescending(b => b.Genre).ToListAsync();
                    return Page();

                    default:
                       // Book = await _context.Books.Include(b => b.Author).ToListAsync();
                        return Page();

                }
            


            }
    }
}
