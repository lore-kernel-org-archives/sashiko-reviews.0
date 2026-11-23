Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449652;
	b=QB8x0NhV7p+xvA5dUgRZ4PYFn9DFFibbqql2GCiQRpspR/b7Us1qbyVV6+2IueQSOiop
	 MMJhnedDyN8EzV4AQawDANoDm5S5PK2z54nIOeTz5RmREvq534g/M6GqvUJuz8ssB/Opw
	 G+NsJIz2xqLfuvpiUgOrn+GkgZvK4s0fit6GQc6psOYascQUMYpaZBHr88qybeXy0qmtQ
	 SUdhyICjZZp62CpA4i5JE5CvcFk5qog9Od/0Ig10dPVAI0Wsi7DradyX9BP7b5I1KOzYX
	 g+sRZZgwyaP5ucYh7X5we5Oh6eHV+3+T2MjCfxD5ff9GCfS/4D4zP2AzpeFKp2p9vIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449652;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4p/D3PbATuxtQeuk7eymT/zAWtBGaKRQTsY1rB5za+g=;
	b=VXGsruz4m7jSnVa3Nb4pv9GwHvlK5deNi7+Ob0J1loQhu1ftYtxxdGyLQYkEGA3njV7f
	 Axao2Nm0tS/ZwSmtkWCdiQWN7JbE9r90lh8qx+lklizcz8+B9buc8DyppoVMZ2J1oOxFh
	 ZLu2R89HaiA8+6Q2M8e+ZISOYhoahdo/fasCAKnn3xKbP/+7MWfpmUQ2zvzPl+RXZBvQV
	 0PYslUrovCyCYyfbE3E+fUuIksKkKcMw8L+U7yamYMR0KJxRdP9dZF13N2XorMYyJ8rJa
	 0dwkmv0e+RRFsGetPreeQ0Sgl7Cy0Mk82AX4/KDU0OSEon4JeuOmQaSbaQGKbvBzGJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=gdbhM5ay;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A0606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 16:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=gdbhM5ay
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 73CC0534024C;
	Mon, 23 Nov 2026 17:00:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795449647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4p/D3PbATuxtQeuk7eymT/zAWtBGaKRQTsY1rB5za+g=;
	b=gdbhM5ayMVFXR4B4TwTrvfY2p3A54nTJ+ywC0oISdFZjobymhuOkS3ySMk7wmS4E709NEC
	3h/ZXv6+NAbSdc+Oq+rHf70CAFkIVYfipt7EeDq+oenHHfmK2k/obmL/HH61sK6ebq9rrZ
	p2TVD84ZoLJE/1zGNsHrqywRFw/Yg7s=
Message-ID: <d67611e1-771a-4e71-8da9-1f5b8635b49d@ixit.cz>
Date: Mon, 23 Nov 2026 17:00:47 +0100
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
Subject: Re: [PATCH v11 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261123-pixel3-camera-v11-0-d00195d180dc@ixit.cz>
 <20261123-pixel3-camera-v11-1-d00195d180dc@ixit.cz>
 <sashiko-outbox-229342@kernel.org>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <sashiko-outbox-229342@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 14:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: sdm845-google: shared MCLK2 pinctrl placed on
>    camss
> --
> 
> commit 68e8cf5f08b67a7bed75adb265a543d6741f3995
> Author: David Heidelberg <david@ixit.cz>
> 
> arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
> 
> This commit adds devicetree nodes, regulators, pinctrl states, and CAMSS
> endpoints for the two front-facing Sony IMX355 camera sensors on Google
> Pixel 3 devices.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
>> index 3c9656b88b696..1c1cc036dcfe8 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> [ ... ]
>> @@ -351,6 +390,53 @@ vreg_s3c_0p6: smps3 {
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
> Should cam_mclk2_default and cam_mclk2_sleep be placed on &clock_camcc
> instead of &camss?

No need for that, works reliable as is. // just for the record.

> 
> Both front_cam and front_aux_cam consume CAM_CC_MCLK2_CLK from
> &clock_camcc, while their only link to &camss is the bidirectional
> remote-endpoint graph cycle that fw_devlink relaxes to
> DL_FLAG_SYNC_STATE_ONLY.  When imx355_probe() runs before camss binds,
> &camss has not bound its default pinctrl state yet, so GPIO15 is not muxed
> to cam_mclk when imx355_power_on() enables MCLK2 and
> imx355_identify_module() reads the chip ID over CCI I2C, causing both
> front sensors to fail probe permanently.
> 

No failure saw so far (using it for like 2 months).

