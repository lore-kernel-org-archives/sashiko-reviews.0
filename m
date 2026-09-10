Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BE4324B32
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053673; cv=none; b=CfdB3H1e6E+P2yUFi+izzOoAnpGBxfJB2EiSHzKQHZoEbWIWpZkGYOeN7Vkp8GhcEc+xnEHKVrgs4Bpv98NWgvTt4fkdtvcSBaRdEdgInXJJkmH/rTB5A7YwBM3xooaeVyuisTq5EqSnB+6KjZlBtIQIQU5nOWY8TxfnK2d7jKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053673; c=relaxed/simple;
	bh=0xEQgT/s8m3NJpOJD7G2kjNJ7WGRSRytpLzCpoikd6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9XL+sT2h4cJFR34Qjm6vIbdz2rxm1JK21nERoEdJE7aXqse4b9htSb86/YfcCTxRwDqEcz39DnIwRZ/raDxduTht2jugE8oSOtiwusSWuWGC4I8S42hS/OCCEDmVi3aDlxr9kf5fMBqBUHbtsB46y0Y1bwYMHY1ImpdMLisLMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7aAuatx; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7aAuatx"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4a483a552efso3311187b6e.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789053658; x=1789658458; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Is6QCpSLv4TMEMoNx1AAjKAPoWKXWN2o91q0iAaVLcE=;
        b=k7aAuatxVLkjZ+BkmMQZLdfjGvFLdgObmgb/iCUpsSdOBlMxRebr9mMgm8ykWs5POS
         sPUIsodISFYyTG1w5g8C9XfmZ3okQDCwteo52AkZlNV6FQhoq9+34/QcFzwz0USMW0/6
         b7bPFzZU6We+zhG8DqNAp2Ppkx3ZtMPp7tURccpJA6Zl/fEH/i8OKtiEbor+GGzaP8Fu
         JqX1ZE2Vk44ewyIpwaH57DcCvYpUwud9EZTcbqBLFa5Fm8RXsAvxs9TiDC+f9VV59xc3
         NjvS+V9+FQ65tXs9q8KGkXkDLQgbQaDojVrSCCFgizbXPYeNXlg93ng4QJAqgBRzXnro
         PO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053658; x=1789658458;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Is6QCpSLv4TMEMoNx1AAjKAPoWKXWN2o91q0iAaVLcE=;
        b=En/CPaHgVogcEb/XV9CK/i9lqgCJ/NwS0FmlozD+XWs3MYQVE5NZqKkZYdDULQmbXN
         nrJrHgSjW0iuDJPQaDr2isq8iPnUfBiBtMMjLbWJnZFM7bFjIU0yc3Vh3wqaC3BxVcyo
         GryMAlu8FZaL94yxyaVIxY0KZ+5R+9Adsw9Lz60FyhhfYjfYd3fnr5UF6GkWeQLJP40H
         v8YvZUdZdoznj1VsWFD+jv5xU8RkodB/Z/J7HVD9xe8g3JxdrmV24I7rOMX5bIUB+j5g
         03FI4tl3Q6CupUE//bdMJ+rzmAz3Cp58rCu/sckU6uyvFZAgVJGqbbsWylaK848oltr2
         cx7w==
X-Gm-Message-State: AFuF++mBSf5ek/RQz5IMrkMUfkKiE3T+w7zMZ6RKZLdYsj6iaMkhw2Zq
	3v7FWx1Tq9DuKf0UcMwEJBNPj1gI7lZ6VY9lwCmQEjjJQr/n0hxkvIkBgYsIhnhl
X-Gm-Gg: AYBFou0tEywLP7yGkN6phaHSJslOh7OXrXrMOYOS2McHLWnnMxWnnTH2FK+GIfsBZ4K
	kY6vw5A3TEDI++mD9Kd4btdl26BLzDnmMEhZCHNad3I4b1JGA1FEl/l/XUrcek7y1R6tDKtJH0s
	ntbIKLgcR7q5SjvGdjfPpScfyBn2jvV8/21TjUHIbHbh84CM2KBjEaaSsJ8XhWS4tLBehbX88nz
	mV1ivLCxQoXX283buHVlcYWkZT6Dj6l6rXUNd6zqKO2R0Mm/R2epFhL3yRY0aQq62xEoCPc7WBN
	TH/hUyww6EMy5AoSRTUQb7nsCq/EMVNvwdoeqHrqOlDK0LFHsLsaopiFAKbGe+Z5ubTuYdkKTPU
	eMXZ/o1655ZBjuOltxzUIrI078n8NwnV71gb8U0yG6FxAa8ngHfq5XwSjrIR1flGc1XCTR7czdf
	RfvtdQbkUlxnUYl472lpB6rNWQw89KMLwu1xfGARQRViLGntnsLCB2NHww2nzeRi9crT3ZNkmp4
	EKc6iZit+iL6hDJpEbJ5tOrNuPymXVwglITuGI9dfbCtJqq
X-Received: by 2002:a05:6808:1986:b0:495:feaa:9e3b with SMTP id 5614622812f47-4b965a75102mr24408459b6e.7.1789053657792;
        Thu, 10 Sep 2026 08:20:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971c98e07sm17859939b6e.18.2026.09.10.08.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:20:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <af4a28fc-e150-46f8-99a9-f8098c1ed949@roeck-us.net>
Date: Thu, 10 Sep 2026 08:20:56 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: hwmon: (yogafan) adjust table alignment
 for long model name
To: sashiko-reviews@lists.linux.dev, Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260910074505.1077544-1-sergiomelas@gmail.com>
 <20260910074916.93F211F000FF@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260910074916.93F211F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 00:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch silently introduces undocumented model additions and modifications to the hardware support table, which contradicts the commit message.
> --
> 
> commit ecc05eb9d5cd9f6474be8ef3ef43d5a812bf701e
> Author: Sergio Melas <sergiomelas@gmail.com>
> 
> Documentation: hwmon: (yogafan) adjust table alignment for long model name
> 
> This commit updates the reStructuredText table layout in the yogafan
> documentation to accommodate a longer product family string for the newly
> added IdeaPad 3 15ALC6 Ub model, preventing Sphinx build warnings.
> 
>> Update the reStructuredText table layout and column separators to
>> accommodate the longer product family string for the newly added IdeaPad
>> model (IdeaPad 3 15ALC6 Ub). This prevents Sphinx build warnings and
>> maintains proper visual alignment.
> 
>> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
>> index 9ff5db5dc08ce..239c7b5761caf 100644
>> --- a/Documentation/hwmon/yogafan.rst
>> +++ b/Documentation/hwmon/yogafan.rst
>> @@ -85,28 +85,30 @@ immediately to ensure the user knows the fan has stopped.
>>   
>>   ::
>>   
>> - MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
>> - ----------------------------------------------------------------------------------------------------
>> - 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
>> - 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> 
> [ ... ]
> 
>> + MODEL (DMI PN) | FAMILY / SERIES     | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
>> + -------------------------------------------------------------------------------------------------------
>> + 82N7           | Yoga 14cACN 2021    | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
>> + 81TD           | Yoga 740-15IML      | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
>> + 82KU           | IdeaPad 3 15ALC6 Ub | 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> 
> [Severity: Medium]
> The commit message states this patch only adjusts table alignment to
> accommodate the newly added IdeaPad 3 15ALC6 Ub model. However, it appears
> this patch also silently adds an entirely new model (81TD | Yoga 740-15IML)
> and modifies the name of an existing model (Yoga 14cACN to Yoga 14cACN 2021).
> Should these unrelated hardware support additions and modifications be split
> into a separate patch or explicitly mentioned in the commit message to
> accurately reflect the changes made?
> 

Why those changes ? This should at least be explained in the commit
description.

Thanks,
Guenter

