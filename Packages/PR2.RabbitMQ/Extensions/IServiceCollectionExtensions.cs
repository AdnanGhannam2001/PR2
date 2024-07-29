using System.Reflection;
using MassTransit;
using Microsoft.Extensions.DependencyInjection;

namespace PR2.RabbitMQ.Extensions;

public static class IServiceCollectionExtensions
{
    public static IServiceCollection AddRabbitMQ(this IServiceCollection services, Assembly assembly)
        => services.AddMassTransit(config =>
            {
                config.RegisterConsumersFromAssembly(assembly);
                config.UsingRabbitMq((context, rmq)
                    => rmq.ConfigurationReceiveEndpointsFromAssembly(assembly, context));
            });
}