using System.Reflection;
using MassTransit;
using Microsoft.Extensions.DependencyInjection;

namespace PR2.RabbitMQ.Extensions;

public static class IServiceCollectionExtensions
{
    public static IServiceCollection AddRabbitMQ(this IServiceCollection services, Assembly assembly,
                                                 string host, string username, string password)
        => services.AddMassTransit(config =>
            {
                config.RegisterConsumersFromAssembly(assembly);
                config.UsingRabbitMq((context, rmq) =>
                {
                    rmq.ConfigurationReceiveEndpointsFromAssembly(assembly, context);
                    rmq.Host(host, host =>
                    {
                        host.Username(username);
                        host.Password(password);
                    });
                });
            });
}