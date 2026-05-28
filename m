Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3300426B973
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982117; cv=none; b=aOCU9Xfm8NZ6Cv3Xld33h//an4IqELK4/FDeeKaglPY/MFNHLoTt8mcg87mHj1Ix6NuCBQVJ4sgacRm9a5e/q5DA2CpDR5Akuk29uZerxhpQJqOy9rloerSDGOLXLJR9c6Q3C/HXFYhrfeUB/iWgIcEY5M3qMmqK6c/9WeDKt6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982117; c=relaxed/simple;
	bh=eeEMIJjxVyJLBdL8FEaWHTXSNzVQEV3p0297m14anKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1E7SB92bcKaSso+16XXw+rk73abfREeehK4AVLwK/7OiRt8vZKd/ffxVwFj8ZEMwsCy+zMtieSWFXLLLal7RQ2Iltkl87JqnwnMoPxwlHRiX5ptlb8PWp8GC1w+saKgPNZboaF7fj4EM/itnzgb+5TXNrGe5izAIaiEvmD9wFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=TAK8w7U2; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="TAK8w7U2"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E36E84B8557;
	Thu, 28 May 2026 17:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779982114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=t0W1udPINrIavFGb3a52KDavbFALzINfXswBdNoYZbc=;
	b=TAK8w7U2Vrt57VszqooF7CL3RTycS4qG8jd82Za7JKN0lQeh8akjJEmVvOg2+h6Z+paDPO
	f3QUBnMhN6AEnAOSfi0LIm5mz6H1duDy1uCFjlYVnFqalUkbnQH7pcUDJgsD15zP7UWCMY
	VI8ViBOeW1A7HJqw7pPq64QLAsbS8ykFhQtDof33eQgTla0uXqlUPd9UtUpWmms41YAX5W
	reYwThUZPGYWw7P1rG6aJHvBxknN3jma78pbJ2OBk55hWmGbCruWm5Zz4B0kXglm14s4vr
	m0ECopZLAamXEcEinmwGpNLHYdhkQbV/ca8T0v8vSkACgjceelD/iiqswlFrIA==
Message-ID: <562d7eb0-6536-43ad-859c-1ee2a83623e0@cjdns.fr>
Date: Thu, 28 May 2026 17:28:23 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 2/5] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260528140046.2897674-3-cjd@cjdns.fr>
 <20260528144536.4BCEA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260528144536.4BCEA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 28/05/2026 16:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The commit modifies the `compatible` property to remove the fallback and strictly require 4 interrupts for the `econet,en751627-timer`, breaking backwards compatibility with existing device trees.
> --

When I first contributed this driver, I added an en751627 compatible 
because I knew it to be present on the hardware but en751627 support was 
not developed. Now we know that for this to work it requires 4 IRQs.

This was a mistake on my part the first time around.

Thanks,

Caleb

>
> commit 4d76d221e102e3fd0badbb607f955a94dc92884a
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> dt-bindings: timer: econet: Update EN751627 for multi-IRQ
>
> This commit updates the device tree binding for the EN751627 timer. It
> modifies the binding to require an individual IRQ number per timer instead
> of a single shared percpu IRQ.
>
>> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> [ ... ]
>>   properties:
>>     compatible:
>> -    oneOf:
>> -      - const: econet,en751221-timer
>> -      - items:
>> -          - const: econet,en751627-timer
>> -          - const: econet,en751221-timer
>> +    enum:
>> +      - econet,en751221-timer
>> +      - econet,en751627-timer
> [ ... ]
>
>> @@ -52,21 +51,31 @@ allOf:
>>             items:
>>               - description: VPE timers 0 and 1
>>               - description: VPE timers 2 and 3
>> +        interrupts:
>> +          description: An interrupt for each timer (one per VPE)
>> +          minItems: 4
> [Severity: High]
> Does this change break backwards compatibility with existing device trees?
>
> The previous schema allowed compatible = "econet,en751627-timer",
> "econet,en751221-timer" with a single interrupt.
>
> Modifying the compatible property to an enum without the fallback and enforcing
> minItems: 4 for interrupts on the en751627-timer means any existing device tree
> using the old schema will now fail validation.
>
> Can this cause boot regressions on previously functioning deployed systems if
> an updated driver expects 4 interrupts and attempts to index into an
> uninitialized IRQ array?
>
