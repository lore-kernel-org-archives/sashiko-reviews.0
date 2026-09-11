Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E3534AB00
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115795; cv=none; b=GvqSK/o3l/e64JPwQLFxS9Jc7ULXOcg0wBGpR/rhCYRPYHUJso50ImokJDVry+pYFD4d1y7HCfNVsFEgb4pYswfOy9TX+uzeBcubOxaQK9Uw0riv5roNVEkdfpStXxNcQtenpcQlqJT2iOiHfanWxgj3D6H2bB1dEfOeaocVhmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115795; c=relaxed/simple;
	bh=WMgo+qlFgtpRDnP/sYc+kSbsgLJq+odkWr0Tg5mDrog=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gy7vu9OJ5oeZwpO8zgyOExAOVmuC7Pe6roLuHwbLVaQFX7mLAfqouapU0dN3iE/dNYoo3I6DYMxSIsg3mXDCsuymZAN11a25LIomvSYt15YoQ3adHgOJLLvC7TkcNDhGN7/TRjW4WdvLiotE0+C6Aa5mTsgjCJNSfLQ4Ue7WvWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I4g3aFzb; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I4g3aFzb"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hh7Ds5yfdzKnS4;
	Fri, 11 Sep 2026 10:36:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789115789; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMgo+qlFgtpRDnP/sYc+kSbsgLJq+odkWr0Tg5mDrog=;
	b=I4g3aFzbzk1wEJA+WKi4GZEWRvw1OUT4AD6g2enzyLyDwI6qtDdPtf++Q1LX76zSRmoV0i
	hy6/yYb83A815aMlKYzdGelDW4oQScEBOau09ZTgEW+y7BXshDy5Jt9NoIRbudNqJV3cMF
	ntWNMhldQa+a4BCeDX2/hVOVnMiLcDy8aJEevAtaocPUZiqbeHJ5iPutvukt2++ggIpK4N
	QZiVTnl+Vg3kiQNCPwksqzEmDlEM821ug9/LODYF5D37O27K+Nl7WzwPLPXYiqRvdoMlw7
	1GKYGUU7j5uTahFc1ArwAeE3xxXz++aaHOMhRFTuzdNQ7daGXNX0m9Jwjgtrjw==
Message-ID: <0228eabf667d4af40869bb479ac3cd73fa121229.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Free the run queues at the end of
 drm_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: phasta@kernel.org, Donggeun Yoo <donggeunyoo.kernel@gmail.com>, 
	sashiko-reviews@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich
	 <dakr@kernel.org>
Date: Fri, 11 Sep 2026 10:36:27 +0200
In-Reply-To: <f0118a45f01a5c1f774fd77e745f5f2dae493ba0.camel@mailbox.org>
References: <20260910121601.805032-1-donggeunyoo.kernel@gmail.com>
		 <20260910123736.6EB8D1F000FF@smtp.kernel.org>
		 <20260910132532.820610-1-donggeunyoo.kernel@gmail.com>
	 <f0118a45f01a5c1f774fd77e745f5f2dae493ba0.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-META: zs9j1918a7r8hww9xpczmxoue8h9t1q9
X-MBO-RS-ID: df5520c08b4e23abc16

On Fri, 2026-09-11 at 10:03 +0200, Philipp Stanner wrote:
> On Thu, 2026-09-10 at 22:25 +0900, Donggeun Yoo wrote:
> > On 9/10/26 21:37, sashiko-bot@kernel.org=C2=A0wrote:
> > > [Critical] Potential Use-After-Free of `sched` and `sched->sched_rq` =
if
> > > `drm_sched_fini()` is called with pending jobs and `own_submit_wq` is=
 false.
> >=20
> > Thanks for the report
>=20
> Sashiko is a bot.
>=20
> The reported issue sounds correct to me. Would then indeed be a bug
> (race condition) that someone(tm) might want to fix.


No. Wait. It isn't?

The same argument applies: when drm_sched_fini() is called all fences
are signaled. Thus, no timeout will occur.

Nevertheless, one could change the teardown for more robustness in this
regard.

P.
