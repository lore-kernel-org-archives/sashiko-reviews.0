Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678E44607B
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113807; cv=none; b=OX9HeMSxJhOpT8jG6lnhLxmN1yltJLt3Msq3pKkrgnq2tqHYWuBLMfUniBhHphYmg7Rpfw86dZYoo8AgzROIkRhrIMq8F1XoLGf5Om12Lak1nIq5AlWRZDsHNVcrWeLhkrYklUdsVkhvxuflGPz2neorO1E3DfY5WQa1TRthlko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113807; c=relaxed/simple;
	bh=FBWjnj+IeHLh3gExLrDO/NrHM+NxJDRhSP7Tb7kzuAg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X0wUfR+hRVcXfgSBCmJylAGsSVdKsMmelRmtm0ZMAfN0JYAXU4tuOh4QijGbyq2SttzKxV8UM8WKSXlxqbVTAWj/LiagWAYOWoOaSLjq+9jx2652utipZY/plAooMRJKSUvttBc0JbI7Fh+1+zXdy05pYU5MvF2BPJtOdKuLDCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VEj6V4VN; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VEj6V4VN"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hh6Vb04p0zMlGh;
	Fri, 11 Sep 2026 10:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789113800; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBWjnj+IeHLh3gExLrDO/NrHM+NxJDRhSP7Tb7kzuAg=;
	b=VEj6V4VNoQi3cO0YRy1kTvP189YHQfq6UuHXYHvEo5qwK/LVWgX8t9n115rjMuHiEqp0VV
	Nt3vq4SdGVQmf4acnpf+nyQznqM8xejMrxSNnl6rh4V6DBtaVhjXU9V8bew9r3P2FDOusd
	TjtJ/JCWOIZGrFiS3jN+zDWNnaI4mC/+6Ex+Chb9TvuyiTiRZhHQ4ur28Nf03Gw1qvcCbd
	W6mcWlNHEx5MtRmZPp5f3NC9saOGqDa3I8tqzcrgCVKXNiEjcdIRpg+6gagRESGeCXsfDs
	sMFIIGv4os8kjktu3afCVJQxkVtD55xqsio2vBYFf3s3GYX6HpXM/7b8nvg6jQ==
Message-ID: <f0118a45f01a5c1f774fd77e745f5f2dae493ba0.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Free the run queues at the end of
 drm_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, 
	sashiko-reviews@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich
	 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 11 Sep 2026 10:03:11 +0200
In-Reply-To: <20260910132532.820610-1-donggeunyoo.kernel@gmail.com>
References: <20260910121601.805032-1-donggeunyoo.kernel@gmail.com>
	 <20260910123736.6EB8D1F000FF@smtp.kernel.org>
	 <20260910132532.820610-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: 24e3f7eee8be9f6fd10
X-MBO-RS-META: t3xkbxy4fmhgrgdo9p9kiydtna3p7139

On Thu, 2026-09-10 at 22:25 +0900, Donggeun Yoo wrote:
> On 9/10/26 21:37, sashiko-bot@kernel.org=C2=A0wrote:
> > [Critical] Potential Use-After-Free of `sched` and `sched->sched_rq` if
> > `drm_sched_fini()` is called with pending jobs and `own_submit_wq` is f=
alse.
>=20
> Thanks for the report

Sashiko is a bot.

The reported issue sounds correct to me. Would then indeed be a bug
(race condition) that someone(tm) might want to fix.


Regarding this patch here, would be nice if someone else can give it an
R-b.


P.
