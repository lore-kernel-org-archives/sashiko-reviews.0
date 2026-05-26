Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF943451A7;
	Tue, 26 May 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783878; cv=none; b=XbxGO4DBAXREY/CsmGcbRbcLdIJF+4S/8IbP+Jwrthr1sIwsM/MYI1d0mlU3si1pxCyDLQZCEyautP5VUyldFR/ffIQOChOuVA13uAlW4nFmk2qh1XcrpFY9uUz12b6s8MP1Avp48Vk8FJqfgfI71q2xbjyOJ7mbCLjm6l+OvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783878; c=relaxed/simple;
	bh=0UQsIdGc34pghBSBHWr8ZtkhmrdmfnSjvIGsCS9t5jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKuXyqT6sERiLrWkTEDY1yAG2iZz+UIGCH8BRh6lLHaJbQT/NcfQ+zGcxNTfnkuP5eXm+u0RJ9KUFBHs0igLfcgNUWXEtI3so70efbmx/qa3wz6Sk8lFE6hx6LUcnWCUPfusmP8O1VWFj8BLwU9mArh31P/+FQbZbtUyynS/3Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=KOrsmCvB; arc=none smtp.client-ip=212.27.42.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="KOrsmCvB"
Received: from L30177.local (unknown [213.36.132.10])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 249CEB00592;
	Tue, 26 May 2026 10:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779783875;
	bh=0UQsIdGc34pghBSBHWr8ZtkhmrdmfnSjvIGsCS9t5jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOrsmCvBHPR7Y8WU3dX5n5ZwDNfshg0HNy5n6wrbHz8jHl67ZQ7PeqjVT1L+J1YVX
	 7zGRhJ3N4DvTJUGVhbFb3FXNn/GWdw+/LjdCxxFn/PuJuDoGUkLTifGfM3MDZPSgYJ
	 gEE/x4tyG1jHdOOg0qRdATltOC+ExGoDy+RdcmyKH7M8VlITvFtzf8NDxdPIEBSauu
	 hv1kMTSU6CbPmqPkA9nnBNWaMxUWlB+zhK6bHpEhZGtj2gCQZzb+0DBa5wFu2a+IJA
	 T813RhJHYMXj/OoQ9lawD8wLbE4m8uO9Z+KkTC7aYncSf5uUnSDB1yLO4O+mc4Q/NU
	 gMHh339AlcJEQ==
Date: Tue, 26 May 2026 10:24:31 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (atomic)
Message-ID: <ahVYvwI2z8C3wDJm@L30177.local>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-1-26a3cc8cd055@free.fr>
 <20260525171809.8C73A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525171809.8C73A1F000E9@smtp.kernel.org>

Hi bot,

> i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)

> [Severity: High]
> This isn't a bug introduced by this patch, but does the atomic read setup
> fail to clear the TXAK flag for SMBus block reads here?
> 
> When i2c_imx_prepare_read() is called for SMBus block reads 
> (I2C_M_RECV_LEN), the I2C core initially sets msgs->len to 1. In 
> i2c_imx_prepare_read(), we have:
> 
> drivers/i2c/busses/i2c-imx.c:i2c_imx_prepare_read() {
>     ...
>     /*
>      * Reset the I2CR_TXAK flag initially for SMBus block read since the
>      * length is unknown
>      */
>     if (msgs->len - 1)
>         temp &= ~I2CR_TXAK;
>     ...
> }
> 
> Because msgs->len is 1, msgs->len - 1 evaluates to 0, and I2CR_TXAK is not
> cleared. If prior reads left TXAK set, the master will immediately NACK the
> length byte. A NACK on the length byte signals the target to abort the
> transfer, so no subsequent data bytes are transmitted.
> 
> A similar issue was previously identified and fixed in the interrupt-driven
> path by explicitly checking the I2C_M_RECV_LEN flag. Could
> i2c_imx_prepare_read() be missing the same check?

See,
  https://lore.kernel.org/all/ahRmjr9cxYmkYvm5@L30177.local/

it was already explained: this serie fixes the block read of 0 locking of the
i2c, and this v2 just add the symmetric for count > I2C_SMBUS_BLOCK_MAX case.

For this topic and the analysis see the former email that replied about the same
topic on the v1.

regards,
  Vincent
