Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CCD36D500
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064842; cv=none; b=s/9G5xfhlhJXtffZ207MTsbVst7rsLTnchS+vCDJYialsXZvn8J5eObTA0txqTX+Bin6cWkg7HcQpyMJfnzE+cja9VrTgKpDzu3pBJpKwTJzApOO2LdYEB0ff5lRJ0Emal2Kc5uMZab3MNegmEr1jFaXG1Etmwr90FM2wyq8oYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064842; c=relaxed/simple;
	bh=7IVWCHfP5MwVTCA3fIsaCAaolAt/KSw/x8IVH8+NdoQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mwBuTY3SN8OOsP33FgksvLV42zHpJYLFKsCYVZ4yW1YsfDr0+4Cnb5mh4qnbexSmFdbVqvMEzJlyqlflVvb3HEV51nGIxdF7wmZQKiTJVRP3N2aBv39u+8MRj14f9oWr4v2lNOdpht3+kfSUvb6YISpvJX4bnhCN0urgKnkMV0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEEvvqY/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEEvvqY/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-479b7aada85so279536f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783064839; x=1783669639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p62SZWRaW03RXCqUmh0+MOM6FMNGTWsoP+vgWvFmoQ=;
        b=LEEvvqY/NET7kJBCO30xsMWDNu9DghbIdHTecktaYueivqspKlf1HDu2Ve7mxCgJA5
         rokyxtKgK0UyiVmqQK8dw+4gZrrvJ2e4J9D844B4A/fiKW3yduB5jKCgfvlzp+pAM0Al
         1gZerqYO2rZex2xKUkyrDtDvigw0Z3dd8Ym3c6J5OB+mecsU/5KGQHmxFkrQ8iG5kDik
         XZ6IiMFsr9iQv8PvI8nRpU1E1ZH/SfUqz8+5oGfDN4kLVR8wjRb7b/9261IdVJ7CN/V/
         i1MpwZV/M5ZF4+lTRMn1xqI9xfcidgtmroBX1jTFU8shYB99A5RlU8V9hdGiZdaAsUJ5
         05rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064839; x=1783669639;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p62SZWRaW03RXCqUmh0+MOM6FMNGTWsoP+vgWvFmoQ=;
        b=rEiusDCn+7iC3ee+AOesws9YfrfAY0NHiv9oUbTcvbWDQHHIPUcNyHaQNAlHw8tRgW
         0eA2RuNpnw4p8RzI+5+l9xWaKlwpq7yZE8NpiD9tm2mFsYnEYo+ud3gUvnSAmsd0LbVU
         7YXaLyB/eAOjaGP/7S5HRDgz/L5zDCiBhUMRn90jpKfGEP4lciyfeUBOaPudN4QNjnM7
         XDZGEoQVNhL4HHJkUpWA7MRAzlBdkqN++057mi/nrCXF87cUjdyRHRAUdCndGlSY7BAJ
         V+T1IlzZbKnQX0gms5kTi2LfECATu5z4uNyRiVPdFxEVV6FC4pLXTd4/S8NQ6el/DXDY
         MM1A==
X-Gm-Message-State: AOJu0YzH6smN5912AT1R8T/V2MTYGPIx/BDJhFXhiU6nn9xCRO5DTYS8
	AySnRVkU2ZfHdxOjPTCSW6bMITvu26l6S7VDFs8xRy0IOLL3xoL9f3dnqoAtl7woBw9trDwRAlU
	QEMmH
X-Gm-Gg: AfdE7cmOMfh/ze731PS9RJtaHJozabuOEOI17JpiYOIVe6UHWK1dNkpSlTtK6OGv+1C
	CSo9gm+uS3DXNEMv2xiHdapUztAcky5JFtrH4MZDsv/LGSVapSzl7P6rnFcl9xFbGEb+g+CYkms
	YRCfUiCd9uUl457HImovZfMJnZgZbxDSMq/lzcwo8rBXGg5HYeEclrPVwca3DQAAYZIl3xYuOkX
	zkOP7W3WcZ7ib2QTeRgx6R8wJk7BBAclMpdkFPPlztaZ3Ezwq6JJZaztxEefw/owEjJY2IXUw5w
	hXDWe6QY467oVDqdDq6TJFloNRucBDqdnsMJFNo10MOExoTCENAM1RiLGOEPxrAIDnTgHmwE/Mg
	UQjjKxddgAmjHq6Gg2V4JHBtNtDn+rUCMuIWYZV2Atx4IEALkkeUrbHSNVxGEgFqXgwcIyxKcbj
	9Qe7eDFzURs3BdQPZgDJz2003KvX8S5Q1qChj+FYXwCcBfkMoNBjXs5bAXybebEt1Qkn5Y
X-Received: by 2002:adf:ed42:0:b0:477:80fa:f44d with SMTP id ffacd0b85a97d-477b5677843mr9598440f8f.40.1783064839203;
        Fri, 03 Jul 2026 00:47:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e9e1:7bf9:472f:c4d8? ([2a01:e0a:106d:1080:e9e1:7bf9:472f:c4d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbc75sm16621817f8f.5.2026.07.03.00.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:47:18 -0700 (PDT)
Message-ID: <446be9c1-b9a6-485a-b21b-ec812c163e8a@linaro.org>
Date: Fri, 3 Jul 2026 09:47:18 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8650: add CPU cache size
 properties
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260615-topic-sm8650-upstream-cpu-props-v3-2-eeb6e9fa7581@linaro.org>
 <20260615165606.ABC8B1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260615165606.ABC8B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 18:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The L1 data cache size for the Cortex-A520 cores (cpu0 and cpu1) is incorrectly set to 64KB (`<65536>`) instead of 32KB (`<32768>`).
> --
> 
> commit e69e8fc4f3866077641d02b02b7f11554b632507
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650: add CPU cache size properties
> 
> This commit adds L1, L2, and L3 cache size and line size properties to the
> CPU and cache nodes in the sm8650 device tree. It splits the unified L1
> cache properties into instruction and data cache sizes based on clidr_el1.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index e8e43ddc3032a..090a4739ebc1d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -75,6 +75,11 @@ cpu0: cpu@0 {
>>   			compatible = "arm,cortex-a520";
>>   			reg = <0 0>;
>>   
>> +			i-cache-size = <65536>;
>> +			i-cache-line-size = <64>;
>> +			d-cache-size = <65536>;
> 
> [Severity: Medium]
> Is the d-cache-size for the Cortex-A520 correct here?
> 
> According to the ARM Cortex-A520 Technical Reference Manual, the L1 data cache
> is strictly fixed at 32KB (<32768>), even though the instruction cache can be
> configured to 32KB or 64KB.
> 
> This misrepresentation of the hardware topology could potentially lead to
> suboptimal scheduling decisions or misguide userspace optimization algorithms.

Just looked into https://developer.arm.com/documentation/102517/0004/L1-data-memory-system, and no it clearly states:

L1 data cache	32KB or 64KB

This is AI slop

Neil

> 
>> +			d-cache-line-size = <64>;
>> +
>>   			clocks = <&cpufreq_hw 0>;
> 
> [ ... ]
> 
>> @@ -117,6 +126,11 @@ cpu1: cpu@100 {
>>   			compatible = "arm,cortex-a520";
>>   			reg = <0 0x100>;
>>   
>> +			i-cache-size = <65536>;
>> +			i-cache-line-size = <64>;
>> +			d-cache-size = <65536>;
> 
> [Severity: Medium]
> Does this node also need to be updated to <32768> for the 32KB fixed L1 data
> cache on the Cortex-A520, similar to cpu0?
> 
>> +			d-cache-line-size = <64>;
>> +
>>   			clocks = <&cpufreq_hw 0>;
> 

