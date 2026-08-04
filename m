Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B044607A
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840026; cv=none; b=VBFAldvL7G6mBNLJQ7CHPtGpYZceh2J0Dm5RM6En8SK5QGc8phL6zSz0OA0fbmFzN/oK9RUb39Yb2WqHbI358KZJ7XLOg/L7RmfukizcfxHMrllOPlym8FM92V1s7EL9QBIILcQO+vTVMIruur2MRsaeKCWbK8hj4GdNFoQlwwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840026; c=relaxed/simple;
	bh=XjqEhMzVyJidAYNTgfZuzibV+vw4kgTP4iUjr/Y8zwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH9Dh8Z8MqoqPF9511V7KeDGNuLxiI5lYkGzzeWZ6imi7KgcLHD4NNy4bH5IqaQB707FZ4NOXrR1CeOrBNoPhxSe+eBmoVcJelhoymPSq819rg9DcTKsW+hzvvBfmHPk6lnNsUEO3ULzyXnMsiCVUu3SeMuniA1rduEunhcdY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/DxcE7F; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/DxcE7F"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so49790915ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785840024; x=1786444824; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezaCKY+/GsZkbyZqG8Ty7NTbyuHDDYUEigB5GN8nxr4=;
        b=m/DxcE7Fdsm0BA60IcTjr7kpbFXuBvnO3btlpgpwM+FpBlh+0ebw0qwMB/NpxIwSMP
         O/zRb5bMfhy4llQPo2SKg6GMFLZxsl7TZZ5pwk+Z94TE6RePId6m7X+/wlZ49+z8M8a4
         odhyzl19CFuizYILINwIlW0xe+Cj3jmtUNPLCaUCdXrd4NqAX2gxLjsnLMT0BK/bE0PE
         GtxHdVenPyhzPPYgl1+Y702RFf5N3jbl4NkUSspYjnsfOPPhuQg5smSm7mE3gTHmIIPt
         Elpc9xVmEi1yFXrZAOGbWuzmZlfDB3z4SkfiSA5UsE7R2Om0m9auK+8oQgXGCMhThBRW
         28Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785840024; x=1786444824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ezaCKY+/GsZkbyZqG8Ty7NTbyuHDDYUEigB5GN8nxr4=;
        b=PRzwmvGT/1s+KlSX1X2CXDKzoSH5D72bBggCuLJbZVUZXbbzC5d1SoQqdqByJNPXT9
         /TPMqX3+xVfmOC9muLFalKD64fEsud6hLgT7enBEdpvhl38nDCKpZsC6jTRkHt6cQ3aZ
         FYRKMnIZQg4PBmp2QF61T9hMcJJtFOprk+drzZqvP3kgU+iWiMhv5mFoREP+bb14WWJp
         DAJQ78m5sHCSwpKdjIsKgax3EnzwjoHZAZ1qupKlEACV2O+ZVsRWrbvZxqQUcg4qOJYW
         AtiHGN+NTEM3gCuaJ0AOLszOfMMPa+KVzvy7PEd7qQ60gPu04bmOSBztmXRpaoavovFE
         dSvQ==
X-Gm-Message-State: AOJu0YxfirrKq78WIr+5mUQEQk20t3AyHSl7SdOkXe1NScIosfU75J/d
	K2ZedITWc9o/ReYqrdGHWs0L8rPIJILuLgHsr2kMIetx8LlmBRtjMeWcYGbmi6p0
X-Gm-Gg: AR+sD13YYb88WjL4dm/nX0RZmnAYpLNuf+/kh+nzLBs0l4D7e8ba79V6BF2iGosdQ5d
	xLkqXonMuJuSHi6rqMa7zZObrveHyJyoAoEXeacJczYZ5/GcGPdSPekpuFGsD5xU6jUu4EEs+0t
	J96p7e3+Ax+ivsmp7QmiambiJMb41BgQMYGshbGQaHw3HDUw1na3g8te/LuqsfEdrho05/Xq63e
	j66HMGyQ8GqRzyySTRsDFwJfqaEp/FKMzDP8ecXShUcXyM1FRtCKq21M3gf7fKSTheXwOneCn7j
	DoJ4edPcZ64tNYstQkexCzbh/ooctpYkJp3n57S5Qiy16DtrsnVIVSZZ8IFtC014aqfqMk2vVex
	kqvUKbcWdxJj2bY+Isrq2E4zCfTik9nW6KqTPWuaIoH5dXWdefp5s2CrGR/GGQruINFzJ3J+W/j
	HqFAA2s+/97BxlRv7YlxXN99Vwy+JGQ5pImCOIOGMhcgUbSnQBJ4gfhE+pJw+tHPaDdSM=
X-Received: by 2002:a17:903:37c8:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2d0521ed7afmr130801125ad.12.1785840024104;
        Tue, 04 Aug 2026 03:40:24 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9371asm4888905ad.13.2026.08.04.03.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:40:23 -0700 (PDT)
Date: Tue, 4 Aug 2026 07:40:19 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <ho2mdxntgkxp6uwdosqkazgcl7t524bwrz3vr5vprhbh35xemh@zsfccaotx4q5>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <20260803175122.2C37F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803175122.2C37F1F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 05:51:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The compatible string 'ilitek,ili251x' is not documented in any device tree binding schema.
> --
> 
> --- Patch [1]: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display ---
> commit 73e2dedf7bdfd04739a496a9f0ff1282f074c0ec
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
> 
> Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 panel with an
> ILITEK ILI251x capacitive touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> 
> [ ... ]
> 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> > new file mode 100644
> > index 0000000000000..834f23e75cbc3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> 
> [ ... ]
> 
> > +&i2c_dsi_0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> [ ... ]
> 
> > +	touchscreen@41 {
> > +		compatible = "ilitek,ili251x";
> 
> [Severity: Low]
> Is this compatible string documented in a device tree binding schema? 
> 
> It appears that "ilitek,ili251x" is missing from the binding documentation,
> which causes dtbs_check warnings during the build.
> 
> > +		reg = <0x41>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
> > +		/* Aquila GPIO_17_DSI_1 (AQUILA B42) */
> > +		interrupt-parent = <&main_gpio0>;
> > +		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
> > +		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
> > +		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260803173705.2268792-2-leoreis.costa@gmail.com?part=1

Hello,

To me this seems like a false negative. The binding is present at
Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml:

    properties:
      compatible:
        enum:
          - ilitek,ili210x
          - ilitek,ili2117
          - ilitek,ili2120
          - ilitek,ili251x <--------

Running 'make dtbs_check' also gave me no warnings for this overlay.
