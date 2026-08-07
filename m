Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12313C197F
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 20:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136301; cv=none; b=aVpRBIMSk3l4M0G64dw2UC087WYlNVsATEJmiWVLV5c2gLeqP2932JfYb0gbCct4YTXgeHzS2PHIRXZc/9ENqPhxHRQV6QbtasdBZEsvU8rnO9YtXGwawb8yttdOMnffFYltgpO4qU0eZ/7/dTUNN7TBgmwmKMg+QVZyyPN784w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136301; c=relaxed/simple;
	bh=lAG1g6NCiRgJ72AI59x0RziGscPAlXlsBwHZP4rfx7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7TRJUJBWGFngE9PMWceB0QW2oh15igfBSALeVnI6wzjlSnwXv4mmmiHzQqKLyQPNyEnUm0FHSPjviTU8OXmIs5UsqVhnUcBCLSv5gvPCqwOhn5NeUC6GvSYsLLaQvm7vLc0iorACXe88mzIRwc78b+T9A8CEACyuzEdc+MpFsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ePsoaMM6; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ePsoaMM6"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e6391b114so300877385a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786136299; x=1786741099; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJPO/O+fbYB5hoAWGFXpSodw1GgptFASJAHcUDxPHkY=;
        b=ePsoaMM66PmXdOOoRe0ICe397bnTPHdtxPQOe6sntuNG2ZJe0ZtFtnRWF3REr8oTTS
         /Po3dujxdGJTeekarz3s3BZC867fnfP6Q2k1W8MtoGeeZHK8a0JnTxhQAPdksSc9EBRM
         02yk5Elb8g3ZqbX5m3/j+OiaAyvfN0EVPYr+ndJL7m8q1xZwxFjSjP50XmWl8ZtRl1oZ
         fX3v+2axv/yI7VvwAs5qSVazDFzvRJsVJgzxSQQy83QACadLMo429P+Iyzfy8ZiYYSXk
         MVjCXK/PGv6NoOcsqP/RBk5R3Eb2Xl6/bb3/VqikgGbcSF7TDPccSLXnQR6iE6cHZRXo
         vhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136299; x=1786741099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJPO/O+fbYB5hoAWGFXpSodw1GgptFASJAHcUDxPHkY=;
        b=TNTBu94UqQ8DnguG0DJ2fcAebOmgJ3Ve/5nHEuL7hQ2nsdQXE0pyEUXx0BJrZP6jYA
         SLkaji5bt+0fZA9g3v3J3tWMAasm9+0dV+20m25JMqOEQ6rYOiP5cMOJVgNNw8ZxRuXp
         GNaNrcBzjPx4KOhHh+4qSyuy4H4njPMQ/dyyTIlscVNFIXwXmG+HR1/7KoP5xG3eEQGv
         xkUNxC+ZPsNRNmpatJo0v8z6eb2C/ppaWGURghN1SIec306J4uC6AIFmUVh7P5v238ht
         KNQ40rQBVoefzBbwA6INetf7kLr/Z9jSDRKLvqY7aZYqhUwgSuHPV9dVcUsyCXwBGeC5
         piCw==
X-Gm-Message-State: AOJu0Yyqhsk/Y9Dsh19JUehsctJIs5Xf0QtCCzB23H5g777h89Xc8MT8
	CZYhupWpIi5z7uD9S/MxqP6Hbbt3abwXJ1oIFuIbC0Hz3yAx2qY9g18L+ogYiw3LY4v70TAmu05
	iBWr+KEM=
X-Gm-Gg: AR+sD10UKz5dv0RtWNzr+VNLiFT1+qOkcDr4ReNVeqF5ljXEbi/1yaeotj2zcjBIli7
	SGyPD0V6l476VdW0UmG22ityLDk2mSFTht5mG80ytEU2oKtVxpkBRtyyLcsA/ReZeIznMrjY2I+
	viAuIik61MR3Ji5XNwzMepI+Lyw95D13kGM0qHGPYCn26T4Vh8C7RxlCRuR4vpcbblErtXel51h
	cae5RYDikIBBSmX8SCSyy79rCb9zyJLMM+lc2CloKdS7FhpYvml7Gn6M9t74bcq6vut+zC+ZmQK
	B3jYrdA71lZ1azJBt+wIWDie5AJAwmuotEhNxmgKsnn5b6gUy/NQ6irrwFQaJsrb0+HaO3CdRP2
	IyJucKkrBBcE4HCo2ZUGdQ9esu+HuFijZ0mXXvaMdfLx9G9voWIkOy/kT/GvAaVo5LQEkwlNSDQ
	1Vl5rLFjudjI5MxyMbU0Fcbd7nKYroEgLZbC9o56kNq13O70+LfHUeUkmR4qYi
X-Received: by 2002:a05:620a:1b98:b0:92e:8a8d:ec1f with SMTP id af79cd13be357-9366655b1aemr1521961885a.24.1786136298765;
        Fri, 07 Aug 2026 13:58:18 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e09dc07sm233090185a.15.2026.08.07.13.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 13:58:18 -0700 (PDT)
Message-ID: <3d1d9c63-9be5-4f24-8133-2d93925ee0f4@riscstar.com>
Date: Fri, 7 Aug 2026 15:58:17 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 linux-pci@vger.kernel.org
References: <20260807194100.455599-1-elder@riscstar.com>
 <20260807194100.455599-3-elder@riscstar.com>
 <20260807195604.277C31F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260807195604.277C31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/7/26 2:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The function `of_pci_is_range_resource()` incorrectly evaluates `IORESOURCE_MEM_64` using the `resource_type()` macro. The `resource_type(res)` macro applies the `IORESOURCE_TYPE_BITS` mask (`0x1f00`). Because `IORESOURCE_MEM_64` is defined as `0x00100000`, it falls completely outside this mask. Consequently, `resource_type(res) & IORESOURCE_MEM_64` evaluates to a constant 0.
> 
> As a result, the condition `!(resource_type(res) & IORESOURCE_MEM_64)` is unconditionally `true`. This simplifies the entire filter condition to `!(resource_type(res) & IORESOURCE_MEM)`. Any resource that does not have the `IORESOURCE_MEM` bit set—such as `IORESOURCE_IO` (`0x100`)—will cause the condition to evaluate to true, making the function return `false`.
> 
> This logic flaw inadvertently filters out `IORESOURCE_IO` resources entirely, which prevents PCI host bridges from exposing IO space mappings via the dynamically generated device tree `ranges` property. Furthermore, if a 64-bit memory resource were defined with `IORESOURCE_MEM_64` but without `IORESOURCE_MEM`, it would also be incorrectly rejected.
> --
> 
> --- Patch [2]: [PATCH 2/4] PCI: of: don't zero flags in of_pci_get_addr_flags() ---
> commit d6dba8ef5457a1efb23f2b68f270883ef856bbdb
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: don't zero flags in of_pci_get_addr_flags()
> 
> The flags variable whose address is passed to of_pci_get_addr_flags()
> is zeroed before assigning a value to it. Skip the zeroing and just
> assign it instead.
> 
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> index 505226b876c56..22fea1905a080 100644
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
> 
> [ ... ]
> 
>> static bool of_pci_is_range_resource(const struct resource *res, u32 *flags)
>> {
> [ ... ]
>> 	if (!(resource_type(res) & IORESOURCE_MEM) &&
>> 	    !(resource_type(res) & IORESOURCE_MEM_64))
>> 		return false;
> 
> [Severity: High]
> This is a pre-existing issue, but does this correctly evaluate
> IORESOURCE_MEM_64?

It is incorrect to apply the IORESOURCE_MEM_64 flag mask
to the result of resource_type().

> The resource_type() macro applies the IORESOURCE_TYPE_BITS mask (0x1f00).
> Because IORESOURCE_MEM_64 is defined as 0x00100000, it falls outside this
> mask, causing resource_type(res) & IORESOURCE_MEM_64 to evaluate to a
> constant 0.
> 
> This makes the condition !(resource_type(res) & IORESOURCE_MEM_64)
> unconditionally true. This simplifies the logic to reject any resource
> that does not have the IORESOURCE_MEM bit set, such as IORESOURCE_IO.
> 
> Could this inadvertently filter out IORESOURCE_IO resources entirely when
> called from of_pci_host_bridge_prop_ranges()?

No, this is not an issue because the purpose of this test was
to make the function only apply to memory resources (MEM or MEM64).
It's *possible* it will skip MEM64 resources, though in some cases,
IORESOURCE_MEM and IORESOURCE_MEM_64 are *both* set in the flags
field (see decode_bar()).

So I don't think there is an issue with skipping I/O resources,
but as stated above, this bit of code is at least wrong, and
it *could* be wrong in a way that affects correct behavior.

This function is only called by of_pci_host_bridge_prop_ranges().
I'll create a fix that at least fixes the bogus test, and in
the process will try to confirm that the result is correct.

					-Alex

> drivers/pci/of_property.c:of_pci_host_bridge_prop_ranges() {
> 	...
> 	resource_list_for_each_entry(window, &bridge->windows) {
> 		res = window->res;
> 		if (!of_pci_is_range_resource(res, &flags))
> 			continue;
> 	...
> }
> 
> If IO windows are wrongly skipped here, will dynamically created PCI host
> bridge device tree nodes lack IO mappings in their ranges property?
> 

