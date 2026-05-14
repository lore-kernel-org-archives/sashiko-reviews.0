Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1C5426EDE
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778772137; cv=none; b=BKIKMHDuKeW6n/3m77PA/aYrmjTgTlRvCzxy3TbDj2rnAuuUixjHIVFQHv+DRCG2bzY2GOYlXi/m0od5brr0MVKLPLg/SWvyyw6QRd5dY4Y4llb7iUV2QOcQHSh7OASQqvhL78f26bY2cW+IBPlrbqcBqdEdlaNW6GyKrQt25IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778772137; c=relaxed/simple;
	bh=V6qObgAZ/8hMUFqea2LYv5tf6j+hTtLWS+i37NwyaQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8WyNyk53X6N+XZM8P7NBNbDrAdWj/Iyc5X+FArnF+AUMVAs82WRLwJcR7stusYniGLe131r2BLkJBiDBotfGue7UmGvjQ+RHcN/c2FRBUzOlb4q/T7AwPXPfXYNj71MUuNtbB/GZEmXs0pAVuIFMAhjaLTP8Kqi+/XiBtVrR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=msAy41lZ; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="msAy41lZ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D18E3C049D;
	Thu, 14 May 2026 17:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778772130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=iPIEtsOB9x3Ey5zEUP6k0EZzT9HMxltvUAX8Ft7+obc=;
	b=msAy41lZfa3wmojt6qzahl/zTAhRJ0D4yQx0gU7+ju8UXA+lYWxoP3QXfJhr3tPG2Lx9g7
	aDACBEOH2lB75yu1r96HFfvVaqUYuPYwRrDIReLPLHN7MOCeqNM+q8Mk2/8km3TAMD5rge
	JOpYk4aXrfpJ93XY4gooDRf4sQzm8Qn01/e2tk4vRUdYmyIyJxeLxZ2dVnLlqjssxpWTIo
	jncILW7g6C8Hak/Cig/DvqeE7IcOXzlAXNDAxbAW7m0z2IjOrqUWM5j2q/Y+rGW31633Sr
	87SGBBZ16VuhlewcEq2m57sngixx5yFzKd4d73PVxTGj8qVDdoxXCY0UHGm+Dg==
Message-ID: <23568f49-4b58-4acd-85fa-7eba5e99b46c@cjdns.fr>
Date: Thu, 14 May 2026 17:22:05 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/5] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
References: <20260514000601.3430262-2-cjd@cjdns.fr>
 <20260514114243.126F4C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260514114243.126F4C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 14/05/2026 13:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Invalid fallback compatible string for incompatible hardware.
> - [Medium] Outdated top-level binding description.
> - [Low] Missing item descriptions for the new interrupts.
> - [Low] Grammatical errors in the commit message.
> --
>
> commit 5cbd9643ff098f6fa9a3e82043e46dcf9b0a9953
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> dt-bindings: timer: econet: Update EN751627 for multi-IRQ
>
> This commit updates the en751627 timer hardware to use individual IRQs
> per-timer rather than the shared percpu IRQ used by the en751221 family.
>
>> The former uses a percpu IRQ for all timers while the
>> later uses an individual IRQ numbers per-timer.
> This isn't a bug, but there appear to be typos in the commit message.
> Should it say "latter" instead of "later", and "individual IRQ numbers"
> instead of "an individual IRQ numbers"?


:sigh: it seems I'm physically incapable of not doing this. Anyway glad 
for the bot to pick up after me.


>
>> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>> index c1e7c2b6afde1..f338739e039c6 100644
>> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> Does the top-level description in this file also need an update?
>
> It still explicitly claims that the timer has a single interrupt line using a
> percpu-devid interrupt mechanism, which is no longer accurate for the entire
> binding.


Good catch.


>
> [ ... ]
>> @@ -52,21 +52,31 @@ allOf:
>>             items:
>>               - description: VPE timers 0 and 1
>>               - description: VPE timers 2 and 3
>> +        interrupts:
>> +          description: An interrupt for each timer (one per VPE)
>> +          minItems: 4
> Could this include an items list detailing the specific purpose of each
> of the four interrupts? Defining an items array for each interrupt (such as
> Timer for VPE 0, VPE 1, etc.) would help ensure clarity for driver developers
> and enforce a consistent definition order.
IMO should be self-evident.
>
> [ ... ]
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>>       timer@1fbf0400 {
>>           compatible = "econet,en751627-timer", "econet,en751221-timer";
> Is it safe to retain econet,en751221-timer as a fallback compatible string?
>
> Device Tree fallback strings declare that an older OS can safely operate the
> hardware using the fallback driver. Since econet,en751627-timer uses four
> individual shared IRQs while econet,en751221-timer strictly uses a single
> percpu IRQ, they appear to have fundamentally incompatible interrupt
> topologies.
>
> If an older kernel boots using the fallback, the legacy
> timer-econet-en751221 driver will attempt to map the first shared IRQ as a
> percpu IRQ via request_percpu_irq(). This will fail with -EINVAL, causing
> the timer driver to fail to initialize and potentially leading to a boot
> failure or system hang.
>
> Should econet,en751627-timer be defined as a standalone compatible string
> without the econet,en751221-timer fallback?
I find this argument compelling so I'll switch.
>
>>           reg = <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
>>           interrupt-parent = <&intc>;
>> -        interrupts = <30>;
>> +        interrupts = <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
>>           clocks = <&hpt_clock>;
>>       };
