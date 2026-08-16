package algorithim

import "math"

type IntRateCalculator struct {
	MRate float64
}

type CompoundIntRateCalculator struct {
	MRate float64
}

func (c *CompoundIntRateCalculator) MultiplePeriod(value float64, number_period int64) float64 {
	return value * math.Pow(1+c.MRate, float64(number_period))
}

func (c *CompoundIntRateCalculator) ContinuousCompounding(value float64, number_period int64) float64 {
	return value * math.Exp(c.MRate*float64(number_period))
}

func New(rate float64) *IntRateCalculator {
	return &IntRateCalculator{
		MRate: rate,
	}
}

func (i *IntRateCalculator) SinglePeriod(value float64) float64 {
	return value * (1 + i.MRate)
}
