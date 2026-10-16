Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47C4248A0
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136434; cv=pass; b=oqgfuVfJq2GQj+dimBSdmtZefzPNNk7I6rii/wrYuik2F+U/rVomAjulEVzS/0sw23kD7IxvY09eKebpDKyRYzk9CpIVBltzx4XRCejmdmOY2ps/COjpfQ5ddD3cGPqtcnRMTZORrErh2+oJapuHvykmeNmMDqb4drdRtUl6Xg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136434; c=relaxed/simple;
	bh=m7zCkjHGgtakiwRzW+QIVzzzjc1V8GHmFb2HxrY9JaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSD48ruir1zxdaaViQsmUG1xPLIYlNmLHy+oAKDCLMMg97lEq52S3w2tXxWSxeNOmin2DdPZuk9uTvKaS9lQaCP89fFTAG3GIFVnVIysQU5JCCEaGMeP4K+o4iRZpAZwTuiu7QFVxR68yGwOyrcAb8FhZvgIk0fM2q5avjyYri4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMUPx6b2; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMUPx6b2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-872024e2b4eso2740926b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136431; cv=none;
        d=google.com; s=arc-20260327;
        b=gciAmsZF9OS5U/5xpVuHpp1q1qdu6VLA8M5x/w2NQcjCdX7LvqZlg/1wqN815KCrZr
         zGIGHDyfrX1Ry9TEagyyIY8VNd78YDfOFlrtajk4GXRurvrTKdr1EpowiRjJRusoYDBB
         xDmZfBK/brNlH5EEsPKbh0ilM0sHEbBuKhq89aOuVGCCrS607fEZKwuK+aDiA3oBV2u8
         P42anbaoMSTjdrquamRloLX0e7vRHJWeeRWPU2wJhTSX34W9jcxlB8IlF6EjpU5emqkN
         mPKX3ThVTXnR3JFVXKahDbmduq/lQCs7hFcvZg927KtJATJlbMnJoYfFeY5JIvKjQOCv
         6ATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b8NMSYdDGPDxBRgu8DCGU6lZZMQyQu68uXVZZRycBjo=;
        fh=brwc+gCWPvu6a4XKmh9zBKe+0FPgQPwkrPKabf7H9mU=;
        b=XosjB6CVy+ShhlnzgZ7HHNOBucAM0U9hm6wxJJrzcxBEKrTfpllDZNjnKG28ZLLWPP
         7FCc7aTBzEA0DJdoUwHwydI7BAhp/cknqxiL78J7WrayT2XM4JNdsaqFdcYngLoV+hRv
         7d0Aeo6O1CzcGkZhRS+kR5vgrjsVgvW8yqq1X7pi8gkmnOXavXXu2YyL9wk/bBPpm+wd
         QrheQSFc9+PW0jEg10jzR+FLM0JB85pEvX74NcFjloKVgVbloFDNE2ATUzAhmXEDBbFD
         IHfh8V0tyEfJQyKmgsZ0cuxhOCe1u1pMGEKViC6BgM1DA++JoSrC3sRt39ULEQjXx64G
         b+NA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792136431; x=1792741231; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8NMSYdDGPDxBRgu8DCGU6lZZMQyQu68uXVZZRycBjo=;
        b=dMUPx6b2xp+8oJywm1/bUgeYfL/aS7G8Tau4X0hXqS22cA4Jb9zy1+GbzSPnzBSKjs
         TD3lKy2PwIG7jbwx5+c7xbYL+tBI8vcC4pLD5cRcurfu/x3NchyAN4dixtHjBHPuoJKx
         s2cdznUl9fExq1RePa9Ri32MPUV0hnJaByuCvGeBUZHFka9thwXxfrsfyhr5WQGM8FH6
         lOWS0UwrdBRT/9cPkTOdmn9WGC89lbhLKNGdrELf0Z9iQCLp5BT3p6gldPKwFJXTxe37
         /jlYsHm+geS77hYqWdIkaMw2bMPUTlPF0i376PFfOTlbWUA51nXwvOTWRbNa8SSazI3B
         WB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136431; x=1792741231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b8NMSYdDGPDxBRgu8DCGU6lZZMQyQu68uXVZZRycBjo=;
        b=zFssCXI+4aP5vkBA+pSZNFcmfQ0zHXx6JYC9bt5ev8dgm2HWmDS1/S1x0SaL57GEy/
         J9OsplZJaW6RvSd7Ma/OodfoqsrS+m8DDgZ9wIzNCwgKY3koIRMmb0M83zn7RBbOVRNo
         ZWxyHzSM5itg7FhyfgqO+jIWv2hMbe6EEbJNroBUILcyLqJyDAtVXJI9QPsQdUdcVyR5
         7gKjF+A+mrJ6GM7iDQ5ORIg5oU4WTccbseN2ZkXXob0kOwbSI0rZJroDXP4fYoJGxdwJ
         CO6WXxrpPwlZR9/EnJIWubQnC1zWavoMh7jk1okzmoF5T8PF+sj2+RXNokSEfZOueakC
         6uhA==
X-Gm-Message-State: AFq9FYKNS+DH3EZbWbwypoDJS7/oNPWyPJ5tI9izj375VCbLkpDSH6UI
	Cs5QNfCmB7F0uVk+yAz0xD1rjsyq3h93yvBHx/auOn0SQW96WS0i4Mx71MaBA/2Vz17ICZb/Qft
	uumXo3kHz5sBPKHQX4xtPLeFOzPc7mVuflAjq
X-Gm-Gg: AYBFou2HVS3IA6o8T6LwKNhIdmVW+VtXxqjOHF2dNZ/jT0xH0C0HyPdRUyrbpgut3tm
	pimW/bOY2pqPB82046Dy7l9+qMkdtVDx3oT3rUerWwHjGOdX4bybkFM352tlQ2LX1gSnrvN8Vl5
	EbOVedlG1x2YA8yURNBGtrYdCWylmiXNTNYkNiuvar2HDNcb7WFlluqgCKoLBnWBj/r9oYziDJ+
	dqP9jBlduRHlKDm6DQX+VrecCR7t3V/pbhL1Io89dw+H9mRExmr8OTREnIenAv8kZoqVEC22Bgr
	wRZTdw2jVzQbxzB+qKNOsHs5BGytIVLrV3zPfxzYgKTiIXLkeCg6S9o+sVcNhVOXWzuBSPENnPW
	SrNA9ZinjFfF7h9ydBMZ9lakfqC3wI3E2ByLK4yDDAMxE8+bRMTPiVVHT9WAXkGFLOmD8n9ktW4
	6Dcw==
X-Received: by 2002:a05:6a00:3cca:b0:892:66a1:a175 with SMTP id
 d2e1a72fcca58-897c7fbecc9mr17391884b3a.52.1792136430813; Fri, 16 Oct 2026
 00:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <20261015014324.5569-2-phucduc.bui@gmail.com>
 <sashiko-outbox-173760@kernel.org>
In-Reply-To: <sashiko-outbox-173760@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 14:40:19 +0700
X-Gm-Features: AclHuK9I0k_EslrVU0Wzr7YjeZNixROziAKG65dmi8STJ8wv0r855tk6_aLjH0s
Message-ID: <CAABR9nHmXxqZeDwgtWdRQjvmLDf7NivNkcAKOo64MKotykBopw@mail.gmail.com>
Subject: Re: [PATCH v2 01/25] ASoC: amd: acp: Fix .close() being skipped on rollback
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> Is there a memory leak in acp3x_dma_close() related to this subsystem?
>
> Looking at sound/soc/amd/raven/acp3x-pcm-dma.c, the stream instance
> structure is allocated on every stream open:
>
> sound/soc/amd/raven/acp3x-pcm-dma.c:acp3x_dma_open() {
>     ...
>         i2s_data = kzalloc_obj(*i2s_data);
>         if (!i2s_data)
>                 return -EINVAL;
>     ...
> }
>
> However, when the stream is closed, acp3x_dma_close() returns without calling
> kfree() to free the allocated stream instance structure:
>
> sound/soc/amd/raven/acp3x-pcm-dma.c:acp3x_dma_close() {
>     ...
>         return 0;
> }
>
> Could this lead to a memory leak of the i2s_data structure on every stream
> closure, allowing a user to drain system memory by repeatedly opening and
> closing the device?


This appears to be a pre-existing issue unrelated to the current patch.

However, after reviewing the code, I agree with Sashiko's finding.
I could not find any place where the i2s_data structure is freed after
being allocated in .open().

I'll prepare a separate patch to address this issue.
