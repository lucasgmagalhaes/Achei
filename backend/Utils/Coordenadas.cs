using Entidades.Entidades;
using Nest;
using System;

namespace Utils
{
    public static class Coordenadas
    {
        public static double DistanciaBase { get; set; } = 2;

        public static double DistanceTo(Regiao baseCoordinates, Regiao targetCoordinates)
        {
            return DistanceTo(baseCoordinates, targetCoordinates, UnidadeDeMedida.Kilometers);
        }

        public static double DistanceTo(Regiao baseCoordinates, Regiao targetCoordinates, UnidadeDeMedida unitOfLength)
        {
            var baseRad = Math.PI * double.Parse(baseCoordinates.Latitude) / 180;
            var targetRad = Math.PI * double.Parse(targetCoordinates.Latitude) / 180;
            var theta = double.Parse(baseCoordinates.Longitude) - double.Parse(targetCoordinates.Longitude);
            var thetaRad = Math.PI * theta / 180;

            double dist =
                Math.Sin(baseRad) * Math.Sin(targetRad) + Math.Cos(baseRad) *
                Math.Cos(targetRad) * Math.Cos(thetaRad);
            dist = Math.Acos(dist);

            dist = dist * 180 / Math.PI;
            dist = dist * 60 * 1.1515;

            return unitOfLength.ConvertFromMiles(dist);
        }

        /// <summary>
        /// Verifica se as regiões estão próximas. o valor default é de 2 km.
        /// </summary>
        /// <param name="regiao1"></param>
        /// <param name="regiao2"></param>
        /// <returns></returns>
        public static bool RegioesEstaoPerto(Regiao regiao1, Regiao regiao2)
        {
            double distancia = DistanceTo(regiao1, regiao2, UnidadeDeMedida.Kilometers);
            return distancia <= DistanciaBase;
        }
    }
}
