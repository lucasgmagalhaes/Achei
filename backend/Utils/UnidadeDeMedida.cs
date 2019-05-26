using System;
using System.Collections.Generic;
using System.Text;

namespace Utils
{
    public class UnidadeDeMedida
    {
        public static UnidadeDeMedida Kilometers { get; } = new UnidadeDeMedida(1.609344);
        public static UnidadeDeMedida NauticalMiles { get; } = new UnidadeDeMedida(0.8684);
        public static UnidadeDeMedida Miles { get; } = new UnidadeDeMedida(1);

        private readonly double _fromMilesFactor;

        private UnidadeDeMedida(double fromMilesFactor)
        {
            _fromMilesFactor = fromMilesFactor;
        }

        public double ConvertFromMiles(double input)
        {
            return input * _fromMilesFactor;
        }
    }
}
