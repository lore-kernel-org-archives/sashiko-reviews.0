Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC73385A1
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727835; cv=none; b=ocm1Maz2USd0Vse4aZh44V+ww8aX/gBpBocKr2ImGaPF4k+p+Xi78E3RrlGTvSD224yl2AzyJQWAZ23663GJb0+8QEwyIJ1jZQc+83+gMFfCSOlAl1eVi2dohLzktkn1PVM4jF1eDZfkJsAmiQ2CQrwvSgy7RCJoi7fa5H+FrFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727835; c=relaxed/simple;
	bh=iqpiEEBmTqITQqwR2Rx7qfUFmS8RO10Nz/lz7i5gnGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aevG+yPMM+bNI8B+khEcLQ4j5KzViw9mGzszEfnFZbd7Gc7vVdPrXF2UqAtIImcR6gJJCKgUCd7vQ+jC/wxPOUY1KgYt4hb7yKhfu+2IrI+HsD4nbVHmUK1938gwM7LS99+XQt0jocCQgCfMYIZBSTcOYz9tS71NOBiyYYcywqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPXTaJ+O; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPXTaJ+O"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so10213760a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784727833; x=1785332633; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQu6D6zMmE//zVm5BvssGdlCD03HKc9DnU5nZji75ms=;
        b=iPXTaJ+OLSu806oo09Q582Y63D73tku7VmOp/UFZwtc1mre7nv5jBSC0jdF0u8ojhp
         qcS3OPD/PogdwCD7Hh5h1SRoww93g5JnuSzT6kxs7lbep+MsJyi/UgY2XFoV0MMdN+S5
         5mHffi8ZsHWynEPdAhbJjOtRHUYucLtokmfnn6ZjgXaO/rqPCygGtw8H2YbdD0TzmoWa
         t7r7gteAzOPnFJZvc93Mj5FNV6N8VIZZJU2I8ImAFyQrpmK4kxTqxYxgZmfJV/RQ1C7j
         ZymDbaHgyePDg+HSwfd+NXkk/9dNxwy7BKap0VpNh4xxnRUva8DuuNymWUJzwCIaEY81
         /i6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727833; x=1785332633;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vQu6D6zMmE//zVm5BvssGdlCD03HKc9DnU5nZji75ms=;
        b=e2+HIjJgASO5XbmIB6JxSeaqaGyJ/4L5N165VUAL+JoXOZWVgx8o1yGv9MpP3ZZYOW
         B7t6Ih6HDmjoVBg6VetcVPNll6LxTmcnlrSeU0J14pIlX91+kwHCAE6pa7tC30uaiSio
         J3EMcfTgTrptnU3A138rhAuHbvMpSF+XsWYSI88pFFBL2beDk7v0q5SxYIfXdNj4E1IP
         JPLKTZi822HC7xOdF+0z91iXVJGsyTlZ72Uo+emvholKfvcolE5xLB3dUkjs4TS6ciPF
         0FSFjVdSUeYvSM4d5OkEFQlqwOh0zCstJ9vfe8ZB0y+CXQzNCeRTT5Y0aZnBx3EVWqck
         9p+Q==
X-Gm-Message-State: AOJu0YwdDzJ03BOIJS9UohLJcoRQlhCp9Tkjb8g/s+Uai10yMlFn5DL4
	DAe9yU1d8EOL2GgXv+em1mcIpfpD9tOir6Gd1fbjmzsHCVpTikTsZa3v/1rHvQ==
X-Gm-Gg: AR+sD12Bor1eMDUXzwuBKQLZ5GJJ5Gn1iwJFN893pIkURzwbjrHpIy3Plpz3Lh0cuwB
	0MP29t+fGlOQLaZQ63iTg4DFEVfpnbqIuqfy0zdkE128P2nRS2XwxCBvcIWXPxqlEqo2+N//nS4
	LM2x0FJ/JtOjj0Jfgt0rSqMoOrcGIc5Q2cIfjh1ma8tos+qsTDNEQlfEL18OQBxtvtRYLPRcHXV
	SjBdKSSsyUlhxpVqn4m61SXJ+2e+Z5D/0bwwhHeI4+u7pmGjrps7M7KcpbkIzsoW2qgQWqoZ7Dk
	6N8DohBfF/wqSWpfTBAiXrQVbXmjS4TqDwlyr8wpU17995OxuwZIMQtxnhqvwkSjzhSo4ezou7W
	Lk/XxS9E8sBH2PxhnnhcM6nxz82MVHFGshPi1p3SK8QqCzGGFF5Qa1MUtZ8AiFfU+M2IggqM6Mt
	WByvFJV/FkAoz+ftcsNvkcAQIYn9wOBqj6auXUOCGXiyssFFnALo5BhHNIHbZRbg==
X-Received: by 2002:a17:90b:5251:b0:38e:76f8:fcbf with SMTP id 98e67ed59e1d1-38e76f91ca1mr13142485a91.31.1784727832582;
        Wed, 22 Jul 2026 06:43:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm11276071c88.2.2026.07.22.06.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:43:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f2eb5423-b5e8-4b8a-9d28-974dc0eef892@roeck-us.net>
Date: Wed, 22 Jul 2026 06:43:50 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to fix problems with the sashiko review model
To: Greg KH <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: sashiko-reviews@lists.linux.dev, Chris Mason <clm@fb.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-scsi@vger.kernel.org,
 ksummit@lists.linux.dev
References: <20260722041257.1557-1-pengpeng@iscas.ac.cn>
 <20260722042744.5C1B01F000E9@smtp.kernel.org>
 <dcadf40a07a616de931c484bbe68f4b3f1f83b80.camel@HansenPartnership.com>
 <2026072224-moisture-gonad-409f@gregkh>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2026072224-moisture-gonad-409f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 06:08, Greg KH wrote:
> On Wed, Jul 22, 2026 at 07:58:48AM -0400, James Bottomley wrote:
>> There doesn't seem to be a Sashiko list, so I added ksummit as the most
>> likely one to catch attention.  We got this review in SCSI on this
>> thread:
>>
>> https://lore.kernel.org/linux-scsi/20260722041257.1557-1-pengpeng@iscas.ac.cn/
>>
>> But this part of the review
>>
>> On Wed, 2026-07-22 at 04:27 +0000, sashiko-bot@kernel.org wrote:
>> [...]
>>>> +
>>>> +	reply_len = mpi_reply->MsgLength * 4;
>>>> +	if (reply_len < event_offset || reply_len > ioc->reply_sz)
>>>> +		return false;
>>>> +
>>>> +	event_data_len = le16_to_cpu(mpi_reply->EventDataLength) *
>>>> 4;
>>>
>>> [Severity: High]
>>> Is there a Time-of-Check to Time-of-Use window here since mpi_reply
>>> is read directly from shared DMA memory?
>>>
>>> The validation function reads bounds from mpi_reply, but after
>>> validation passes, mpt3sas_scsih_event_callback() re-reads fields
>>> like EventDataLength and NumEntries directly from the same DMA-backed
>>> memory.
>>>
>>> Could a malicious device mutate these fields in the window between
>>> validation and use to bypass the checks introduced by this patch?
>>
>> Is wrong.  Hardware may never be presumed to be malicious (well, except
>> if it's virtual hardware provided by an untrusted host to a
>> confidential guest, but that's a very small list of drivers or it's a
>> USB or thunderbolt device designed to attack or exfiltrate data from an
>> unattended system).  It may be buggy, but we never presume bugs until
>> someone finds a device exhibiting the bug in the field (so we don't
>> proactively fix them).
>>
>> The bigger part of this is that I was looking into how to fix this
>> (which might interest a broader swathe of developers than just SCSI).
>> I think the fault is in the review prompts:
>>
>> https://github.com/masoncl/review-prompts
>>
>> And what I need to do is to add an additional drivers.md file to
>> kernel/subsystems explaining this?  If that's right I can send a pull
>> request, but I thought I'd check here because the audience is much
>> bigger than if it were to get discussed in the github PR.
> 
> Please make this per-subsystem, as your description above doesn't hold
> for all types of devices or busses.  See this thread where I describe
> what we do for USB and asking for much the same type of description for
> the virtio drivers:
> 	https://lore.kernel.org/all/2026072036-outburst-rebel-c71b@gregkh/
> 

Agree.

For Sashiko, fork and clone https://github.com/sashiko-dev/sashiko.git,
submit your changes into the clone, and send a pull request. Or at least
that is how I do it.

In the Sashiko source, per-subsystem prompts are located in directory
third_party/prompts/kernel/subsystem.

Guenter

