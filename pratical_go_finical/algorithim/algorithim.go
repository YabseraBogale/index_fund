package algorithim

import "math"

type IntRateCalculator struct {
	MRate float64
}

type CompoundIntRateCalculator struct {
	MRate float64
}

type CashFlowCalculator struct {
	MCashPayments []float64
	MTimePeriods  []int64
	MRate         float64
}

type BondCalculator struct {
	MInstitution string
	MPrincipal   float64
	MCoupon      float64
	MNumPeriod   int64
}

func (b *BondCalculator) InterestRate() float64 {
	return b.MCoupon / b.MPrincipal
}

func (c *CashFlowCalculator) AddCashPayment(value float64, time_period int64) {
	c.MCashPayments = append(c.MCashPayments, value)
	c.MTimePeriods = append(c.MTimePeriods, int64(time_period))
}

func (c *CashFlowCalculator) PresentValue() float64 {
	total := 0.0
	for i := 0; i < len(c.MCashPayments); i++ {
		total += c.MCashPayments[i] / (math.Pow(1+c.MRate, float64(c.MTimePeriods[i])))
	}
	return total
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
