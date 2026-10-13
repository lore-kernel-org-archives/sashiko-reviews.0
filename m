Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030EF521231
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911543; cv=none; b=GdANWR7h9rvFcBRLTbpHeeo5qupCG2+aC0pCFfIcBhQ5LDt4xJk1n02HdBNyDJFqArFi/6UXaaTZCk+Q/SI8pA+Zm41TIEiKFqj7ZLrJCgS2jP7SfAEh2+kEwbUpFa3ksIQcmN9WHp10FC9JV1oqw58foW1/l9g3NIYfw7NYwnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911543; c=relaxed/simple;
	bh=T8NlhaeVZy6s9aCXxQDmOlcnQfGg7C5XfWYHzD/xFw0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JzCzPY6A7YMsANHEMc1G2MdI86sF0pWK9DxUMi1DJlB/JpuRhvZTuI2MhMMaWGNFHRVjKbSG1J8xAhQWhVFkwv9yAZmLn+xvXyzPk465Hg9Z0WlQtTNhp88H0UnCbfKoLtFUdrlblTWNwU+sGN1TqK310MIRW6USG/4Xm8buDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gIwAZpJu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gIwAZpJu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A9304C653F4;
	Tue, 13 Oct 2026 17:13:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D863660362;
	Tue, 13 Oct 2026 17:12:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD28C11D7185F;
	Tue, 13 Oct 2026 19:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791911534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hV8HMJDWqmywJZRWh24mzyeI9ctzMOp+YlqUbyGw7g8=;
	b=gIwAZpJurkDQBahCsCqIbskG2gt9/prCtlnZC+DRYwoC2yr8yEOJvam5+oj9tchPbjerLx
	mIY2oON/ZebscTCmrcErr7ynJrs9F+jESU5GJSJ4ErhqSTsjgBew6jW+U/QPCTZ9aIQPdJ
	WCsifudwCNUwZFlBqhWgmiThggVlWyjuH+cFGxD0nR0EzT/OQj9XvhwaBnuckrSIpLG1oy
	Dv+uHnSlqcm6DoacDDrM0nynPUSy6WxEqVAlM3ajyOBB+Hdfw1adRpNfRVL+ddY2LvVpVC
	JtJ3RVqXusu486PoBHbdLQqigySpC3CzXjaJDwWtQhs+0+QI9WommO+vqxT8iQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org,  sashiko-reviews@lists.linux.dev,
  conor+dt@kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
In-Reply-To: <1jmrss7byt.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Mon, 05 Oct 2026 11:06:50 +0200")
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
	<20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
	<20261004205903.E62F91F000FF@smtp.kernel.org>
	<875wzhjhe6.fsf@bootlin.com>
	<1jmrss7byt.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 13 Oct 2026 19:12:11 +0200
Message-ID: <87fqy9v82c.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Jerome,

>>>> -	hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
>>>
>>> [Severity: Critical]
>>> Does this unconditional removal break ABI compatibility with older devi=
ce
>>> trees?
>>>
>>> Because HXT (index 0) is exported as a public ABI in the DT bindings,
>>> removing its explicit registration leaves hws[HXT] as NULL in the provi=
der's
>>> clock array. If an existing downstream or older device tree consumer ex=
plicitly
>>> references this clock via clocks =3D <&clk HXT>, won't the provider's
>>> of_clk_hw_onecell_get() fail to resolve the clock and return an error?
>>
>> Jerome, your wisdom matters here :-) For me this is a false positive,
>> because nobody outside this driver should access hws[HXT] and the clock
>> is still referenced through the DT, just not provided by this
>> driver. For me this is not an issue we should consider, let me know
>> otherwise.
>
> Strictly speaking there is (used to be) a clock at this index so it is
> not a false positive. Someone crazy enough could have gone through here
> to get the OSC even if does not make a lot of sense.
>
> This clock should never have existed to start with but it got in the
> bindings ... and that is the pain of dealing with bad bindings :/
>
> You've got 2 options:
> * Removing the ID from the bindings explaining clearly that it conflicts
>   with the fact this clock is actually an input according to the same
>   bindings. I suspect the DT maintainers won't like this much ...
>
> * Keep the bad support binding in the driver: You'll need a pass-through
>   clock element where the parent data is the fw_name and a fallback to
>   an `hxt-fake-internal' fixed clock. Feel free to add a comment
>   explaining how bad it is to use that clock and what user should be
>   doing instead.

Too bad. I am pretty sure nobody ever used that yet (since it is both
very recent and fundamentally broken) but okay, I'll keep registering a
dummy fixed clock there in case anybody ever cares about that lookup.

> You'll probably need to play that last trick with the lxt anyway ?

Yes, it is already handled indeed.

Thanks!
Miqu=C3=A8l
