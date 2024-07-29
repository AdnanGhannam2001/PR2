using System.Reflection;
using MassTransit;
using PR2.RabbitMQ.Attributes;

namespace PR2.RabbitMQ.Extensions;

public static class IRabbitMqBusFactoryConfiguratorExtensions
{
    public static void ConfigurationReceiveEndpointsFromAssembly(this IRabbitMqBusFactoryConfigurator config,
        Assembly assembly,
        IBusRegistrationContext context)
    {
        foreach (var @class in GetAssemblyTypesWithAttribute<QueueConsumerAttribute>(assembly))
        {
            var queueAttribute = @class.GetCustomAttribute<QueueConsumerAttribute>()!;
            var queueName = queueAttribute.Name
                ?? @class.Name
                    .ToKebabCase()
                    .Replace("-consumer", "");
            config.ReceiveEndpoint(queueName, e => e.ConfigureConsumer(context, @class));
        }
    }

    private static IEnumerable<Type> GetAssemblyTypesWithAttribute<T>(Assembly assembly)
        where T : Attribute
    {
        foreach (var type in assembly.GetTypes())
        {
            if (type.GetCustomAttributes<T>().Any())
            {
                yield return type;
            }
        }
    }
}