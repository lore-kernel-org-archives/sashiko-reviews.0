Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAC026B755
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902397; cv=none; b=dSOAp20jI1WuICPkHc2mmJAk74wvN7BHiuRzNfwqX0AZkaB+hJ9+SNbrT7czL/cqRUI9s3CVIJhU/GMRGuXs3p/esmz4bYR7nVTwefpGYx8CUR4ZnsfGfFAKuZi3QvP4/AKShDcvtyn34TsURcbU0V16rYLam0kIANKnSRTM458=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902397; c=relaxed/simple;
	bh=riq1Gkad55t9ps5gwc29K6tLrNUvJeC1Hr5UhZ+UF+Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1i6GS8pYQ4vGDK9dphtkkFni/l1g3F4oZFfxXV9UX4+FCw8+/B3TR5Pa1BjIerLH/MuEBIrrsIoooxZu8UqAV0q3MSQcOBBglQDilz1PokeVsdTZJIaHOUjlPe43qW1KbbBS5FE0Lg8OB1+AeyiyvopUeFeSsbDp4eHAHptQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AqfjZNAQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AqfjZNAQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so381637f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784902394; x=1785507194; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NopB2zcAoE2W1rfx+y/nPylIKkaB6dYctYVWOaoLAo8=;
        b=AqfjZNAQ78hc7X7oqJhQJfpa0HX7mUxbyccCKWqst11De5HI5Ky8wBCD61A7TIumjL
         l/aNNpvWNgRV3+gBNBI5Y4SSMkqnH6IrtYEbGW87dDsl112URHkDRbZKxlQF195JK6Ql
         q9RRSwxImgHCy1CwnRia3DsyhPI5XiGMCuXBMbG02ONiHD2AwDWdm4GoItXllAhNE7fL
         cuL0TMzdzs+zVfjqeqwcJwDDnnKd8UJt9vUX1hireSkdaMUjdnt8374vWWxWxyzmnhWL
         i1ayl5Jd3PlGc9Ge7HML5qNOu47sg2yMz+Ht0mYdoC19ErxTtKMaa4VaPidb8gC0/3cq
         udCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784902394; x=1785507194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NopB2zcAoE2W1rfx+y/nPylIKkaB6dYctYVWOaoLAo8=;
        b=Y1QRKwBySkFsr+cSthVqby6BaA+vImitzhiasH9CW2ey0xK+5CYAadcQz5ltKZxi4Q
         F8cP3Wa4Quo67e163nwqjKwGTAwG5iMv940fxmBEiKorg/Aq+IK0I5R/NrPA9BU5Nf2z
         v9WqFnHZ3tkfdFyj9oEOX6O+uYe0mHoyyp+aDjEFAQNE2RGQo8wpbWLLI+6KCZPCYfLf
         aA9VGdsu74CBTC/vDqEmcgdP/svjdiHTiPxHknBGPt/d7OXJ3rXmEqQd1woC/iKyAqYc
         ooEaumvgNHspJ+w/XbUp9AwEC0ZYtpuzW9YNiinaGYuNFrlFDhWhEgqkIUxAhVrX8CYF
         /qjg==
X-Gm-Message-State: AOJu0YwlR3kjeeombO0cU8ikrqSgHfiIjlL1zzo+7URnrC2fWeA902hO
	wGidVJ9ZU6UK6Iv3XmCXKT+Ahzf+oNPXam/nKSTPQY2H3BdnYH5/uQ+IJYCTjnA8jGs6tgeLfbu
	XiJ7WFi0=
X-Gm-Gg: AR+sD10zXBDbycyX/MV7fzd4kpobJFCjtKLfAH4IihXeaqFQH2oB91NJ8oWKFCqTfA1
	zssuK27LgtjBrsxiL9IG+qks3ZdU7kXZ6bvqeqfC9JEwQognwQ7IqK4fqZaK4LQyGYCigjg2hso
	R12jiicHR3A8tBnn2T84HjrvywqYLXu18gLNIjrGQWq2u195kqpWaiKhUJwc9izCO2IGzMdJv3p
	4QXAZ903mvR+uzTYZrrKRmYAbPAZZnspa62UbfFu+bibD1L1LUIO/dSnArAJtJwRDtaG4XT4T4G
	T/Yw17WJ00U7sWvBg4v4dDaG95vq/aStufWNZV+NazhbmtLx0Y7y24iVy6tSc/8C+VH+eebqXlc
	h1SiQ9+4XWiv0bwFa1scPT0BLQ4EdkHYYtZf27HJ656beSL+CW40n3fd0QiwI0BooVs2c7sDdeo
	3v
X-Received: by 2002:a5d:5d0f:0:b0:47d:eee2:e19f with SMTP id ffacd0b85a97d-47f8d756adbmr9271223f8f.33.1784902394468;
        Fri, 24 Jul 2026 07:13:14 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5a46sm23693173f8f.9.2026.07.24.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 07:13:14 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 24 Jul 2026 16:16:43 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Andrea della Porta <andrea.porta@suse.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, ukleinek@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
Message-ID: <amNzy0jqWAvh-cBk@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <67d51a7210f0d7410dbe34e3d93813db1fecd622.1784539788.git.andrea.porta@suse.com>
 <20260720095027.B76CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720095027.B76CC1F000E9@smtp.kernel.org>

Hi,

On 09:50 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The binding description states the device acts as a syscon provider for shared registers, but the schema prohibits the use of the "syscon" compatible string.
> --
> 
> --- Patch [1]: [PATCH v7 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller ---
> commit 06ebdbe78362ab02ea5e88d503ad7c179855b48a
> Author: Naushir Patuck <naush@raspberrypi.com>
> 
> dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
> 
> This commit adds the devicetree binding documentation for the PWM controller
> found in the Raspberry Pi RP1 chipset.
> 
> > diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > @@ -0,0 +1,66 @@
> 
> [ ... ]
> 
> > +description: |
> > +  The PWM peripheral is a flexible waveform generator with a
> > +  variety of operational modes. It has the following features:
> > +   - four independent output channels
> > +   - 32-bit counter widths
> > +   - Seven output generation modes
> > +   - Optional per-channel output inversion
> > +   - Optional duty-cycle data FIFO with DMA support
> > +   - Optional sigma-delta noise shaping engine
> > +  Serves as a fan speed provider to other nodes for a PWM-connected
> > +  fan using shared registers (syscon).
> > +
> > +properties:
> > +  compatible:
> > +    const: raspberrypi,rp1-pwm
> 
> [Severity: Medium]
> The description states this device acts as a syscon provider for shared
> registers, but the compatible property is restricted to a single string.
> 
> Will device tree validation fail if a user includes the "syscon" string 
> normally required for standard kernel syscon lookup APIs alongside the
> "raspberrypi,rp1-pwm" compatible string?

I deliberately chose not to include 'syscon' in the 'compatible' property
to retain the flexibility to constrain the regmap exported through syscon
in the future.
Including 'syscon' in the producer's compatible string causes the syscon
framework to register the entire 'reg' property range, whereas the driver
uses of_syscon_register_regmap(), which could restrict the regmap later on.

Additionally, the fact that a specific register is used as a tachometer
depends solely on the firmware; if this changes in the future, the syscon
requirement might go away. Therefore, we might not want 'syscon' in the
compatible string at all.

Thanks,
Andrea

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784539788.git.andrea.porta@suse.com?part=1
