Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06439A054
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 23:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218095; cv=none; b=DXJeXlm/0gVk3rv/2aedc7HtjSBwNtlpurNxDwY8rIPu67ten/Kb+wFhOIY2vZ6AmrcoJRp9quhP4BOU0GtxKrvc3Ipe7cNffk11rPoelnrLBh/bBny1bKhc+I+mMuzrLbF5v8R/NGhHecOOhsGSuttOg0fl4a6coeKiZITPhkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218095; c=relaxed/simple;
	bh=+DtOgMGR9+Hm0zGDpoOk2t7h7FujKWT+OqJ/UAJlZvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDANdJkEnikDKZ35AkQha+nCL9+xoiLWLKChJ/A7rXNS3ZBcxfVa9N+Lj0W/oN6Uy/b2XZSO8o/t+V38AVm/N+nWYbVcmT94nHTDyv9OtSbgx+Ew30wnppGsZAI1UUK+c94dyKezIDtmVnEFu4819QnPM9Ssr2fubrLNVDgTGhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSfOI4xZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSfOI4xZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso5466505e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 16:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218092; x=1788822892; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7imqAMa0q2kTKskLUSu2S5gDTb494TVGlrCJqb2nzRU=;
        b=QSfOI4xZLN2r+oQP4bsoJLeL2RyGQTaHPuxx/TBjzo53mkhCDz3foqELano/TrIr9W
         mvI0vpcgkNUSWTDWQIeOWLJnw+/mJwTKnNNGogTjO+BhONsUMmI21Ak6ogmsbcQCZFEB
         Wrx1UIPTUizoKblBXcPGZcogPHol8tYu4bKdqpch5h4PB+1wza7dSRytZjKiniHgZlQa
         4Mjaa5aIrc7vitx5Ybb0CYMD6kZDT1kxjLO1v2vgF2xbwqdNAHEtHy4kUEVHk4+ucpND
         f59v5C4VXJTpPG7mL0XfT5sK2TZTjMluwoS5nMBjt/MOTx5s0Eo/f/DCUPqum0fjWXhQ
         c/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218092; x=1788822892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7imqAMa0q2kTKskLUSu2S5gDTb494TVGlrCJqb2nzRU=;
        b=PdebniAqpPy7UkHH9eIbNIPBO3JN0RyxIIm5Re5wgARurBCni1/Sbbk6g+E4jC3L1U
         AQkCQwth9kRL2U9ChuMgI1Ca+NDP3/J8dH7LaMNbIV1h/t3d3X26kWfL1XNc2HV7MHUM
         8tjU0k7cTxO/JXmpnobych7DHR0g/WwEadL8wBHHrJ6njxw2O9w+qQBXuvcGO1drcX7t
         wgtgmYvv5IzNxs22L4UGQnoggHt0Zj3i/fpCqLxSgFVJ7SSVHzl0IPmPI/o29oFSvzdp
         IO6wWctso2KsIcVAZHHcFFjeBLw3b3UQ3JGADr97t0CAJbom/H5hAvuoAnfS7+6sB9fv
         EWRA==
X-Gm-Message-State: AFuF++nD2Km6xgK1RgGwADoZrlmFXk5QrMWxhVUTcmVUklyhIz5ZB21+
	YqhDqo5NMyt/p6PVnXREkck+kwcrR3rakeejMbvzl2jylFo+Ow+sHqTbB6i1rWMbrHo=
X-Gm-Gg: AR+sD10gZPGvvx+bnfeE9ASpBZReDIljiC/3SUAAy528T8Qv2UzIM4KKGdPCMWcsTup
	8Lt+zJCW1V7YZQ6/QiM9XPfVmAP3GlvcCnkpXG+JUCCU9wrcj+EUsrX4JLP5NHQEN2agpEaSp0N
	80KTBwNY3om4CZ+EZsNNPPXGQGxRP8R9b73rkuEvo1xlVneP7uf+SK4gg0qm2iQ56u+aMU/PGtE
	YcW6cepz34mC/G/TOT0n2+4b5dqjy1o8fUeNDyhwg96OV0aBz0fv01nqbveI6DFE9fae0EnCxf4
	xB15T/ZPu+qUWIKMtmSe5yHbjoBvOsHewvUND3E5gT4V9tMOsevr34VKwmFXsWAzS6s6m2GJq8S
	sj3zHD2aw3c3brQcujmEXkkf1FoC8JNhpmGdQcRq7ZHw1ALvP6re5cnDQGJkR+gqjYy7haSkZ3z
	i5SaPx4tXs46lbOM3zAzoF8YuA13vWbjEuD+BeaDamq1xRJMTIED212RSPZV2TPLE48MiLXZ288
	NnZ/ruvfaT20VAcsu2O37Y91Cd3Eu2O
X-Received: by 2002:a05:600c:4fd4:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49cdc59f62emr71319315e9.9.1788218091484;
        Mon, 31 Aug 2026 16:14:51 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d4236esm855500f8f.16.2026.08.31.16.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:14:50 -0700 (PDT)
Date: Tue, 1 Sep 2026 01:14:44 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v8 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <apYK5AIXkEnDYEHV@GLaDOS.station>
References: <cover.1788184274.git.stefano.r@variscite.com>
 <7a3aa8bc7d4613998904db4fbbae03d213c6c30d.1788184274.git.stefano.r@variscite.com>
 <20260831231042.59BBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831231042.59BBF1F000E9@smtp.kernel.org>

On Mon, Aug 31, 2026 at 11:10:41PM +0000, sashiko-bot@kernel.org wrote:
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
> > new file mode 100644
> > index 0000000000000..b56f3680edcff
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
> [ ... ]
> > @@ -0,0 +1,118 @@
> [ ... ]
> > +&i2c2 {
> > +	wm8904: audio-codec@1a {
> > +		compatible = "wlf,wm8904";
> > +		reg = <0x1a>;
> > +		#sound-dai-cells = <0>;
> > +		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> 
> [Severity: Medium]
> Does this code assign the wrong clock to the wm8904 codec's mclk?
> 
> The codec is configured to use IMX7D_AUDIO_MCLK_ROOT_DIV, but shouldn't this
> point to the clock actually driving the MCLK pad (such as
> IMX7D_SAI1_ROOT_CLK)?
> 
> If the driver queries the frequency of this incorrect clock tree node (which
> defaults to 24MHz) instead of the actual 12.288MHz rate driven by the SAI1
> pad, it may miscalculate its internal PLL/FLL configuration. 
> 
> Could this result in incorrect audio playback speeds or a failure to lock
> the FLL when the audio subsystem initializes?
> 

This is intentional. The WM8904 MCLK is provided by the dedicated audio
MCLK root, while the SAI1 root clock is configured separately for the
SAI interface.
The fact that the pad is muxed as SAI1_MCLK does not imply that the
codec clock provider must be IMX7D_SAI1_ROOT_CLK.
This configuration has been validated on the hardware.

Stefano
