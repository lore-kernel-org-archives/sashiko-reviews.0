Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295563254BB
	for <sashiko-reviews@lists.linux.dev>; Sun,  5 Jul 2026 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783258342; cv=none; b=mFQpvdmMROSZc8/uS7o9FJHvDlO+hyXS0ey7+ebRNCunyARIIbOaCbqzL6C6zq8fobAJZH/nFGQJMDZo+2UaHKDRmQITC6c5vXQeFjrjtBQmea0Bylq36BQc6xVi/N9X9FO7hR89DvvrH4dR9ZtpgqtN1GKSVGfw2+AmNVfreME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783258342; c=relaxed/simple;
	bh=seHVJUyqa9aSBvOyTdNEHCDYxu/mToEdAFd2tfd09AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tAxGfHDLb9SnAOyaehFKGwN27L4fFyInmF9BVcYBLTtqoUh5slVfwC4ZLdjs5/uDPp8c2AsgjHDu7FROcDevwxfdZyTg3EfkPE2/GHJroVvg37K9FdPyaothu/3d22nWBksVwP3DNbu2k4bKtHgicV2IV4S3+7ci4QdFdm/9qtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=vSeMcuv8; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="vSeMcuv8"
Message-ID: <5f65074b-760f-4d09-9d7a-34202d5917ab@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783258339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTmlDRgNraQsD+AV2gpWxhAPRQr9N8rs/H7TaWydj3k=;
	b=vSeMcuv8NouWtEUbJQDVT1TWLX+omooB31vvsAGBQay0fJ2pvC5iSle2FzPOLpmf7GMgRG
	rq0FR6u34oaenxJP24QQQet2Mbk79vFOq8vGasoSw+a+wvVKxNY+HWq4wapTBfmKYfOcAL
	Vj83qscNXYwUOTyiMKYaU4oC8nz0Noo=
Date: Sun, 5 Jul 2026 15:32:18 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 02/10] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8132 compatible
To: sashiko-reviews@lists.linux.dev
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-2-e5655ee56523@cyberchaos.dev>
 <20260705132421.233081F000E9@smtp.kernel.org>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260705132421.233081F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/5/26 15:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The newly added compatible string 'apple,t8132-aic3' (and the pre-existing 'apple,t6030-aic3') are missing from the `if:properties:compatible:contains:enum:` conditional block that enforces `#interrupt-cells` constraints.
> --
>
> commit 4be0e67c14a594eec020638f7ba5290c4bf05496
> Author: Yureka Lilian <yureka@cyberchaos.dev>
>
> dt-bindings: interrupt-controller: apple,aic2: Add apple,t8132 compatible
>
> The Apple t8132 (M4) SoC uses an AIC3 as interrupt controller, same as
> the M3 predecessor.
>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> index d0d9a90e96e7b..7171c8c09feaf 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> @@ -44,6 +44,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - apple,t6030-aic3
>> +              - apple,t8132-aic3
> [Severity: Low]
> Does this new compatible string also need to be added to the allOf conditional
> block further down in the schema?
>
> Looking at the conditional block that enforces the constraints later in this
> file:
>
> allOf:
>    - $ref: /schemas/interrupt-controller.yaml#
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - apple,t8112-aic
>                - apple,t8122-aic3
>      then:
>
> It appears "apple,t8132-aic3" is omitted from this enum list.
No, this is correct, as t8132 is merely another alias always to be used 
in combination with the existing apple,t8122-aic3 base compatible which 
is already in the list.
>
> If a device tree node is written with compatible = "apple,t8132-aic3" and omits
> the fallback string, the top-level schema will flag the missing fallback, but
> this conditional block will silently fall through to the else branch and
> incorrectly permit #interrupt-cells: 4 instead of enforcing the strict
> #interrupt-cells: 3 constraint.
>
> This is a pre-existing issue, but it looks like the "apple,t6030-aic3" string
> is also missing from this conditional block.
>
>>             - const: apple,t8122-aic3
>>         - const: apple,t8122-aic3
>>
