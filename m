Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A00550DD5
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873555; cv=none; b=gKtTp4i7+jwn1QaVnyWdgXjMf5UD/nyLGAyi1ugVbARbo+jTZK+TuxMdR4IjAJA0rvbtX2VC63ruHtpn6HGPHgeofU5kEJW7MYixbIz8lTvY/iqOHJ+vezHERjyspfPeOMF1DZevHcTVyJCHzd8UMbbdJp9WZDC3XqJJVRto5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873555; c=relaxed/simple;
	bh=9YMYEyXu4SirAqbmQxF+UCJAn8WCFaimhxY6fO+yn7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biRn0+yFh5dMLZ/cvcLGFHYOEOGGCA2qd2sdYS+di7HNu3jHH6mOLkWItSnc2JZMVBYPo2w7XlM2ze9ZZ4gV7qlrV8mIeb822VbX2hJdxRWm/WZWXlgKpvy+OTWbjCtQ6t8uYmpVzOGaNqpxZOfvqMoC7kKvXEdMNqaP5df6H+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYj0hJom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyrJEm0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYj0hJom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyrJEm0Q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkdhS4162783
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 13:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+HRkriuVzWqqqsg8EA57IGDloRqI/G0+65px0QRHcc=; b=kYj0hJomTc8vS9pd
	acc79svyiqXIqmKuKOKq7HqPOsiLMxuEGgRC+qr/OJvzAik0ajJGDVZdNXQ+W91G
	wlk3EmOsxqCG+vRvsrjMxvDrMEqULUo3r9/TVGVhu/HtAPalh9e9OJQCZWIqpgJG
	4h//LoPWuLO1ASAgcvqNuqGltixZIF3uxHQoxqkganVxixLI3zRjNAek8ljOXRmp
	awqgiOqwWBXqTA9Diz7hvHiFU8rHBasLhmkKQ5r80IkTTrRuTWSjj7mO91T2F+UY
	lrYH9RcDUuquAh8AIXD191FgI0WCJf7SYpfYHH9ULa0c3NNonFysNduJAY7o+lIg
	ZHD1HA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pa3et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 13:19:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so769088885a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873548; x=1789478348; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+HRkriuVzWqqqsg8EA57IGDloRqI/G0+65px0QRHcc=;
        b=JyrJEm0Q9xW9cX3KhXfoUD2lfihOiXlcyKfDapj3BLW7St/ioo71uwPKx2OfqLQWml
         tzxkYHsG3A3+VUI2sat/et4xxGmQXkBG9TFPvmSfZhRlMlPGqnUzzoneGGI+3Fip2zSb
         hGqGrEhnn37p2nexRJlZMc7vKIsLh3ayTD0YOAffsn/+0uroCTn1dEyKb198WqNmLdq4
         jP21rNwsSG0MUcp3g+Y48oigNRmMtm1D68nirS964jz20O0/BT8HBG1Hk2ggzXozdbl5
         65l2hXw0qZGT/MGMM2dEqR4sKrLGHyqdcQ31CZkaKNexXFTFTIR4GFTdM2l0Hu2Iyxd3
         3SAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873548; x=1789478348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+HRkriuVzWqqqsg8EA57IGDloRqI/G0+65px0QRHcc=;
        b=HsARI6V/qDk5CJ/FHCwCCkSv883wVQQoONjeo8rFphEjMjJQZePvASHtGXt+G48GEK
         TsGcEImBaR3xDNNRkfa/nFL5oOOO7B+hVcdC/7CruSrUQAlSyaazxkSWV/HfE0rlvu8r
         EQ6G+SqiwXNap2gJ7qsne9zJf0bIpjF4kEa9t5TsYJX99UxwtD5CdpizjlHlEdyo8JZQ
         CTcRfyws0ck6ok5j1wS/01+UdvtmnWvu6E56DIuAkMfhv+UOeJJ0crS2J35y4uW7+7OK
         OULGVdgtzPzToNuWiKQV6t2kiFteqophrQCkKkHxKZb9ySBGZ3byt/8fZNkbKjh2rVo9
         +R4Q==
X-Gm-Message-State: AFuF++kRpAQr4mlD/NtDoMFYospxfOOp/uIxQ4FS7ljWrpFIY6paj4yQ
	JdPk5rLb+mPE6n/1ffzrGgDqzOk4i6uYJ+j078tyky+kBsb/AvIczbWS56lxozbd+RTcSOiPyPe
	KBNI3axMnh8jIUNjdZcap4fHcRgFbXA1HVpAKmLBHO4DDUZCos4kSNxo86KhbALK+woS4YrPJ6Q
	ElbbU=
X-Gm-Gg: AYBFou0uhWCHWXe/nGSgepk0/k6fWQ6Ag0xw+gENSTyrol30ox2c9N9Epv+SQqutgTe
	B9FQsWfq3mZ20Eo8wraC+pH5c3kON3gdLxFlYXoshVIhSEubnKaMssou4bSLz9YAHT24p0FT8GR
	9pMhBDmp2WrFzGuRrSzHFSgKD8Y7wYWuk2PKjNmAMBsI+iGNFginXL6meKJAjSV4+k0MW5Nvew4
	ZCutPHLuoRFM9GJrKwRf/C0gGMhvV4XkikZg3e/WBoPDqVYhF5wIgO1ktCjawgVEvkKT+sT2YqS
	KwJc9e1aUU+dgSO3uRtCBmZfNnI6dXCC/sbX8HUgYNIWsQJnrk/E9C2v2+3YiZv4F9FEraJzm1D
	soA7AGA4u2j0BY7ozq+YoK623Kg9U
X-Received: by 2002:a05:620a:17a4:b0:939:6de6:9517 with SMTP id af79cd13be357-9398049f91emr3268240885a.46.1788873547563;
        Tue, 08 Sep 2026 06:19:07 -0700 (PDT)
X-Received: by 2002:a05:620a:17a4:b0:939:6de6:9517 with SMTP id af79cd13be357-9398049f91emr3268232985a.46.1788873546917;
        Tue, 08 Sep 2026 06:19:06 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm335727855e9.3.2026.09.08.06.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:19:05 -0700 (PDT)
Message-ID: <771390d1-b7c9-4c13-8849-c71a922825f8@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:19:03 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 10/12] drm/msm/hdmi_phy_eliza: Add
 support for Synopsys-based HDMI phy on Eliza
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
        robh@kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org,
        conor+dt@kernel.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-10-67843277de17@oss.qualcomm.com>
 <20260828141923.8E5F81F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828141923.8E5F81F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wOFmtTLHGnQgT7ESdJY4JbMXgo28-RdT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MiBTYWx0ZWRfX+qAAjtqGb3S8
 UBzetGW37vIfA3XivLvhUXnyGMK8jkseubeyIEn67BGjC9Rbtrj44YREtPZFG/S6f6YZx+YOeMn
 bHz04Jj3BmZvLfAQ3a0MmeV6jDTRO7Q=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa00b4c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rwc4GHvP-eKwHY9TLAEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wOFmtTLHGnQgT7ESdJY4JbMXgo28-RdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MiBTYWx0ZWRfX00R6TIpIe/PI
 tp+7QUemV15dV0wYJMF+Wul2TB4tuEpw/jDrORm+oW6mIrYT7o3ue/inI/oBDZ2z7t+yia2yudZ
 tn30xqfoIdmU8DBRLp4L8Yk/sD8mGFPg4h67EVFFRxh3HUtEN/mH5IT2glSVOF9r/TfHXRAOlXw
 AuinsCeThHDqACRpgdWrocqITRxIYww3BSBCXEA8Nri71xZNtkmVWIHtb++r8L6WLjnR0Uf9Y7d
 0SUhumxBWIP9/irpm3Ak6xdBvp0GK3AoJnqZd6LVdFhshy8AObVy9rD7f8UHQ30x5t1jZpuLrg6
 x8afRZ8vhIh2p0ss8GnpCgo2WBClgUC4XEQnsNGTy+LFay7IkmusTlMQq+4cAC3n6Be4Utu4BQt
 eP7Mx8KKLEVcJibGomnqSyrs5KWL17X5AA4AikRE9tbLxkNbRvL1jy8rO5Ee4kktI/PU7+HmBZe
 lS+IzIvAkiP/ptSPStw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080142

On 28/08/2026 16:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential issue(s) to consider:
> - [High] Silent truncation of 64-bit integers passed to `gcd()` on 32-bit architectures leads to incorrect clock calculations.
> - [High] 32-bit integer overflow during PHY bit rate calculation causes incorrect hardware configuration for high-bandwidth displays.
> - [High] Deterministic division by zero during CCF clock registration due to uninitialized configuration.
> - [High] Severe CPU soft lockup risk due to excessive 3-second busy-wait loop using `readl_poll_timeout_atomic`.
> - [High] Premature integer division causes precision loss yielding incorrect hardware PLL parameters.
> - [Medium] Data race on PLL configuration state by bypassing Common Clock Framework (CCF) synchronization.
> - [Low] 64-bit division using '/' and standard division macros causes build failure on 32-bit platforms.
> - [Low] Unsupported floating-point literals used in integer calculations.
> - [Low] Use of `mdelay(8)` wastes CPU resources in a sleepable context.
> - [Low] Fragile design conflates the presence of PHY regulators with the name format of device tree memory resources.
> --
> 
> commit 9c53defce3c459b1740fbff4f2434baad5c70aee
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: drm/msm/hdmi_phy_eliza: Add support for Synopsys-based HDMI phy on Eliza
> 
> Add driver for HDMI phy block from Synopsys used on Eliza SoC. Adjust core
> parts for handling HDMI phy initialization sequence.
> 
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>> @@ -168,13 +171,17 @@ static int msm_hdmi_phy_probe(struct platform_device *pdev)
>>  	if (!phy->cfg)
>>  		return -ENODEV;
>>  
>> -	phy->mmio = msm_ioremap(pdev, "hdmi_phy");
>> +	if (phy->cfg->num_regs)
>> +		phy->mmio = msm_ioremap(pdev, "hdmi_phy");
>> +	else
>> +		phy->mmio = msm_ioremap(pdev, NULL);
> 
> [Severity: Low]
> Does this use a fragile heuristic? This logic overloads the presence of
> power regulators (num_regs) to guess the format of device tree memory
> resources. These two hardware properties are orthogonal, which could break
> if future device tree bindings diverge.

Ack

> 
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c
> [ ... ]
>> +static int hdmi_eliza_pll_calculator(struct hdmi_pll_eliza *pll,
>> +				     unsigned long rate,
>> +				     unsigned long parent_rate,
>> +				     struct hdmi_eliza_phy_pll_reg_cfg *cfg)
>> +{
> [ ... ]
>> +	s64 precision3 = 1e3;
>> +	s64 precision6 = 1e6;
> 
> [Severity: Low]
> Are these floating-point literals supported? Scientific notation defaults
> to double literals, which relies on compiler implicit conversion to integers.
> The kernel strictly prohibits floating-point types.

Yeah, that's not really a kernel style but downstream pattern which I
did not clean up.


> 
> [ ... ]
>> +	/* expon = floor(log2(4.999999e9/base_rate)) */
>> +	utemp = 4.999999e9;
> 
> [Severity: Low]
> Are these floating-point literals supported? This is another instance where
> scientific notation will evaluate as a double literal.
> 
>> +
>> +	expon = fls64(utemp / base_rate) - 1;
> 
> [Severity: Low]
> Can this cause a build failure on 32-bit platforms? The direct 64-bit
> division operator triggers a dependency on __udivdi3, which is unresolved
> on 32-bit architectures. do_div or div64_u64 should be used instead.
> 
> [ ... ]
>> +	/* multiplier = 2*(floor(bit_rate) * 2**expon / ref_clk_int) -16) */
>> +	multiplier = DIV_ROUND_UP(vco_freq, ref_clk_int);
> 
> [Severity: Low]
> Could this also trigger a 32-bit build failure? DIV_ROUND_UP performs a
> native division, and since vco_freq is a 64-bit value, this requires a 64-bit
> division routine that is unavailable on 32-bit builds.

I got build warnings on this and remaining 32-bit, so I'll be fixing these.

> 
> [ ... ]
>> +	if (aux2 == 0) {
>> +		cfg->remainder = 0;
>> +		cfg->denominator = 1;
>> +	} else {
>> +		cfg->remainder = DIV_ROUND_UP(aux2, gcd(aux1, aux2));
>> +		cfg->denominator = DIV_ROUND_UP(aux1, gcd(aux1, aux2));
> 
> [Severity: High]
> Does this truncate 64-bit values on 32-bit architectures? The gcd function
> takes unsigned long parameters, which are 32-bit on 32-bit kernels. Since
> aux1 and aux2 can hold values requiring up to 36 bits, they will be silently
> truncated when passed into gcd, feeding incorrect fractions into the PLL
> configuration.
> 
> [ ... ]
>> +	/* stemp = (REF_CLK_MHZ/2**ref_ana_mpll_div) */
>> +	stemp = (REF_CLK_HZ / 1000000) * precision3;
> 
> [Severity: High]
> Does this premature division cause a loss of precision? REF_CLK_HZ is
> divided by 1,000,000 first, which drops the remainder before scaling. With
> REF_CLK_HZ at 38,400,000, the result truncates to 38 instead of preserving
> the 0.4 MHz. The error is then squared later, propagating significant drift
> into the PLL analog parameters.
> 
> [ ... ]
>> +	cfg->cp_int_holder = DIV_ROUND_CLOSEST(stemp3, precision6);
> 
> [Severity: Low]
> Can this result in a build failure on 32-bit architectures? 
> DIV_ROUND_CLOSEST triggers native division on s64 variables, which will fail
> to link without __divdi3.
> 
> [ ... ]
>> +static int hdmi_eliza_pll_prepare(struct clk_hw *hw)
>> +{
> [ ... ]
>> +	/*
>> +	 * This Synopsys PLL does not have a PLL lock-like register, thus there
>> +	 * is no way to tell when the PLL actually locked.
>> +	 * Returning now, would lead to stuck pclk or iface RCG clocks at off
>> +	 * (disp_cc_mdss_hdmi_pclk_clk status stuck at 'off'),
>> +	 * thus obviously the professional solution is to delay.
>> +	 * 8 ms was figured out during tests, not based on any datasheet.
>> +	 */
>> +	mdelay(8);
>> +
>> +	return 0;
>> +}
> 
> [Severity: Low]
> Is mdelay strictly necessary here? Busy-waiting the CPU for 8 milliseconds
> wastes resources in a context where sleeping is fully permitted. The prepare
> callback can safely yield the CPU using msleep or usleep_range.

msleep should be fine

> 
> [ ... ]
>> +static u64 hdmi_eliza_pll_vco_freq(u64 ref_clk_hz, u32 multiplier, u32 frac_quot,
>> +				   u32 frac_rem, u32 frac_den)
>> +{
>> +	u64 num;
>> +	u64 den;
>> +
>> +	num = 32ULL * 65536ULL * frac_den +
>> +		(u64)multiplier * 65536ULL * frac_den +
>> +		2ULL * ((u64)frac_quot * frac_den + frac_rem);
>> +
>> +	den = 2ULL * 65536ULL * frac_den;
>> +
>> +	return mul_u64_u64_div_u64(ref_clk_hz, num, den);
>> +}
>> +
>> +static unsigned long hdmi_eliza_pll_recalc_rate(struct clk_hw *hw,
>> +					       unsigned long parent_rate)
>> +{
>> +	struct hdmi_pll_eliza *pll = hw_clk_to_pll(hw);
>> +	u64 rate;
>> +
>> +	rate = hdmi_eliza_pll_vco_freq(REF_CLK_HZ, pll->cfg.multiplier,
>> +				       pll->cfg.quotient, pll->cfg.remainder,
>> +				       pll->cfg.denominator);
> [ ... ]
>> +int msm_hdmi_pll_eliza_init(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> [ ... ]
>> +	ret = devm_clk_hw_register(dev, &pll->clk_hw);
> 
> [Severity: High]
> Can this lead to a division by zero during probe? 

Ack

> 
> When devm_clk_hw_register is called, the Common Clock Framework immediately
> invokes recalc_rate. Because the pll structure is zero-allocated,
> pll->cfg.denominator is zero. This zero is passed into
> hdmi_eliza_pll_vco_freq, which results in den evaluating to 0 and
> triggering a kernel panic in mul_u64_u64_div_u64.
> 
> [ ... ]
>> +static void hdmi_eliza_phy_tx_lane_config(struct hdmi_phy *phy,
>> +					  unsigned long pixclock)
>> +{
>> +	const unsigned int bpp = 24;
> [ ... ]
>> +	if (pixclock * bpp >= HDMI_PHY_MAX_BIT_RATE)
>> +		hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_TX_COMMON_CONTROL_0, BIT(2), 0);
>> +	else
> 
> [Severity: High]
> Will this calculation overflow 32-bit bounds before the comparison? 
> 
> The pixclock parameter is typed as unsigned long, which is 32-bit on 32-bit
> kernels. For high bandwidth displays, multiplying a high pixclock by 24 will
> exceed the 32-bit integer maximum of 4.29 billion. This overflow will result
> in a smaller wrapped value, breaking the conditional check and incorrectly
> programming the PHY for high-resolution displays.
> 
> [ ... ]
>> +static int hdmi_eliza_phy_ready_poll(struct hdmi_phy *phy, u32 reg, u32 mask, u32 val)
>> +{
>> +	u32 state;
>> +	const u32 sleep_us = 2000;
>> +	const u32 timeout_us = 3000000;
>> +
>> +	if (readl_poll_timeout_atomic((phy->mmio + reg), state,
>> +				      ((state & mask) == val),
>> +				      sleep_us, timeout_us)) {
> 
> [Severity: High]
> Does this present a severe CPU soft lockup risk? 
> 

Ack, sleeping should be allowed, so readl_poll_timeout


> The readl_poll_timeout_atomic macro disables preemption and spins using a
> udelay. Looping a 2000 microsecond delay for up to 3,000,000 microseconds
> (3 seconds) violates scheduling rules and is very likely to trigger watchdog
> lockups if the hardware fails to respond.
> 
> [ ... ]
>> +static void hdmi_eliza_phy_init(struct hdmi_phy *phy,
>> +				   unsigned long pixclock)
>> +{
> [ ... ]
>> +	hdmi_eliza_pll_configure_pll(phy->pll, 396000000, 19200000);
> 
> [Severity: Medium]
> Does this bypass the Common Clock Framework synchronization? 
> 
> Directly invoking hdmi_eliza_pll_configure_pll here forcefully mutates the
> shared pll->cfg state locklessly. CCF invariants generally mandate that 
> clock state modifications are protected by prepare_lock. Concurrently
> reading the clock state from sysfs or debugfs could hit a data race.

Ack, but then programming guide will be violated.


Best regards,
Krzysztof
