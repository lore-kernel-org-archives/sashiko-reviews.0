Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C32EEE95
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649121; cv=none; b=TBiJaMhfYa8748a91unl8mwHnNy4YhGByr1HTqjjyKY4vJ+y0dsflY3yoSxF/byKaRirt5w/gFLfnGT6rDfOYJNd8ti6tl7uFXGrvtQzYMhm7sw+9g1fZcSOW+iC/ElSmsFJbMbopnFZ+VYBhoaftV/no2l19mVSqO7NN8kM6yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649121; c=relaxed/simple;
	bh=8WCPoeh0BcZLAKb8hLkhJB2+pNWKzYNgBA/oVZlehgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDYdgmzgJUi8X4rHPbQd9azSrdGkuQpAmyhEgaVzkIRSyg01/6ob0rspjtLwXESXxRRSj9JLpj8DcQDjugMu35UzF5ADsD6Qqju1vb9XLOnLDBZtDKdA4s7U7eDsLDsCLLC8B8GZSM1FIXNamkxHTh++EkM/BJcCvKuJd1qViYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wVQAz-0003dG-DJ; Fri, 05 Jun 2026 10:45:13 +0200
Message-ID: <3cbee0dc-87a9-4b87-9d22-b3e378fa57c3@pengutronix.de>
Date: Fri, 5 Jun 2026 10:45:12 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add default-intensity property
To: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 sashiko-reviews@lists.linux.dev
References: <20260605-multicolor-default-v2-1-ed07271df6b0@pengutronix.de>
 <20260605073816.E916D1F00893@smtp.kernel.org>
Content-Language: en-US
From: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <20260605073816.E916D1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: sashiko-reviews@lists.linux.dev

Hello,

On 2026-06-05 09:38, sashiko-bot@kernel.org wrote:
>> @@ -73,6 +73,17 @@ properties:
>>         - keep
>>       default: off
>>   
>> +  default-intensity:
>> +    description:
>> +      The initial intensity of the LED color component. Used only during
>> +      initialization. Defaults to 0. As the intensity of each sub-LED is
>> +      multiplied with the overall brightness, without this property on a
>> +      sub-LED, the leds-pwm-multicolor-LED is effectively initialized at
>> +      minimum brightness regardless of its linux,default-trigger and
>> +      default-brightness properties.
> 
> [Severity: Low]
> This isn't a bug, but the description for default-intensity explicitly
> mentions the specific driver name leds-pwm-multicolor-LED.
> 
> Since common.yaml is intended to be a hardware-agnostic specification
> for all LED bindings, could this wording be updated to refer generically
> to the multicolor LED or simply the LED to avoid leaking an
> implementation detail into the generic schema?

I'll be leaving this as-is until human feedback.

I think documenting the property in common.yaml is correct because the
default-intensity itself is applicable to other multicolor-LED drivers,
I just only implemented it for pwm-multicolor because that's what I use.
But we could just as well move it to leds-pwm-multicolor.yaml for as
long as that's the only driver supporting it.

I intentionally included the "pwm" in that sentence because the
described issue that default-intensity is effectively required when
using linux,default-trigger may be pwm-multicolor specific.

I would not like to omit the sentence either because this situation is
the reason why one might actually need (not just want)
default-intensity (for -pwm-).

Regards,
Jonas

-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
