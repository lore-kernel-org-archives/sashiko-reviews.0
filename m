Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCEA1A6817
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784487428; cv=none; b=Xf4d99RXYJc8ZOYgm58JTFlvA2TrhKo644v47e8n3ASCd/OzR8DAhh1mB0oAplNWhVZupRkax0XD31cuj0S1+ttbcxo7/BWFoUEIoOXs3PY9NHpp0e7EK8winEY1i3lBTnxaZWv6guChliAzoUdUqNgLCy5wS5KnIJejKcKe8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784487428; c=relaxed/simple;
	bh=m8iaPY7YFuKpcueS3QWeksBwilW6M2mmlKOuioskBi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kP+Sb+q6+5KfdNVzOMp2a0qkjLjWcGzVLWf5DeZu8WWu10OmNMEYaDzlVKg5KBBfVl78vhfki4ePC+4O5P38ykLeZXTVPNrkyIfMBX/HumMnY+OcXXyvsLp55kFvdPpUFpj7JP9dPthwQN2csi30Gbx6hSVk/PCFAR5JBdXZdCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=roinVsHy; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="roinVsHy"
Received: from [192.168.1.182] (ip-62-24-73-79.bb.vodafone.cz [62.24.73.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 4EBF453402C7;
	Sun, 19 Jul 2026 20:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1784487421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uwuygl609oY5jPviWbtTa2poMC/Sj4YTbIRXUtyilZk=;
	b=roinVsHyVfvjHAYVYlM2yiy2tU1Wm1taJTrG+ftkm4+PE14MEbQa3tfDvHKyNIJJ/ufv2g
	wgkCNJ99Nm596UNmhx0OzGEs/Q0qk7vqZ7hDnlKPesrtZ7mCks1xE52LUmZKD0AjIU4dSw
	8AdhEwCOiY51dnCxkH1vfg0btNqW6y4=
Message-ID: <1e24a75d-8e23-4767-8648-72d148e7083a@ixit.cz>
Date: Sun, 19 Jul 2026 20:57:00 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz>
 <20260719-pixel3-camera-v5-1-99593f1bd8ec@ixit.cz>
 <20260719182401.D720A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20260719182401.D720A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/07/2026 20:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Pinctrl for MCLK2 is attached to the camss consumer, causing a probe deadlock that breaks camera initialization.
> - [Medium] Incorrect pinctrl sleep state override for I2C bus causes power leakage and configuration conflict.
> --
> 
> --- Patch [1]: [PATCH v5 1/2] arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras ---
> commit 650af867be78a11fabbd3346603a6fc8f7cb758f
> Author: David Heidelberg <david@ixit.cz>
> 
> arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with different
> focal lengths (standard and wide-angle). Sensors are connected via CSIPHY
> port 1 and 2 and controlled over CCI I2C1, using MCLK2 as the clock source.
> This enables support for the dual front camera configuration.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
>> index 9368fd6b87515..cb5c261802bc9 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> 
> [ ... ]
> 
>> @@ -351,6 +389,52 @@ vreg_s3c_0p6: smps3 {
>>   	};
>>   };
>>   
>> +&camss {
>> +	vdda-phy-supply = <&vreg_l1a_0p875>;
>> +	vdda-pll-supply = <&vreg_l26a_1p2>;
>> +
>> +	/*
>> +	 * MCLK2 (GPIO15) is shared between both front camera sensors.
>> +	 * The clock is generated by CAMCC, therefore the pin is
>> +	 * configured here rather than in individual sensor nodes.
>> +	 */
>> +	pinctrl-0 = <&cam_mclk2_default>;
>> +	pinctrl-1 = <&cam_mclk2_sleep>;
>> +	pinctrl-names = "default", "sleep";
> 
> [Severity: High]
> Will this cause a probe deadlock that breaks camera initialization?

No

> 
> Since fw_devlink parses the remote-endpoint properties, it establishes that
> camss depends on the imx355 sensors, meaning imx355 will probe first.
> During the imx355 probe, it requests and enables MCLK2.
> 
> However, because the pinctrl for MCLK2 is attached to the camss consumer
> rather than the provider (camcc) or a dedicated gpio-gate-clock node, the
> physical pin (GPIO15) won't be configured to output the clock until camss
> probes.
> 
> Without the clock active, will the imx355 sensor fail to respond to the I2C
> read for its CHIP_ID and fail to probe entirely?

Yes

> 
> [ ... ]
> 
>> +};
>> +
>> +&cci0_sleep {
>> +	/* bus has external pull-up, don't pull down */
>> +	bias-disable;
>> +};
> 
> [Severity: Medium]
> Is this targeting the correct CCI bus?

Yes.

> 
> The commit message states the cameras are controlled over CCI I2C1, which
> uses cci1_sleep. By overriding cci0_sleep instead, does this leave the
> I2C lines for the cameras pulled down against their external pull-ups
> during sleep, causing a continuous power leak?
> 
> Additionally, without using /delete-property/ bias-pull-down;, won't
> cci0_sleep incorrectly contain both bias-disable and bias-pull-down
> conflicting settings?
> 

-- 
David Heidelberg

