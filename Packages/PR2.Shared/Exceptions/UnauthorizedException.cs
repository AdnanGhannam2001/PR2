using PR2.Shared.Common;
using static PR2.Shared.Constants.ExceptionCodes;

namespace PR2.Shared.Exceptions;

public class UnauthorizedException : ExceptionBase {
    public UnauthorizedException(string errorMessage = "You can't perform this action")
        : base("User", errorMessage, Unauthorized) { }
}