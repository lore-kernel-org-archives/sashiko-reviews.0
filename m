Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00974657F6
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119685; cv=none; b=Y5u61NVsz8FS25AJ9f5l/oCIcKX3lm/EUaz8w+48yo8V+wnPyPkBqeusb7XYutRweKjTSdZVaONvMjbIqH9brvCDt/0P4nn628DvsGpPNCoKKAxECrYtb7YGez+AI/L5kX8y5l0ZUsl1qTQStNq+vPMEIz4RJMOqF6VxHLpB2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119685; c=relaxed/simple;
	bh=ULNIgkQWYkWrSd5tLTOtNC3fTL33xCOqao0DtR/rkKM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mv2U9tPBeVl0AWhV8AYiQxBlz0nyBZDSvKfiUZ7PV/0QT26q1lpEDOYqZBowraoEbjworLRewhTZeALgqD3fKAqkDneESct3vrl0lOIt88LgBzOmlASON+BhZ0gC5keuiATlNC4Qhr9maTg6rYLMDixOJ4NS5W8xKT7LQ4i4hSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L7v/a6f/; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L7v/a6f/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 30176C2B9CA;
	Wed, 15 Jul 2026 12:48:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D1B06035C;
	Wed, 15 Jul 2026 12:47:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3596A11BD15D9;
	Wed, 15 Jul 2026 14:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784119677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ULNIgkQWYkWrSd5tLTOtNC3fTL33xCOqao0DtR/rkKM=;
	b=L7v/a6f/EicKnoQdUCetm7a42/KyIS/LSMccfP/U2ILjcv1J1Kxivabkwjsw5e8zIvyvQ4
	aKzkkcpDFIt1iW+6Aj5sI9kYMzODkHdun9BbvahYOZgI5e4zwY7HqspYNPyj4F6OPjlWhd
	0ovk1zGHsV8hbWzTCxZqfnDJooKseW5GX47FKS3m4GpozFOOMw+CgaFpHl0Q5j6FbWibpm
	how9WwKAy9ytK6FjHc/bHKRkOE8kIF8epfGlxlzs9qrvFd3g6kP+A0qyq4b8vSY1L08U/u
	AoVpQvwuJpu+e6/4EzQPON/RVDSdVua3mHLgTV2l3c3aZWvWVRZJQ5adA6lNqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v2 6/7] clk: Add support for clock nexus dt bindings
In-Reply-To: <20260710183359.61D3A1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 10 Jul 2026 18:33:58
	+0000")
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
	<20260710-schneider-v7-2-rc1-eip201-upstream-v2-6-b4680787377e@bootlin.com>
	<20260710183359.61D3A1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 15 Jul 2026 14:47:56 +0200
Message-ID: <87o6g8e7wj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 10/07/2026 at 18:33:58 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Stack buffer overflow in `of_parse_phandle_with_args_map`
> when `#<list>-cells` exceeds `MAX_PHANDLE_ARGS`.

Device trees are reputed correct.

> - [High] Infinite loop in `of_parse_phandle_with_args_map` due to lack
> of cycle detection.

Ditto.

> - [High] Unconditional dereference of optional `out_args` pointer in
> `of_parse_phandle_with_args_map`.

Does not happen in real life.


Since these are pre-existing issues and seem relatively impossible to
hit (except during development, but that's mean the DT is incorrect and
*must* be fixed), I do not plan to complicate further this series which
is already 7 patches long for (initially) a single line change.

Thanks,
Miqu=C3=A8l
