Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662280;
	b=H100rHcu+I8T4rCgJFk3zF4ZaoCD7hr45yg2+S+BkNHqOAmIh8Mt/bCxBlG2+Cu256+8
	 ijsQCQqrra/sbuHU1e62kfvwBkh8R36eZvrSMv1nFznPuTX0GB6+niBufAhiQD3wUQZsy
	 gfefM9hTvhcmF8e1pFgnY5qU0i4ILlUOhYUUd0XhPR+rtIE8T73fhyU37CDkGwGp3w89x
	 RVOyKfsu2cp/Whq/igCrXDr/HoaCsA8w4sCV6DZX4lE2QmxwCEv9dBpjvHeJY1xljDGme
	 cCtTkP7NX4yUxi+7CbBFheHuDx8+iQH5bgjSW4ZV4Bc0HKRz5ji8KIk9WQJwP8wG9Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=D2K7zZ8vA27g3Bom8qpakpX6z92oPkrZ5BShXGJhQXI=;
	b=vbfM5/g00cYpD9Tt3sKNoc1grpvcY24pRycS5u+TVF2/4XyYdWCNQbkh0Hn7d6SBt70s
	 QoqAs3RlOlXIQbN4dw3i7/bnbl4dyuyq+rH2Z4wuDEfHdIanO/NQLe2FY1UtexgedFhtI
	 msJWi49Ya5LE0usRTLPLTspowH9XCrCgPgk5kT3JYlOmw99JlL1vtYrCinedFKeeUamt6
	 djbogoSEsnMh6yCWj9zF6fDS8gE2u/mudQ2Lbs2/LtgvpTcUpCkGkQTPp0ISTX/FhJuIx
	 i/QrCtll9ywnYAK2GA56JKK8qzhtNtjhjMOKVphLKXYpkdi99+rMFT6zthj4wlaQrNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KGKDwqCt;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA786606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 09:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA786606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KGKDwqCt
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so1337717f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 02:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792662277; x=1793267077; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2K7zZ8vA27g3Bom8qpakpX6z92oPkrZ5BShXGJhQXI=;
        b=KGKDwqCtg/ZvQzwT0KQvYggVNMFQJ2w5XOepDadz73j9CVdAX8N/xHXJjZUSjwhzGo
         0d/lv/pjidOKCxg+DzAX67e5iJmZ5jXVnk78a0eEHKD9w+iSzwez0WdM8fzBXIIdwz/E
         qfHUUD84neRMh3mgwOmJdlUAgxyidhNn/1G4cnhyC1vTe73pfI9PhVnZyHKmHk28BzmV
         8xQiSvKsPdg74xSeS0TEMaCdu9WjAsaYlx9i/kChW/752118cvkRUMiOH8GXbEQV+dh+
         eVjdDPYCzai9mQsSxiglAoS9ApBJqTGtbSrc0zdPU6n3EtcK+yqnz5wWV212zM870drJ
         L3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662277; x=1793267077;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2K7zZ8vA27g3Bom8qpakpX6z92oPkrZ5BShXGJhQXI=;
        b=01cOI60AlPGLxeiNjBTOWPxPO3VvUZTkgWHHVuLibaR8zwQQEs/1saYo53aGjmcZeN
         iKntaV5nC9krkBvzSGLaFcRMj8qXO5Ht4/YIewA6gbu4VAzHuWCfsOETLBzy3aan/UMW
         SVKILk7nrc4cOeAvZ9UVJ5ymtor0WNuUgCNk3Fwpc17Bx5U575deg05LER+rSSs4xwac
         Qtkklxrrm6Ih1EfojGIRXBYmMIzfowtrFjmZ5hEXRLyH68Piy6UzPuYoUJsP1nTz2Pcu
         fPqeeaVVpVY07maQm9WaIx/xtCiGvs4lsoTDAOjlibgJX5rfHZfiVQ6ic1KsOyi7KyDN
         /n0A==
X-Gm-Message-State: AFq9FYLrhl93RQo12O9Lqra3bOe78xioUw82TJYjix2x+8lXORVfxbZR
	/R/JZnIXTr+5pzxe7IRYcWcX/ZI7xf9RPBf9GnYZbs+snbxJHtYQSWPBTlmM+fBwBWk4cZdncmi
	wDhoS
X-Gm-Gg: AYBFou2ObxMVfq/j8YWUzVu3EwLq1VtttaiW+fpnBoC4/PCaizTKy+CAaQYZJO4rXl4
	qPJMsL9dynkkOLdYf7meBa9kJiRk60lT6Z5wSdmYACJN1BSPzDOuSrAUJ7JKg5STKwkYl/kcFwb
	USa1pEkI4V5fxyTvv13bwrVOhCXFNV9A9FyV62fSqh83/mHxVuiXrgWzGsJ/TSyx74eUnclzVsM
	J1+kelrGQOSn/v1gJ1o/dtCWzdw+3/LnuJjr+5WPrF32I9stKO5X/L7+2QaMhu+rOIj5POFMKa0
	8OrRcqV9nuHyuiyfRyASDg12PhDfbODJRkm1fFMm9jZeO1opNKc9aAlWRp4mxNny30P0BDwKw3Q
	zJKSea4urI8lsfgf3NJBJmn3nUZTGGDQyOWtQSKGtUv2SLbdBD+yjYW127RbWsNXHlRXcTCseP0
	xfA1UYesXg9ilSQlV5NZmodJT7hybQAIR1wU0oakHyUw8TKo39+RKSXPizYIn8JjHStIQdh2+Bs
	8cnAgtOAqf+4KdieDYUUuXbLsQAu39e5V73pPhbgvCqujgR67v9tZvsy6Da0DXRaxE2+PVJaiGN
	xeTBytkROpMHC+xHV76WF+myGIIALbsTYBU=
X-Received: by 2002:a05:6000:1184:b0:488:8384:c382 with SMTP id ffacd0b85a97d-48e264de064mr7320656f8f.49.1792662277127;
        Thu, 22 Oct 2026 02:44:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:211e:45da:8a88:2665? ([2a01:cb1c:fcf:4600:211e:45da:8a88:2665])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583f25asm11006187f8f.45.2026.10.22.02.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:44:36 -0700 (PDT)
Message-ID: <5bf81f06-6a19-4ce7-bda8-937d3159a2ad@linaro.org>
Date: Thu, 22 Oct 2026 11:44:36 +0200
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
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-2-aa1030a75e46@linaro.org>
 <sashiko-outbox-181264@kernel.org>
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
In-Reply-To: <sashiko-outbox-181264@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 11:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] arm64: dts: qcom: sm8550-hdk: active HDMI DAI link breaks display-card audio
> --
> 
> commit c6bfa3ecf122e125408eec9949d0c3f7b965b70b
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
> 
> This commit adds I2S and audio MCLK pinctrl states to sm8550.dtsi and
> configures the PRIMARY_MI2S_RX backend DAI and HDMI playback DAI link on
> sm8550-hdk.dts to output audio via the LT9611UXC DSI-to-HDMI bridge.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> index e75e3b878e89e..6c09816983a23 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> @@ -278,6 +278,22 @@ platform {
>>   				sound-dai = <&q6apm>;
>>   			};
>>   		};
>> +
>> +		prim-mi2s-dai-link {
>> +			link-name = "HDMI Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&lt9611_codec 0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>>   	};
> 
> [Severity: Medium]
> Will leaving prim-mi2s-dai-link enabled when the display card overlay is
> applied prevent the sound card from probing on sm8550-hdk-display-card.dtb
> and sm8550-hdk-display-card-rear-camera-card.dtb?
> 
> In arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso, the LT9611UXC
> bridge is disabled because DSI0 is routed to the display card panel instead:
> 
>      &lt9611_codec {
>              status = "disabled";
>      };
> 
> When the sound card probes via sc8280xp_platform_probe() ->
> qcom_snd_parse_of() in sound/soc/qcom/common.c, it iterates over all
> available child nodes of /sound and resolves each codec phandle:
> 
>      qcom_snd_parse_of()
>        for_each_available_child_of_node_scoped(dev->of_node, np)
>          snd_soc_of_get_dai_link_codecs()
>            snd_soc_of_get_dlc()
>              snd_soc_get_dlc()
> 
> In sound/soc/soc-core.c:snd_soc_get_dlc(), the lookup checks registered
> components without checking whether args->np is disabled in DT:
> 
>      int snd_soc_get_dlc(const struct of_phandle_args *args,
>                          struct snd_soc_dai_link_component *dlc)
>      {
>              struct snd_soc_component *pos;
>              int ret = -EPROBE_DEFER;
>              guard(mutex)(&client_mutex);
> 
>              for_each_component(pos) {
>                      struct device_node *component_of_node =
>                              snd_soc_component_to_node(pos);
> 
>                      if (component_of_node != args->np || !pos->num_dai)
>                              continue;
> 
> Because lt9611_codec is disabled by the overlay, its component is never
> registered, causing snd_soc_get_dlc() and qcom_snd_parse_of() to return
> -EPROBE_DEFER indefinitely and breaking all board audio when the display
> card overlay is used.
> 
> Should prim-mi2s-dai-link be given a label in sm8550-hdk.dts and disabled
> in sm8550-hdk-display-card.dtso alongside lt9611_codec?
> 

Good catch, will fix

Neil
