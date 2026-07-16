Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C03B637A
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189728; cv=none; b=GHPjv2Pt30o5P4G7fIi4OsrULgO7BH+vXFvHqd7jmvUKF356Fv8Wc/UBetbhQclWKq+GoGtBekVovtdZLrMQlg+wo2h8JoQBNjlH7ohNTAfd/R/o3zMnUixJ+SliEsWa2rbcmht9Il5jSCE2gDjrcm4qr7lX8JwvMfzP1asZ+hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189728; c=relaxed/simple;
	bh=NlcmIKdNIJ+T24Mg570Fz4HM3DDssIyrIyhJJVd9p9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sGq4Oy2ycV4spE+0saMFc4KCZOsXLiN4FJ/lSfMmUcAekvd2secjhtFNGStCpMx40IMdx6GgJKgOvTCfuwRD8JnqMbPFZix+QKBzu4LFdkBCptlD3V5+u1HU8rr+R7WNfuqOCh6a1EEahgBU+IWh87y3v8yGNNnzCfjRHES58lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rcFUDjjT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rcFUDjjT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B7A1D1A0FBC
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 08:15:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CA85602B8;
	Thu, 16 Jul 2026 08:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3AEF11BD057C;
	Thu, 16 Jul 2026 10:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784189724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NlcmIKdNIJ+T24Mg570Fz4HM3DDssIyrIyhJJVd9p9I=;
	b=rcFUDjjTGXxvz2UccO2tyaOAk18SLbNkffUpLHUTy0FM+G3JCGUWC+O7AD9iRm5qCzHltM
	n4/RtUnCKvWVJnZDVeHI+ESYd/3n2YBz77tgVZunx1s4cOuV7WIWEer7LMEPidKJQFkJPo
	aneStdPoy6BfRIl+ICYqCLyZc9aIvv9aUDzw1KZqkDSqv85dAKA63X7BISADass0luURDP
	mX7F0Xet42bGx3yptT/rmCXJlGVr6EhScHOYePR40G+GJuMhoBc/TnaIHc/A8YZtiZLEPa
	2rMXnkVerMdo/EUZl3FqEwEgS82/djUxaq73zVIHxdlbvehgwbt0LemAi/3MHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,  conor+dt@kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/7] clk: tests: Add clk_parse_clkspec() Kunit testing
In-Reply-To: <20260710183127.126261F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 10 Jul 2026 18:31:26
	+0000")
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
	<20260710-schneider-v7-2-rc1-eip201-upstream-v2-2-b4680787377e@bootlin.com>
	<20260710183127.126261F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 16 Jul 2026 10:15:22 +0200
Message-ID: <871pd3e4f9.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 10/07/2026 at 18:31:26 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Ignored return value of `of_clk_add_hw_provider_kunit()`.

This is a relevant comment, I will fix it in v3.

Thanks,
Miqu=C3=A8l
