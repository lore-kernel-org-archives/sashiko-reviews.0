Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50F42E8E7
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 02:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230586; cv=none; b=XdibPTr9XI58QtR4nrzei63Ucnv/pnTLfsm2F7hRwxutVh82griEjhoOnyTnLGW2IaAAZ9vp4kf2pVVvWFDxOXdTLa9ykErkI/EyUeLxquxGy/bKZHWtxJNKF0kykhNpi803g48jRnAo5eQWC59kBZWPs2ASG7n0+q7erCaIdsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230586; c=relaxed/simple;
	bh=cavPLdZ3EM365UmMDeiKEQPWG/ZtK6GBzxNXSfWmPAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcgG9x6HQuRs5CnZXepC8Y1ryMMx+85/5+ZFJomqlvCRqdw4FT5t3WFFT8TXH2drTuNe7AyfEo4T7QdzFzy5+XTZBXQUnFAgPGueorLr9vQGgsKLUysl9Y2YMLR0bPNDIoFfqlpkn3Ea7GC5Ed/cm9KWGkVNVOKXP2aHz5SOpOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ege3M29C; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ege3M29C"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9377f717879so26891185a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788230571; x=1788835371; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPbdamFgACK5fDGcrO4A3g8qwBFcMj5srbjsH4obLc4=;
        b=ege3M29CJG9HTCc3IqXx5t+HDmdkFZ6OPP2nKR0x3RU0VJIprKWrdl8ikU1sJb/87p
         ztj+4lt4SxzFFEHZmADNMnQMYKxgQxB7ZkwotjF/aInCn8RmSqYfV4L+ioiRYtMBgXtQ
         cEKlFWhkJbuzwgXQGjiE5Usk7Y21JwUjYaWDz7EvYKQEAgN70NOj3HwJFuvMOY4mbUOS
         wgzW1UR0QNmfLe42hvmOjSCNWhljGqeU4eHT30GyQh64enwEphC8t8BeEl30/chw744A
         95RLcFWQctNOkYNkPhurz+o2EKJsbZY0IrLd8PB3lwgbrx/jhmlDJPWIb2CpeBrHg/aG
         AVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230571; x=1788835371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPbdamFgACK5fDGcrO4A3g8qwBFcMj5srbjsH4obLc4=;
        b=XNx2r3Qv3/FXERLIFZpNM7ryy4ks8+x4UnBFobvFOwFwarQ4iIkkra0gvxEivxryW9
         l0xICqlJrh86D1QaJaNwyYxyJm+Pye7HA7oG5Ur70TQbqsGEzW3FPbkmHPd6RVpEPttI
         gBhMBDAasHO4H99v9abapfyKETH7GAjQ8XHdqqsZH9YuV60bU1QzmvhCnFO/nsqUtpy7
         KyJo8uGNz4fLkuISzdXvlMEB8/MByA4WsbrWfxkWZuOFRvTCWT1vu7ob/jinu7deoaOB
         bQnVfLUzOWo4+UVT52NIa+nMFI1vJa4Waf2P7JIakQpqiXWDBkvRNU5HT+IyS1XQsGvq
         2zSw==
X-Gm-Message-State: AFuF++kpS9L/kvyp3pVJ2uDXJDr7ORh8cKLYE2iX7o89Zb8tbDcxmX92
	is5VfMhjABh0QplYLuIIzLRcjN5t8MgnU7aK8Jm7jbMIH7RWOemncOhVr0rYC5TpKAD+s1yvGeu
	Z9DSucxc=
X-Gm-Gg: AR+sD13jDv3qAjNksiECSNa8j/xvgPnK/bqF8sTEqrI4ySfoF+0YtkbkfironoOxS95
	6pmb19GVVB1poJA+CO5BjP2yFEAF5ev7TS4fKHq5UDg+G6dGMkdIh8cmsRXa62ia7cm1n4yLIhf
	Y/GK7CIGhsnjqcJUzwAdsPAriNpBUay1LYkKX8y2CGF6f7EEq4OegHYGdq6Ukbr5ekcYHhFNM+d
	acMdt3Hc3C/86BFt39FM7yuNfNaMgMuPHgJax3AP7zb9Im4bTovKuTEAJhDyYORcTdrUHIrHy9h
	9boYzZTZkKQsZmZE5l7b0M3xMZW+teBs1+LoEGjsJpUgcmQhkWrjPksz3JWBsGOOvZY+3C+VT0R
	Pb2CBIw1b6qylDCPoqLxIdFtxjkm9S0bY0GQ2l4KzGxeW859HtK7ut8ibIQsB5qEJGssS+kZ1AK
	WLxUyDMT+FZ6Pr/EaSUhmROLhwqtt2H0cvUhBvnxXedRlgcstfiK8VPJAvJiRw
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2704459585a.2.1788230571171;
        Mon, 31 Aug 2026 19:42:51 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917016ed4sm929269085a.9.2026.08.31.19.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 19:42:50 -0700 (PDT)
Message-ID: <d95aebf1-8319-4307-9d62-f1f3dc7ace61@riscstar.com>
Date: Mon, 31 Aug 2026 21:42:48 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] PCI: of: don't zero flags in
 of_pci_get_addr_flags()
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-3-elder@riscstar.com>
 <20260901012046.1BF371F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901012046.1BF371F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 8:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Potential NULL pointer dereference in of_pci_prop_compatible if kasprintf fails.

This issue was reported before, and I responded that I would fix it.
I *do* have a fix, but I have not yet posted it for review (waiting
for the end of the merge window).  I will post it soon.

					-Alex

> --
> 
> commit 036872e87dc6e9201c6f86349afb91815a638d1e
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: don't zero flags in of_pci_get_addr_flags()
> 
> The flags variable whose address is passed to of_pci_get_addr_flags()
> is zeroed before assigning a value to it.  Skip the zeroing and just
> assign it instead.
> 
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> index 505226b876c56..22fea1905a080 100644
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
>> @@ -82,12 +82,10 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
>>   	else
>>   		return -EINVAL;
>>   
>> -	*flags = 0;
>> +	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
>>   	if (res->flags & IORESOURCE_PREFETCH)
>>   		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
>>   
>> -	*flags |= FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
>> -
>>   	return 0;
>>   }
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential null pointer
> dereference in this file under low memory conditions.
> 
> Looking at of_pci_prop_compatible(), kasprintf() can fail and return a null
> pointer:
> 
> drivers/pci/of_property.c:of_pci_prop_compatible() {
> 	...
> 	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] =
> 		kasprintf(GFP_KERNEL, "pci%x,%x", pdev->vendor, pdev->device);
> 	...
> 	ret = of_changeset_add_prop_string_array(ocs, np, "compatible",
> 						 compat_strs, PROP_COMPAT_NUM);
> 	...
> }
> 
> If kasprintf() fails, the compat_strs array will contain a null pointer.
> When this array is passed to of_changeset_add_prop_string_array(), it
> unconditionally dereferences the strings to calculate their lengths:
> 
> drivers/of/dynamic.c:of_changeset_add_prop_string_array() {
> 	...
> 	prop.length = 0;
> 	for (i = 0; i < sz; i++)
> 		prop.length += strlen(str_array[i]) + 1;
> 	...
> }
> 
> Would it be better to add a check for allocation failures in
> of_pci_prop_compatible() before passing the array to
> of_changeset_add_prop_string_array() to prevent this?
> 

