using System.ComponentModel.DataAnnotations;

namespace LGarden.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}