package equities_market

import "math"

type MACalculator struct {
	MNumPeriods int64
	MPrices     []float64
}

type VolatilityCalculator struct {
	MPrices []float64
}

func (v *VolatilityCalculator) AddPrice(price float64) {
	v.MPrices = append(v.MPrices, price)
}

func (v *VolatilityCalculator) RangeVolatility() float64 {
	if len(v.MPrices) < 1 {
		return 0
	}
	min := v.MPrices[0]
	max := min
	for i := 0; i < len(v.MPrices); i++ {
		if v.MPrices[i] < min {
			min = v.MPrices[i]
		}
		if v.MPrices[i] > max {
			max = v.MPrices[i]
		}
	}
	return max - min
}

func (v *VolatilityCalculator) StdDev() float64 {
	mean := v.Mean()
	sum := 0.0
	for i := 0; i < len(v.MPrices); i++ {
		val := v.MPrices[i] - mean
		sum += val * val
	}
	return math.Sqrt(sum / float64((len(v.MPrices) - 1)))
}

func (v *VolatilityCalculator) Mean() float64 {
	sum := 0.0
	for i := 0; i < len(v.MPrices); i++ {
		sum += v.MPrices[i]
	}
	return sum
}

func (v *VolatilityCalculator) AvgDailyRange() float64 {
	n := float64(len(v.MPrices))
	if n < 2 {
		return 0
	}
	pervious := v.MPrices[0]
	sum := 0.0
	for i := 0; i < len(v.MPrices); i++ {
		r := math.Abs(v.MPrices[i] - pervious)
		sum += r
	}
	return sum/n - 1
}

func (m *MACalculator) AddPriceQuote(close float64) {
	m.MPrices = append(m.MPrices, close)
}

func (m *MACalculator) CalculateMA() []float64 {
	var ma []float64
	var sum float64

	for i := 0; i < len(m.MPrices); i++ {
		sum += m.MPrices[i]
		if i >= int(m.MNumPeriods) {
			ma = append(ma, sum/float64(m.MNumPeriods))
			sum -= m.MPrices[i-int(m.MNumPeriods)]
		}
	}

	return ma
}

func (m *MACalculator) CalculateEMA() []float64 {
	var ema []float64
	var sum float64

	multiplier := 2.0 / (float64(m.MNumPeriods) + 1)

	for i := 0; i < len(m.MPrices); i++ {
		sum += m.MPrices[i]
		if i == int(m.MNumPeriods) {
			ema = append(ema, sum/float64(m.MNumPeriods))
			sum -= m.MPrices[i-int(m.MNumPeriods)]
		} else if i > int(m.MNumPeriods) {
			val := ((1 - multiplier) * ema[len(ema)-1]) + (multiplier * m.MPrices[i])
			ema = append(ema, val)
		}
	}

	return ema
}
