Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400119D07A
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787551910; cv=pass; b=T2w/d7Whq8w34LomR9wGpTXAcCh1CV6ZeZCN7FMeC+kiAVgYJ9Jevc6SqRSrdFBHFsCdGM2IKyNIQsuzA74l2BQ0ZikDuwKcsdjRi+rpxaGzLIQfgj8cX7sp6idTAgdM3NQX7hUTGL0sPYyJGvF5F8BluESkhFU+k97C+0JKdxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787551910; c=relaxed/simple;
	bh=upJbpfw5P/06Gk2CCXLh/97sXvHk+7trsmukUfr/kNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ6e9A/D04bUJ0gOuCNsi6gAEldrL+THqzQNwhoIdam8v7ivq7BS/8AfITnTQU4wFYbMwuRR+FZxr/N7f1O/yGXwK4n667YI885sxOp2pXrI+42Mket6p8BMHQdYFvtyyOfsrifhYhxqYYckcVkE2+p95iaCF8FVe3pRvWWwG24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRd9ecq/; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRd9ecq/"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84847482584so1966738b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 23:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787551908; cv=none;
        d=google.com; s=arc-20260327;
        b=JjoqnxWzoe2AM3mgxuqH3qLbqaogku+h1IVYqkPHhFLWJC6uhv71KKflO3BV2+4XWZ
         JN6cVAJ0FjpzKeQV6EZ7Zf7c1kki0e2e9N7yge6HKK2F48zvhrtZHRI6blgdxZJOMsjj
         nCRsDQaaDaDM1OwsQB03idUt+aEoyFCQNpJNr7W5ykyzL+hUsdMqC85LYFOPc1xuDBZa
         t8BP5Wzd2dADQlmDEqQW27w5oXXsOU/pk3yi5dY0UuU3RyX7B8Y9XhhQBvJU+lfgD6UX
         p/RVL+HqiVOv3LMzKCypMiFGKH3A3SGHBYzEAS5H1IE3bMckS9S/NjyyWl/9W+DHOptH
         N6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=upJbpfw5P/06Gk2CCXLh/97sXvHk+7trsmukUfr/kNY=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=GdhTSpix8HLv+tCnkQfGyxr17B1AuwUuCLR2WAK1/EDwgNGaEMgWMW7RsX2rIkUUiN
         U9DtPvUf0ccU4u8VRyR9pJNplKNcZeRueDiwmAQUD9CBHshNc5otmD2PhukRHa0FGu6o
         o9lAEPkoa/R83YqZv0Dqjv9ajzEgYHGiE68s0CDrZcCohtPOhXlxrbA7JHPWZAA7XUnO
         +b+IO7iSQx9ExSMtva63ZRI+9p+B+KNddjeoxsoc2wESQ++lg7xqw/NluYqW7y6inumb
         f4VjfzSNPnKN+ccGVsFkAcAD/iL9L/lqG6d3jfNpNJn5tW22MlPTEY/bR9u1+4tJjIUQ
         yqIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787551908; x=1788156708; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upJbpfw5P/06Gk2CCXLh/97sXvHk+7trsmukUfr/kNY=;
        b=fRd9ecq/2RXhxMzJwu3NNMkwC5TMMJgguaNBcIU6xtylLeN7RkNp77gT08ZYVKy3ge
         3N18bR6A4JHPo49at0nnjlUdbxRrH8+gZJPiUYLxcENU4XjWm3F3BqSygf6ix5GtyeT6
         FnRUi1UFS4LXx1AG4NpQ0Z/CyN5rAbP7WvV4xdM2XHLtgXawRbfNyta03rDTYbIeUGWm
         h4mY0XsK6CdRNrkR6IQXlOfDe2pIXQGTlTAZWIxpA5Qc46zOTYdrmSW1xB0cAuagS7Nl
         zRPd/qf3cr8vPIKyZ2nPegmPL8z77GiVjEl1PMt0YBqHu1AJwBA2AsT203CMqCdyfXO5
         huKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787551908; x=1788156708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upJbpfw5P/06Gk2CCXLh/97sXvHk+7trsmukUfr/kNY=;
        b=gebgwndRz4DknbY8Di++YaXAfchHoANcBB6upILoAxZ1oqcZqJVE0y3SPjvSUBoaWe
         o/J26xQRCm+dAPgFNay1VELzrDAxY48k1RY9OvLTfKjoM3XwduCkcE/ZHMeqya5d16+2
         ieV+xqxAxK8zf1WVm0/R3KFNbzfAEiHikCig7Zl/QDFKym4RMf75zwHaRaoUpuKxvyfL
         whtSH3GXzRNsjCkspNjWmhp6W8LbU4MJVOuV391COJgw7ypElk9VGltBlYd6B0aQsvJ0
         CvaNafTTiWq+RtTwnPUENb1KTml0IMFPnPtHQx0mwoZS0vdHn3Fv6qsJFE3yC/8to2x+
         DK9Q==
X-Gm-Message-State: AFuF++mtgQufsMhYbQkgm3Aqp/lJpRflggf8zC2s5vXkeH9X8gA3RXut
	mGN4MU6qG9iAB/bjMv30g4xawzRyK5VDTpJCO514S0JbDgUTkF+D/BVOlAHk2rUJjv5nm3sR6iE
	eRdfcT5+/kxBdekvsBfyRmFaevtBSFID3VkCA
X-Gm-Gg: AR+sD13QHaJWbxY2ZBeiTPrelO8EDKO7k1QnZSdiPMej96nmxuMb+lSf0DEK2ofm6Qt
	2UmgB2oDY9ybrRAOxLr3dEhDC7sxT/64o+C9V9o5atV4rk7f1s6IFyOcSK0Uu3Ueyn53cYsG1DG
	yrg3hpac/vjwYojlQZ4JHs5x2Zw0tuyoDlJixhri/1e0sXylrrvSBR7BgRLGVZW6zLKsn+umQ1+
	Ba0ZRYTee011xG/1pg5tRPcIsXyTjFk2bL88dZwn857bNKFbwCRMxkmm//XPXCZBvZ4NFlxXtWJ
	XcYUNWixjGl+U3/TfUHVmNAmMmtxUkCHXNoCq4hcAGlGP1Zkw5KvHakLqcwg2frOqscmunRQHgy
	cNce8hhUMj46LLIZ71RMjbKOtODhSZl0+YMQv3+TmsIEVREvaSXYDsV0a
X-Received: by 2002:a05:6a00:178c:b0:848:52bf:4296 with SMTP id
 d2e1a72fcca58-851dfa76f9amr31661331b3a.15.1787551908090; Sun, 23 Aug 2026
 23:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820111416.97917-1-phucduc.bui@gmail.com> <20260821111442.BAAED1F00A3A@smtp.kernel.org>
In-Reply-To: <20260821111442.BAAED1F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 24 Aug 2026 13:11:35 +0700
X-Gm-Features: AcwNN1UUehHIBiUS3udMQDSoIp88Cr9UdchE0iBxwkX45M9_ARcsKGBtlwkKhwM
Message-ID: <CAABR9nFtcX4_Zx+kcDFMDb_Mj2LeAnp-948VDbGrkrrpwBHxNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: fec: Propagate PTP initialization errors
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> New issues:
> - [Medium] `fec_ptp_init()` incorrectly returns 0 (success) instead of propagating the actual error code when `ptp_clock_register()` fails.
>

The ptp_clock_register() error handling issue will be addressed when I
resend the patch to net-next after August 31.


> Pre-existing issues:
> - [High] Concurrent execution of the PPS interrupt handler and device teardown causes a use-after-free on `fep->ptp_clock`.
> --
>

This series fixes the error path when devm_request_irq() fails by
propagating the error to the probe function.
The reported race between the PPS interrupt handler and device
teardown is a pre-existing issue and is unrelated to
the error propagation changes in this series.
I would like to leave this issue out of the current series.
