Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49E84749C0
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 16:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726523; cv=none; b=rntxz8Xs19EOCyujFLRxmt0wLIUu3RKPHFj0xLel8GWl9Y5CLz8OypxsUiONrrtVyrSpEyWqx1gG4+GdHlcR9OMzPUYj8FqWWw5aI9xvfWBP9zocGn8S67EJd9rAOgfOXYIFJIRRl0okEIICb2h4/n9exVNM8UaXd6XLfetYIPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726523; c=relaxed/simple;
	bh=RBwYjF3auxfgNTDdTufyuoqTSozXax3hznWOixXop/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qc7fOnhV+Va76FCYq0+qIp/HJewqccndqPwNupLuuddNt1443x+imzpOdOKSStwyLsdMg5M6daVO1B+9Zq7bucu6dGh9VPN31N+qDPcl3G4Ph7/gb5qdZ8eSx76pFtM6nJBxFx8Lhr6Fnk82OebmSP2NeLaQ+yv/1r+J6OgXKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fp/wGnbM; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fp/wGnbM"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c0c45c580so8355031cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786726516; x=1787331316; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL8pP85i8EaCb3lxYohsqsu8B10B2NEcVQY+xjMxthI=;
        b=fp/wGnbMJG5gc9H9lC8sA3GvczGRup1NmtinspgP0Z7LnuzbiY34mwdSJpprgId+JD
         NuLtl8f/5ndHqnvOp1VuwtpTaT380Mz+5o3eJVEm0jKUi0P4RkvAotxV+EMCI5FX5BnD
         xYzzw5NddcUK1XOrowxAkBG3ytfjtAgd46hgoEeF73WqjpCHBPgdtkk+2K3fOCsJw2WW
         emMkXaEadQA8tmz7ikbjbtQxO4ZY6pTOWRy7lAubkMyxE8EaQOlbsW8mbM2KgMhHjcfU
         VsXYuR16nNvyeMh1m0E5D7v2DiWS1BcOsl1OSF4vftBy+gisU6IxD1a/6OY4PDqttkL8
         QKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726516; x=1787331316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL8pP85i8EaCb3lxYohsqsu8B10B2NEcVQY+xjMxthI=;
        b=Gjpotb6ZLx+49+qHVQMaVbHB3fMBIv5oUT56k+gLs6rQVcG7aIMdxfeUoKXrqZ6eho
         hLG/UFfd00m3iFybUljymJNMV/wyhKIUXzqPbZ+ALomowh+871fP3EXN7KBqMdVPDem7
         on/o/5m+AQfysHUVB5f/MgYxGNCSZ0XIaR0PSfogI25w0dRhDrNHHAtu+THlNYmZ7jpA
         fyshdIyIieOewO2TdriCxKRzfoqG1eyzy5j0JCvvYne2VPUchNdkgL9KE7BggPCu5xyy
         mujOmF5afuZ3kiP+cy8/k6gm4LJ7RZWwrZR3/lyiUSKbD+9BWQ5znftZGISYCBp9Vf5h
         jj2A==
X-Gm-Message-State: AOJu0YznZ1KIhWk/rGQKXCewMxEGXjn3PnTgAi14cfK5LWNMuxfYRSAt
	Ea+AAukzzkEIJ9ir1x+tQpODulvpGmRW7C6HS56TeKQ2hib+AOxZ/54LmqFt5c9IPs38rY5nY6/
	eiTETId8=
X-Gm-Gg: AR+sD13Lt6RLouqhf/idpUUE6uj+KREekvJWKmrPOuDeYipzoFtVURV6INsTdhbKWFC
	TJz2MJOz0UHUq5cVuSpoQPcmw+IWjbtAW9u7rUBCdjaS6/g6TcDDKAomHYIpq5gQWvNtcYpXZqH
	85cwEHqLqjUtIHBS0EqqcHpfPutsBZZTq1l6/Hw1ydpXRm40ODAc0IHvUJV/AOT6Gr34Zgtk0bC
	Uik+7V6qU7BZjb/RPTCU6CW+ERo0tgvsXWF6hbikUNwv8zV1lPtGsKx4Iz6TGpDo0mHPk3Vb0Xx
	5zNbVlunghxn0hav5sRgIV7tsmKHB3czWmolbvNirjIXYFhsz+RMpdMs0geepfmJeAwegI4ODzI
	lZ0e5yCslU0xK2woGB2VFwxXk3Pdv9+Z+z0GR+pV32jPSwgAGUKhNrKMglIjX9C5vDYJi0yx/uK
	o6tA+H1uF5jlIaU4RUO0Mlpx96ltNut1NsiwcoqD2qV4F2xP0YRTUgO2+uhf1SuA==
X-Received: by 2002:ac8:6104:0:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d854ce987mr83660721cf.26.1786726516287;
        Fri, 14 Aug 2026 09:55:16 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d84071799sm24476161cf.20.2026.08.14.09.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:55:15 -0700 (PDT)
Message-ID: <29e363b0-baa0-40e6-b347-5083c4f2c682@riscstar.com>
Date: Fri, 14 Aug 2026 11:55:14 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: misc: introduce pci1179,0220.yaml
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260813222943.1655453-1-elder@riscstar.com>
 <20260813222943.1655453-2-elder@riscstar.com>
 <20260814014513.5CF1A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260814014513.5CF1A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/26 8:45 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The example DT nodes map multiple PCI BARs to the exact same parent physical address, and define unused BARs that contradict the hardware diagram.
> - [Low] Typographical error in the compatible string comment.
> --
> 
> --- Patch [1]: [PATCH 1/2] dt-bindings: misc: introduce pci1179,0220.yaml ---
> commit ee5f64080011b047dd81e1bbdc568f784c09b77f
> Author: Alex Elder <elder@riscstar.com>
> 
> dt-bindings: misc: introduce pci1179,0220.yaml
> 
> Define the binding for the Toshiba TC9564 PCI endpoint function device.
> The third downstream PCIe switch port within this chip has an embedded
> PCIe controller, and that implements two of these PCIe functions.
> 
>> diff --git a/Documentation/devicetree/bindings/misc/pci1179,0220.yaml b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
> [ ... ]
>> +properties:
>> +  compatible:
>> +    const: pci1179,0220 # Toshiba TC96564 (a.k.a. Qualcomm QPS615)
> 
> [Severity: Low]
> This isn't a bug, but there's a typo in this comment. It says TC96564 instead
> of TC9564.

I will fix this in the next version.

> [ ... ]
>> +        pci@0,0 {
>> +            compatible = "pci1179,0220";
>> +            reg = <0x0 0x0 0x0 0x0 0x0>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            /* Ranges will be updated dynamically */
>> +            ranges = <0x0 0x0 0x0  0x83000000 0x0 0x0  0x0 0x4000>,
>> +                     <0x2 0x0 0x0  0x83000000 0x0 0x0  0x0 0x80000>,
>> +                     <0x4 0x0 0x0  0x83000000 0x0 0x0  0x0 0x200000>;
> 
> [Severity: Low]
> Are these example ranges accurate for the hardware? The mappings configure
> BAR 0, BAR 2, and BAR 4 to use the identical parent physical address
> (0x83000000), which would result in overlapping memory regions.

Yes, and I could put something else in there, but this is related
to another issue about the dynamic nature of assigned BAR base
addresses.  I sent out another series to propose a fix for that.

   https://lore.kernel.org/lkml/20260813220717.1394644-1-elder@riscstar.com/

I'm interested to know if anyone has another suggestion for how
best to represent this.

> Additionally, the hardware diagram in the binding description indicates
> BAR 2 is not present, but it is configured in this example.

I find it very impressive that Sashiko interprets the ASCII
art diagram this well...

The reality is that--at least when the ranges property is dynamically
created--all BARs will have a range value defined in the ranges
property, even if one or more is not used.

I chose this way of specifying this so that the relationship
between the endpoint ranges property and the pci-ep-bus ranges
properties were clear (indicating the BAR number in the first
cell).

The remaining questions below have the same basic answers as I
have already provided.

					-Alex

> 
> [ ... ]
>> +        pci@0,1 {
>> +            compatible = "pci1179,0220";
>> +            reg = <0x100 0x0 0x0 0x0 0x0>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            /* Ranges will be updated dynamically */
>> +            ranges = <0x0 0x0 0x0  0x83000100 0x0 0x0  0x0 0x4000>,
>> +                     <0x2 0x0 0x0  0x83000100 0x0 0x0  0x0 0x80000>,
>> +                     <0x4 0x0 0x0  0x83000100 0x0 0x0  0x0 0x200000>;
> 
> [Severity: Low]
> Do these ranges match the hardware design for Function 1? The example maps
> BAR 0 and BAR 2 here, but the hardware diagram indicates Function 1 only
> uses BAR 4.
> 
> These mappings also map to the same parent physical address (0x83000100),
> causing overlapping memory regions similar to the previous node.
> 

