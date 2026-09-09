Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502E653B5FA
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958943; cv=none; b=mxSwgg6bPggwoG9b5IQP+wpg7jwjiGLHvNrjPpY+sk+l71YoMJ2Hl15NxPdXCEtI7sFMQAcmTCAVQE8jQo5/XecWuNDJG1iCJ2iyjhL4cQSd2rY0tJQzVulP9rGloQGZApuRenxdsxg/DgKrBQqWMSOwFF4KvJFPFHhuwfBc11A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958943; c=relaxed/simple;
	bh=j9Pi+ZLX4OZ+1G9Ee1d8lNIg/X9OdRMm+shG3FZAY0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1fDGmedqfmvuWjHKrgJzyRM7k+U9enJL34tK2JhXm7i81fH01FDGyV216hOc0powAPIKbeogazlZHqqwxYTvD5A1Sy0rYFjuuHy0wtlelWaGiNWtGBfZVoY/nBN+cvST35ikfN+3GKzoafU5ddcTAD3I/8Yhiwxq9QMVB40Sh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=qiDGFMo1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="qiDGFMo1"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so474088e87.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788958939; x=1789563739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUgF/CrYctElW8HYQdRdPRn47TT9mqidw6R7aTL1YFk=;
        b=qiDGFMo153ojgCY3BndAPOE0EhZtkCEke0zMZQRXUSMUDOMqe8/EYZ8ndlZxM19/Vs
         Iq1WcntfEeg+Ge+COeqq9X07rQ2ULjeqHjtP5XQvBAHFgfIz9MddNus901LK74Yx+g6t
         tMN/80k+gal4khhBp9uqPdgHcqeE+TOZqJTzezeu/U/H7/CFCl0e9NipcVyPfKcnN85U
         qnFSPY7P/Lp63RU3nAW/CwT0LGCyCvXHOsOGG3tj3Dkv1ycUkr8es5vWLhD0TaWhlJMb
         IqE+6fuxv2dh/3jjrPGzVttElLWb/8nIf8NPPefwQmb/YGCQjQ6ZzVridL7rW8NCZ7fz
         vK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958939; x=1789563739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUgF/CrYctElW8HYQdRdPRn47TT9mqidw6R7aTL1YFk=;
        b=ddSrP5FC7xdWvAqIImckVo0m4m0FL9F2ZKsHJCUrHOmsTjRQOrFTVjAPvoMizziezM
         cpup4ryqcEIv8KOgDhQKwCnsxBYaVsbZe3gXg8YC7hoNXotxqSolReEFZX/XveYgsz5r
         qrQz8k2DfEygaz5SgCsxT+GCthXvOwKy1A47ddlDxmvbaexicwOO/L+tI4of79Ud/NkK
         4EJi7U+hov1shjQsdzaSMakjs8mrPynfWH3AUPQrxc8PlzYCJWfRP4iIplxPnydbIRr3
         yov9r3eeV7fQveP7T8LYnJ7BAPV3XTM84j1vRi+WpMkbk8CJUa8/zed+buzt3pUQh9FQ
         jyjA==
X-Gm-Message-State: AFuF++kOOHUgmWpTzrqn1h1GxJqKDf/8vMi4SigS90vrJLVZRLpBbmHU
	ytefVMGbZ64DnFbTilyToGB8BeUmm5rvQsN/v2qbxi7iWZAMG/CAZ/r1NiYxZ4Mc6/5MR6YK8fJ
	sKL7Xfd0=
X-Gm-Gg: AYBFou0wAkSoeOvrlLBfymQso8l+qyWVGp5uEZPn9e4fYWD44L/mMyd0A42qgwrU3+P
	GKVkGHd4HXog5v+tfLLWXpdEsjJMcQZ/hdqdtkh7Q/ApJ1//30Vls+IDo80bTdPV+g46ke40IJV
	b2ddH/X90JpxpvNosmmj5rJLgIl248ROXgG1kOFZy5a9NoeS8Yg+UdGKPNkksZWqdoNZUS0ZT1w
	ZP+ofy5b1kIRdGlxR+/fXRcEkxOnajAbumLu4j2CX5Z2GOSvCBWCp5KRc5zrgU7sfeCPO0sTeEG
	DugcNgVTOhuQoLLtGj+lGuA3t7YzEgxBWFdjexDI9Inp9Y+AHOWrSpnruJdhvQGW9rjXu5fZb29
	DjULeQPKBbz3Oh1ERTyEcyW9hVaTGLTeHAxgAidGr2Gpa7GCca+sXRJ/xdeId7f7xFqlSMseTNx
	e/PzQNIXSDvXgCJyBD9Lkz16XnKOzZQZmwqP2Vr0KsWKWae+Z12WxcrbWm3vCWsfzkEHIYlXo=
X-Received: by 2002:a05:6512:3f16:b0:5b6:1a7c:59e6 with SMTP id 2adb3069b0e04-5b61a7c5b4amr5179834e87.64.1788958938948;
        Wed, 09 Sep 2026 06:02:18 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166f6ca3sm3792717e87.32.2026.09.09.06.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:02:17 -0700 (PDT)
Message-ID: <9131cd8e-240d-4991-a248-a497f490474f@riscstar.com>
Date: Wed, 9 Sep 2026 08:02:13 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] PCI: of: drop the reg_num argument to
 of_pci_set_address()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260908213459.2519059-1-elder@riscstar.com>
 <20260908213459.2519059-3-elder@riscstar.com>
 <20260908214601.7716D1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260908214601.7716D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 4:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Leaked OF node reference counts in of_pci_prop_intr_map()
> --
> 
> commit b3af32f45eed6da355a4a96246bdedb364fe0855
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: drop the reg_num argument to of_pci_set_address()
> 
> The reg_num argument passed to of_pci_set_address() is always zero,
> so get rid of it.
> 
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> 
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> index d66c702218081..1caabbd4c18b5 100644
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
> 
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue, but does this code leak device node reference
> counts in of_pci_prop_intr_map()?

Given of_pci_add_properties() is the only caller, it makes sense
that this would be found (again).

This was reported last month, and at that time I said I would
investigate and fix this.

https://lore.kernel.org/sashiko-reviews/a647bd56-7dc8-4fec-9d96-834622054cdf@riscstar.com/

I fixed the other problem reported there (possible null pointer
dereference).

I still intend to fix this, and will attempt to get to it soon.

					-Alex
  > When of_irq_parse_raw() successfully parses an interrupt, it acquires a
> device node reference and stores it in out_irq[i].np:
> 
> drivers/pci/of_property.c:of_pci_prop_intr_map() {
>      ...
> 		ret = of_irq_parse_raw(laddr, &out_irq[i]);
> 		if (ret) {
> 			out_irq[i].np = NULL;
> 			pci_dbg(pdev, "parse irq %d failed, ret %d", pin, ret);
> 			continue;
> 		}
>      ...
> 
> However, the function returns without calling of_node_put() on the
> successfully parsed nodes in the out_irq array. This leak occurs on all
> return paths, such as when map_sz is zero or when kcalloc() fails:
> 
>      ...
> 	if (!map_sz)
> 		return 0;
> 
> 	int_map = kcalloc(map_sz, sizeof(u32), GFP_KERNEL);
> 	if (!int_map)
> 		return -ENOMEM;
>      ...
> 
> Are we missing calls to of_node_put() for these references before
> returning?
> 

