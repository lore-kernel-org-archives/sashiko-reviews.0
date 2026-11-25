Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595563;
	b=zmTP45sexrytqIMvL2uzHGPVGC7fO4lj0O/KUtvBcMeleS4wZPKqDO4xVJybGOsS8lOb
	 D/p9zWNf4h3pnEOc+USEaKSiJdNnfRFlXqfGXuno1Tz+NnDczUy5viKy8Gw9u8dnzFgM3
	 yUc2h1XfSUOM0+qst3oMvxrU7jcrE+xNOpKJ/LpjAF5nsJ5iF+3ZPA31tM0OJqTROocAF
	 rQddqzwjX/NKFLVFF8TfD7tX7zbzPtiZEqmbslNrH7rjb3kAz5PkCilplSjWQHaHd8lsw
	 76+fAnxwsqwc3Y1PgcLhfaNEOWMONuAAhXnbxhupCWsdJPpXZt7JpEZ/CSayxCkjONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z7nVlkXNx7FQmO9ItasInEpMKvgYG91F7qwPmFbmBqU=;
	b=tbYAt8MayXCQNV/8OuGZx+5HLrjWOQP8DjXBV+MFtnkEFWPhUotmJ1pzSEi5YUErSgSp
	 KN6vFqn7XOg6o4bpD95Dv1i8ztENbDyF1BsK4z86RazfWlV8TG2r3O8cgTSy/NfauKP8S
	 MD1G+iZ2nIdR9WyQnXJ+cMWcZgyyaw/O3tYh8cAVB25lSF9RdgUIDkSjy3pqGQzT7KCFp
	 gR8NeUi0NekWDu2m7z9ZtVaAjcC/e3Djsa0Wovy+UpUCJqW2YRQ5wLTZYDUr/GnVK2owA
	 /u4zS6ACU9MsAwVD+2nskA5JpGnEllw3WY2Lje3Y5Me+EfiLREL52JgzjrtXB91Es7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WGWBwvsw;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A471606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 08:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A471606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WGWBwvsw
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so31239755e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 00:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795595560; x=1796200360; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7nVlkXNx7FQmO9ItasInEpMKvgYG91F7qwPmFbmBqU=;
        b=WGWBwvswThHrGlGbDeNcDchjiP43hpfWWsvsdHHNSOoC6oX0/46eSsR8pEXoJJ4xni
         T2lPjkooQfcbAaM4sT8WKemJh0caKxDLUuk6r6Ckgc1X7SGNgGGiGXqzxmPdphyewPad
         lKIfAfX/ZbAU1THaRi2XAGxPrwaaBhpKKxnsTxLaxRPqhJv6Fm4mBFj1nZZT3IrC+6GJ
         yJ3Y9lI5jlSVIIxXws0HpUJDQn+t6ciz0UVR9gkopZJAT1Uh+g73sn+91yFVlwSvj/dB
         nuvcL7+YFtAbWuFgcpt7x+KHkq4otRICQz8009DY+5leyNDDrXRQtD5gDp27Vrbno4Rq
         ZnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595560; x=1796200360;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7nVlkXNx7FQmO9ItasInEpMKvgYG91F7qwPmFbmBqU=;
        b=v8g32ShCihFeBEertJg8Xj8vTNOU2dl8CLutgqCKeZtnaEidBb0fMhVtBLucBlCgJV
         dPzD1cr3O7JCwGEA5JHUilLTFyKUUD9v/g8o8D8wG9C6xvg8JSk6r3tQtXmz6zjiwP3f
         fg7C/7KK7cNy9DVYMY6DfDR12nHgjAYLLpPdFnMUbQee91QQsEJbq5e9xoQWeIpxiltf
         kEt/vRLIgJBP9XWpscjqcB2bt9UA2OzF8Rm8Fl9dkcjU5NmjC3Izk6SAWSjCkDss7dGi
         HJY5eytAJ8ez/fkjcVqzRiC9LoFxEoYi07O4X/YHJKu2ISrcPL9Ms0BB8+IhtDUV5KIZ
         T5aA==
X-Gm-Message-State: APuU4Z9E2WXDb2v6fRqxI7UliIN8MP4AqkwapWB0eM1l3D0nTApVYd3v
	kUqN0zaCSp1qq4DZqEG+4blxm+saB5QupRK80hJ6AuAfhhlBdPHUx8gsZG+mHhc3XM6LL9MLgBI
	I+d2ikkf5sg==
X-Gm-Gg: AZFdTZc4EewxGwJnYVn0EVI24SI9Lqt/YE5eofDu08lL8vbKzBNrWQQ6Y3biobrKxGP
	FoVN07eBPhrbI0Cc8EA4medRB58WqZEzHZsv4Q8pQ+bJem3y4Za9UYmL8y/SVMeUsQqkGCRyQyI
	gSqs2+TqRzwmgJAqoDr9Jaiu+oQ20gLNV8FJGK1W3qZsHebUoy5xt0szRGRlBoVy6eNxMaMpagt
	NnBvQdGYfxpx7eroMSRATlCuPM1WLSeg6NUAQaf51Kevciq0TzruD0Yiz86LWYZZsxf3XSykG0G
	zyo6htNBQQ4wd00ibnMC/r+vkdzAIRtY12050Er3vl6m/S4BGj5iwJjwl3EvnFgJI7Ur6pz8dXT
	pU6E6w7U6qLB78AVMn/Ci4T78Jkdr0tFkQCycszuQDdBsTV1K1DzlfFfQfxf2qUZa24f3oPDx8e
	3OS4xi+g2rMPiffOgqNPSoTHyk83e0CxskOEwZuJyv2GXg6RkQD5GQ6YP4lNIpHZKi1EGkNVPK5
	mmB+sBKNGmO1i8eYw60w1aZvPYzsyBHKhjjrFqxEkDO2nBD38qCBOgmZpegInLbehiQQizB1XEk
	dzRD2d8ovon4szfZxTWqvFqPzWynrIY49jN3k80IgGUuLcbcLPhN6nGXTfwH3SuLY9eUh61Yl77
	q74Bh313ZHmF9lP7Bv+pOHrXzRuaLcw==
X-Received: by 2002:a05:600c:530f:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb887e21e4mr334917245e9.1.1795595560293;
        Wed, 25 Nov 2026 00:32:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm502783405e9.15.2026.11.25.00.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:32:40 -0800 (PST)
Message-ID: <5ffffee4-15f2-477b-b7d1-67649605b412@linaro.org>
Date: Wed, 25 Nov 2026 09:32:39 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: add SM8650 LPASS core & audio clock
 controllers
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
 <20261124-topic-sm8650-el2-clks-v2-2-8086440e2c09@linaro.org>
 <sashiko-outbox-231728@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-231728@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] clk: qcom: unclocked GDSC MMIO access in lpass_aon_cc on SM8650
> - [Medium] clk: qcom: MND freq_tbl used on non-MND
>    lpass_aon_cc_main_rcg_clk_src
> - [Medium] clk: qcom: MCLK branches parented to 2X RCGs instead of CDIV
>    dividers
> - [Low] clk: qcom: stale LPASS HM iface clock description in commit
>    message
> --
> 
> commit 5b9d49ed39635aa6cd0df792f0d843cc860ce478
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> clk: qcom: add SM8650 LPASS core & audio clock controllers
> 
> This commit adds drivers for the SM8650 LPASS HM, core, audio, and AON
> clock controllers so Linux can manage LPASS clocks and GDSCs without ADSP
> firmware.
> 
>> Add drivers for the SM8650 LPASS HM, core, audio and AON clock
>> controllers, the HM, audio and AON controllers keeping their iface clock
>> enabled while in use, LPASS HM's being the GCC LPASS config NoC clock.
> 
> [Severity: Low]
> Is the commit message description of LPASS HM's iface clock still
> accurate?  Only the audio and AON drivers acquire and manage an "iface"
> clock via pm_clk_add(); lpass_hm_core_probe() calls qcom_cc_probe()
> directly without setting up pm_clk.

Will fix

> 
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sm8650.c b/drivers/clk/qcom/lpassaudiocc-sm8650.c
>> new file mode 100644
>> index 0000000000000..abd0258d9e72f
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpassaudiocc-sm8650.c
> [ ... ]
>> +/* XO only for now: the ADSP plan feeds these from the audio CC DIG PLL */
>> +static const struct freq_tbl ftbl_lpass_cc_ext_clk_src[] = {
>> +	F(1536000, P_BI_TCXO, 1, 2, 25),
>> +	F(2304000, P_BI_TCXO, 1, 3, 25),
>> +	F(3072000, P_BI_TCXO, 1, 4, 25),
>> +	F(9600000, P_BI_TCXO, 2, 0, 0),
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	{ }
>> +};
> [ ... ]
>> +static struct clk_rcg2 lpass_aon_cc_main_rcg_clk_src = {
>> +	.cmd_rcgr = 0x19000,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = lpass_aon_cc_parent_map_0,
>> +	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data){
>> +		.name = "lpass_aon_cc_main_rcg_clk_src",
>> +		.parent_data = lpass_aon_cc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
> 
> [Severity: Medium]
> Should lpass_aon_cc_main_rcg_clk_src use a frequency table without MND
> entries (such as ftbl_lpass_mclk_clk_src) since its .mnd_width is 0?
> 
> Because __clk_rcg2_configure_mnd() only programs M, N, and D when
> rcg->mnd_width is non-zero, requesting 1.536 MHz, 2.304 MHz, or 3.072 MHz
> on lpass_aon_cc_main_rcg_clk_src (or via its CLK_SET_RATE_PARENT child
> branches) matches the fractional M/N entries in ftbl_lpass_cc_ext_clk_src
> during rate determination, but programs only pre_div = 1 in hardware,
> leaving the clock running at 19.2 MHz.

Will add a table with only 19.2MHz

> 
> [ ... ]
> 
>> +/* MCLK = RCG / CDIV (reset value: divide by 2), the 2X clocks are the RCG */
>> +static struct clk_regmap_div lpass_audio_cc_cdiv_rx_mclk_div_clk_src = {
> [ ... ]
>> +static struct clk_branch lpass_audio_cc_wsa_mclk_clk = {
>> +	.halt_reg = 0x2a0d4,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2a0d4,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_wsa_mclk_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_audio_cc_cdiv_wsa_mclk_div_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch lpass_audio_cc_wsa2_mclk_clk = {
>> +	.halt_reg = 0x2d004,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2d004,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_wsa2_mclk_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_audio_cc_wsa_mclk_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch lpass_audio_cc_tx_mclk_wsa_clk = {
>> +	.halt_reg = 0x2a0f4,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2a0f4,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_tx_mclk_wsa_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch lpass_audio_cc_tx_mclk_rx_clk = {
>> +	.halt_reg = 0x2c0e0,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2c0e0,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_tx_mclk_rx_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch lpass_audio_cc_tx_mclk_wsa2_clk = {
>> +	.halt_reg = 0x2d00c,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2d00c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_tx_mclk_wsa2_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
> 
> [Severity: Medium]
> Should lpass_audio_cc_wsa2_mclk_clk and the three lpass_audio_cc_tx_mclk_*
> branches be parented to their CDIV divider clocks rather than directly to
> the 2X RCG clock sources?
> 
> As noted in the CDIV comment above, 1X MCLK branches are divided by CDIV
> (divide by 2 at reset), which is how lpass_audio_cc_rx_mclk_clk,
> lpass_audio_cc_wsa_mclk_clk, and lpass_aon_cc_tx_mclk_clk are wired.
> Parenting lpass_audio_cc_wsa2_mclk_clk directly to
> lpass_audio_cc_wsa_mclk_clk_src and lpass_audio_cc_tx_mclk_{wsa,rx,wsa2}_clk
> directly to lpass_aon_cc_tx_mclk_clk_src with CLK_SET_RATE_PARENT causes a
> 2x rate mismatch in clk_get_rate() and conflicts with sibling 1X MCLK
> branches sharing those RCGs when clk_set_rate() is called.

Will check

> 
> [ ... ]
> 
>> +static struct gdsc lpass_aon_cc_lpass_audio_hm_gdsc = {
>> +	.gdscr = 0x11090,
>> +	.pd = {
>> +		.name = "lpass_aon_cc_lpass_audio_hm_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = RETAIN_FF_ENABLE,
>> +};
> [ ... ]
>> +static int lpass_cc_sm8650_probe(struct platform_device *pdev,
>> +				 const struct qcom_cc_desc *desc)
>> +{
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_pm_clk_create(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_clk_add(&pdev->dev, "iface");
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "failed to acquire iface clock\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = qcom_cc_probe(pdev, desc);
>> +
>> +	pm_runtime_put_sync(&pdev->dev);
>> +
>> +	return ret;
>> +}
> 
> [Severity: High]
> Can gdsc_enable() or gdsc_disable() access
> lpass_aon_cc_lpass_audio_hm_gdsc (offset 0x11090) while lpass_aon_cc is
> runtime-suspended and its iface clock is disabled?
> 
> At the end of lpass_cc_sm8650_probe(), pm_runtime_put_sync() suspends
> lpass_aon_cc and disables its iface clock (LPASS_CORE_CC_CORE_CLK), which
> also allows lpass_core_cc to runtime-suspend and power off
> LPASS_CORE_HM_GDSC.  Because gdsc_enable() and gdsc_disable() do not
> runtime-resume the GDSC provider device, any genpd power transition that
> runs while lpass_aon_cc is suspended performs unclocked MMIO on 0x11090
> and triggers a bus hang or SError.  For example, genpd_power_off_unused()
> at late_initcall_sync, asynchronous genpd_power_off_work_fn() after a
> consumer drops its runtime PM supplier link, or system suspend/resume of a
> virtual genpd device attached via dev_pm_domain_attach_by_name() in
> lpass_macro_pds_init() can all toggle this GDSC while lpass_aon_cc is
> runtime-suspended.
> 

It's probably fine, register access doesn't depend on the iface clk
