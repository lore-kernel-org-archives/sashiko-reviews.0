Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638824AA3FA
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189239; cv=none; b=qsfGfMQqn/vJFgoUlqQu9BBGcpjB9y+7KJ6Nn3yKjetMzHErpCerTRRmyit4dWnb+HlQX0jqWAIZcYQB3EWJvfRH5PBXKi1gmC9LGaNsAG4hIj+SzOd6Jm8awSsbSyr1yfti1d1QoV8JwkB3Deu5xrC2vq9iUvxpUV/LKxOs9Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189239; c=relaxed/simple;
	bh=ULr1CbAlROLTSTSWTpgKZv1rM2J3GWPn2ux4glhFpio=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FTdTZ0L/mqCsnDSP5tAwDoGcNB8Shkb/ET9gu2ZMYsBxnpYvhU+AUe9gw+xLgsNOPZA+NtoNcF0Xd6TyTu5KqfZnjrxiOh6vY+cFKAVBYgPUsk7Hq3AbsV2UIqoBgJlkayl+o+Ev+3JlXhlQtemRk+vqzxAq0VtBQoIISxctkGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=qyKrFVsA; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="qyKrFVsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788189232; x=1788448432;
	bh=ULr1CbAlROLTSTSWTpgKZv1rM2J3GWPn2ux4glhFpio=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qyKrFVsA0g5jYowzoMSDZ2egsnD0O6YCzQEXmbt/tpQV64yK/6k7PFPN45BS+YlSX
	 X+V2AMlWgcP34k2tJKCusClJIMZ8/+jYtqs8Z/GZwkBeh45GrHgMYj5iuQP5kxhBmb
	 hDEOcc6FarnUIdXlZjztFLySf9lDR4dibr9kICiwMCD6uP1gHEO5S8TSjYgiBHhmp1
	 fHv5vuvFM5lg62eFPPukD5KMcHyH8ADnLnaTPqzSwKIpvucK7pNuqx5L765HoJ3i/f
	 qYYCN4KYsSkDDio7IOtroiekr6KuTQNaQA/48jyVU33c93PFugGchSk5cIQQHZaovZ
	 kgTeAyU9Vaujw==
X-Pm-Submission-Id: 4hYXZP0t8Zz1DDs7
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/4] drm/bridge: nwl-dsi: Cleanup endpoint mux
 control selection
In-Reply-To: <20260831133448.DB07A1F00A3E@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 31 Aug 2026 13:34:48
	+0000")
References: <20260831-nwl-dsi-fixes-v4-0-6a2a1cb23910@geanix.com>
	<20260831-nwl-dsi-fixes-v4-1-6a2a1cb23910@geanix.com>
	<c29_epPmBRcdNhmdPrhhKaZrpV7WRr2PtdmWdmXP1hUPoaUV3tDu0Ibu9jKo9MSUzO-FlDvFeBQVv4I2Y0p3wg==@protonmail.internalid>
	<20260831133448.DB07A1F00A3E@smtp.kernel.org>
Date: Mon, 31 Aug 2026 17:13:47 +0200
Message-ID: <87mru2uxuc.fsf@geanix.com>
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
> - [High] Dangling pointer to stack variable left in dsi->xfer after transfer completes or times out.

I will add a fix for this pre-existing issue to the next patch series I
have lined up for the nwl-dsi.c driver.

So let's try and get this one merged :)

/Esben
