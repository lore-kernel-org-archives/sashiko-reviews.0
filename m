Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E033905F4
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 20:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037542; cv=none; b=KFchBfwZWxXlF+Uh/bEZPBgwjL5WVA/awqpe5hVH8bxUgXxP/JAkdU0uAX8H9kYu0UAAZ0enzGdjIoMtVQBTVsxvAyC3wcbvhoB++lHLYGm6D6/IftSDQW+7MJpFuI1O2Wjq7hqKRAOq3hq4wp2sK1UPqMBPZWiPGs1Nz2DyHuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037542; c=relaxed/simple;
	bh=wjrsyFAFBOqBoBS2Vr6+ezTs640vJuST6uXExrhL44o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfW9DzF/rf1f+WeoWz6FT94zeEM9qFqD+YQ7X+zPq50882CfmSH74e3+HrF0gNO8mGK0ywr6dewR008ia7BqtSH4WZw41mD3PhtYplZM90sD2N1SXCD+B2kT/kzARlBpBGhZmHRAWrhSaLAZjmGHIg5rclQt0UNnNOuMgyIkByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=PuMU2WWM; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="PuMU2WWM"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-486852c7b68so3774655b6e.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 13:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781037540; x=1781642340; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uC/gW0bqBQrvyjGENIA0EklxnQV7jgJOX02+wy/otqQ=;
        b=PuMU2WWMBgiOqCU/XiKnL/P9LUD6of/boEO1fPmvp+oo0DNivGUl2WqLWt2BQXZXgE
         zSM8tzFIqm2HnyROi/ww4yEVXsolr3rH1QjY3j8q8B2PHIoMTA45OqXFDzslCAH0oVhe
         /Yh5IB3uUO83Nh7ywFyMMciugZBmxhzAnoC7Gna5nCZem1VVy8LOKSVpdEmvtbr6tXDw
         UwBpjXP5B/1oXjdk9a2IZtcj1NAVCiwOu1x7YbonBEUEJm9zTbrLlk3gqrK8+Yu9pwD/
         LPjx0NSVMxCMVSOe6d3s4bAK1a1rxUmt2x1z4Kf+GgGuBubqEH9yNCVHGMSnT5AEYldp
         YR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781037540; x=1781642340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uC/gW0bqBQrvyjGENIA0EklxnQV7jgJOX02+wy/otqQ=;
        b=iQOmN9wUZgrl1male6D3kB6MV5dL4F7rfsBvnstaQB8YLHQGCZKX9GYi0VBy5oHK8y
         blibBD555OyVPK6nsFlo3JGu4kEHGrimFSKYRGQatT4+nlnwIO7dKU9xxfgB6bc6+Oym
         Nx0UYShqclXX0SaU129i/6y9q8nq9MevjpPhjyJSbXxKESJkUr5ovToebHUDT9JXRvH/
         OJgr6jEaKCDCYSH4ciZGJWTxQN2w9kPSxYz2UMtL31djRPgLIXz2tTqi0Sd5afQc4/N7
         JyhGC5H7Mk4r3pQBauJ0QOtH97D5eWUKf1sZXtuFBmwWdsGXC/JkVpEYNrFEyoYLIwRK
         CUcg==
X-Gm-Message-State: AOJu0YzOXl3yF+/f6xIAiGng19ohKJmc5VuxrDW1Kzh2rNOUDh4UvhSI
	m7NUySbSXsibimHb3GhxlTjRR4k1hRHb1pY8ieF5lCq0/nQc0QrM+/35rEVNjoWBVjeJoO7DbgI
	UvlzJbCA=
X-Gm-Gg: Acq92OGqurO5I0+7pLuB/ByUr7t0qERsaGn147VULHpuWuaRiT5mCBMt2N2ZK1KghYL
	enejqAmQbvUIcIDyASFWIi001H6ls11kUqU7kNfhqd7jpZ4BDWYLx+TRuVBDd+aHzxck4aEs9Pt
	uFkH+RxRjisZkr/RetPpUGd3SWzYBMP2ixxZPlJ33AAQB6TN1jcqpa4KhiSMAdYLnA8CUmqH5+t
	2bNSQgrzDb0vsbpQe1pJXOsiXU7FP+5rWF+P7iQSEADmWFmhSAiKv+N62N1xUrrnwmhXUhf9hTx
	fa7trCCLJGeui54joMBEKj3LB1ln5UD2IoDhVX4lGZq/5lz5fMGMMrRQHgnYUu8xfrEZZ5tTwyY
	d37OoTglv8u+nHsUL372/fPgPxz9/jqijMq2CaSJ3BdQHmy8XSk7e6b29f6n0vwlrpnK3z3HEef
	Xc4cf8db8xbTpPWZWjIw9gUO3My1XhvSI9SXwN8XXoCMJg
X-Received: by 2002:a05:6808:d49:b0:479:e869:5424 with SMTP id 5614622812f47-4868dc7df9bmr12485645b6e.19.1781037540345;
        Tue, 09 Jun 2026 13:39:00 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e78e7f9csm15313928a34.17.2026.06.09.13.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 13:38:59 -0700 (PDT)
Message-ID: <8bc8bd9c-2982-4186-809b-13f7b75f7fd4@riscstar.com>
Date: Tue, 9 Jun 2026 15:38:58 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 01/14] dt-bindings: net: qca,qca808x: Add
 regulator properties
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, bpf@vger.kernel.org,
 conor+dt@kernel.org
References: <20260605010022.968612-2-elder@riscstar.com>
 <20260606010120.590881F00893@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260606010120.590881F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/26 8:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The device tree example incorrectly assigns a 1.8V regulator phandle to a 1.05V supply property.
> --

Impressive catch.  This will be fixed in the next version.

					-Alex

> commit 9408235f22241ddbd72a22ee2611a98eece3d7f2
> Author: Daniel Thompson <daniel@riscstar.com>
> 
> dt-bindings: net: qca,qca808x: Add regulator properties
> 
> This commit adds four power rail supply properties (avdd18, vdd, vdd18, and
> vdd125) to the QCA808x ethernet PHY device tree binding. It also updates the
> example section to demonstrate how to configure the power supplies.
> 
>> diff --git a/Documentation/devicetree/bindings/net/qca,qca808x.yaml b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
>> index e2552655902a3..3c1b7eca33caf 100644
>> --- a/Documentation/devicetree/bindings/net/qca,qca808x.yaml
>> +++ b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
> [ ... ]
>> @@ -25,6 +25,18 @@ properties:
>>       enum:
>>         - ethernet-phy-id004d.d101
>>   
>> +  avdd18-supply:
>> +    description: 1.8v analog power supply.
>> +
>> +  vdd-supply:
>> +    description: 1.05v power supply.
>> +
> [ ... ]
>> @@ -39,6 +51,8 @@ examples:
>>               compatible = "ethernet-phy-id004d.d101";
>>               reg = <0>;
>>   
>> +            vdd-supply = <&phy_vreg_1v8>;
>> +
> 
> [Severity: Low]
> Is this the intended phandle for the vdd-supply property in this example?
> 
> The property description defines vdd-supply as a 1.05v power supply, but the
> example assigns what appears to be a 1.8v regulator (&phy_vreg_1v8) to it.
> Could this discrepancy lead developers to copy-paste an overvoltage
> configuration into their actual board device trees?
> 
>>               leds {
>>                   #address-cells = <1>;
>>                   #size-cells = <0>;
> 

