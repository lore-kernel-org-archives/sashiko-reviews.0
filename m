Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91FF42CB19
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 21:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582814; cv=none; b=WRIDj39kVAmREgM2e8JmSQSDJXPhQrh5axOr+wdWJOaKP+7mLUh248dcrR87RSkk/UeXdufiNt3ZHvlIFvESTYu6mNabXboAQashizprtFvtWbimOO85qumLyOlsx2fmWv+xOL7CkJgpkCmcoEFJbB77KbesYr5/m7p4yHfk5Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582814; c=relaxed/simple;
	bh=KBb6QIoZw0FdFa7o5VODkCyFlMxQ+46+6ErjuXZUcaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOn0DV3C0bPh3UKeyQt07dFTfjLjYh+XMoxA5aEYUhEDKR4GbFfMoB3o8Zq0/mHolPmlIs3aXdmVLEaHaNPmpAYv0npJBAoDeXb/LqDGGZGtbgmvtsGgHA9SMFkMocuY5xDfDjbDN97e9yP9N9inaHdXcSd8FrYIDnrOJ4nr80I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyDxWKaB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyDxWKaB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso22316775e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784582810; x=1785187610; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyyZwG9uZSyTHP89I/9Uxi2/crj+YVtpDfvIWd9J/1M=;
        b=OyDxWKaBAAHmveEpXXHZAMjkOVgdTdMJouYgmIjYOtgoFfCNXn425jK5SgtXLUCaIp
         uo/pKT/Vf5Tc3WrdwNSKTija2FLRHWFkTikZ8GMnAeGgoQjwB5XjSgfFN18KlVTM/tqc
         6RyerM8758xv7oane0kKWiNhcOGyF8VIlNdFJY+9dIHqAX3lMBkAXae1rx4WCEHnEYA/
         QDQoKOaDxLIJPRjToKYIqzzMMI9A3TTSD/1gW9B4ijxIOmWtH8VbFWZlguea1FdbN0CX
         L4y5RZ2L6wQqRsvx7SUpRcvYxOZPI6J4rxm6gJED3Mj5EzskTm1dVCnveYkuMD17q/hQ
         HVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582810; x=1785187610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qyyZwG9uZSyTHP89I/9Uxi2/crj+YVtpDfvIWd9J/1M=;
        b=PAAgD2aWs3MzJGIc+51COpaMjK2gVJABDEFbQUNDm77i8ina9MNmXIOe4ulYIn3/4/
         rulXjZROgO9g/PwyiNwf5XpYnrpwqotQ5SUnAuhzLgJAaVxCwMbVJVxQ4zZIvof3sswl
         vRMGt/+1Dlllvynpmcx3VU3+hMI0sGKy66yHaDbRrw9w4qoDgXLPzChdMsIByG0ZQhsz
         gorZde+SE78MCoYD4R3+waDX+ETrRdUgELwXZcqvrgNBybbm+0mmepb3mf4jdHOIl4JX
         sIA2uaEPpHr8HpUUGdTSijI7Ix/wTXOSM2FfXyVwa/Ca13K22lnDt+a3dV4/BhtzDb3s
         jvaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMnrtRSHWGf0zNy+Ua+EpZ2tgqlfkRHQlibifhR0jmgpizhoj5sUadcS5N7VKH5E2e31eFNKKXsVRTfRxVT2M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2qgztIiNrhtOqo1WfqJRG+D41pM0AWptU1KrspBHerP3zV5Ed
	i9O9T+LdhXvNNGA+b/qdqUCm56zGxwU+RcNZkNTYK8Bk61ZCWtFimpIH
X-Gm-Gg: AfdE7ckQlrc5C8ZUyeG1XsySqzV+z50EyV6bjdDs6nyDKkMKDpqm15J17/GtQ50v5/V
	wmGm4ukvoLpRmzgtnwsUH8uglr+YCfP1QL6e5C7pxZ0eQ9jk+adE8jX/yDXMSsibHhKG+u3Ec7M
	Z60vr4gNvotNgDeg1J3Lca8Hi53+y9vXkjgrHm/rxQQd82LKtWK2gSSLG3cw0UBV18vcYrglAjz
	wuQwVeiGIhktRCT1bNh2y3wa2iNHXBlvPhs4Cbv2EC+lKUXBD30Q0di++6niwm2CoGKIi9hUiUY
	lhK6uK4LYAoKLCbphO7uaLnBYS/z6v0LerBDRvuVMfMb96mBt+cPgc1qk9UFhIlO9zDv2jz5lUc
	f4LmiodAUjv6d34PxZQDvuvSwkBw6gg6cHDTAQmzk8w2CGY1u6+1blev4yAxIQ+r1LA2GDn61yw
	q0GuYiiVBPrJJWRMjaBbAG1EK2nnV9CrTgpw/ZBSYdFUGI4BulzxA6FFR9AgtVtQDQee52DzbT3
	UtyAUBYffjrEGsQJtND9s/Ywj2bH5Oi+QIjmPOO8RJ8gl1lpMsSnU8KrlkzxuRMB7o2bmCvKoxy
	0MLu00BtCsPzB/KDiViorrnG
X-Received: by 2002:a05:600c:4f56:b0:495:4dd3:ca97 with SMTP id 5b1f17b1804b1-4954dd3cb28mr155374405e9.29.1784582809607;
        Mon, 20 Jul 2026 14:26:49 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-9c4b-4f01-f5b8-3b3d-3e3d-5e7a.310.pool.telefonica.de. [2a02:3100:9c4b:4f01:f5b8:3b3d:3e3d:5e7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956548321asm15332135e9.12.2026.07.20.14.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:26:48 -0700 (PDT)
Date: Mon, 20 Jul 2026 23:26:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>, 
	sashiko-reviews@lists.linux.dev, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 2/2] serial: amba-pl011: keep console clock enabled for
 atomic writes
Message-ID: <al6M1gwuWfk2wqwI@gmail.com>
References: <20260719063502.18852-1-kmehltretter@gmail.com>
 <20260719063502.18852-3-kmehltretter@gmail.com>
 <20260719065214.A40521F000E9@smtp.kernel.org>
 <20260720080100.Mk9zZFql@linutronix.de>
 <8733xeaxix.fsf@jogness.linutronix.de>
 <20260720082640.eGsVn61E@linutronix.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720082640.eGsVn61E@linutronix.de>

On Mon, Jul 20, 2026 at 10:26:40AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-07-20 10:19:58 [+0206], John Ogness wrote:
> > This is what the suspend/resume pm callbacks are for. In this case, it
> > is pl011_suspend() and pl011_resume().
> 
> Perfect so everything is in place except for these two.
> 
> > > There is also this no_console_suspend argument…
> > 
> > Yes, the callbacks need to check @console_suspend_enabled. If false, the
> > clocks obviously must not be disabled.
> 
> good.
> 

All right, I will send a v2 patch for this.

My testing is limited to QEMU, so I cannot test the power impact or
behaviour of real SoCs.

Karl
