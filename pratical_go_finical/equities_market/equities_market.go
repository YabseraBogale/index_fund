package equities_market

type MACalculator struct {
	MNumPeriods int64
	MPrices     []float64
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
