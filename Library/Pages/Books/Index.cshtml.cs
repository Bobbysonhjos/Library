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
            Book = await _context.Books.Include(b => b.Author).ToListAsync();
            Book = order switch
            {
                "Asc" => Book.OrderBy(b => b.Author.Name).ToList(),
                "Desc" => Book.OrderByDescending(b => b.Author.Name).ToList(),
                _ => Book.OrderBy(b => b.Author.Name).ToList()
            };
            return Page();

        }


        public async Task<IActionResult> OnGetGenreSort(string order)
        {
            Book = await _context.Books.Include(b => b.Author).ToListAsync();
            Book = order switch
            {
                "Asc" => Book.OrderBy(b => b.Genre.ToString()).ToList(),
                "Desc" => Book.OrderByDescending(b => b.Genre.ToString()).ToList(),
                _ => Book.OrderBy(b => b.Title).ToList()
            };
            return Page();

           



        }
    }
}
