Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BDF374A08
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344952; cv=none; b=odqSy+C2/N+0M6FnExmIC8GAFcmhFCwx4V4C+vz9RB26U+xqK9336S0DueXmlG/O8+Zuu5wOoUHtfxYInXwZgKZ89+OmSGagYOvDoNwLeGuF8sbK1VxnODDfpVWfu5n61pA7pn2AXexTXXc8QhmMvEf6fVfgzGll2kO0GDbmBUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344952; c=relaxed/simple;
	bh=eG2g92HpxADpaewQr6kuNzXlZQd2Ti0PWMpSl/JUR74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkGBjOft8TgayMfRmrl2evVVIytQtkghWB6mMbTMBFJoN8wsQktAiGNcv9/YQ5atKZFHIQ5Sr0kE03N5rx9W8+P3IM4YNWJEjsLslcmH3KrSHrIhRjz77m/HIUltgjkUBm2AROgRenkSaDBTAEWwnxbTYAUy1YnKremPy82bAjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cpneA1zT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cpneA1zT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783344950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N3Anvk5g2W6Ax5Xx12MjDPwqLCiF744jyWfZgTib1bI=;
	b=cpneA1zTjgKmqlKwXIspHqmJje6nUwXMarxD7FIaImxeWHu0yHMhBax6MG+4mwMORzXdzf
	w3HEOVCENQJC0EQrZ9mcXn3V6YNp4Rhe2hN5KvSvWlBrPLBuz0x0eMHUCK/GhgGgmb+hlW
	r5wEAf1sRNpvF6Bbscy7jwT5lZ6nNqM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-BctAehJfMPW3sFSrgTEJPg-1; Mon, 06 Jul 2026 09:35:44 -0400
X-MC-Unique: BctAehJfMPW3sFSrgTEJPg-1
X-Mimecast-MFC-AGG-ID: BctAehJfMPW3sFSrgTEJPg_1783344943
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493c55d5ce5so13597855e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 06:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344943; x=1783949743;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3Anvk5g2W6Ax5Xx12MjDPwqLCiF744jyWfZgTib1bI=;
        b=IRd0/D+utPIvHEsbLeRlDCxBJT+T8NpmeaptGpJwekSp/4qr/XpIkUOzWfDq5Yr/rd
         AX3eRbKp3GIEJaN9YEsfFkXFrNZSqULV5UgurisrLsz4BsNvMHV4AWb6PkW5GzjRmM3m
         32bpTGQs1gVQgVfz6e/IegGP7zI8o2evs3t76SCWkh9YW8AX3dluZHEX0dWu22kH2nm4
         LLUPJPchP6V6+R7ghxSdOSKvpZF+NQHnspGE+M0Yps9ohxSBFRJ9uhqloQewew+lntmc
         I+AumaoVuApvcq+MhDhjIIM5gS8CEgMryexqA8q2vIerQqdCaf4Dlv+WBQKWq7e7tg1+
         KqWw==
X-Gm-Message-State: AOJu0YzZiuHs6xUp9l045di8/lDbfSGfFtoarkJMZ2MzK0yXQ0t0Tb9g
	xxJeqpG2/gLNp9s4bNWTKI9ugS3JNgZEG1pCLc2HUm5i55LBmgwE+wSm0bfNC5IUnDvP68Iqtn9
	3uE4hFa8rSrXobFCbAQaJ5Gk64gtrr03FvkDa951Db+de+nWRaRWd4dNxK27dE/xUf/A/VQ==
X-Gm-Gg: AfdE7cl8bTfDMByNJ8THeU0RA6wt8vuIpf1lcPSWXuE4rLlJAXOsHJB8t0S1urYz8Qd
	OxOVbKJZM67VrXcfc77pVQht2XVxu4THx/i2x/AxFjKmqVcuboLnnkioSUQmMI96m4qMozWOYJb
	O4f8xYKfam6JWAtX6Bt6wnJ8sVNbO0SKj2LlWH3tiKK0xn/+Lk++jNaFswKGyUY7AT1QtUquVdX
	1BwliPnj8s0rW7io/opk1TfMZVr+htF4BOaUDfDq0/SIu+/3+w43WVluyOs+0zv4F+/7+jUNfuU
	JUvHq8ZMqXnAv4CBm1T7Sffej6YLWWRBBCWnJCEgh9XihDwdsCy4QLtTDUlfFvB7Y/fOP1kUf78
	cjDllJaqToVN1vO5cBoiaLXr4d+PWWAL2s9//qc+5DA3cM7jq+kA+sP9DnBKf2H6tlGESCfJsmu
	k090BFgeV0g69V
X-Received: by 2002:a05:600c:4f87:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493df17fcb9mr3435235e9.6.1783344943162;
        Mon, 06 Jul 2026 06:35:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4f87:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493df17fcb9mr3434775e9.6.1783344942712;
        Mon, 06 Jul 2026 06:35:42 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce11497sm308056635e9.12.2026.07.06.06.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:35:42 -0700 (PDT)
Message-ID: <41d0e6d6-f1fc-425e-a122-b0433a925a3d@redhat.com>
Date: Mon, 6 Jul 2026 15:35:40 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
To: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, Min Lin <linmin@eswincomputing.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <20260701063512.9ED051F000E9@smtp.kernel.org>
 <5de09a24.a11e.19f2207d7d2.Coremail.lizhi2@eswincomputing.com>
 <58532b95-bb74-4d87-acae-e67b41dd7d57@lunn.ch>
 <f21ffca.a15e.19f25abaea6.Coremail.lizhi2@eswincomputing.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f21ffca.a15e.19f25abaea6.Coremail.lizhi2@eswincomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yE-cE8MkwwgGHoYStixfC44Ltbh4L63cwBSoQgwoQrc_1783344943
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/26 3:50 AM, 李志 wrote:
>> -----Original Messages-----
>> From: "Andrew Lunn" <andrew@lunn.ch>
>> Send time:Thursday, 02/07/2026 21:22:34
>> To: 李志 <lizhi2@eswincomputing.com>
>> Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, "Min Lin" <linmin@eswincomputing.com>
>> Subject: Re: Re: [PATCH net-next v9 6/6] riscv: dts: eswin: eic7700-hifive-premier-p550: enable Ethernet controller
>>
>>> Hi Andrew,
>>>
>>> One question before I prepare the next revision.
>>>
>>> As discussed previously, the DTS patch was included only to provide the overall
>>> Ethernet design context during the review of the binding and driver patches:
>>>
>>> https://lore.kernel.org/lkml/64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch/
>>>
>>> For the next revision, would it be acceptable to drop the DTS patch from this
>>> series and post only the binding and driver patches? The complete DTS
>>> enablement is planned to be submitted later as a separate series after the
>>> binding and driver have been merged.
>>
>> What normally happens is that I give an Acked-by: or a Reviewed-by:
>> for the DT patch, and you submit it for merging via the DT Maintainer.
>> Everything then meets up in linux-next.
>>
>> Why do you need to do this later? Why not now?
>>
> 
> There is an another seperate DT patch series
> [https://lore.kernel.org/all/20260615122016.1110206-1-pinkesh.vaghela@einfochips.com/]
> which is under review.
> It also introduces DT nodes for reset, clock, pinctrl, HSP power domain.
> 
> Therefore, our planned steps are as follows:
> 1. In the next net-next v10​ patch series, drop the DTS patches, and submit only
>    the bindings and driver.
> 2. Wait for Pinkesh’s DT patch series​ to be merged.
> 3. Once the HSPCRG patch series​
>    [https://lore.kernel.org/all/20260605060730.1605-1-dongxuyang@eswincomputing.com/]
>    is merged, submit a new DT patch series​ to extend ESWIN EIC7700 SoC support​
>    for all HSP modules—including USB, eMMC, SD, and Ethernet, since they are all
>    under the HSP bus node eventhough ethernet doese not depend on HSPCRG patch.

In v10 please include some actual description of the series, beyond the
changelog.

Thanks,

Paolo

