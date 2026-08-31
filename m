Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66883E7BBF
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179272; cv=none; b=qMTiTtBIDxcFVjsU9Gh4jJRXeQJlOstktd5HkDyKyUBwbE3YRNWiY+nRporyYgNKXcE3mLWM0AFLWW1HZ+HvWMbrFM1o1TYdSMkTM5Sx+A0Va3KlRn6zmJes2qRUQdSjusRXK/4Qvzh7sPVc5dSrfinH+D0l1iB/32CpoPnD47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179272; c=relaxed/simple;
	bh=YfqR/vMRmNS8dD3ZfLMM3JhQFyP64RQ/IUaqphE03xI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CwYA2IuAO5pU54JaXjVrkbPpE/oNAY02rcdz2psV+EHJHmVpXTslE76l2G9jOVn9okKJNGpwGf9b8mmOcziF2X9O3MtXCBGQM8diQ5ePn+EVR5gYBXk4AxEaEQ4mH2RQisAaDxlqqnHpGCqf9GbGvIp3SgygZjmJB5hlRZmgIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=Yb93gXzi; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="Yb93gXzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788179268; x=1788438468;
	bh=YfqR/vMRmNS8dD3ZfLMM3JhQFyP64RQ/IUaqphE03xI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Yb93gXzipfdDHWha8nGItK1Px0Mzkm5blaajgpjlFchKN3X0ROfNENspnpzkXY2vU
	 r9GacfgJmbxIv0fp1mOG1huol7Od/lRr2oqXetLnbS7qPBGqf8+LMNetNc2ETVyaq/
	 4vqzopZGFr2hm0mVSHuSZ1sMq8YKzbLEKCabs/bwNxrfDnuFZh8gy8Y9ekhIvDfT8Y
	 xDSVvomZH1WjYUljlTbj+ISb3Yd1/s+1VmPDHLEXWL+VVI0Kt6qgzNJ1JUfDDicenR
	 iqEn4kk3wdqOGfdRJZf3FevHazqBO+fKVF5C8h3w2oSl+G6SqykOIE7awhucaPI849
	 fvLo/FHwQUbMw==
X-Pm-Submission-Id: 4hYStp0Sxbz2SchS
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/5] drm/bridge: nwl-dsi: Add error handling of
 nwl_dsi_mode_set()
In-Reply-To: <20260810072257.2ABD61F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 10 Aug 2026 07:22:56
	+0000")
References: <20260810-nwl-dsi-fixes-v3-0-256da9d672e1@geanix.com>
	<20260810-nwl-dsi-fixes-v3-4-256da9d672e1@geanix.com>
	<5q9c0nOychvLDFd3tAjzhmVICVDZQWFIPqhVqa1FQJGcjJTarKOeTu1dJqvF_NiZXLKlWwb68VedbPjlDsJ8gg==@protonmail.internalid>
	<20260810072257.2ABD61F000E9@smtp.kernel.org>
Date: Mon, 31 Aug 2026 14:27:45 +0200
Message-ID: <87v78qv5j2.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Unbalanced resource teardown and PM runtime underflow in mode_set error path.

I am preparing a new patch series where this will be adressed. I will
send it when this series is merged.

/Esben
