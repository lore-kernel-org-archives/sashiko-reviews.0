Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B753DDB02
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274167; cv=none; b=uqi6eF+foQ9rO5vbCHhtKytKpRRgkMTRazphmsFMsxC/J/pmHMJigIMRSIwelpjO896UxUFyZ2jGIq83EL3iEajfk/v6oUYJRH/Zoz0C8iTwvO55PiLl8o69hqjN7m5EkLT1hZFaiHzkZaYPxFob5/VnCksgJRAsKcMJq1pAXmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274167; c=relaxed/simple;
	bh=8p11zjM37sH/yfiHAF+93eEEgVqdpnYL8nDogocJjWY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VBsRHY8N8TLG+LVd833aj/6Zvqeu8oDe+Qiy96MJPXhaYmhJE9qVNXDEk5TgO8RO4YKlcM3I8Y5TD1w5B8RpQXGIe1t9B85fLz2o6v1GHnMInlkMfVr4NQgG+nHb12Kc08oD54rkKhVAemzo+d/j/XCo9PzzTIVIVD5buIQ+ytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KfXhCzsh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KfXhCzsh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 281744E40E16;
	Fri, 17 Jul 2026 07:42:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7F3A60361;
	Fri, 17 Jul 2026 07:42:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D88D411BD0186;
	Fri, 17 Jul 2026 09:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784274154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8p11zjM37sH/yfiHAF+93eEEgVqdpnYL8nDogocJjWY=;
	b=KfXhCzsh4Q/MW8seFeyBcpHx4CzhQaHFLZbaFi0+wryZpH8/DdnTqqvv8Jnt0TJU8Y7n+m
	Q0bT4pfNqJcWa0cGGI6xeW44AVmKOYjrTnMw1ac9V8BlgzTNC6fpDbVDtkJ9I8NdcBACb7
	rLM427FpUsSP2LlV17SCF2yKs9nJFNOfXUGwN6g/ZiCulZFcpskolnspC4mUB8VV0MYS6Y
	K9twWKZ0+LrSvjNlGEQuLTuYzQEwNDyZ/rqk6q15lnl4ppgR32jCmCTyQ1B0IDLSyLu1Zo
	sUFWvEIXLUY1jHaIUT9ePaB/CWi6BLsOKRPSxfoEV30FALEUKVchg4xU1905uA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v3 2/7] clk: tests: Add clk_parse_clkspec() Kunit testing
In-Reply-To: <20260716110432.03D171F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 16 Jul 2026 11:04:31
	+0000")
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
	<20260716-schneider-v7-2-rc1-eip201-upstream-v3-2-98454e83845c@bootlin.com>
	<20260716110432.03D171F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 09:42:33 +0200
Message-ID: <87pl0mkqom.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 16/07/2026 at 11:04:31 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Pre-existing race condition in `__of_clk_get()` exposing a
> time-of-check to time-of-use (TOCTOU) use-after-free vulnerability
> during concurrent clock provider unregistration.

After looking into this issue, I don't see any relationship with this
series, it is probably worth keeping in mind, but since we are exposing
the symbol for kunit testing which is just not racy by any mean with
something else, I believe it is not worth the investigation.

Thanks,
Miqu=C3=A8l

