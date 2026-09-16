Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9C04F30EA;
	Wed, 16 Sep 2026 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563923; cv=none; b=ELNAg/nRUXFmPVUAC82nDUUzj1NXiDH0pMdGKf37kRk63YJboM3r47LBBqgnB62I0gDELE+0CgfMrQ87CdKkmTf3J91VPUuzlzvNGXWjNZmQ0SABcofMVYKbpkrfjyagKeuiZ0IG1faK+hPzQWDf/lVKyk15/pXShf4HJFVfmdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563923; c=relaxed/simple;
	bh=SsctNH5FmqemHATJAMbpcX9sz+jJtOnczWLqKjqnwQ8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l0G2yFD/GQXw2EbaTF438zNWOAiOkI0G+CglFyihldyq9EiLSYuzKMnNSgHbl9Egsz+2dQRtCyhREdgaulojpeh4Rff+GKTxn92Wmlc8C5rHNBzYepKytiDTJlFV/nRyPs+lkRv1LSxgMrvehVm8syAWekZMdHccnVjLvPERD2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=sOFMQxfr; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="sOFMQxfr"
Message-ID: <28052bf6-1a8a-42e9-86c7-cfb89d663a06@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1789563426;
	bh=SsctNH5FmqemHATJAMbpcX9sz+jJtOnczWLqKjqnwQ8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=sOFMQxfrqZCMmKHyB1FwqzOMR9479k/3p9m2Y56tUSKt5UItQWQP8RH/hV+0BdkAa
	 Un8y+T0KuN1LtANnhkKEEqF31aBn/A0XbNGqsqDZjyXW/LHRBrotqlXr8zz1gzkKkQ
	 fIfw9LQ4sngGhQD0LkajpBcw4ZN8gnSWsfxJzEhI=
Date: Wed, 16 Sep 2026 14:55:41 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v11 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
 <20260902130216.55BC21F00A3A@smtp.kernel.org>
 <20260910141629.GE1051768@google.com>
Content-Language: en-US
In-Reply-To: <20260910141629.GE1051768@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 4:16 PM, Lee Jones wrote:
> On Wed, 02 Sep 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] Parent MFD driver introduces child-specific private resources (fan configuration) via a platform data struct in a global MFD header, violating MFD separation and coupling principles.
>> --
>>
>> commit 85d716a1f91fa9e8e2f48479df8c7b07e0cf0279
>> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 support
>>
>> This commit introduces per-variant configuration structures for the KHADAS MCU
>> driver, adding support for VIM4 specific registers. It also introduces an enum
>> for variant matching and a fan platform data struct to pass fan configuration
>> to a sub-driver.
>>
>>> diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
>>> index a99ba2ed0e4e0..7a9980ea63e7e 100644
>>> --- a/include/linux/mfd/khadas-mcu.h
>>> +++ b/include/linux/mfd/khadas-mcu.h
>>
>> [ ... ]
>>
>>> @@ -88,4 +95,21 @@ struct khadas_mcu {
>>>  	struct regmap *regmap;
>>>  };
>>>  
>>> +/**
>>> + * struct khadas_mcu_fan_pdata - fan sub-driver configuration
>>> + * @fan_reg: register address to write the fan level
>>> + * @levels: table mapping logical cooling-device states to raw fan levels
>>> + * @nlevels: number of entries in @levels
>>> + */
>>> +struct khadas_mcu_fan_pdata {
>>> +	unsigned int fan_reg;
>>> +	const unsigned int *levels;
>>> +	unsigned int nlevels;
>>> +};
>>
>> [Severity: Low]
>> Does this struct introduce child-specific private configuration into the core
>> MFD driver?
>>
>> By defining khadas_mcu_fan_pdata to pass thermal cooling state levels, it
>> appears the parent MFD driver will be forced to handle configurations specific
>> to a single sub-driver. The MFD subsystem principles indicate that the core
>> driver should only handle shared core resources, while child drivers should
>> manage their own private configurations.
>>
>> Could this approach create tight coupling where any new fan variant requires
>> changes to the core MFD driver, rather than keeping those details contained
>> within the thermal driver?
> 
> Agreed.  Why can this not live in the fan driver?
> 

Thank you for the feedback, I will send a new proposal without this.

-- 
Best regards,
Ronald
