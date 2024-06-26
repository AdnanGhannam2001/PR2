using PR2.Shared.Common;
using static PR2.Shared.Constants.ExceptionCodes;

namespace PR2.Shared.Exceptions;

public class ConnectionFailureException : ExceptionBase {
    public ConnectionFailureException(string errorMessage)
        : base("Database", errorMessage, ConnectionFailure) { }
}