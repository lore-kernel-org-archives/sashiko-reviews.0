Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E23A6B67
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779437615; cv=none; b=oI4kkWbJoyhAg/2QLtzQgrcNRegt0tpDoB6Bzln3zmrWR/21ADAHausUCgCNHQN0nruOPO/BZPsbPq3CR8TnljJKZxtEKVsQ3cF9Tm7j6Z9FVmVNADcEzbzzYEJXUjxNlC6lbtUqNO1kNM5K+OOQTlOr99ho5gtQL3ecBMa5K2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779437615; c=relaxed/simple;
	bh=jomel0oPADXBx3RNpLJWhpNzh5YZTgxCIIU5WRUNi1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snl/F6FhDiTeYm8MgMyMAiSPDaZ8SDIDECmNNjFueePFd1ag+qs9k6FpiVqjaVb/ljiurhDy7Y1ALb+f6dNOQILjHFRJtKCY5HtYpbYXA+cFsU1wSBQNXp6cVr9NOuNWbYhiI6mt8R1yTnhERK08vT0EbTgcbdWModqQ/I3eiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWZuKz+x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWZuKz+x"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49039a8851fso15843845e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779437612; x=1780042412; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=krd+xtZLkefnPN4mdCrGXGZmFdEnpHSMkyhgQXQ9R4M=;
        b=SWZuKz+xsicCB1wZd2N9J2zRraPZftgVnIKBAw0W234AyVNpMInGUsdoEfovTg5tWW
         KyvdCtHekAAwzikxedme+6fxoBDeRUi4HB5KWG+lvIsgzx1TUIo34yTVY34nbCPxkW/B
         aKuviM0QGIffg2+9IadKdpzBshZdZt4Gw7YxiuOCOAOOr6zHmNzFaEQ2ecqDQnf9mxHu
         br58kfZtEDSI/gFg2avgx8h7rKBnQaon89+p4Kstzes1ctsn3Nzzse9B3UvicOSFrqYk
         KL1nwr02tV93G5ObKhmn/X8lXPmAbfqPd5YND2bFOqMMtCjWcocHz/KbAD/EKTw/VT8V
         fGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779437612; x=1780042412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krd+xtZLkefnPN4mdCrGXGZmFdEnpHSMkyhgQXQ9R4M=;
        b=pmUeybYkQ1guJidEZSqz+SXckAfnz2ckZxY6jAMlTLOA5bNjLu3capS5ZTbcDvM8Tr
         4lfbxTDRMYCFeNTZpoA9PXFLyjiSIzg2n7GVjCGT5MbG/d8MVZslb3lnrAvbMMDfizAz
         tm3z+K/5ym93Vt1KB37ABHerUg+SqP21VNV9woGnk5gPnRMiEvPmliu8ju+h3prR/Afb
         caAWfDNNFpuvYhvEOwMIEYMbTvH8wHAqVV9WjCBUfJUtMVG6A3qpj95HFBPv23F2d8qZ
         bTNAksUf1Nk8WQFTDkiHKnrtxA5yHzSri5qMirxhzNxFLX3lz136rnenS1z5LnwJtjvV
         LRoQ==
X-Gm-Message-State: AOJu0YyEkpfm2wQZd2yLewprjz6unDxeeWKaQOtzJqdN+Y70RUXPmj/P
	FdG4Mrmd39b3J5PmKQYgsG+nCS9nzUGQQXZ564b4fFEzQV/acM8saxerAOeXoYdm
X-Gm-Gg: Acq92OHfPst0Gjxr0oELy4a3ybfL9sTUn+NlLxUzHtdJmp3Lli6wR7TrsIUkMtaD5M+
	UsNZoiyUr7nZosDDGXvi4gYPGjU8z3cJyWBWNT/RYuusVmfGwW1pbwsiogvzt+gh/z5ZnJh8iht
	X3rzxoVDUv+Y0ZWFH7CUumivUNGK3gQCrpkSrIp1vUhd3f7ongLhE5O2nIh0BLyPn2K9lR06j7U
	fAH7e3InnyF0Xohui6kS/OJffQteWlQDaFwuUXRphmJzkBowkV+XcbeKt4fyy4CsxRufUWFFvjh
	K60GVppnX+59QaM1gCIVYtM3gPi9tbLV3glsxJ9c81rffyPL2K/bgECPEQSnORDq7utIEodiYzE
	6GYtNw66cwLmiPVeeQDb9L+dz3axMJsKMaU6Lowp9vchxTNDoeVZ29XLcCuZRhYe5gzEOb7LBxV
	tKMnKeY/6aQNiITfhcdtEB
X-Received: by 2002:a05:600c:c04b:20b0:490:3cec:52f6 with SMTP id 5b1f17b1804b1-490424ac920mr21743465e9.2.1779437611814;
        Fri, 22 May 2026 01:13:31 -0700 (PDT)
Received: from legfed1 ([2a00:79c0:61a:3200:1ebe:eb51:3a97:3b47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49045620c05sm24502425e9.14.2026.05.22.01.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:13:31 -0700 (PDT)
Date: Fri, 22 May 2026 10:13:29 +0200
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Dimitri Fedrau via B4 Relay <devnull+dimitri.fedrau.liebherr.com@kernel.org>,
	linux-phy@lists.infradead.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com,
	robh@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: add support for NXPs TJA1145
 CAN transceiver
Message-ID: <20260522081329.GA1983692@legfed1>
References: <20260513-tja1145-support-v5-1-38720a7ee63e@liebherr.com>
 <20260514051738.B2D32C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514051738.B2D32C2BCB7@smtp.kernel.org>

Am Thu, May 14, 2026 at 05:17:38AM +0000 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The dt-binding omits support for the `max-bitrate` property.
> - [Medium] The dt-binding omits support for the `interrupts` property for wake-up routing.
> --
> 
> commit 853ad7c93ebe1c2a625ddddde401c4aaad496a8e
> Author: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
> 
> dt-bindings: phy: add support for NXPs TJA1145 CAN transceiver
> 
> This commit adds documentation for the NXP TJA1145 CAN transceiver, residing
> in the generic PHY subsystem bindings. It describes the required SPI
> configurations and supply properties for the device.
> 
> > diff --git a/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml b/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml
> 
> [ ... ]
> 
> > +  vbat-supply:
> > +    description:
> > +      Battery supply voltage
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#phy-cells"
> > +  - spi-cpha
> > +
> > +additionalProperties: false
> 
> Does this binding need to include the max-bitrate property?
>
No, the max bitrate is know for the device. See:
https://lore.kernel.org/linux-phy/0b4b8291-40cf-4faf-a79f-48c56677f9a2@kernel.org/

> This property is standard for CAN transceivers to describe board-level
> capability constraints where the layout cannot support the chip's theoretical
> maximum speed. Since additionalProperties is set to false, valid device trees
> specifying a maximum bitrate will fail validation.
> 
> Also, does this device tree binding need support for the interrupts property?
> 
Not at the moment, this can be added later on when there is an
implementation for this features.

> The TJA1145 supports partial networking and wake-up functionality, which can
> route a wake-up signal to an interrupt line on the host processor. With
> additionalProperties set to false, it is impossible to describe this hardware
> interrupt routing in the device tree.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260513-tja1145-support-v5-0-38720a7ee63e@liebherr.com?part=1
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
