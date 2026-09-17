Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AFF4E36FB
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672465; cv=none; b=ApCvwTdJaQwCApwmyF0LRBqRYxZ2aaAfewStaWV4HKUNb8fHT8lpNmYI8u8yY3yyE70i9RZEqRXg27hAoxAty3T5dPmtmca6w55qtAMoIkOwlJkWIMNFeQHSwYO0J3XziwZAXi45WmRXR/rQLXnfDmHG9/jnFFj7kJnyZF9SVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672465; c=relaxed/simple;
	bh=PsT9NM7+x95sDVcyjkUlLYsDInNrGTwBFmY0J5z/2I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9kCLTQeUOQWHKKJactdhCcw59YZS1Q4yYLgm9aaVjz7KJSfOgGPCSZTCSIhzO6RbkJ+8Vjdxgb71pDXql1G3vdz2AeY89YVq1pGttmL7fvtv68AxrufZJQrrw7mptZIjGXGBdsHFybyjPK/DTu4/SYI6jZC1DNNt9V/4SAC+KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq9Jxy5/; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq9Jxy5/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so767760f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789672462; x=1790277262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzYLOWyfgGEEFvCR5EarhALHCHgWymVUp+bDyHHXrVg=;
        b=Vq9Jxy5/ZHswKQbZ9RERT1CMWLO4lQvG2Z9dP5wh5FmggFEDQF/SYXpz8mlsCApOG9
         JRR9kcKxZArPcUGOuAgD0YUsP500ct9VjKDYBFlaQ/DyZ59P9/biuYHlIwDU4vDH5mCm
         +1d43U/p7PqoGCJzS7+60h6sM+5qGxiXUWS6ps1MfNBbvYFsP7dxgs8eyzGPydTzGli+
         b4zcULDy/iRZGNR1bMzZHv7JzDQAjp00piFEup6nSP7D/Jv1S7WSv7gXd1kZBZoFfT6Z
         Be3XtWrKSn32NtuSy/1ltClmh/02q6jYYR4v3G+HCQCCNgXmZC6eAUw3lqMxWlfAOzd1
         UbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672462; x=1790277262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzYLOWyfgGEEFvCR5EarhALHCHgWymVUp+bDyHHXrVg=;
        b=GBGqeZqQK55NHnzp6jZ5gCWC8yuSVxrY31h1yAJNT5FDwGpL3FS/0s+gzPiKuu/j3x
         c7F4gfTflUmml57RYBq4gzTDF4wS009YC7cymeBXPRkN3RelTzUXRZ6rTdrQV0lMH9BP
         SR7wGdqc09FgKBn92ryuDgvZtfSal7jRBuq0dwgrbfeRCyYkU+ltAddNNmPTN5yRP9oT
         fe6OXnKcR8EWJ7OjRxhZw/EwtPp2P0GnhW/4Kz3XP5+RhWfdBUhaLy9meA27Gz3AvagH
         fXnyoh6qQ4+TZuk8gex/2WS2nt5Fingm0xoN9wwPKUPEgRdXbKpOeKgCrZw6l49OAnjQ
         hycw==
X-Gm-Message-State: AFuF++kG2iDQYVaA2YmpPlmRi73zen8ha2C+Vponrh9W3O3seKZZma7G
	y7a7EvcyLcqbBAHxeWs3H9jH3vbZ6oPV47yNHxxOb1WiCCwEhNR0yFvz
X-Gm-Gg: AYBFou3j/g6HDrBr/R8IW0grVBLjjtRxkPhyp5m6yoUpr83htcv4mMsVmpI1K0/6HXO
	Vq7OHpeu5BCS0466bvUrZo5ETNsMeJcs4rT7hIr8325y2i7SgZsOLvKJjlNDCvTh14UXKlyR74+
	mNsWF/sVMrrdxopC8h22mO8vjk+m6kFQzoJ1QNifL5zgWToh8At+dKtwAItV3AdFKOi130miZ0w
	2onRS2VaxtAqZ3KsXd9mY3CtGZXv50W79TlzCDl84/YjUCf1N3S2HvpRmYoMZ6Xn0HQ5ONIq134
	W86rTJNidTDnRHztgpqXL7/nWokejror2wdFxX/AVOHW0Ajp/XlopYVDv0v2SqXqTYCUNTDGB/T
	BxPI3UtjzxxtZLi1p7km1lxpjY8hEhXd1AJyfETCIFtt0XsAqcWdRqw4PbRX5BQxp6V9FsTfnIB
	H2xQh39vS2KuhR3L9m2wB+pXvvIkOswW34KAsnpvRk00rHszkBM8ivoEp5E7dJ6XUNNZGAXxLEo
	RBSm6Ypjpgc3eZJJn19yUkUULaB9bgtRVc+IYiFDqtoRDgtacQyMHQwFexuIJR7GiC58/s7lg9P
	P1W9ANGrosx4yXcfx6fFU8VwrmKH
X-Received: by 2002:a05:6000:25f3:b0:487:f37:7ece with SMTP id ffacd0b85a97d-4870f3780a7mr20918885f8f.0.1789672461701;
        Thu, 17 Sep 2026 12:14:21 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm17755585f8f.20.2026.09.17.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:14:21 -0700 (PDT)
Date: Thu, 17 Sep 2026 21:14:19 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Message-ID: <aqw8C2YwvXOcRYPV@Lord-Beerus.station>
References: <cover.1789659585.git.stefano.r@variscite.com>
 <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
 <20260917155033.C43521F00899@smtp.kernel.org>
 <aqw2zT8W6EvRroWj@SMW015318>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqw2zT8W6EvRroWj@SMW015318>

On Thu, Sep 17, 2026 at 01:51:57PM -0500, Frank Li wrote:
> 
> tpm_tis_core.c have not parser reset-gpios. ref
> 
> static int reset_gpio_assert(struct reset_controller_dev *rc, unsigned long id)
> {
>         struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
> 
>         return gpiod_set_value_cansleep(priv->reset, 1);
> }
> 
> suppose it should be GPIO_ACTIVE_LOW to assert reset line
> 
> Frank

Thanks Frank.

You're right, tpm_tis_i2c currently does not parse a reset control.
I have proposed a separate patch to add optional reset support using
the reset framework:

https://patchwork.kernel.org/project/linux-integrity/patch/20260917124211.136221-1-stefano.r@variscite.com/

Also, the reset line is active-low, so you are right, GPIO_ACTIVE_LOW
is the correct polarity here.

Would you prefer me to send v3 without the TPM DTS patch for now,
and add it back once the reset support patch has been accepted?

Best Regards,
Stefano
