Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7238C38F951
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 17:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784829139; cv=none; b=K1dwS/jpNtdRIEhWKKZQbMGSHJ+9DIyYpt2lQEn1mCWwR2OjDxy+kT3JEB3ijlSrQCvt1tBVpcqrWFimoXxeRkkPY7ys0D4k0ILBdo5iKnD/rfpm9amdbUoV83/78wtajJTuwE17ET/pknrP77ZJ/MxBm/wEd2ADJMVrhnQRmiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784829139; c=relaxed/simple;
	bh=1MPMvOczMfE71F3sxE+tZk6T3YzHla2u2hhnMSEmLCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0EsbXAWKcoOfj1Yi9B7Qw6jpq9G5JpLBSm86/0K9gpyYnmPC1dTchNUQKFZfsERthyoNRVtvddZSDiUaj79U+7rhdOpo/c/D+CcWKqF9HqlObNHuBUIC9jfOYMSvmoY8NP8ubUmMJcJ+sIYePJVCzBX/M36aK7YrCLbHvHLVG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izOE9DKn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izOE9DKn"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so874399f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784829136; x=1785433936; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQjaJTz3kBHgokHNYTl/gM5EyjGoZTl675jw/y4LuvQ=;
        b=izOE9DKntwJS5bVUbo4K++4GH+Wm8SaQRc8QMI6Adg0oWKSp6vxIz5c22z38NeGatJ
         DALBOEbAG7t2uGcud8L9e+wkqXSYeWtVcGg4R12BxkBjajybc4ZtkzdD2oZxrDKocDe0
         cNQJ2Slvq7j2FGIanF1WytBgust3DS19L4IU2tdla/1ZcJ3C6+w7Vo+11k+KfpjxfJUX
         +pmxs9tMRPAiHH72NAJxiRmxo2O86xmx0+iend+mw0CEIfKHNKmED5yb550bTbuQr//G
         PdT9DFq4f37AwBI/RgmwecdevzpOi2PFpcwCmYvRYxBDVbQGYCCiaFVP2rGHPkKiX+rF
         E1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784829136; x=1785433936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WQjaJTz3kBHgokHNYTl/gM5EyjGoZTl675jw/y4LuvQ=;
        b=FtVDHAtZYDRwTE6VJPi0v0e2PoPzhu8VLPlTm05DRSNnVaTDdMYFA9TzSn8MOGFkBe
         0SnrPoQ35HfFNP+nNLf6+vNkC32El3AF0K496PHQuNp1sVe/E0Far6zPpY9lJGhUAprD
         QHYMNosRH2wvAf2rdvFvzB+QICmhZEprsN2Lql/uJv1c3HV3iTxn1S/dWyZjSlNo/uhz
         lVz9lX0YUIGTZV261FMwYW76v/AeNdG2kkqsDWokaS2i95MYWAKbtpixVqDpk/BGdDAi
         5EN1fsct1z0qDOh8Pxa/tv6xYPcAbfGKmNESqLFGOG+qFAN0LojL0IZA9ErRYM/RXOMi
         kT5A==
X-Gm-Message-State: AOJu0YxMaF7oXvgdIlrwmUvIyC5qwV/1awurYZ2KFp8VL4uoSRpF7aod
	xVzGGJRScPapCzU/A93P9OnCJEVc8ZDVZE1FIce8EgNa9IACE78QX3xwxY3VmA==
X-Gm-Gg: AR+sD11Z9GOT//P1HLDuVF86GN9KYPGY/7Hcj/TGtywDt5VlIhF+3GRkjvIsW6E/0yi
	CYmqe/KuxWXKVRvke05QqcID1XneZO9wwJD+XAWBJ3xjJYCm6n28KsFmLY7DjzcQsyTmeC39KJ6
	/hO/0yr7NqYpsSSYi4qHPEKfcxyChZDepEnpSjNu2eVNFPJsCarVeziwFrVsLMZ17NDzTDJAAiF
	YK0AM0yTw/YtoUVcR7CcWfHXOsL4oj3sDiqsQuhQOHhUo+TDxyP6YaNavPuYZWgU/UzTMrakMrZ
	QxouCAFdNJQEAEHAwdIqi+FpNbrXVinxgV/SliKZuct7UWdPZLHXHMcnEqHcpm+q25bpHYRWmCQ
	9Ty3HQ1Q8lXLNCREhDA0l/9svKmSOnoxWZmIWrvdTcJYxb1BcRMr1wu+h9RgorIOld0YAFsuQE/
	/yuFXO
X-Received: by 2002:a5d:64c3:0:b0:47f:838c:4256 with SMTP id ffacd0b85a97d-47f8d71c7f5mr5792280f8f.16.1784829135607;
        Thu, 23 Jul 2026 10:52:15 -0700 (PDT)
Received: from antoniarch ([78.212.250.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6ef25sm15799410f8f.36.2026.07.23.10.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:52:15 -0700 (PDT)
Date: Thu, 23 Jul 2026 19:50:50 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 5/6] rtc: abx80x: create abx80x_i2c_probe()
Message-ID: <amJTTziIZ-WhP5Ih@antoniarch>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
 <20260722195814.298552-6-apokusinski01@gmail.com>
 <20260722201057.5CE841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722201057.5CE841F000E9@smtp.kernel.org>

On Wed, Jul 22, 2026 at 08:10:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] RV1805 hardware workarounds are skipped during auto-detection.
> --
> 
> --- Patch [5]: [PATCH 5/6] rtc: abx80x: create abx80x_i2c_probe() ---
> commit 0661079a8b8384fb14bc67f5100b45ebe0a01c3e
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: create abx80x_i2c_probe()
> 
> Move the I2C-specific code from abx80x_probe() to the newly created
> function. This is a preparation for introducing the support for
> ABX81X RTCs which use SPI interface.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 7761cb353994e..6e0c14695bdf1 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -855,7 +820,7 @@ static int abx80x_probe(struct i2c_client *client)
> >  					ABX8XX_OUT_CTRL_EXDS,
> >  					ABX8XX_OUT_CTRL_EXDS);
> >  		if (err < 0) {
> > -			dev_err(&client->dev,
> > +			dev_err(dev,
> >  				"Unable to write output control register\n");
> >  			return -EIO;
> >  		}
> > @@ -867,26 +832,24 @@ static int abx80x_probe(struct i2c_client *client)
> >  			if (partnumber == abx80x_caps[i].pn)
> >  				break;
> >  		if (abx80x_caps[i].pn == 0) {
> > -			dev_err(&client->dev, "Unknown part: %04x\n",
> > -				partnumber);
> > +			dev_err(dev, "Unknown part: %04x\n", partnumber);
> >  			return -EINVAL;
> >  		}
> >  		part = i;
> >  	}
> 
> [Severity: High]
> This is a pre-existing issue, but are the RV1805 hardware workarounds being
> skipped during auto-detection?
> 
> Looking at abx80x_probe() in drivers/rtc/rtc-abx80x.c, the RV1805 specifics
> are configured before the part auto-detection logic resolves the hardware type:
> 
>     /* Configure RV1805 specifics */
>     if (part == RV1805) {
>         ...
>     }
> 
>     /* part autodetection */
>     if (part == ABX80X) {
>         for (i = 0; abx80x_caps[i].pn; i++)
>             if (partnumber == abx80x_caps[i].pn)
>                 break;
>         ...
>         part = i;
>     }
> 
> When the driver is bound using the generic "abracon,abx80x" compatible string
> or I2C ID, the part argument is initialized to ABX80X. Because the workarounds
> check if (part == RV1805) before part is updated to RV1805, they appear to be
> silently bypassed.
> 
> Could this cause the RV1805 RTC to accidentally enter test mode and suffer
> from extra power leakage?
Yes, this makes sense. The fix would be to simply move the autodetection before
the "Configure RV1805 specifics" section. Will add this as a separate
patch in v2.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260722195814.298552-1-apokusinski01@gmail.com?part=5
