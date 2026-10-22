Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662291;
	b=ic5KTBl6iSmoafAL9u974sIorHNuo/Z9h3PNsFhjQgW0t3GyQyCNzAC2JDzNp9KkLWVp
	 Mt9sqLIzkbnuaYQ3jcVQg7GTJPQFq7IKQ4/1J41vSW0w7dQTvMoiNA48+KbC8ZpY7vTpv
	 jakzqwtBaPW3coNBGL1ya3HKygIwyxgu8Ws/73R/tVuprBInmJtUiRWKNpBCEcD6mygZ9
	 bEe6T5Y8kZtHBctce80gm83jw7ZtJmnopTyLg656wif4Zy0FU7VON60n7Wog8RkTfrbEc
	 x1o0yL0drXKLHGJmtc8M6qpmBw2EUvCUhAYZPm7llsQtjuqrEeZkclDIBM3RZ3F18/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=f6CiKd9vploQ3thnAtvKilPGMztbzzs5Gxheqi3WCGQ=;
	b=sE+fM85ANqzY2wCNMqNA1R67h1wV67bIBwHXB+YhpbQyPBdFKW5dvRaM1kXwaNlAjzud
	 nTjtRb+zTFuYI46he4N2GOluM54cBdQzqAI1Ioeh/hq53iXSj1Zghavp2aGIV3XRCz3to
	 FtTjI4l6eK0MFZpwSYjaNvP5J/dizbhiLbB+AWrpnxqTfIfD3mBCH7MhQDNEInUYMdPps
	 gHboB2GAmaNHC4owbhSVLXxeoeDY7BRP8Nbp6M1AM5tBL/y7TWhx3rq0DV9ER5qID+0bH
	 3m/qpc+qSMAXhhZd4TbNw3wdqgWTASLq4XBWJuVidiCXFt591MPJfsfgcoc8tI/CKtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SPWVtiE+;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E6606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 09:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 243E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SPWVtiE+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2109825e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792662289; x=1793267089; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6CiKd9vploQ3thnAtvKilPGMztbzzs5Gxheqi3WCGQ=;
        b=SPWVtiE+XnHLxfi0yp+D+tYUFE/COKlYjWmqDPW2/SF4o44N0YXoYQp3ZGaqA71UlY
         eLOH85h+Q4rQOxxUpPMNktew7mw0mQDFknp8C2xNZdLi6QF3YN5P0+5lWoc7p4PgRbT1
         ej3+5AMxNH/J4XYveYS7CAG7LLHcws7Kny0kMZq559UzSYbU/4rB0wddAEsqcqXoVxZw
         IY1Q8ZxvhnYbWdya0FJkuPHzuK5cwG7jrMwK4PCzdLOcOpwCmxBLWVAWIb5PbM0NfSKg
         e4Xhe1MEKi8NE8Jb8MKsru+JLehGpr9SQElZ9kzCyXPLn4Xfll2yXGvZTLduWrDEu8Ac
         VWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662289; x=1793267089;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6CiKd9vploQ3thnAtvKilPGMztbzzs5Gxheqi3WCGQ=;
        b=t+wjzgbZx0VPFjF0n/wQVjlY4RmCMUDG/Te31AiexkiFrPsPREHg61VZ5oLi4dW/In
         77qKzeSUxiqvm74AOL2PfqHuS1r1g4tZJdsneg8FKpQr5X9Hs7DwGyxanPifXbo2D/77
         C7VDmQ9Ur4HDMCgOBJQCBLMfxYp3aPB60PROe/7gSX2YYiY/k32XpXuE+vyA/nbO9zZb
         UGaB39ht6Qr8cTY3uB7nasf5muu0SX4Es+b9DkSnzZl2vP2wZKatt+AXZr4IqIQ+3BnX
         rRoI5Wvm761sVyQAXDwNq8u80++0tVBallRUQ2cH6iTx7NYWanfXMWkh2K7v693w/Ak2
         cpxg==
X-Gm-Message-State: AFq9FYJJY1Ru0RhuYkN9G537HQEBRHTSEtWvjVjbLSQNFHmfc5dbIFM4
	oHfweOLvzeSvAb3QFxcgMJLfej7rKXO+xs9Zu6NH48zKRPPTlTNk7Q+CU2I8rp8QSKimqsfTmD5
	qxN6b
X-Gm-Gg: AYBFou2mvos3h29xGUt2l8QU/5krYIh4fPa3ndUTR6UmPxz9/1v7t9HD38cs3DEffF9
	XgoY/AeKfo1YkTXILAFt2NAmoLL4jGJGTD3wJueybjWZGSQOSHFS8YAO6iAo3elHiNSSPIrhQO1
	Ij9TK31+ZM5aiFoBGFsgSvlpQmR4EoiGDTD+Tb2xmqvMFKX1O7duuvEF8SywED8zXicGXBdhkc7
	Ng+y/LiL7DHGXNkkVyPf6gWsiBbhsENHBdEsSP2AUFltw9kegg7GMABz3I4SBwc54rUb3+/4S7u
	r4Jq8f6QJ7Cf32hVD2Jg8f3ONMccN9SVCKB2TdQ9mL1PoLpYR0kYvIudz9muyyLuMI0VydH2vlp
	uhGFcEgEKEv7d/N2w5qJ/w9laig4FJ1IhnBsBSz10AmSYWFyDgHNw60kJw5A24nX7xsn+IBIVEW
	/PHHA3gANaJPSB0279HkqIx2bycbeLALB/foNRQoPJFWmIQfjG+1Qa449ngjZlwbw5V60a8knG5
	scYhCr8eb9LNcSSnFhIqgTJSF2ulSBZkYLt2CtSVvvlD5Fcpj3KdXPRPc1XhMNspfLbCCILPWFp
	Tmuq1dCg5BMXqCp7Bh9IQw/0GDy+FUtq8UU=
X-Received: by 2002:a05:600d:b:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a1fdd1f18dmr78709625e9.32.1792662289474;
        Thu, 22 Oct 2026 02:44:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:211e:45da:8a88:2665? ([2a01:cb1c:fcf:4600:211e:45da:8a88:2665])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b29907sm54557935e9.3.2026.10.22.02.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:44:49 -0700 (PDT)
Message-ID: <a07fddc5-20a8-4171-bfd6-f74e472fff47@linaro.org>
Date: Thu, 22 Oct 2026 11:44:47 +0200
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
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-3-aa1030a75e46@linaro.org>
 <sashiko-outbox-181265@kernel.org>
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
In-Reply-To: <sashiko-outbox-181265@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 11:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: HDMI DAI link breaks sound probe with display-card overlay
> --
> 
> commit 1d7b2eb9f1841da26b5c6030ed7671341483661b
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
> 
> This commit adds the primary MI2S DAI link, Q6APM backend DAI clocks, and
> TLMM pin configuration needed to route HDMI audio through the LT9611UXC DSI
> bridge on the SM8650 HDK.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> index 6cb0dc089b17a..eba989e6766bf 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> @@ -218,6 +218,22 @@ platform {
>>   				sound-dai = <&q6apm>;
>>   			};
>>   		};
>> +
>> +		pri-mi2s-dai-link {
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
> [Severity: High]
> Does adding pri-mi2s-dai-link unconditionally here cause a sound card probe
> regression when booting with the display-card overlay
> (sm8650-hdk-display-card.dtb or
> sm8650-hdk-display-card-rear-camera-card.dtb)?
> 
> In arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso, both &i2c6 and
> &lt9611_codec are disabled because the DSI lanes are routed to the display
> daughterboard instead of the HDMI bridge:
> 
>      &lt9611_codec {
>              status = "disabled";
>      };
> 
> When that overlay is applied, lt9611_codec never probes or registers its ASoC
> component, but pri-mi2s-dai-link remains enabled under /sound.
> 
> During sound card probe in sc8280xp_platform_probe() -> qcom_snd_parse_of()
> (sound/soc/qcom/common.c), for_each_available_child_of_node_scoped() iterates
> over every available child node of /sound and resolves the codec DAI via
> snd_soc_of_get_dai_link_codecs() -> snd_soc_of_get_dlc() ->
> snd_soc_get_dlc() (sound/soc/soc-core.c):
> 
>      if (codec) {
>              ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
>              if (ret < 0) {
>                      dev_err_probe(dev, ret,
>                                    "%s: codec dai not found\n", link->name);
>                      return ret;
>              }
> 
> Because neither of_parse_phandle_with_args() nor snd_soc_get_dlc() checks
> of_device_is_available() on the target codec node, snd_soc_get_dlc() returns
> -EPROBE_DEFER indefinitely when looking up &lt9611_codec, causing the entire
> sound card probe to defer forever and breaking all audio on the board. (The
> same issue also appears to affect prim-mi2s-dai-link in
> arch/arm64/boot/dts/qcom/sm8550-hdk.dts with
> arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso.)
> 
> Should pri-mi2s-dai-link be given a label so that
> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso can set its status to
> "disabled" alongside &lt9611_codec?
> 
> [ ... ]
> 

Good catch, will fix

Neil
