Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A44394780
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717122; cv=none; b=p7y+cfLnqbWZPceYEJwsPl+2vFiW2rc0nXWcTZN/nlQk/C2A7pyOK5VrAnxRlihgjyY2QpchGMaE17jCq8BvomYzBVQOtHsHSCkkL2BeeLPDIKj74EQTnbnAzJQ5Z2J6zvxwbhDPQJfwuqHtyfVcp0EP7weNnDLP8fsrhusWpwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717122; c=relaxed/simple;
	bh=5dLAwEvtWaHtLcVbYsoHyc9TqtGJVQ5X1Y4VsvB2t/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSXNnwvc4yzkCeABSVIdCXaOG3pqV0vTx8oF0maJa/guJJqR1NSKrR5LzpIhhCvkhyP8fibXI/z9UkxCGY5AGwjCWWOUjPUggP/86Wyi8HKKDKyoykStGBZtb0fDhWKLjUzwOrJx38x8WwA6B9fxuEML/xuS/uBXpfZCfTbW7bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYJZOEX3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYJZOEX3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46cacc39191so702199f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717120; x=1783321920; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14U3oSmp6/cxdfs7VbabXG2V4XXAB0Fo6JU3//lbVyA=;
        b=AYJZOEX3QaGuhWgB8+pFfDN1HWvi2LDaNr8nqxO8i5glPe6KrU4QTXI2THDsipt1Av
         3DNsQlGRfeP3SSQo4jyIF27JjGNOTYNFjRsNY8Fp5n3sZ2MACDF4TkbRNz7F9sEoLxc7
         T0me56kjAuOhxJuOYEksvP0YrieVtW4lCfJgwlQEqSohJgk5jDBozQlvVev8YIhrAyxb
         SIlQ9xjxWRVqzu24nOxhkOP3EysXAen18jB4eOnOJp3ix+DJ385vm6LVHaswTxIcaQOo
         L9W2dMfu8qH2lBKyYEQHq6jHqiBYrlbMwqmdaambM/0zHe5MOfm4vaNQ2a2LZiYiGktX
         Y3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717120; x=1783321920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14U3oSmp6/cxdfs7VbabXG2V4XXAB0Fo6JU3//lbVyA=;
        b=XAlmuSDCQdVoWicZZLqUTrNsffhfgCgLoCJ3ZljqPnbI6FSMxpXp8uquJpFJPW7csu
         NHyFK9n1GM3P0IRnjnXMu54SIveHnnFPULuYqNBkgBpIyDD5YAlV+/A/pPNOV4IKPOP6
         PTu3UQwDk7Lke+vYkE+rWJNcbdLp98cZ3L7shMTy4dB17LzE7A1OXmD9f0n2hfR8MWaz
         hQPARCLTNcYRdGn4Uia6B8Cd2g3j0bQ3CmUdBiv99+ZXXFVM5LADbkMn1Of8xpLkZPe6
         tfmeK0e7HKCzvH8tHd9w0HV6cZWYVHPO5Z5hZuWzHlb4RAHcUxvAZ1VRFVTDltsyomw9
         HSLA==
X-Gm-Message-State: AOJu0YzzG71BxBO697lPcmvx8r52d+rogSDtdeeIq4KI6BEWdxOskUmw
	3crWAyT7kL9YNL8iGFiP8MHQHvolbOzIW4kwMd27AtyXb0xLOqZP5gGbvHAVMO8J
X-Gm-Gg: AfdE7cketKWPhBFSqfRN310nlAHEknT+vrPpw3woj0Bzu8t213UL+tlvaCuE2QlRCx2
	0IAey5y56EbSSQ8YJqs96oDNkfL00p1KNvcs5dm3G7bUdG/WVsddRSkkAiPl+M2qmJiXvnAlr/o
	zk9R9qBpJ6dAaJcfinz7dMILL4kzm5j/7G8FI7rpCQyTbeEV1oMjcurYqs/7WCG6ywQ+VFjznMx
	fFxnID7QfXM8Rfed1jC4ZPEK3CtX/3zxMuRSZQTX9RdBjQuu8ay9i+6OV3ZP0NGFV6bQXa9n8Th
	uOjdgtPhlscGAE+F8hxr30x9DGIFlVs/ZiVtERXiodqROj8hT+4xhPL51bUGcL2Nq/PtuGjm8AU
	EsmsLIbIogzhBTGMrb3Caj6hSSHFffTWVGymezKZ2lEvMed54EvnpKfGUw5X7+WCBaQUmzBekZP
	hXDmCB0X75zA==
X-Received: by 2002:a5d:5888:0:b0:460:6b12:1783 with SMTP id ffacd0b85a97d-46da706dbd9mr24010558f8f.4.1782717119929;
        Mon, 29 Jun 2026 00:11:59 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm19216148f8f.23.2026.06.29.00.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:11:59 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:11:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vmwgfx: Fix NULL vs error pointer bug in
 vmw_prime_import_sg_table()
Message-ID: <akIauwCZJNQwGrI_@stanley.mountain>
References: <akIR3WlKLCiCTb5T@stanley.mountain>
 <20260629064342.7FB8B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629064342.7FB8B1F00A3A@smtp.kernel.org>

On Mon, Jun 29, 2026 at 06:43:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The error path unconditionally returns ERR_PTR(-ENOMEM), masking the actual error code from vmw_bo_create().
> --

Fair enough.  It's better to propagate the error code.

regards,
dan carpenter

