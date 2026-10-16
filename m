Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0539443E3B
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137856; cv=none; b=hEFCrvzDkj+6JCnQI6sBjLa+5gERceKzfFtiFIEhTeMTNGCLmXQzqs0e03Hf9/+MpIUha3ZG56EJuECtiHAwbc7hbD5GOJg+rIHBucmR3ZHB5UiMMVlOeIBFj74qaLy7DZxvBa7J6MvGA20Y26EneH+5w7gx0j4AFOSbkFgrZqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137856; c=relaxed/simple;
	bh=1gCRGv5PfhwaFq6kB+XvISu78rAz6x7n1ZUFzkCG+Uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBYkYntN8lrUGD+8S22ywasjnJWcHVfkro8iupakJ4FsLdWjHFnA89IyEvUjYE9w5MpqfW7ZPDOkou5+rKCTm0aMsb+PzA2vCPFEY5TuuYB8Py2ZZWfVsF0jWJwoT8IRIlXvfwZCZRqOzjOtetWuHPXXFU52ui0VgKGnjgaL8oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=KZMVZHL8; arc=none smtp.client-ip=91.218.175.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="KZMVZHL8"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=1gCRGv5PfhwaFq6kB+XvISu78rAz6x7n1ZUFzkCG+Uo=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792137849; v=1; x=1792742649;
 b=KZMVZHL8R+I9y7p8jdYcPGs5hKKNm4s1Hsc6tIK55Wy+WbnVsWiz7gfj4rl4vA+IbRvf09wd
 YeOdcER63uL7O7ZG6AUl62IATh099IBkDgXPE3DX1XRo6oU6ei3CXAe4/Raw4HKi4NaqXVBq0yw
 kQrIyNcYZPQC5lP8pnEyacJWAjC18lTM4i+iJWIEWSeihFRh8T3eQO9lmXBx9JaF2Iy0EREdhAj
 +bY5jNCPxp9xZmi8YY/uLN4/xxK0p4ZcAtsCpvNRP3pUfILncgxNaYExSGDF7f7YqUWmbrOg5em
 15zcSUh9BzuNgQGcmzg+mrc9UCGsPDsIOJhN5OaQT9Jpw==
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b65444621253ef5f;
	Fri, 16 Oct 2026 08:04:08 +0000
X-Mizu-Trace-ID: b65444621253ef5f
X-Migadu-Flow: FLOW_OUT
Message-ID: <5f6c6962-9b05-4964-a0ed-ec7c3efc4d56@packett.cool>
Date: Fri, 16 Oct 2026 05:04:05 -0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: motorola-dubai: Add sound card with
 aw88261 speakers
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016073157.611956-1-val@packett.cool>
 <20261016073157.611956-6-val@packett.cool> <sashiko-outbox-173985@kernel.org>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <sashiko-outbox-173985@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/16/26 5:00 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dt-bindings: aw88261 audio channel assignment inverted
> - [Low] commit-message: inaccurate description of power-domains removal
> --
>
> commit df15644ca6ae81e8d6c78e4e8358dd5c5c68d8f0
> Author: Val Packett <val@packett.cool>
> arm64: dts: qcom: motorola-dubai: Add sound card with aw88261 speakers
>
> This commit enables the sndcard node with MultiMedia frontends, a USB offload
> RX link, and two aw88261 speaker amplifiers. It also fixes the audiocc
> compatible string and removes power-domains from a node.
>
>> While here, use the correct compatible for audiocc for this phone,
>> and remove references to power-domains from a 'reserved' node.
> [Severity: Low]
> Is this description accurate? The patch code removes the power-domains
> property from lpass_audiocc, which is a clock controller, not a reserved
> memory node.
>
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> index 3860ab8508a09..1e1c195de1af1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
> [ ... ]
>
>> @@ -699,6 +701,40 @@ &gpu_zap_shader {
>>   	firmware-name = "qcom/sm7325/motorola/dubai/a660_zap.mbn";
>>   };
>>   
>> +&i2c1 {
>> +	clock-frequency = <100000>;
>> +
>> +	status = "okay";
>> +
>> +	/* Bottom speaker */
>> +	aw88261_r: audio-codec@34 {
>> +		compatible = "awinic,aw88261";
>> +		reg = <0x34>;
>> +
>> +		dvdd-supply = <&vreg_l18b_1p8>;
>> +		sound-name-prefix = "Amplifier R";
>> +		firmware-name = "qcom/sm7325/motorola/dubai/aw88261_acf.bin";
>> +
>> +		awinic,audio-channel = <0>;
> [Severity: Medium]
> Does this assign the right physical speaker to the left audio channel?
> Channel 0 is typically the left channel, which contradicts the
> "Amplifier R" and "Bottom speaker" designation. This might result
> in inverted stereo audio playback.
(It actually was inverted before, and this is the correct tested 
configuration, but I think awinic,audio-channel might just be 
unnecessary now, yet to test that though)
